package Login;

import Login.MemberDTO;

public class ValueCheck {
	
	
	
	
		
	   public boolean charLength(String str, int little, int large)
	   {
	      int size = str.length();
	      return (size >= little && size <= large);
	   }
	   public boolean charBig(String str)
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
	   public boolean charSmall(String str)
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
	
	   

}
