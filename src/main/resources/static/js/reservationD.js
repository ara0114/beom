// 바로실행
$(function () {
  $(".woman_cut_price").hide();
  $(".man_cut_price").hide();
  $(".woman_perm_price").hide();
  $(".man_perm_price").hide();
  $(".woman_color_price").hide();
  $(".man_color_price").hide();
  $(".woman_dry_price").hide();
  $(".man_dry_price").hide();
  updateProgress();
  $("#category").change(function () {
    updateProgress();
    let category = $("#category option:selected").val();
    if (category == "시술 선택") {
      $(".woman_cut_price").hide();
      $(".man_cut_price").hide();
      $(".woman_perm_price").hide();
      $(".man_perm_price").hide();
      $(".woman_color_price").hide();
      $(".man_color_price").hide();
      $(".woman_dry_price").hide();
      $(".man_dry_price").hide();
      $("#gender").val("성별 선택");
    } else if (category == "perm") {
      $(".woman_cut_price").hide();
      $(".man_cut_price").hide();
      $(".woman_color_price").hide();
      $(".man_color_price").hide();
      $(".woman_dry_price").hide();
      $(".man_dry_price").hide();
      $("#gender").val("성별 선택");
    } else if (category == "color") {
      $(".woman_cut_price").hide();
      $(".man_cut_price").hide();
      $(".woman_perm_price").hide();
      $(".man_perm_price").hide();
      $(".woman_dry_price").hide();
      $(".man_dry_price").hide();
      $("#gender").val("성별 선택");
    } else if (category == "cut") {
      $(".woman_color_price").hide();
      $(".man_color_price").hide();
      $(".woman_perm_price").hide();
      $(".man_perm_price").hide();
      $(".woman_dry_price").hide();
      $(".man_dry_price").hide();
      $("#gender").val("성별 선택");
    } else if (category == "dry") {
      $(".woman_color_price").hide();
      $(".man_color_price").hide();
      $(".woman_perm_price").hide();
      $(".man_perm_price").hide();
      $(".woman_cut_price").hide();
      $(".man_cut_price").hide();
      $("#gender").val("성별 선택");
    }
  });

  //시술가격 값 가져오기
  $(".woman_cut_price").change(function () {
    let woman_cut_price = $(".woman_cut_price").val();
  });
  $(".man_cut_price").change(function () {
    let man_cut_price = $(".man_cut_price").val();
  });
  $(".woman_perm_price").change(function () {
    let woman_perm_price = $(".woman_perm_price").val();
  });
  $(".man_perm_price").change(function () {
    let man_perm_price = $(".man_perm_price").val();
  });
  $(".woman_color_price").change(function () {
    let woman_color_price = $(".woman_color_price").val();
  });
  $(".man_color_price").change(function () {
    let man_color_price = $(".man_color_price").val();
  });
  $(".woman_dry_price").change(function () {
    let woman_dry_price = $(".woman_dry_price").val();
  });
  $(".man_dry_price").change(function () {
    let man_dry_price = $(".man_dry_price").val();
  });

  $("#gender").change(function () {
    updateProgress();
    let gender = $("#gender").val();
    let category = $("#category option:selected").val();
      

    // 성별 + 카테고리 cut 선택시
    if (gender == "woman" && category == "cut") {
      if (gender == "woman") {
        $(".woman_cut_price").show();
      }
      $(".man_cut_price").hide();
    } else if (gender == "man" && category == "cut") {
      if (gender == "man") {
        $(".man_cut_price").show();
      }
      $(".woman_cut_price").hide();
    } else if (gender == "성별 선택") {
      $(".woman_cut_price").hide();
      $(".man_cut_price").hide();
      $(".woman_perm_price").hide();
      $(".man_perm_price").hide();
      $(".man_color_price").hide();
      $(".woman_color_price").hide();
      $(".woman_dry_price").hide();
      $(".man_dry_price").hide();
    }
    //성별 + 카테고리 perm 선택시

    if (gender == "woman" && category == "perm") {
      if (gender == "woman") {
        $(".woman_perm_price").show();
      }
      $(".man_perm_price").hide();
    } else if (gender == "man" && category == "perm") {
      if (gender == "man") {
        $(".man_perm_price").show();
      }
      $(".woman_perm_price").hide();
    }
    //성별 + 카테고리 color 선택시
    if (gender == "woman" && category == "color") {
      if (gender == "woman") {
        $(".woman_color_price").show();
      }
      $(".man_color_price").hide();
    } else if (gender == "man" && category == "color") {
      if (gender == "man") {
        $(".man_color_price").show();
      }
      $(".woman_color_price").hide();
    }

    //성별 + 카테고리 dry 선택시
    if (gender == "woman" && category == "dry") {
      if (gender == "woman") {
        $(".woman_dry_price").show();
      }
      $(".man_dry_price").hide();
    } else if (gender == "man" && category == "dry") {
      if (gender == "man") {
        $(".man_dry_price").show();
      }
      $(".woman_dry_price").hide();
    }
  });
});

//날짜
$("#startDate").datepicker({
  minDate: new Date(),
  showOn: "both",
  buttonImage:
    "https://cdn-icons.flaticon.com/png/512/939/premium/939128.png?token=exp=1657774669~hmac=1c3ac533c4f996c6ba86b17be0cda07d",
  buttonImageOnly: true,
  buttonText: "Click Here",
  dateFormat: "yy-mm-dd",
  changeMonth: true,
  changeYear: true,
  nextText: "다음 달",
  prevText: "이전 달",
  showAnim: "drop",
  showButtonPanel: true,
  currentText: "오늘 날짜",
  closeText: "닫기",
  autoSize: true,
  dayNames: [
    "월요일",
    "화요일",
    "수요일",
    "목요일",
    "금요일",
    "토요일",
    "일요일",
  ],
  dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
  monthNamesShort: [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ],
});

//체크박스 radio
$("input[type='radio']").checkboxradio();


$("#submit").button({
  disabled: true,
});
//progress var 진행율
$("#progress").progressbar({
  value: 0,
});
$("input").change(function () {
  updateProgress();
});
$("select").change(function () {
  updateProgress();
});

function updateProgress() {
  let $progress = 0,
    $itemCount = 5,
    $itemCompleted = 0;

  let $category = $("#category option:selected").val();
  let $gender = $("#gender option:selected").val();
  let $price = $("#price option:selected").val();
  let $time = $("input[type='time']").val();
  let $date = $("#startDate").val();
  //let $referrer = $('input[type="radio"]:checked').val();

  if ($gender != "성별 선택") $itemCompleted++;
  if ($category != "시술 선택") $itemCompleted++;
  if ($time) $itemCompleted++;
  if ($date) $itemCompleted++;
  if ($price!="시술 선택") $itemCompleted++;
  $progress = ($itemCompleted / $itemCount) * 100;
  $("#progress").progressbar("option", "value", $progress);
  $("#progress").progressbar("option", "color", "green");
  $(".pct span").text($progress);
  if ($progress == 100) {
    $("#submit").button({
      disabled: false,
    });
  }
}
