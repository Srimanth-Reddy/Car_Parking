package otp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;

public class sendOTP 
{
	public static void SendOTP(String message , String number , String apiKey)
	{
		try
		{
		String sendId="TXTIND";
		String language="english";
		String route="v3";
		
		message=URLEncoder.encode(message,"UTF-8");
		
		String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;

		URL url=new URL(myUrl);
		HttpsURLConnection con= (HttpsURLConnection)url.openConnection();
		
		con.setRequestMethod("GET");
		
		con.setRequestProperty("User-Agent","Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		System.out.println("Wait!!");
		int responseCode=  con.getResponseCode();
		System.out.println("response code: "+responseCode);
		StringBuffer response=new StringBuffer();
		
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		while(true)
		{
			String line=br.readLine();
			
			if(line==null)
			{
				break;
			}
			
			response.append(line);
		}
		
		System.out.println(response);
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

        public static void main(String[] args) 
	{
		   System.out.println("Program Started....");
		   
		   OTP otp=new OTP();
		   String otpmessage=otp.generateOTP(6);
		   System.out.println( "Generate OTP : "+otpmessage);
		   
		   String apiKey="VNUMrFE8cZCbmT79h3devAlpSWKkPfDqORo0xB6wj4tnGHz5yaV7fqFT6YnzlJ5mGwQphWCUuj3xgtIy";
		   String number="9182708064";
		   
		   SendOTP("Hey this message is send by Rohita using Java Code. Your OTP is: "+otpmessage,number,apiKey);
		   
	}
	
}