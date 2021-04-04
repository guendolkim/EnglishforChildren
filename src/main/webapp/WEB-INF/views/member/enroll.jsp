<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/portfolio/css//member/enroll.css">
<!-- <script defer src="/portfolio/js//member/enroll.js" ></script> -->
</head>
<body>
 <body>
  <div class="wrapper">
  <div class="img_wrapper">
  <!-- <img src="https://picsum.photos/600/300" alt=""> -->
</div>
 <form action="/portfolio/member/enrollNewMember" method="POST" id="formSubmit"  enctype="multipart/form-data">
  <div id="picArea"><img id="proPic" src="data:${sessionScope.member.ftype};base64,${sessionScope.member.picBase64}" width="200px" height="200px" onerror="this.src='https://cdn.pixabay.com/photo/2021/02/08/16/03/dinosaur-5995333__340.png'" alt=""></div>
  <li><input id="nopic" type="hidden" value="https://cdn.pixabay.com/photo/2021/02/08/16/03/dinosaur-5995333__340.png"></li>
  <li >프로필사진<input type="file" name="file" id="file"></li>
  <li><span id="picMsg"></span></li>
  <li>아이디(e-mail)<input type="email" name="member_email" ></li>
  <li>비밀번호<input type="password" name="member_pw" ></li>
  <li>비밀번호 확인<input type="password"></li>
  <li>닉네임(별칭)<input type="text" name="member_nickname" ></li>
  <li>연락처<input type="tel" name="member_tel" ></li>
  <li>생년월일<input type="date" name="member_birth" ></li>
  <li><input type="submit" id="subtn" value="회원가입"></li>
</form>
 
</body>
<script>
  const $file = document.getElementById('file'); // 파일등록버튼
  const $picArea = document.getElementById('picArea'); //이미지영역 클릭하면 파일오픈
  const $picMsg = document.getElementById('picMsg');  //유효성 검사후 부적합시 메세지
  const $proPic = document.getElementById('proPic');  //미리보기
  const $subtn = document.getElementById('subtn');  //미리보기

  //그림 클릭시 파일등록 버튼 발동
  $picArea.addEventListener('click',evt=>{
    $file.click();
    
    
  });

  //파일선택창에서 파일을 선택했을때
  $file.addEventListener('change',evt=>{
    //메모리상에 로딩된 url정보를 읽어와 미리보기
    const url = URL.createObjectURL($file.files[0]);
    $proPic.src = url;
    
  });
  $subtn.addEventListener('click',evt=>{
  
    if(!$file.files[0] > 0 ){
      const jb = document.getElementById('nopic').getAttribute('value');
      console.log(jb);
      $proPic.setAttribute('src',jb);
      console.log($proPic.getAttribute('src'));
      
    }
    
  });
  
    </script>
</html>