'use strict'
 
  const $member_id1 = document.getElementById('member_id1');
  const $member_pw1 = document.getElementById('member_pw1');
  const $member_repw1 = document.getElementById('member_repw1');
  const $member_tel1 = document.getElementById('member_tel1');
  const $member_nick1 = document.getElementById('member_nick1');
  const $member_birth1 = document.getElementById('member_birth1');
  
  
  const $msg_member_id = document.getElementById('msg_member_id');
  const $msg_member_pw = document.getElementById('msg_member_pw');
  const $msg_member_repw = document.getElementById('msg_member_repw');
  const $msg_member_tel = document.getElementById('msg_member_tel');
  const $msg_member_nick = document.getElementById('msg_member_nick');
  const $msg_member_birth = document.getElementById('msg_member_birth');
  const $msg_member_gender = document.getElementById('msg_member_gender');
   
	/*window.onload = function(){
	$msg_member_nick.style.display='none';
    $msg_member_repw.style.display='none';
    $msg_member_pw.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_id.style.display='none';
    $msg_member_birth.style.display='none';
	}*/
  
  // 클릭시 도움말 표시 시작
  $member_id1.addEventListener('click',evt=>{
    console.log('ddddd ');
    $msg_member_id.style.display='block';
    $msg_member_pw.style.display='none';
    $msg_member_repw.style.display='none';
    $msg_member_tel.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_birth.style.display='none';
  });
  $member_pw1.addEventListener('click',evt=>{
    $msg_member_pw.style.display='block';
    $msg_member_id.style.display='none';
    $msg_member_repw.style.display='none';
    $msg_member_tel.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_birth.style.display='none';
  });
  $member_repw1.addEventListener('click',evt=>{
    $msg_member_repw.style.display='block';
    $msg_member_pw.style.display='none';
    $msg_member_tel.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_birth.style.display='none';
    $msg_member_id.style.display='none';
  });
  $member_tel1.addEventListener('click',evt=>{
    $msg_member_tel.style.display='block';
    $msg_member_repw.style.display='none';
    $msg_member_pw.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_birth.style.display='none';
    $msg_member_id.style.display='none';
  });
  $member_nick1.addEventListener('click',evt=>{
    $msg_member_nick.style.display='block';
    $msg_member_tel.style.display='none';
    $msg_member_repw.style.display='none';
    $msg_member_pw.style.display='none';
    $msg_member_birth.style.display='none';
    $msg_member_id.style.display='none';
  });
  $member_birth1.addEventListener('click',evt=>{
    $msg_member_birth.style.display='block';
    $msg_member_nick.style.display='none';
    $msg_member_repw.style.display='none';
    $msg_member_pw.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_id.style.display='none';
  });
  
  
  
  // 클릭시 도움말 표시 끝
  
  //회원가입 버튼 입력 시 오류 체크 시작
  
  const $joinBtn = document.getElementById('joinBtn');
  const $enrollBtn = document.getElementById('enrollBtn');
  
  $joinBtn.addEventListener('click', joinHandler);
  
  function joinHandler(evt){
  	 
console.log("ppppp");
    //회원가입 버튼 클릭시 도움말 표시 삭제
    $msg_member_nick.style.display='none';
    $msg_member_repw.style.display='none';
    $msg_member_pw.style.display='none';
    $msg_member_nick.style.display='none';
    $msg_member_id.style.display='none';
    $msg_member_birth.style.display='none';
   
  	evt.preventDefault();
  	
     //유효성 체크 통과 못해을 경우 리턴
    if(!validationChk(evt))return;
    //유효성 통과시 제출
     $joinBtn.submit();}
  
  
  function validationChk(){
    //아이디체크
    if(!isEmail(user_email.value)){
      $msg_member_id.style.display='none';
      //오류메세지
      msg_member_id1.textContent='아이디를 잘못 입력하셨습니다.';
      //포커스이동
      user_email.focus();user_email.select();
      return false;
    }else{
      msg_member_id1.textContent='';
    }
    //비밀번호 체크
    if(!isPasswd(user_pw.value)){
      $msg_member_pw.style.display='none';
      //오류메세지
      msg_member_pw1.textContent='4~10자리 영문, 숫자만 가능 합니다.';
      //포커스이동
      user_pw.focus();user_pw.select();
      return false;
    }else{
      msg_member_pw1.textContent='';
    }
    //비밀번호 일치여부 체크
    if(user_pw.value !== user_repw.value){
      msg_member_repw1.textContent='비밀번호가 일치하지 않습니다.';
      user_repw.focus();ueser_repw.select();
      return false;
    }else{
      msg_member_repw1.textContent='';
    }
    //전화번호 체크
    if(!isTel(user_tel.value)){
      $msg_member_tel.style.display='none';
      //오류메세지
      msg_member_tel1.textContent='전화번호 형식에 맞지 않습니다. ex)010-1234-5678';
      //포커스이동
      user_tel.focus();user_tel.select();
      return false;
    }else{
      msg_member_tel1.textContent='';
    }
    //닉네임(별칭) 체크
    if(!isNickname(user_nickname.value)){
      $msg_member_nick.style.display='none';
      //오류메세지
      msg_member_nick1.textContent='4~10자리 문자만 가능합니다.';
      //포커스이동
      user_nickname.focus();user_nickname.select();
      return false;
    }else{
      msg_member_nick1.textContent='';
    }
    // //생년월일 체크
    // if(!iBirth(user_birth.value)){
    //   $msg_member_birth.style.display='none';
    //   //오류메세지
    //   msg_member_birth1.textContent='아이디를 잘못 입력하셨습니다';
    //   //포커스이동
    //   user_birth.focus();user_birth.select();
    //   return false;
    // }else{
    //   msg_member_birth1.textContent='';
    // }
  //성별 체크
 /* const $Allgender = document.querySelectorAll('input[name=user_gender');
  let status = false;
  for(const ele of $Allgender){
    if(ele.checked){
      status=true;
      break;
    }
  }
  if(!status){
    msg_member_gender1.textContent='성별을 선택해주세요';
    return false;
  }else{
    msg_member_gender1.textContent='';
  }
  return true;
  */
}
  
  
  
  
  
  //아이디(이메일) 체크
  function isEmail(user_email){
    const emailPattern = /^[\w]([-_\.]?[\w])*@[\w]([-_\.]?[\w])*\.[a-zA-Z]{2,3}$/;
    return emailPattern.test(user_email);
  }
  
  //비밀번호 체크
  //대소문자 또는 숫자로 시작하고 끝나며 4 ~10자리인지 검사한다.
  function isPasswd(user_pw){
    const passwdPattern = /^[\w]{4,10}$/; // /^[A-Za-z0-9]{4,10}$/
    return passwdPattern.test(user_pw); 
  }
  
  //별칭 유효성체크
  //한글 알파벳 대소문자 또는 숫자로 시작하고 끝나며 4 ~10자리인지 검사한다.
  function isNickname(user_nickname){
    const nicknamePattern = /^[가-힣ㄱ-ㅎㅏ-ㅣA-Za-z0-9]{4,10}$/;
    return nicknamePattern.test(user_nickname); 
  }
  
  //전화번호체크
  function isTel(user_tel){
    const telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
    return telPattern.test(user_tel); 
  }
  
  //숫자인지 체크
  function isNum(num){
    const numPattern = /^[\d]*$/;
    return numPattern.test(num);
  }
  
  //4~10자리수의 숫자인지 체크
  function isNum2(num){
    const numPattern = /^[\d]{4,10}$/;  ///^[0-9]{4,10}$/
    return numPattern.test(num);
  }
