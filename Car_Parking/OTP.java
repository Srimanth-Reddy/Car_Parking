package otp;

import java.util.Random;

public class OTP {
	public String generateOTP(int otpLength){
		Random random=new Random();
		
		StringBuilder sb=new StringBuilder();
		
		for(int i=0 ; i< otpLength ; i++){
			sb.append(random.nextInt(10));
		}
		
		String otp=sb.toString();
		
		return otp;
	}
	
//    public static void main(String[] args){
//        String otp=generateOTP(6);
//        System.out.println("Generated OTP : "+otp);
//    }	
}