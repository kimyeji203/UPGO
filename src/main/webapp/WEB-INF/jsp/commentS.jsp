<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
var b_no = '${detail.b_no}';

$('[name=commentInsertBtn]').click(function() {
	var insertData = $('[name=commentInsertForm]').serialize();
	commentInsert(insertData);
})

//댓글 목록 보이기
function commentList() {
	$.ajax({
		url : '/comment/list',
		type : 'get',
		data : {'b_no' : b_no},
		success : function(data) {
			var a = '';
			$.each(data, function (key, value) {
				a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += '<div class="commentInfo'+value.c_no+'">'+'작성자 : '+value.c_writer + ' 등록일 : '+ value.c_date;
				a += '<a onclick="commentUpdate('+value.c_no+',\''+value.c_content+'\');" style="cursor:pointer;"> 수정 </a>';
				a += '<a onclick="commentDelete('+value.c_no+');" style="cursor:pointer;"> 삭제 </a>';
				a += ' </div><div class="commentContent'+value.c_no+'"> <p> 내용 : '+value.c_content +'</p>';
                a += '</div></div>';
				});
			$(".commentList").html(a);
			}
		});
}

//댓글 등록하기
function commentInsert(insertData) {
	$.ajax({
		url : '/comment/insert',
		type : 'post',
		data : insertData,
		success : function(data) {
			if(data == 1) {
				commentList();
				$('[name=c_content]').val('');
				}
			}
		});
}

//댓글 수정(1) - 댓글 입력 내용 출력을 input 폼으로 변경해서 출력하기
function commentUpdate(c_no, c_content) {
	var a = '';

	a += '<div class="input-group">';
	a += '<input type="text" class="form-control" name="c_content_'+c_no+'" value="'+c_content+'"/>';
	a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+c_no+');">수정</button> </span>';
	a += '</div>';

	$('.commentContent'+c_no).html(a);
}

//댓글 수정기능
function commentUpdateProc(c_no) {
	var updateContent = $('[name=c_content_'+c_no+']').val();

	$.ajax({
		url : '/comment/update',
		type : 'post',
		data : {'c_content' : updateContent, 'c_no' : c_no},
		success : function(data) {
			if(data == 1) commentList(b_no);
		}
	});
}

//댓글 삭제
function commentDelete(c_no) {
	$.ajax({
		url : '/comment/delete/'+c_no,
		type : 'post',
		success : function(data){
			if(data == 1) commentList(b_no); //댓글 삭제 후 목록 출력
		}
	});
}

$(document).ready(function(){
	commentList();
})
</script>