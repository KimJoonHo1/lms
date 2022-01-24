/* ----------------------- list.jsp --------------------------------------- */
var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우

function listSearch() {
	var search = document.getElementById("list-search").value.replace(blank_pattern1, '');
	if(search != "") {
		search = document.getElementById("list-search").value;
	} else {
		search = "";
	}
	$("#list-search").val(search);
	document.getElementById("list-form").submit();
}


/* ------------------------ newUserList.jsp ----------------------*/
function newListSearch() {
	var search = document.getElementById("new-list-search").value.replace(blank_pattern1, '');
	if(search != "") {
		search = document.getElementById("new-list-search").value;
	} else {
		search = "";
	}
	$("#new-list-search").val(search);
	document.getElementById("new-list-form").submit();
}
function approvalUser(data) {
	var id = data.id;
	var form = { id: id };
	if (confirm(id + "님을 가입승인 할까요?")) {
		$.ajax({
			url: "approvaluser", type: "post", data: JSON.stringify(form), dataType: "json", contentType: "application/json; charset=utf-8",
			success: function(map) {
				document.location.href = document.location.href;
			}, error: function() {
				alert("에러 발생");
			}
		});
	} else {

	}

}

/* ----------------------- subject-insert.jsp --------------------------- */
function subjectInsert() {
	if (document.getElementById("sub-insert-name").value == "" || document.getElementById("sub-insert-name").value.replace(blank_pattern1, '') == "") {
		alert("과목명을 입력해 주세요.");
		document.getElementById("sub-insert-name").focus();
		return;
	}
	if (document.getElementById("sub-insert-department").value == "") {
		alert("학과를 선택해 주세요.");
		return;
	}
	if (document.getElementById("sub-insert-score").value == "") {
		alert("학점을 선택해 주세요.");
		return;
	}
	if (document.getElementById("sub-insert-time").value == "") {
		alert("강의 시간을 선택해 주세요.");
		return;
	}
	if (document.getElementById("sub-insert-comment").value == "" || document.getElementById("sub-insert-comment").value.replace(blank_pattern1, '') == "") {
		alert("과목 설명을 입력해 주세요.");
		document.getElementById("sub-insert-comment").focus();
		return;
	}

	document.getElementById("subject-insert-form").submit();
}

/* ---------------------- subject-info.jsp ----------------------------*/
function deleteCheck() {
	if (confirm("정말로 삭제하시겠습니까?")) {
		location.href = "subjectinfo-2?num=" + document.getElementById("delete-num").value;
	}
}

/* ----------------------- lecture-insert.jsp --------------------------------- */
function lectureInsert() {
	if (document.getElementById("lec-insert-name").value == "") {
		alert("과목을 선택해 주세요.");
		return;
	}
	if (document.getElementById("lec-insert-perso").value <= 0 || document.getElementById("lec-insert-perso").value > 30) {
		alert("수강인원은 1~30명 사이로 입력해 주세요.")
		document.getElementById("lec-insert-perso").focus();
		return;
	}
	if (document.getElementById("lec-insert-time1").value == "") {
		alert("강의시간을 선택해 주세요.");
		return;
	}
	if (document.getElementById("lec-insert-time2").value == "") {
		alert("강의시간을 선택해 주세요.");
		return;
	}
	if (document.getElementById("lec-insert-startDate").value == "") {
		alert("강의 시작일을 선택해 주세요.");
		document.getElementById("lec-insert-startDate").focus();
		return;
	}
	if (document.getElementById("lec-insert-endDate").value == "") {
		alert("강의 종료일을 선택해 주세요.");
		document.getElementById("lec-insert-endDate").focus();
		return;
	}
	var date1 = new Date(document.getElementById("lec-insert-startDate").value);
	var date2 = new Date(document.getElementById("lec-insert-endDate").value);
	var date3 = new Date();
	date3.setDate(date3.getDate() + 7);
	if (date3 > date1) {
		alert("강의 시작일은 현재 시간보다 7일뒤부터 입력이 가능합니다.");
		document.getElementById("lec-insert-startDate").focus();
		return;
	}
	if (date1 > date2) {
		alert("강의 시작일이 강의 종료일보다 빠를 수 없습니다.");
		document.getElementById("lec-insert-endDate").focus();
		return;
	}

	document.getElementById("lecture-insert-form").submit();
}

