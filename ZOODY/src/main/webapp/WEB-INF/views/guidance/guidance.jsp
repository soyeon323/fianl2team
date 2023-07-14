<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/employee/detail.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

  #container {
    overflow:hidden;
    height:800px;
    position:relative;
  }

#btnRoadview,  #btnMap {
  position:absolute;
  top:5px;
  left:5px;
  padding:7px 12px;
  font-size:14px;border: 1px solid #dbdbdb;
  background-color: #fff;border-radius: 2px;
  box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;
  cursor:pointer;
}

#btnRoadview:hover,  #btnMap:hover{
  background-color: #fcfcfc;
  border: 1px solid #c1c1c1;
}

#container.view_map #mapWrapper {
  z-index: 10;
}

#container.view_map #btnMap {
  display: none;
}

#container.view_roadview #mapWrapper {
  z-index: 0;
}

#container.view_roadview #btnRoadview {
  display: none;
}

</style>
</head>
<body>
  <!-- 발급 받은 key = 6bea9cf67b29bdd2dc51f99aec137adc -->
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>
    <div id="wrap">

     
    <div id="container" class="view_map">
        <div id="mapWrapper" style="width:100%;height:00px;position:relative;">
            <div id="map" style="width:100%;height:800px"></div> <!-- 지도를 표시할 div 입니다 -->
            <!-- <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰"> -->
        </div>
        <div id="rvWrapper" style="width:100%;height:300px;position:absolute;top:0;left:0;">
            <div id="roadview" style="height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
            <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
        </div>
    </div>

         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bea9cf67b29bdd2dc51f99aec137adc"></script>
      </div>

 <script>

  var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
    btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다 
    btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다 
    rvContainer = document.getElementById('roadview'), // 로드뷰를 표시할 div 입니다
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다

// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다 
var placePosition = new kakao.maps.LatLng(37.43107559930207, 127.009982299925);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.42267753749449, 127.02243224710735), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 로드뷰 객체를 생성합니다 
var roadview = new kakao.maps.Roadview(rvContainer);

// 로드뷰의 위치를 특정 장소를 포함하는 파노라마 ID로 설정합니다
// 로드뷰의 파노라마 ID는 Wizard를 사용하면 쉽게 얻을수 있습니다 
roadview.setPanoId(1023434522, placePosition);

// 특정 장소가 잘보이도록 로드뷰의 적절한 시점(ViewPoint)을 설정합니다 
// Wizard를 사용하면 적절한 로드뷰 시점(ViewPoint)값을 쉽게 확인할 수 있습니다
roadview.setViewpoint({
    pan: 321,
    tilt: 0,
    zoom: 0
});

// 지도 중심을 표시할 마커를 생성하고 특정 장소 위에 표시합니다 
var mapMarker = new kakao.maps.Marker({
    position: placePosition,
    map: map
});

// 로드뷰 초기화가 완료되면 
kakao.maps.event.addListener(roadview, 'init', function() {

    // 로드뷰에 특정 장소를 표시할 마커를 생성하고 로드뷰 위에 표시합니다 
    var rvMarker = new kakao.maps.Marker({
        position: placePosition,
        map: roadview
    });
});

// 지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다 
function toggleMap(active) {
    if (active) {

        // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
        container.className = "view_map"
    } else {

        // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
        container.className = "view_roadview"   
    }
}
</script> 
 

</body>
</html>

     
       
        