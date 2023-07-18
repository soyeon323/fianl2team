<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- <link rel="stylesheet" href="${root}/resources/css/work/work.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 드래그 앤 드롭 API-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

<style>

/* 드래그 앤 드롭 */
    .container {
    font-family: "Trebuchet MS", sans-serif;
    display: flex;
    gap: 100px;
    justify-content: space-evenly;
    }

    .column1 {
    flex-basis: 20%;
    background: #d5dffc;
    min-height: 50vh;
    padding: 5px;
    border-radius: 6px;
    }

    .column2 {
    flex-basis: 20%;
    background: #d5dffc;
    min-height: 50vh;
    padding: 5px;
    border-radius: 6px;
    }

    .column3 {
    flex-basis: 20%;
    background: #d5dffc;
    min-height: 50vh;
    padding: 5px;
    border-radius: 6px;
    }

    .column1,.column2,.column3 h1 {
    text-align: center;
    font-size: 22px;
    margin-top: 20px;
    }

    .list-group-item {
    background: #fff;
    border-radius: 2px;
    margin-top: 10px;
    }

    .list-group-item:hover {
        border: 1px solid black;
    }


    #enroll{
    margin-top: 40px;
    margin-left: 80px;
    font-size: 20px;
    font-weight: 600;
    }

    #wrap{
        width: 1663px;
        height: 93vh;
        position: absolute;
        top: 65px;
        left: 255px;
    }

    .btn{
        font-size: 0.3em;
        padding: 0;
        block-size: 30px;
        background-color: rgb(45, 99, 216);
        margin: auto;
    }

    #popup_open_btn{
        margin-left: 480px;
        margin-bottom: 10px;
    }

    
    /* 모달1 */

    #my_modal {
        display: none;
        width: 600px;
        padding: 20px 60px;
        height: 700px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
        overflow: scroll;
    }

    #my_modal .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    #modal-area{
        display: grid;
        grid-row-gap: 20px;
    }

    #textarea{
        resize: none;
        height: 300px;
    }


    fieldset {
    border: 3px solid #ccc;
    padding: 10px;
    width: 300px;
    border-radius: 4px;
    display: grid;
    row-gap: 20px;
}

    /* 모달 2 */
     
     #my_modal2 {
        display: none;
        width: 600px;
        padding: 20px 60px;
        height: 700px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
        overflow: scroll;
    }

    #my_modal2 .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    #modal-area{
        display: grid;
        grid-row-gap: 20px;
    }

    #textarea{
        resize: none;
        height: 300px;
    }

    fieldset {
    border: 3px solid #ccc;
    padding: 10px;
    width: 300px;
    border-radius: 4px;
    display: grid;
    row-gap: 20px;
    }

    #btn-area{
        box-sizing: border-box;
        margin-left: 20px;
    }

</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">
        <div id="enroll">업무 할당</div>
        <button class="btn btn-primary" id="popup_open_btn">업무 추가</button>

        <div class="container">
           
            <div class="column1">
                <h1>To-Do</h1>
               <div class="list-group-item" draggable="true">Wash Clothes</div>
               <div class="list-group-item" draggable="true">Take a stroll outside</div>
               <div class="list-group-item" draggable="true">Design Thumbnail</div>
               <div class="list-group-item" draggable="true">Attend Meeting</div>
               <div class="list-group-item" draggable="true">Fix workshop</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>        
            </div>

            <div class="column2">
               <h1>Doing</h1>
            </div>

            <div class="column3">
               <h1>Done</h1>
            </div>
         </div>

         <!-- 모달창1 -->
         <div id="my_modal">
           <h1>업무 할당</h1>
           <br>
           <div id="modal-area">
               <input type="text" name="" placeholder="업무 명">
               <input type="text" name="" placeholder="직원 명">
               <div id="btn-area">
                   <button class="btn btn-primary" style="width: 30px;" id="plusBtn">+</button>
                   <button class="btn btn-primary" style="width: 30px;" id="minusBtn">-</button>
               </div>
               
               <fieldset>
                <legend>업무 내용</legend>
                
               </fieldset>
            <div id="date">
                마감날짜
                <div id='calendar-container'>
                    <div id='calendar'></div>
                  </div>
            </div>
            <div id="btn-area"> 
                <input class="btn btn-primary" id="addBtn" style="font-size: 1.3em;" type="button" value="추가">
                <input class="btn btn-primary" style="font-size: 1.3em;" type="button" value="취소">
            </div>
            </div>
           
            <a class="modal_close_btn">닫기</a>
        </div>


        <!-- 모달 창 2 -->
        <div id="my_modal2">
            <h1>업무 할당</h1>
            <br>
            <div id="modal-area">
                <input type="text" name="" placeholder="업무 명">
                <input type="text" name="" placeholder="직원 명">
               
                
                <fieldset>
                 <legend>업무 내용</legend>
                 
             </fieldset>
             <div>마감 일시</div>

             </div>
            
             <a class="modal_close_btn">닫기</a>
         </div>

    </div>
</body>
</html>

<script>

    // 드래그 앤 드롭
    const columns = document.querySelectorAll(".column1,.column2");
    columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
    });
    });

    // 모달
    function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    document.getElementById('popup_open_btn').addEventListener('click', function() {
        // 모달창 띄우기
        modal('my_modal');
    });

    // input +
    document.getElementById('plusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = document.createElement('input');
        inputText.setAttribute('type', 'text');
        inputText.setAttribute('name', '');

        var inputCheckbox = document.createElement('input');
        inputCheckbox.setAttribute('type', 'checkbox');

        fieldset.appendChild(inputText);
    });

    // input -
    document.getElementById('minusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = fieldset.querySelector('input[type="text"]');
        var inputCheckbox = fieldset.querySelector('input[type="checkbox"]');

        if (inputText) {
            fieldset.removeChild(inputText);
        }
    });

    //modal 2
    function handleListItemClick() {
        // Show the modal
        modal('my_modal2');

    }

    var listItems = document.querySelectorAll('.list-group-item');
    listItems.forEach(function(item) {
        item.addEventListener('click', handleListItemClick);
    });

    // 추가 버튼 누르면 colum 에 추가됨 근데   /* 백엔드 작업할때 AJAX로 처리*/
    const addBtn = document.querySelector('#addBtn');
    let divTagCnt = 1; // Initialize the divTagCnt variable
    
    addBtn.addEventListener('click', function() {
        let column = document.querySelector('.column1');
        let newDivTag = document.createElement('div');
        alert('추가 완료');
            newDivTag.setAttribute('class', 'list-group-item');
            newDivTag.innerHTML = "추가된 업무들 " + divTagCnt;
            column.appendChild(newDivTag);
            divTagCnt++;

        // 확인 버튼 누르고 모달창 닫히게하기
        var modal = document.getElementById('my_modal');
                    modal.style.display = 'none';

        });

        // 추가 된 모달 클릭시 나오게 해야함 학원에서 처리하자
        newDivTag.addEventListener('click', function() {
        var modal2 = document.getElementById('my_modal2');
        modal2.style.display = 'block';
        modal2.style.top = '50%';
        modal2.style.left = '65%';
        modal2.style.transform = 'translate(-50%, -50%)';
        modal2.style.msTransform = 'translate(-50%, -50%)';
        modal2.style.webkitTransform = 'translate(-50%, -50%)';
         //////////////////////////////////////////////////////////
           
    });


    // callender
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    //   캘린더
    (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '400px', // calendar 높이 설정
       
        // 해더에 표시할 툴바
        headerToolbar: {
        
        },
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        }
       
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();

</script>