/* ----------------------- lecture-update.jsp ------------------------------------ */
function lectureUpdate() {
	var originalPerso = document.getElementById("originalPerso").value;
	if (document.getElementById("lec-insert-perso").value <= 0 || document.getElementById("lec-insert-perso").value > 30) {
		alert("수강인원은 1~30명 사이로 입력해 주세요.")
		document.getElementById("lec-insert-perso").focus();
		return;
	}
	if (document.getElementById("lec-insert-perso").value < originalPerso && document.getElementById("lec-ture-perso-check").value == 2) {
		alert("수강인원은 현재 수강신청한 학생 수보다 적게 변경하실 수 없습니다.")
		document.getElementById("lec-insert-perso").focus();
		return;
	}
	if (document.getElementById("lec-insert-time1").value == "") {
		alert("강의시간을 선택해 주세요.");
		return;
	}
	if (document.getElementById("lec-insert-time2").value == "") {
		alert("강의시간을 선택해 주세요.");
		return;
	}
	if (document.getElementById("lec-insert-startDate").value == "") {
		alert("강의 시작일을 선택해 주세요.");
		document.getElementById("lec-insert-startDate").focus();
		return;
	}
	if (document.getElementById("lec-insert-endDate").value == "") {
		alert("강의 종료일을 선택해 주세요.");
		document.getElementById("lec-insert-endDate").focus();
		return;
	}
	var date1 = new Date(document.getElementById("lec-insert-startDate").value);
	var date2 = new Date(document.getElementById("lec-insert-endDate").value);
	var date3 = new Date();
	date3.setDate(date3.getDate() + 7);
	if (date3 > date1 && document.getElementById("lec-insert-startDate-check").value == 2) {
		alert("강의 시작일은 현재 시간보다 7일뒤부터 입력이 가능합니다.");
		document.getElementById("lec-insert-startDate").focus();
		return;
	}
	if (date1 > date2) {
		alert("강의 시작일이 강의 종료일보다 빠를 수 없습니다.");
		document.getElementById("lec-insert-endDate").focus();
		return;
	}

	document.getElementById("lecture-insert-form").submit();
}

function lectureDelete() {
	if (confirm("정말로 폐강하시겠습니까?")) {
		document.getElementById("lecture-delete").submit();
	}
}


/* ------------------------- test-insert.jsp ----------------------------- */

function readURL(input) {
	var file = input.files[0];
	var id = input.id;
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			if (id == "img_file1") {
				$('#test-image1').attr('src', e.target.result);
				$("#img-delete-btn1").css("display", "block");
			} else if (id == "img_file2") {
				$('#test-image2').attr('src', e.target.result);
				$("#img-delete-btn2").css("display", "block");
			} else if (id == "img_file3") {
				$('#test-image3').attr('src', e.target.result);
				$("#img-delete-btn3").css("display", "block");
			} else if (id == "img_file4") {
				$('#test-image4').attr('src', e.target.result);
				$("#img-delete-btn4").css("display", "block");
			} else if (id == "img_file5") {
				$('#test-image5').attr('src', e.target.result);
				$("#img-delete-btn5").css("display", "block");
			} else if (id == "img_file6") {
				$('#test-image6').attr('src', e.target.result);
				$("#img-delete-btn6").css("display", "block");
			} else if (id == "img_file7") {
				$('#test-image7').attr('src', e.target.result);
				$("#img-delete-btn7").css("display", "block");
			} else if (id == "img_file8") {
				$('#test-image8').attr('src', e.target.result);
				$("#img-delete-btn8").css("display", "block");
			} else if (id == "img_file9") {
				$('#test-image9').attr('src', e.target.result);
				$("#img-delete-btn9").css("display", "block");
			} else if (id == "img_file10") {
				$('#test-image10').attr('src', e.target.result);
				$("#img-delete-btn10").css("display", "block");
			}

		}
		imgdata(input, file)
	}
}

