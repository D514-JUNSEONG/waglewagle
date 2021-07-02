<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<style>
#container {
   width: 800px;
   margin: auto;
}

#title {
   font-weight: bold;
}

#inputTitle {
   width: 100%;
}

#inputContent {
   width: 100%;
   height: 400px;
}

.card-body {
   padding: 0;
}

.card-text {
   color: black;
}

.pagination {
   margin: 0;
}

a {
   color: balck;
}

.row {
   margin: auto;
   width:1000px;
}

#addFile {
   position: relative;
   left: 8px;
}
</style>
<script>
   $(function() {
      $("#toList")
            .on(
                  "click",
                  function() {
                     location.href = "${pageContext.request.contextPath}/board/boardList.jsp";
                  });

      $("input[type='file']").on(
            "change",
            function() {
               $(this).next('.custom-file-label').html(
                     event.target.files[0].name);
            });

      $(".file-box").on("click", ".delFile", function() {
         $(this).parent().remove();
      })

      let fileCount = 1;
      $("#addFile").on("click", function() {
         let fileLine = $("<div>");
         let inputFile = $("<input>");
         inputFile.attr("type", "file");
         inputFile.attr("name", "file" + fileCount++);

         let delBtn = $("<button>");
         delBtn.addClass("delFile btn btn-outline-secondary btn-sm");
         delBtn.attr("type", "button");
         delBtn.text("삭제");

         fileLine.append(inputFile);
         fileLine.append(delBtn);

         $(".file-box").append(fileLine);
      });

   })
</script>
</head>
<body>
   <form action="${pageContext.request.contextPath}/insert.board"
      method="post" enctype="multipart/form-data">

      <div class="row">
         <div class="col-12">
            <div
               class="card-header bg-transparent border-secondary text-secondary col-12">
               <h5 class="card-title" id="title">자유게시판 글 쓰기</h5>
            </div>
            
      
               <div class="col-3">
                  <select class="form-control" name="category" id="srch_item">
                     <option value="" selected>선택하세요.</option>
                     <option value="1">패션</option>
                     <option value="2">동물</option>
                     <option value="3">스포츠</option>
                  </select>
               </div>
               <div class="col-9">
                  <input type=text class="form-control mb-2" name="nickname" placeholder="닉네임">
               </div>
               

            <div class="col-12">
               <input type=text class="form-control mb-2" placeholder="제목을 입력하세요." name="title">
            </div>
            
            <div class="col-12" style="height:400px">
               <textarea placeholder="내용을 입력하세요." id="inputContent" 
               style="resize: none;" name="contents"></textarea>
            </div>
            
            <div class="col-12">
               파일첨부
               <button type="button" class="btn btn-secondary btn-sm" id="addFile">추가</button>
               <div class="file-box"></div>
            </div>


            <div class="row btns" align="right">
               <button type="submit" class="btn btn-outline-secondary" id="toWrite">글 쓰기</button>
               <button type="button" class="btn btn-outline-secondary" id="toList">목록으로</button>
            </div>
         </div>
      </div>
   </form>
</body>
</html>