<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8"); %>

<c:set var="grade" value="${sessionScope.grade}"/>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">Kosta WMS</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">

<c:choose>
	<c:when test="${grade==0}">

        <!-- 본사 매장 관리 메뉴 추가 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매장관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="request_manage">매장 등록</a></li>
            <li><a href="#" id="management">인원 관리</a></li>
            <li><a href="#" id="request_delete">매장 정보 및 삭제</a></li>
            <li class="divider"></li>
            <li><a href="#" id="transaction">거래 내역</a></li>
            <li><a href="#" id="request_order">재고 요청</a></li>
          </ul>
         </li>
        
        
        <!-- 본사 재고 관리 메뉴 추가 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">재고관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="status">본사 재고현황</a></li>
            <li><a href="#" id="status_order">재고 주문</a></li>
            <li class="divider"></li>
            <li><a href="#" id="ware_register">상품 등록 및 삭제</a></li>
            <li><a href="#" id="ware_mul_register">상품 일괄 등록</a></li>
          </ul>
         </li>
     </c:when>    
        
     <c:when test="${grade==1}">
   
        <!-- 매장 재고 관리 메뉴 추가  -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매장 재고 관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="bookinfo">재고 현황</a></li>
            <li><a href="#" id="booktest">재고 주문</a></li>
            <li class="divider"></li>
            <li><a href="#" id="source">불량 요청</a></li>
          </ul>
         </li>
	</c:when>    
    <c:otherwise>
    	<h3>KOSTA WareHouse Management System</h3>
    </c:otherwise>
  </c:choose>   
      </ul>
      
      <form class="navbar-form navbar-left" role="search" method=get action="http://www.google.co.kr/search" target="_blank">
        <div class="form-group">
          <input type=hidden name=ie value=utf-8/>
          <input type=hidden name=oe value=utf-8/>
          <input type=hidden name=hl value=ko />
          <input type=text class="form-control" placeholder="Google Search" name=q size=20 maxlength=255 style=font-size:13pt value="" />
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="https://cafe.naver.com/kosta129" target="_blank">Kosta129기 Cafe</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Etc Link<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="https://www.oracle.com/index.html" target="_blank">Oracle</a></li>
            <li><a href="http://www.eclipse.org/home/index.php" target="_blank">Eclipse</a></li>
            <li class="divider"></li>
            <li><a href="http://colorscripter.com/" target="_blank">Color Scripter</a></li>
            <li class="divider"></li>
            <li><a href="http://192.168.0.126/" target="_blank">강사님 FTP 주소</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>