function imgdata(input, file) {
	data = new FormData();
	var id = input.id;
	data.append("file", file);
	$.ajax({
		url: "imgUp", type: "post", data: data, contentType: false, enctype: 'multipart/form-data', processData: false,
		success: function(a) {
			if (id == "img_file1") {
				$('#fimeName1').val(a.url)
			} else if (id == "img_file2") {
				$('#fimeName2').val(a.url)
			} else if (id == "img_file3") {
				$('#fimeName3').val(a.url)
			} else if (id == "img_file4") {
				$('#fimeName4').val(a.url)
			} else if (id == "img_file5") {
				$('#fimeName5').val(a.url)
			} else if (id == "img_file6") {
				$('#fimeName6').val(a.url)
			} else if (id == "img_file7") {
				$('#fimeName7').val(a.url)
			} else if (id == "img_file8") {
				$('#fimeName8').val(a.url)
			} else if (id == "img_file9") {
				$('#fimeName9').val(a.url)
			} else if (id == "img_file10") {
				$('#fimeName10').val(a.url)
			}
		}, error: function() {
			alert("에러 발생");
		}
	})
}

function testImageDelete(input) {
	var id = input.id;

	if (id == "img-delete-btn1") {
		$('#test-image1').attr('src', "/lmsimg/trip.png");
		$('#fimeName1').val("0");
	}
}

var testNum = 1;

function testInsert(input) {
	var id = input.id;

	if (id == "test-insert-btn1") {
		if (document.getElementById("sub-insert-comment1").value == "" || document.getElementById("sub-insert-comment1").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment1").value.length < 10 || document.getElementById("sub-insert-comment1").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score1").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container2").css("display", "block");
		$("#test-insert-btn1").css("display", "none");
		$("#test-delete-btn1").css("display", "block");
		testNum = 2;
	} else if (id == "test-insert-btn2") {
		if (document.getElementById("sub-insert-comment2").value == "" || document.getElementById("sub-insert-comment2").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment2").value.length < 10 || document.getElementById("sub-insert-comment2").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score2").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container3").css("display", "block");
		$("#test-insert-btn2").css("display", "none");
		$("#test-delete-btn2").css("display", "block");
		testNum = 3;
	} else if (id == "test-insert-btn3") {
		if (document.getElementById("sub-insert-comment3").value == "" || document.getElementById("sub-insert-comment3").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment3").value.length < 10 || document.getElementById("sub-insert-comment3").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score3").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container4").css("display", "block");
		$("#test-insert-btn3").css("display", "none");
		$("#test-delete-btn3").css("display", "block");
		testNum = 4;
	} else if (id == "test-insert-btn4") {
		if (document.getElementById("sub-insert-comment4").value == "" || document.getElementById("sub-insert-comment4").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment4").value.length < 10 || document.getElementById("sub-insert-comment4").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score4").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container5").css("display", "block");
		$("#test-insert-btn4").css("display", "none");
		$("#test-delete-btn4").css("display", "block");
		testNum = 5;
	} else if (id == "test-insert-btn5") {
		if (document.getElementById("sub-insert-comment5").value == "" || document.getElementById("sub-insert-comment5").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment5").value.length < 10 || document.getElementById("sub-insert-comment5").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score5").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container6").css("display", "block");
		$("#test-insert-btn5").css("display", "none");
		$("#test-delete-btn5").css("display", "block");
		testNum = 6;
	} else if (id == "test-insert-btn6") {
		if (document.getElementById("sub-insert-comment6").value == "" || document.getElementById("sub-insert-comment6").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment6").value.length < 10 || document.getElementById("sub-insert-comment6").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score6").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container7").css("display", "block");
		$("#test-insert-btn6").css("display", "none");
		$("#test-delete-btn6").css("display", "block");
		testNum = 7;
	} else if (id == "test-insert-btn7") {
		if (document.getElementById("sub-insert-comment7").value == "" || document.getElementById("sub-insert-comment7").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment7").value.length < 10 || document.getElementById("sub-insert-comment7").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score7").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container8").css("display", "block");
		$("#test-insert-btn7").css("display", "none");
		$("#test-delete-btn7").css("display", "block");
		testNum = 8;
	} else if (id == "test-insert-btn8") {
		if (document.getElementById("sub-insert-comment8").value == "" || document.getElementById("sub-insert-comment8").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment8").value.length < 10 || document.getElementById("sub-insert-comment8").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score8").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container9").css("display", "block");
		$("#test-insert-btn8").css("display", "none");
		$("#test-delete-btn8").css("display", "block");
		testNum = 9;
	} else if (id == "test-insert-btn9") {
		if (document.getElementById("sub-insert-comment9").value == "" || document.getElementById("sub-insert-comment9").value.replace(blank_pattern1, '') == "") {
			alert("문제지를 작성해 주세요.");
			return;
		}
		if (document.getElementById("sub-insert-comment9").value.length < 10 || document.getElementById("sub-insert-comment9").value.length > 200) {
			alert("문제지는 10~200자 사이로 작성해 주세요.");
			return;
		}
		if (document.getElementById("test-score9").value == "") {
			alert("문제 점수를 입력해 주세요");
			return;
		}
		$("#test-container10").css("display", "block");
		$("#test-insert-btn9").css("display", "none");
		$("#test-delete-btn9").css("display", "block");
		testNum = 10;
	}

}

