<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" scope="page" />
<%
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
%>  

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>문의 페이지</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/bbs.css">
</head>
<body>
	<div id="wrap">
		  <% if (uId != null) {   // 현재 로그인 상태라면  %>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" width="45%" height="45%" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/Member_Mod.jsp"><%=uName %> / 등급 : <%=uLevel %></a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
	<% } else { %>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" width="45%" height="45%" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Member.jsp">Sign Up</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
        <%} %>

        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
                  <li class="active">
                <% if (uId == null) { %> 
					<a href="/Proj_OnedayClass/sign/Login.jsp" onclick="alert('로그인이 필요합니다.');">QnA</a>
				<%  } else { %> 
					<a href="/Proj_OnedayClass/bbs/List.jsp">QnA</a>
				<% } %>
                </li>
            </ul>
        </nav>
		<!--  HTML 템플릿(Template, Templet)  헤더 시작 -->
		<h1>문의 페이지</h1>
		
		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		<main id="main" class="post">   <!-- 본문영역 html 템플릿 시작 -->
		
			<h2>글쓰기</h2>
			
			<form name="postFrm" action="PostProc.jsp"
			enctype="multipart/form-data" method="post" id="postFrm">
			
				<table>
					<tbody>
						<tr>
							<td class="req">아이디</td>  <!-- td.req 필수입력 -->
							<td>
								<%=uId%>
								<input type="hidden" name="uId" id="uId" value="<%=uId%>">
							</td>
						</tr>
						<tr>
							<td class="req">문의 제목</td> <!-- td.req 필수입력 -->
							<td>
								<input type="text" name="Qna_title"
								maxlength="50" id="Qna_title">
							</td>
						</tr>
						<tr>
							<td class="contentTD">문의 내용</td>
							<td>
								<textarea name="Qna_content" id="Qna_content" cols="60" wrap="hard"></textarea>
							</td>
						</tr>
						<tr>
							<td class="req">비밀번호</td> <!-- td.req 필수입력 -->
							<td>
								<input type="password" name="uPw"
								maxlength="10" id="uPw">
							</td>
						</tr>
						<tr>
							<td>파일첨부</td>
							<td>
								<span class="spanFile">
									<input type="file" name="fileName"
									 id="fileName">
								</span>	
							</td>
						</tr>
						<tr>
									<input type="hidden" name="contentType"
										value="HTML">									
									<input type="hidden" name="contentType"
										value="TEXT" checked>						
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><hr>	</td>							
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" id="regBtn" class="butcs">등록</button>
								<button type="reset" class="butcs">다시쓰기</button>
								<button type="button" id="listBtn" class="butcs">리스트</button>
							</td>
						</tr>
					</tfoot>
				</table>
			
			    <!--  
			    IP주소를 IPv4 형식으로 설정함.(IPv6 형식이 기본으로 설정되어 있음)
			    프로젝트 => Run Configuration => Tomcat 클릭
			    => (x)Argument => VM arguments 입력란 =>
			    -Djava.net.preferIPv4Stack=true  
			     -->
			
			
			
			</form>
		
		
		
		
		</main>  <!-- 본문영역 html 템플릿 끝 -->
			<footer id="footer">

            <div id="footerTop" class="flex-container">
                <nav id="footerLnbArea">
                    <ul id="footermainMenu" class="flex-container">
                        <li class="footerMainLi"><a href="#">서비스이용약관</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">개인정보처리방침</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">이메일무단수집거부</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">인터넷증명발급</a></li>
                    </ul>
                </nav>
                <!-- nav#footerLnbArea -->
            </div>
            <!-- div#footerTop 회사 관련 정보 영역 -->

            <div id="footerBottom" class="flex-container">
                <nav id="footerArea">
                    <ul id="footerBtm" class="flex-container">
                        <li class="footerBtmLi"><a href="#">주소</a></li>
                        <li class="footerBtmLi"><a href="#">대표</a></li>
                        <li class="footerBtmLi"><a href="#">사업자번호</a></li>
                        <li class="footerBtmLi"><a href="#">전화번호</a></li>
                    </ul>
                </nav>
                <!-- nav#footerArea -->
            </div>

        </footer>

	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/bbs.js"></script>        
</body>
</html>