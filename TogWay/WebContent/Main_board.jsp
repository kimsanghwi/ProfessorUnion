<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/codingBootstrap.css">
   <link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Nanum+Pen+Script|Open+Sans|Sunflower:300|Ubuntu" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Allerta|Cabin+Sketch|Chela+One|Concert+One|Days+One|Fredoka+One|Fugaz+One|Kaushan+Script|Neucha|Open+Sans|Permanent+Marker|Prosto+One|Viga" rel="stylesheet">
	
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

<style type="text/css">
      .jumbotron {
         background-image: url("img/TogWay.png");
         background-size: cover;
         text-shadow: black 0.3em 0.3em 0.3em;   /* 텍스트 그림 */
         color: white;
      }
</style>
</head>
<body>
<div id="weap">
	<nav class="navbar navbar-default">   <!-- 기본적인 부트스트랩에서 메뉴바 제공 -->
      <div class="container-fluid">
         <div class="navbar-header"><!-- 헤더부분을 만들때 사용 -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only"></span>
            <span class="icon-bar"></span> <!-- 기본적인 형태 -->
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="TogWay_Servlet?copmmand=main_list"><b>TogWay</b></a>
         </div>
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
               <!-- active : 현재 선택 -->
               <li><a href="Board_Controller?command=mypet_list&div_num=1">나의 반려동물<span class="sr-only"></span></a></li>
               <li><a href="Board_Controller?command=fleamarket_list&div_num=3">플리마켓</a></li>
               <li><a href="Board_Controller?command=hospital_list&div_num=4">동물병원</a></li>
               <li><a href="Board_Controller?command=review_list&div_num=2">애완용품 후기</a></li>
            </ul>
            <form action="Search_Servlet" class="navbar-form navbar-left" style="margin-left: 420px";>   <!-- 검색 -->
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="내용을 입력하세요." size="30" name="search">
               </div>
               <button type="submit" class="btn btn-default">검색</button>
               <c:if test="${!empty userid}">
               <span> ${userid}님이 로그인</span>
               </c:if>
               <c:if test="${empty userid}">
               <span>로그인 해주세요!</span>
               </c:if>
            </form>
            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
  
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false"><c:if test="${empty userid}">접속하기 </c:if><c:if test="${!empty userid}">정보보기</c:if><span class="caret"></span></a>
                      
        
                
                
                
                  <ul class="dropdown-menu">
                  <c:if test="${empty userid}">
                     <li><a href="login.do">로그인</a></li>
                     <li><a href="join.do">회원가입</a></li>
                     </c:if>
                      <c:if test="${!empty userid}">
                      <li><a href="logout.do">로그아웃</a></li>
                     <li><a href="memberdata.do">정보보기</a></li>
                      </c:if>
                  </ul>               
               </li>
            </ul>
         </div>
      </div>
      </nav>
      
      
      
       <div class="container">
      <div class="main-img">
         <div class="img" align="center">
            <img src="img/fish-L.svg">
            <img src="img/bird-L.svg">
            <img src="img/dog-L.svg">
            <img src="img/fishbowl.svg">
            <img src="img/cat-R.svg">
            <img src="img/rabbit2-R.svg">
            <img src="img/rat-R.svg">
         </div>
      </div>
   </div>


		
		
		
		
		
		

		
		<div id="contents">
			<div class="container">
				<div class="contents-area">
				<form action="TogWay_Servlet?copmmand=main_list" method="post">
					<div class="mypet-area">
					
						<a href="Board_Controller?command=mypet_list&div_num=1"><li class="main-title"style="color: #000000;"><img src="img/dog-house.svg">나의 반려동물</li></a>
							<table class="table table-border" style="text-align: center; width: 100%;">
				
						<thead style="border-bottom:3px solid">
							<tr>
								<th style="text-align: left; ">번호</th>
								<th style="text-align: left; ">제목</th>
								<th style="text-align: left; ">작성자</th>
								<th style="text-align: center; ">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="maxnumber1" value="${maxnumber1}"></c:set>
							<c:forEach var="mypet" items="${mypet}">
							
							<tr>
								<th scope="row">${maxnumber1}</th>
								
							<c:if test="${mypet.re_step > 1}">	
							<c:forEach var="j" begin="1" end="${mypet.re_step()-1*5}">	
								&nbsp;
							</c:forEach>
							</c:if>
								<th><a href="Board_Controller?command=boardview&num=${mypet.num}&div_num=${div_num}" style="color: #000000;">${mypet.subject} </a></th>
								<th>${mypet.writer}</th>
						
								<th style="text-align: center">${mypet.readcount}</th>
							</tr>
							<c:set var="maxnumber1" value="${maxnumber1 - 1}"></c:set>
							
							</c:forEach>
							
						</tbody>
					</table>
				</div>	
						
						
						
					
						
						
						
						
						
						
						
						
						
			
						
				
						
				
					
					
					
					
					
					
					
						<div class="petitem-area">
						<a href="Board_Controller?command=review_list&div_num=2"><li class="main-title" style="color: #000000;"><img src="img/report.svg">애완용품 후기</li></a>
						<table class="table table-border" style="text-align: center; width: 100%;">
				
						<thead style="border-bottom:3px solid">
							<tr>
								<th style="text-align: left; ">번호</th>
								<th style="text-align: left; ">제목</th>
								<th style="text-align: left; ">작성자</th>
								<th style="text-align: center; ">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="maxnumber2" value="${maxnumber2}"></c:set>
							<c:forEach var="review" items="${review}">
							
							<tr>
								<th scope="row">${maxnumber2}</th>
								
							<c:if test="${review.re_step > 1}">	
							<c:forEach var="j" begin="1" end="${review.re_step()-1*5}">	
								&nbsp;
							</c:forEach>
							</c:if>
								<th><a href="Board_Controller?command=boardview&num=${review.num}&div_num=${div_num}"style="color: #000000;">${review.subject} </a></th>
								<th>${review.writer}</th>
						
								<th>${review.readcount}</th>
							</tr>
							<c:set var="maxnumber2" value="${maxnumber2 - 1}"></c:set>
							
							</c:forEach>
							
						</tbody>
					</table>
					
					</div>
					
					
					
					
					
					
					
					
					
					
					
					<div class="contents-area">
						<div class="mypet-area">
						<a href="Board_Controller?command=fleamarket_list&div_num=3"><li class="main-title" style="color: #000000;"><img src="img/shopping-bag.svg">플리마켓</li></a>
						<table class="table table-border" style="text-align: center; width: 100%;">
				
						<thead style="border-bottom:3px solid">
							<tr>
								<th style="text-align: left; ">번호</th>
								<th style="text-align: left; ">제목</th>
								<th style="text-align: left; ">작성자</th>
								<th style="text-align: center; ">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="maxnumber3" value="${maxnumber3}"></c:set>
							<c:forEach var="fleamarket" items="${fleamarket}">
							
							<tr>
								<th scope="row">${maxnumber3}</th>
								
							<c:if test="${fleamarket.re_step > 1}">	
							<c:forEach var="j" begin="1" end="${fleamarket.re_step()-1*5}">	
								&nbsp;
							</c:forEach>
							</c:if>
								<th><a href="Board_Controller?command=boardview&num=${fleamarket.num}&div_num=${div_num}" style="color: #000000;">${fleamarket.subject} </a></th>
								<th>${fleamarket.writer}</th>
						
								<th>${fleamarket.readcount}</th>
							</tr>
							<c:set var="maxnumber3" value="${maxnumber3 - 1}"></c:set>
							
							</c:forEach>
							
						</tbody>
					</table>
					
					</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
						<div class="petitem-area">
						<a href="Board_Controller?command=hospital_list&div_num=4"><li class="main-title" style="color: #000000;"><img src="img/hospital.svg">건강정보</li></a>
						<table class="table table-border" style="text-align: center; width: 100%;">
				
						<thead style="border-bottom:3px solid">
							<tr>
								<th style="text-align: left; ">번호</th>
								<th style="text-align: left; ">제목</th>
								<th style="text-align: left; ">작성자</th>
								<th style="text-align: center; ">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="maxnumber4" value="${maxnumber4}"></c:set>
							<c:forEach var="hospital" items="${hospital}">
							
							<tr>
								<th scope="row">${maxnumber4}</th>
								
							<c:if test="${hospital.re_step > 1}">	
							<c:forEach var="j" begin="1" end="${hospital.re_step()-1*5}">	
								&nbsp;
							</c:forEach>
							</c:if>
								<th><a href="Board_Controller?command=boardview&num=${hospital.num}&div_num=${div_num}" style="color: #000000;">${hospital.subject} </a></th>
								<th>${hospital.writer}</th>
						
								<th>${hospital.readcount}</th>
							</tr>
							<c:set var="maxnumber4" value="${maxnumber4 - 1}"></c:set>
							
							</c:forEach>
							
						</tbody>
					</table>
					
					</div>
					
					
					
					
					</div>



					</form>
				</div>
			
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
<footer> 
         <div class="container">
            <br>
            <div class="row" style="background-color: #0063c6; color: #000000">
            <!-- col-sm- : 총 12칸 을 만들수 있다 -->
               <div class="col-sm-3" style="text-align: center"><h4><b>TogWayTeam member &copy; 2018</b></h4>
               <h5>소준혁(SoJunHyuk)</h5><h5>김상휘(KimSangHwi)</h5><h5>박아영(ParkAYoung)</h5><h5>박현옥(ParkHyunOk)</h5></div>
               <div class="col-sm-5"><h4><b>TogWay 소개</b></h4><p>TogWay의 의미는 Together(함께)Way(길)이라는 의미로 만들었습니다. </div>
               <div class="col-sm-2"><h4 style="text-align: center;"><b>SNS</b></h4>
                  <div style="text-align: center;">
                     <a href="https://ko-kr.facebook.com/" class="list-group-item" >페이스북</a>
                     <a href="https://www.instagram.com/?hl=ko" class="list-group-item">인스타그램</a>
                     <a href="https://twitter.com/?lang=ko" class="list-group-item" style="margin-bottom: 2px;">트위터</a>
                  </div>
               </div>
               <div  class="col-sm-2"><h4 style="text-align: center"><b>인터넷</b></h4>
                  <a href="http://www.naver.com" class="list-group-item" style="text-align: center;">네이버</a>
                  <a href="https://www.daum.net" class="list-group-item" style="text-align: center;">다음</a>
                  <a href="https://www.google.co.kr" class="list-group-item" style="text-align: center;">구글</a>
               </div>
            </div>
         </div>
      </footer>
	</div>
	</body>
	</html>