function testDelete(input) {
	$("#test-score1").val($('#test-score2').val());
	$("#sub-insert-comment1").val($('#sub-insert-comment2').val());
	$("#test-image1").attr("src", document.getElementById("test-image2").src);

	$("#test-score2").val($('#test-score3').val());
	$("#sub-insert-comment2").val($('#sub-insert-comment3').val());
	$("#test-image2").attr("src", document.getElementById("test-image3").src);

	$("#test-score3").val($('#test-score4').val());
	$("#sub-insert-comment3").val($('#sub-insert-comment4').val());
	$("#test-image3").attr("src", document.getElementById("test-image4").src);

	$("#test-score4").val($('#test-score5').val());
	$("#sub-insert-comment4").val($('#sub-insert-comment5').val());
	$("#test-image4").attr("src", document.getElementById("test-image5").src);

	$("#test-score5").val($('#test-score6').val());
	$("#sub-insert-comment5").val($('#sub-insert-comment6').val());
	$("#test-image5").attr("src", document.getElementById("test-image6").src);

	$("#test-score6").val($('#test-score7').val());
	$("#sub-insert-comment6").val($('#sub-insert-comment7').val());
	$("#test-image6").attr("src", document.getElementById("test-image7").src);

	$("#test-score7").val($('#test-score8').val());
	$("#sub-insert-comment7").val($('#sub-insert-comment8').val());
	$("#test-image7").attr("src", document.getElementById("test-image8").src);

	$("#test-score8").val($('#test-score9').val());
	$("#sub-insert-comment8").val($('#sub-insert-comment9').val());
	$("#test-image8").attr("src", document.getElementById("test-image9").src);

	$("#test-score9").val($('#test-score10').val());
	$("#sub-insert-comment9").val($('#sub-insert-comment10').val());
	$("#test-image9").attr("src", document.getElementById("test-image10").src);

	$("#test-score10").val("");
	$("#sub-insert-comment10").val("");
	$("#test-image10").attr("src", "/lmsimg/trip.png");

	if (testNum == 2) {
		$("#test-container2").css("display", "none");
		$("#test-insert-btn1").css("display", "block");
		$("#test-delete-btn1").css("display", "none");
		testNum = 1
	}
	if (testNum == 3) {
		$("#test-container3").css("display", "none");
		testNum = 2
		$("#test-insert-btn2").css("display", "block");
		$("#test-delete-btn2").css("display", "none");
	}
	if (testNum == 4) {
		$("#test-container4").css("display", "none");
		testNum = 3
		$("#test-insert-btn3").css("display", "block");
		$("#test-delete-btn3").css("display", "none");
	}
	if (testNum == 5) {
		$("#test-container5").css("display", "none");
		testNum = 4
		$("#test-insert-btn4").css("display", "block");
		$("#test-delete-btn4").css("display", "none");
	}
	if (testNum == 6) {
		$("#test-container6").css("display", "none");
		testNum = 5
		$("#test-insert-btn5").css("display", "block");
		$("#test-delete-btn5").css("display", "none");
	}
	if (testNum == 7) {
		$("#test-container7").css("display", "none");
		testNum = 6
		$("#test-insert-btn6").css("display", "block");
		$("#test-delete-btn6").css("display", "none");
	}
	if (testNum == 8) {
		$("#test-container8").css("display", "none");
		testNum = 7
		$("#test-insert-btn7").css("display", "block");
		$("#test-delete-btn7").css("display", "none");
	}
	if (testNum == 9) {
		$("#test-container9").css("display", "none");
		testNum = 8
		$("#test-insert-btn8").css("display", "block");
		$("#test-delete-btn8").css("display", "none");
	}
	if (testNum == 10) {
		$("#test-container10").css("display", "none");
		testNum = 9
		$("#test-insert-btn9").css("display", "block");
		$("#test-delete-btn9").css("display", "none");
	}
}

