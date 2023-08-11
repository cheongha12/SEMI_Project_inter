<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="tourHeader1">
        <div class="gatewayWrapper">
          <div class="gatewayInterGate">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a href="https://www.interpark.com/">홈</a>
                </li>
                <li class="nav-item">
                  <a href="http://tour.interpark.com">투어</a>
                </li>
                <li class="nav-item">
                  <a href="http://ticket.interpark.com">티켓</a>
                </li>
                <li class="nav-item">
                  <a href="http://shop.interpark.com">쇼핑</a>
                </li>
                <li class="nav-item">
                  <a href="http://book.interpark.com">도서</a>
                </li>
              </ul>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <ul class="navbar-nav">
<c:choose>
	<c:when test="${not empty loginedInfo }">
					<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:when>
	<c:otherwise>
                  <a href="${pageContext.request.contextPath}/login">로그인</a>
	</c:otherwise>
</c:choose>
                <li class="nav-item active">
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/join">회원가입</a>
                </li>
                <li class="nav-item">
                  <a href="https://tour.interpark.com/mypage/">마이페이지</a>
                  <div id="divHeaderMypage" class="gatewaySub" style="display: none;">
                  </div>
                <!-- </li>
                <li class="nav-item">
                  <a href="http://tour.interpark.com/customer/">고객센터</a>
                </li>
                <li class="nav-item">
                  <a href="http://tour.interpark.com/freeya/">여행정보</a>
                </li>
                <li class="nav-item">
                  <a href="http://tour.interpark.com/corp/">법인/단체여행</a>
                </li> -->
              </ul>
            </nav>
          </div>
        </div>
        <div class="headWrapper">
          <div class="headInner">
            <nav class="navbar navbar-light bg-light">
              <!--인터파크 로고-->
              <h1 class="headerLogo">
                <a href="http://tour.interpark.com">
                  <img src="${pageContext.request.contextPath}/resources/images/인터파크로고.png" alt="">
                </a>
              </h1>
          </div>
          <div class="headerserch">
            <input class="headerserch1" type="search" placeholder="~7월14일 국내 숙소 투숙 고객, 4만원 즉시 할인!">
            <!-- <button class="headerserch2" type="submit"><i class="fa fa-search"></i></button> -->
            <a class="headerserch2" href="#"><img class="aa" src="${pageContext.request.contextPath}/resources/images/btn_search.svg" alt=""></a>
          </div>
          <div class="headerbanner">
            <a href="https://events.interpark.com/exhibition?exhibitionCode=230405006"><img
                src="resources/images/헤더배너.jpg"></a>
          </div>
          </nav>
        </div>
        <div class="navigationWrapper">
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="navigationInner">
              <div class="localNavigation">
                <ul class="navbar-nav">
                  <li class="nav-item active">
                    <a href="http://sky.interpark.com">항공</a>
                  </li>
                  <li class="nav-item">
                    <a href="http://travel.interpark.com">국내숙소</a>
                  </li>
                  <li class="nav-item">
                    <a href="https://travel.interpark.com/hotel/main">해외숙소</a>
                  </li>
                  <li class="nav-item">
                    <a href="https://travel.interpark.com/voucher">투어.티켓</a>
                  </li>
                  <li class="nav-item">
                    <a href="https://travel.interpark.com/tour/main/package">해외패키지</a>
                  </li>
                  <li class="nav-item">
                    <a href="https://travel.interpark.com/tour/main/domestic">국내/제주</a>
                  </li>
                  <li class="nav-item">
                    <a href="https://travel.interpark.com/tour/main/honey">허니문</a>
                  </li>
                  <li class="nav-item">
                    <a href="https://travel.interpark.com/tour/main/golf">골프</a>
                  </li>
                </ul>
              </div>
              <div class="seasonNavigation">
                <ul class="navbar-nav">
                  <li class="nav-item active">
                    <a href="http://tour.interpark.com/EasyPack/main" class="seasonBannertravel">여행혜택존</a>
                    <img class="first" src="${pageContext.request.contextPath}/resources/images/banner-travel.svg">
                  </li>
                  <li class="nav-item">
                    <a href="https://events.interpark.com/exhibition?exhibitionCode=230405006"
                      class="seasonNavigationtrophy">1등특가</a>
                    <img class="second" src="${pageContext.request.contextPath}/resources/images/banner-trophy.svg">
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </div>
      </header>