package com.cherryproject.www.common.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.protobuf.ByteString;

public class GoogleVisionApi {
	
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(GoogleVisionApi.class);
	
	
	
	/*
	 * @comment		:	이미지 파일의 경로를 통해 이미지 객체를 생성하는 메소드
	 * @param		:	이미지 객체를 만들 이미지 파일의 경로
	 */
	private static Image getImage(String filePath) throws IOException {
		
        Image image;

        // GCS에서 이미지를 가져올때 image 생성
        if (filePath.startsWith("gs://")) { 
        	
        	logger.info("gs");
            ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(filePath).build();
            image = Image.newBuilder().setSource(imgSource).build();
        }
        //	로컬에서 이미지를 가져올때 image 생성
        else { 
        	
        	logger.info("local : " + filePath);
            ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
            image = Image.newBuilder().setContent(imgBytes).build();
        }

        return image;
        
    }
	
	
	
	/*
	 * @comment		:	OCR분석하는 메소드
	 * @param		:	OCR분석을 위한 이미지의 경로
	 */
	public static String detectText(String filePath) throws Exception {
		
		String detectText = "";
		
	    List<AnnotateImageRequest> requests = new ArrayList<>();
	    Image image = getImage(filePath);							// 이미지 객체 생성
	    
//	    URL url = new URL("http://www.mkyong.com/image/mypic.jpg");
//	    java.awt.Image image = ImageIO.read(url);
	   
	    Feature feature = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	    	
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();

	        for (AnnotateImageResponse res : responses) {
	        	
	            if (res.hasError()) {
	            	
	            	detectText = res.getError().getMessage();
	                logger.info("Error: " + detectText);
	            }

	            // For full list of available annotations, see http://g.co/cloud/vision/docs
//	            for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
//	            	
//	            	logger.info("Text: " + annotation.getDescription());
//	            	logger.info("Position : " + annotation.getBoundingPoly());
//	            }
	            detectText = res.getTextAnnotationsList().get(0).getDescription();
	            logger.info(detectText);
	        }
	    }
	    
	    return detectText;
	    
	}
	
	
	
	
}