function testRegister() {
	if(document.getElementById("sub-insert-department").value == "") {
		alert("강의를 선택해 주세요.")
		return;
	}
	if(document.getElementById("startDate").value == "") {
		alert("시험 시작 일자를 선택해 주세요.");
		document.getElementById("startDate").focus();
		return;
	}
	if(document.getElementById("endDate").value == "") {
		alert("시험 종료 일자를 선택해 주세요.");
		document.getElementById("endDate").focus();
		return;
	}
	
	var date1 = new Date(document.getElementById("startDate").value);
	var date2 = new Date(document.getElementById("endDate").value);
	var date3 = new Date();
	
	if(date1 <= date3) {
		alert("시험 시작 일자를 현재 시간보다 빨리 설정하실 수 없습니다.");
		document.getElementById("startDate").focus();
		return;
	}
	if(date1 >= date2) {
		alert("시험 종료 일자를 시험 시작 일자보다 빨리 설정하실 수 없습니다.");
		document.getElementById("endDate").focus();
		return;
	}

	if (document.getElementById("sub-insert-comment1").value == "" || document.getElementById("sub-insert-comment1").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment1").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment1").value.length < 10 || document.getElementById("sub-insert-comment1").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment1").focus();
		return;
	}
	if (document.getElementById("test-score1").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score1").focus();
		return;
	}
	
	if(testNum == 1) {
		if(document.getElementById("test-score1").value == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment2").value == "" || document.getElementById("sub-insert-comment2").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment2").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment2").value.length < 10 || document.getElementById("sub-insert-comment2").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment2").focus();
		return;
	}
	if (document.getElementById("test-score2").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score2").focus();
		return;
	}
	
	if(testNum == 2) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment3").value == "" || document.getElementById("sub-insert-comment3").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment3").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment3").value.length < 10 || document.getElementById("sub-insert-comment3").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment3").focus();
		return;
	}
	if (document.getElementById("test-score3").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score3").focus();
		return;
	}
	
	if(testNum == 3) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment4").value == "" || document.getElementById("sub-insert-comment4").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment4").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment4").value.length < 10 || document.getElementById("sub-insert-comment4").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment4").focus();
		return;
	}
	if (document.getElementById("test-score4").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score4").focus();
		return;
	}
	
	if(testNum == 4) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment5").value == "" || document.getElementById("sub-insert-comment5").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment5").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment5").value.length < 10 || document.getElementById("sub-insert-comment5").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment5").focus();
		return;
	}
	if (document.getElementById("test-score5").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score5").focus();
		return;
	}
	
	if(testNum == 5) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) + Number(document.getElementById("test-score5").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment6").value == "" || document.getElementById("sub-insert-comment6").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment6").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment6").value.length < 10 || document.getElementById("sub-insert-comment6").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment6").focus();
		return;
	}
	if (document.getElementById("test-score6").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score6").focus();
		return;
	}
	
	if(testNum == 6) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) + Number(document.getElementById("test-score5").value) + Number(document.getElementById("test-score6").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment7").value == "" || document.getElementById("sub-insert-comment7").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment7").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment7").value.length < 10 || document.getElementById("sub-insert-comment7").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment7").focus();
		return;
	}
	if (document.getElementById("test-score7").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score7").focus();
		return;
	}
	
	if(testNum == 7) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) + Number(document.getElementById("test-score5").value) + Number(document.getElementById("test-score6").value)
		+ Number(document.getElementById("test-score7").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment8").value == "" || document.getElementById("sub-insert-comment8").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment8").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment8").value.length < 10 || document.getElementById("sub-insert-comment8").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment8").focus();
		return;
	}
	if (document.getElementById("test-score8").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score8").focus();
		return;
	}
	
	if(testNum == 8) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) + Number(document.getElementById("test-score5").value) + Number(document.getElementById("test-score6").value)
		+ Number(document.getElementById("test-score7").value) + Number(document.getElementById("test-score8").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment9").value == "" || document.getElementById("sub-insert-comment9").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment9").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment9").value.length < 10 || document.getElementById("sub-insert-comment9").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment9").focus();
		return;
	}
	if (document.getElementById("test-score9").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score9").focus();
		return;
	}
	
	if(testNum == 9) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) + Number(document.getElementById("test-score5").value) + Number(document.getElementById("test-score6").value)
		+ Number(document.getElementById("test-score7").value) + Number(document.getElementById("test-score8").value) +  Number(document.getElementById("test-score9").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
	
	if (document.getElementById("sub-insert-comment10").value == "" || document.getElementById("sub-insert-comment10").value.replace(blank_pattern1, '') == "") {
		alert("문제지를 작성해 주세요.");
		document.getElementById("sub-insert-comment10").focus();
		return;
	}
	if (document.getElementById("sub-insert-comment10").value.length < 10 || document.getElementById("sub-insert-comment10").value.length > 200) {
		alert("문제지는 10~200자 사이로 작성해 주세요.");
		document.getElementById("sub-insert-comment10").focus();
		return;
	}
	if (document.getElementById("test-score10").value == "") {
		alert("문제 점수를 입력해 주세요");
		document.getElementById("test-score10").focus();
		return;
	}
	
	if(testNum == 10) {
		if(Number(document.getElementById("test-score1").value) + Number(document.getElementById("test-score2").value) + Number(document.getElementById("test-score3").value)
		+ Number(document.getElementById("test-score4").value) + Number(document.getElementById("test-score5").value) + Number(document.getElementById("test-score6").value)
		+ Number(document.getElementById("test-score7").value) + Number(document.getElementById("test-score8").value) +  Number(document.getElementById("test-score9").value)
		+ Number(document.getElementById("test-score10").value) == 100) {
			document.getElementById("subject-insert-form").submit();
		} else {
			alert("시험 점수의 합이 100점이 아닙니다.");
		}
		return;
	}
}

/* ---------------------- notice -------------------------------- */


	
function noticeinsert() {
	if(document.getElementById("notice-title").value == "" || document.getElementById("notice-title").value.replace(blank_pattern1, '') == "") {
		alert("제목을 입력해 주세요.");
		document.getElementById("notice-title").focus();
		return;
	}
	
	if(document.getElementById("notice-title").value.length > 30) {
		alert("제목은 30자를 초과하실 수 없습니다.");
		document.getElementById("notice-title").focus();
		return;
	}
	
	
	var text = document.getElementById("summernote").value;
	text = text.replace(/<br\/>/ig, "");
	text = text.replace(/<p>/ig, "");
	text = text.replace(/<\/p>/ig, "");
	text = text.replace(/&nbsp;/gi,"");
	
	if(text == "" || text.replace(blank_pattern1, '') == "") {
		alert("내용을 입력해 주세요.");
		document.getElementById("summernote").focus();
		return;
	}
	
	document.getElementById("subject-insert-form").submit();

}

function noticeDelete() {
	if (confirm("정말로 삭제하시겠습니까?")) {
		location.href = "noticeinfo-2?num=" + document.getElementById("delete-num").value;
	}
}