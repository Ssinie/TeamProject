<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <title>ceoIntro</title>

   <style type="text/css">

      #menubar{
                        display: flex;
                        margin: auto;
                         width: 1200px;
                        background-color: antiquewhite;
                        }
      #menubar div {         width: 100%;
                        float: left;
                        text-align: center;
                        font-weight: bold;
                        height: 100px;
                        line-height: 100px;
                        }
                        
      #menubar > div > a {
                        text-decoration: none; color: black; 
                        display: block;
                        font-size: 1.5rem;
      }                  
                        
      #menubar div:hover {
             			 background-color: rgba(0,0,0,0.07);
						 
     					 }
     #menubar > div > a:hover {color: white;}
     					 
      .sticky {
						background-color: yellow;
						position:sticky;
						top:0px;

						}
      
/*       #menubar div>a:hover{
         color: #ff0000;
      } */
   </style>
 </head>

 <body style = "margin: 0">

<div id="menubar" class="sticky">
   <div><a href="ceointro.jsp">ceo인사말</a></div>
   <div><a href="location.jsp">오시는길</a></div> <br />
</div>
