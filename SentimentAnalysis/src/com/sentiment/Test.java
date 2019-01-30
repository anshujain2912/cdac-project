package com.sentiment;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class Test {
	
	@Autowired
	private HitApiService hitApiService;
	
	@Autowired
	private AppConfig config;
	
	private static final String apiKey = "804a8ae87c4e945cf89152bf3c0861c1";
	private static final String apiUrl = "http://api.datumbox.com/1.0/SentimentAnalysis.json";

	public String fun(String s) {
		String urlParameters = "api_key=" + apiKey + "&text=" +s;
		String request = apiUrl;
		ResponseAPI resp = null;
		try {
			URL url = new URL(request);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			InputStream inptStrm = hitApiService.postURL(connection, url, urlParameters, request);
			ObjectMapper objectMapper = new ObjectMapper();
			resp = objectMapper.readValue(inptStrm, ResponseAPI.class);
			System.out.println(resp.toString());
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return resp==null || resp.getOutput()==null || resp.getOutput().getResult() == null ?"neutral":resp.getOutput().getResult();
     
	}
}
