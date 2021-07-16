/**
 * 
 */
  	function getFileUploadFilenameInput(index, filename){
 	var msg=`
  		<input id="filename" name="filename" value = "${filename}" type = "hidden" name ="files[${index}]"> 		
 	`;
 	return msg;
 	}
 	
   function uploadUpdateForm(getLinkText,filename,getOriginalName){
  var src = '';
  
   if(checkImageType(filename)){
   			src = "/board/displayFile?filename="+filename;	 
	}else {
			src = "/resources/img/etc.png";				
 	}
  
  
  var msg= `
  	<div class='col-xs-4'>
		<a target="_blank" href="${getLinkText}">
			<img src="${src}">
		</a>
		<p class="ellpsisTarget"><small class="delFile" data-filename="${filename}" style="border:1px solid red;cursor:pointer;">x</small>${getOriginalName}</p>
	</div> 
	`;
	
	return msg;
  
  
  }
 
 
  function uploadViewForm(getLinkText,filename,getOriginalName){
  var src = '';
  
  /*var getLinkText = getLinkText(filename);
  var getOriginalName = getOriginalName(filename); */

   if(checkImageType(filename)){
   			src = "/board/displayFile?filename="+filename;	 
	}else {
			src = "/resources/img/etc.png";				
	}
  
  
  var msg= `
  	<div class='col-xs-4'>
		<a target="_blank" href="${getLinkText}">
			<img src="${src}">
		</a>
		<p class="ellpsisTarget">${getOriginalName}</p>
	</div> 
	`;
	
	return msg;
  
  
  }
 
 
 
 function getLinkText(filename){
 	
 	    if(checkImageType(filename)){
       var idx = filename.indexOf("_s_");
       var prefix = filename.substring(0, idx);
       var suffix = filename.substring(idx+2);
       filename = prefix + suffix;
    }

	   return  "/board/displayFile?filename="+filename;
 }
 
 function getOriginalName(filename){
   var idx = -1;

   if(checkImageType(filename)){
      idx = filename.indexOf("_")+3;
   }else{
      idx = filename.indexOf("_")+1;
   }
   
   return filename.substring(idx);
} 
 
function checkImageType(filename){
	var idx = filename.lastIndexOf(".")+1
	var extendName = filename.substring(idx).toUpperCase();
	if(extendName == "PNG"||extendName == "JPEG"||extendName == "GIF"||extendName == "JPG"){
	return true;
	}else{
	return false;
	}

}
 
 
function repliesList(rno, replyer, updatedate, replytext){
var msg=`
	<div class="panel panel-primary">
  		<div class="panel-heading">
	  		 <span>rno.${rno}</span>
	  		 <span class="glyphicon glyphicon-user" aria-hidden="true"></span><span>${replyer}</span>
	  		 <span class="pull-right"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>${updatedate}</span>
  		</div>
  		
  		<div class="panel-body">
    		<p>${replytext}</p>
    		<div data-rno="${rno}" data-replyer="${replyer}">
    			<button class="btn btn-warning btn-xs reply_btn_udate_from" data-target="#myModal" data-toggle="modal">수정</button>
				<button class="btn btn-danger btn-xs reply_btn_delete">삭제</button>
    		</div>
  		</div>
	</div>


`;

	return msg;
}
 
 
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