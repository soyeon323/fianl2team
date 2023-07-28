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

<meta charset="UTF-8">
<title>Insert title here</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 드래그 앤 드롭 API-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

<link rel="stylesheet" href="${root}/resources/css/work/work.css">
</head>
<body>
   
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">
        <div id="enroll">업무 할당 </div>
        <button class="btn btn-primary" id="popup_open_btn">업무 추가</button>

        <div class="container">
           
            <div class="column1">
                <h1>To-Do</h1>
                
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
         
           <h1>업무 할당 </h1>
           <br>
           <div id="modal-area">
            <a class="modal_close_btn">닫기</a>
s                <input type="text" name="workName" id="workName" placeholder="업무 명">
                <br>
                <br>
                <input type="text" name="userName" id="agent" placeholder="직원 명">
                <select id="showtimes" name="showtimes"> 
                    <c:forEach items="${vo}" var="vo">
	                    <optgroup label="${vo.deptName}">
	                        <option >${vo.userName}</option> 
	                    </optgroup> 
                    </c:forEach>
                </select>
                <div id="btn-area" style="margin-left: 200px; margin-top: 20px;">
                    <button class="btn btn-primary" type="button" style="width: 30px;" id="plusBtn">+</button>
                    <button class="btn btn-primary" type="button" style="width: 30px;" id="minusBtn">-</button>
                </div>
                
                <fieldset>
                 <legend>업무 내용</legend>
                 <input type="text" name="workContent" id="workContent">
                
                </fieldset>
             </div>
             <br>
             <br>
             <div id="date">
                 마감날짜
                     <input type="date" name="endDate"/>
             </div>
             <div id="btn-area" style="margin-left: 400px;"> 
                 <input class="btn btn-primary" id="addBtn" style="font-size: 1.3em;" type="submit" value="추가">
             </div>
        </div>

    </div>


  
       
</body>
</html>

<script>

//업무행위자 추가
document.getElementById('showtimes').addEventListener('change', function() {
    var selectedOption = this.options[this.selectedIndex];
    var selectedValue = selectedOption.innerHTML;
    var agentInput = document.getElementById('agent');
    agentInput.value += selectedValue +',';
});

/////////////////////    여기서 업무이름 , 업무내용 , 업무수행자 , 마감일시 보내주기 인서트 완료하면   toDo에 내가방금추가했던 업무명과 마감일시가 보여야함              ////////////////////////////////////////
const addBtn = document.getElementById('addBtn');
addBtn.addEventListener('click' ,function () {

    $.ajax({
        url : '${root}/work/insert',
        method : 'get',
        data : {},
        success : ()=>{

        },
        error : ()=>{
            
        }
    });


    
});


/////////////////////////////////////////////////////////////




    // 추가 버튼 누르면 colum 에 추가됨 
    const popBtn = document.querySelector('#popup_open_btn');
    let divTagCnt = 1; 
    popBtn.addEventListener('click', function() {

        let column = document.querySelector('.column1');
        let newDivTag = document.createElement('div');
            newDivTag.setAttribute('class', 'list-group-item');
            newDivTag.innerHTML = "" + divTagCnt;  //여기에 내가 추가했던 업무 제목이랑 마감일시 박혀야함 아약스로 처리
            column.appendChild(newDivTag);
            divTagCnt++;

        });


//  input +
   document.getElementById('plusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = document.createElement('input');
        inputText.setAttribute('type', 'text');
        inputText.setAttribute('name', 'workContent');
        inputText.setAttribute('id', 'workContent');

        var inputCheckbox = document.createElement('input');
        inputCheckbox.setAttribute('type', 'checkbox');
        inputCheckbox.setAttribute('name', 'chaekListName');
        inputCheckbox.style.width = "25px";

        fieldset.appendChild(inputText);
        fieldset.appendChild(inputCheckbox);
    });


    // input -
    document.getElementById('minusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = fieldset.querySelector('input[type="text"]');
        var inputCheckbox = fieldset.querySelector('input[type="checkbox"]');

        if (inputText) {
            fieldset.removeChild(inputText);
            fieldset.removeChild(inputCheckbox);
        }
    });



 // 모달1
 function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);



        // 닫기 버튼 처리
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });

        
    }


// newDivTag 클릭 이벤트 리스너 추가
var column1 = document.querySelector('.column1');
column1.addEventListener('click', function(event) {
    var clickedElement = event.target;
    if (clickedElement.classList.contains('list-group-item')) {
        // 모달창 띄우기
        modal('my_modal');
        // 클릭한 newDivTag 엘리먼트 저장
        clickedElement = clickedElement;
    }
});



    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };



   
    var listItems = document.querySelectorAll('.list-group-item');
    listItems.forEach(function(item) {
        item.addEventListener('click', handleListItemClick);
    });

 // 드래그 앤 드롭
 const columns = document.querySelectorAll(".column1,.column2,.column3");
    columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
    });
    });

    var column = document.querySelector('.column1');
    column.addEventListener('click', function(event) {
        var clickedElement = event.target;
        if (clickedElement.classList.contains('list-group-item')) {
            handleDivClick();
        }
    });

    var column2 = document.querySelector('.column2');
    column2.addEventListener('click', function(event) {
        var clickedElement = event.target;
        if (clickedElement.classList.contains('list-group-item')) {
            modal('my_modal');
        }
    });



  

</script>