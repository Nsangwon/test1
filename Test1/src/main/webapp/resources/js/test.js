/**
 * 
 */
 
function me3(userId, userPw, userName, email){
   var msg = `<div class="panel panel-primary">
      <div class="panel-heading">
         아이디: ${userId} <span class="pull-right">비밀번호: ${userPw}</span>
      </div>
      <div class="panel-body">
         <h3>이름: ${userName}</h3>
         <h5>이메일: ${email}</h5>
      </div>
   </div>`;
   
   return msg;
} 
 
/*function me2(a, b){
	var msg = `<h1> 나는 ${a}를 좋아하고, ${b}를 싫어합니다</h1>`;
	return msg;
}
//템블릿 리턴``grave accent(그레이브 악센트)는 물결표 shift로 사용한다
//외부에 자바스트립트 파일을 만들어 사용하며 ${}는 이엘이 아닌 템플릿 문법이며

function me1(a, b){
	var msg ="나는 "+a+"를 좋아하고, "+b+"를 싫어합니다.";
	console.log(msg);
}*/