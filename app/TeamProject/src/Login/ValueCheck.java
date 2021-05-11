package Login;

public class ValueCheck {	
	
	public boolean isSame(String Pw1, String Pw2) {
		
		return Pw1.equals(Pw2);
			
	}
	
		
	   public boolean ischarLength(String str, int little, int large) //비밀번호 길이
	   {
	      int size = str.length();
	      return (size >= little && size <= large);
	   }
	   
	   
	   public boolean ischarBig(String str) //비밀번호 대문자 포함
	   {
	      boolean result = false;
	      for(int i = 0; i < str.length(); i++)
	      {
	         char c = str.charAt(i);
	         if(c >= 65 && c <= 90)
	         {
	            result = true;
	         }
	      }
	      return result;
	   }
	   public boolean ischarSmall(String str) // 비밀번호 소문자 포함
	   {
	      boolean result = false;
	      for(int i = 0; i < str.length(); i++)
	      {
	         char c = str.charAt(i);
	         if(c >= 97 && c <= 122)
	         {
	            result = true;
	         }
	      }
	      return result;
	   }
	
     public boolean isSpecial(String str) //비밀번호 특수문자포함
     {
    	 
    	 boolean result = false;
	      for(int i = 0; i < str.length(); i++)
	      {
	         char c = str.charAt(i);
	         if((c >= 33 && c <= 47) || c == 94 )
	         {
	            result = true;
	         }
	      }
	      return result;
	 }

}
