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
    			<button class="btn btn-warning btn-xs reply_btn_udate_from" data-target="#myModal" data-toggle="modal">??????</button>
				<button class="btn btn-danger btn-xs reply_btn_delete">??????</button>
    		</div>
  		</div>
	</div>


`;

	return msg;
}
 
 
function me3(userId, userPw, userName, email){
   var msg = `<div class="panel panel-primary">
      <div class="panel-heading">
         ?????????: ${userId} <span class="pull-right">????????????: ${userPw}</span>
      </div>
      <div class="panel-body">
         <h3>??????: ${userName}</h3>
         <h5>?????????: ${email}</h5>
      </div>
   </div>`;
   
   return msg;
} 
 
/*function me2(a, b){
	var msg = `<h1> ?????? ${a}??? ????????????, ${b}??? ???????????????</h1>`;
	return msg;
}
//????????? ??????``grave accent(???????????? ?????????)??? ????????? shift??? ????????????
//????????? ?????????????????? ????????? ????????? ???????????? ${}??? ????????? ?????? ????????? ????????????

function me1(a, b){
	var msg ="?????? "+a+"??? ????????????, "+b+"??? ???????????????.";
	console.log(msg);
}*/