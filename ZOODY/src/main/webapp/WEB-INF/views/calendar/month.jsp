<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${root}/resources/css/calendar/month.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<!-- //fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- //fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Document</title>
<style>

  
    /* 드래그 박스의 스타일 */
  #external-events {
    height: 50%;
    padding: 0 10px;
    border: 1px solid #f1f1f1;
    border-radius: 5px;
    background: #fff;
    text-align: left;
  }
  #external-events h4 {
    font-size: 15px;
    margin-top: 0;
    padding-top: 1em;
    margin-bottom: 15px;
    /* font-weight: 500; */
  }
  #external-events .fc-event {
    margin: 9px 0;
    cursor: move;
    height: 30px;
  }
 
  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }
 
  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

</style>
</head>
<body>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="cal_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="cal_main">
            <div id='calendar-wrap'>
              <div id='calendar'></div>
            </div>
        </div>
    </div>

	<script>
	 
	  document.addEventListener('DOMContentLoaded', function () {
	      $(function () {
	          var request = $.ajax({
	              url: "${root}/calendar/list",
	              method: "GET",
	              dataType: "json"
	          });
	
	          request.done(function (data) {

                console.log(data);

	              // calendar element 취득
	              var calendarEl = document.getElementById('calendar');
	              // full-calendar 생성하기
	              var calendar = new FullCalendar.Calendar(calendarEl, {
	                  // 해더에 표시할 툴바
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                locale: 'ko', // 한국어 설정
                editable: true, // 수정 가능
                droppable: true, // 드래그 가능
                drop: function (arg) { // 드래그 엔 드롭 성공시
                    if (document.getElementById('drop-remove').checked) {
                        // 드래그 박스에서 아이템을 삭제
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                },
                events: data ,// AJAX로 받아온 데이터를 이벤트로 설정
                eventClick: function(info) {
                  // 이벤트를 클릭했을 때 실행되는 로직을 작성
                  // 예: 모달 창에 상세 정보 표시 등
                  }
	              });
	              // 캘린더 랜더링
	              calendar.render();
	          });
	      });
	  })();
	  
	</script>

 
	



</body>
</html>