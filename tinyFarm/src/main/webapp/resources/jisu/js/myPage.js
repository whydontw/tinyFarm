/* 거래내역 검색 달력 스크립트 */
		$(document).ready(function() {
			$.datepicker.regional['ko'] = {
				closeText : '닫기',
				prevText : '이전달',
				nextText : '다음달',
				currentText : '오늘',
				monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)',
								'4월(APR)', '5월(MAY)', '6월(JUN)',
								'7월(JUL)', '8월(AUG)', '9월(SEP)',
								'10월(OCT)', '11월(NOV)', '12월(DEC)' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월',
									'5월', '6월', '7월', '8월', '9월', '10월',
									'11월', '12월' ],
				dateFormat : 'yy-mm',
				isRTL : false,
				showMonthAfterYear : true,
				yearSuffix : '년',
				changeMonth : true,
				changeYear : true,
				showButtonPanel : true,
				yearRange : 'c-3:c+3'
				};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
			var datepicker_default = {
			currentText : "이번달",
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			yearRange : 'c-3:c+3',
			showOtherMonths : true,
			selectOtherMonths : true
			}
		$("select.ui-datepicker-year").css('width', '10%').css('height', '50px');
				datepicker_default.closeText = "선택";
				datepicker_default.dateFormat = "yy-mm";
				datepicker_default.onClose = function(dateText,inst) {
					var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
					var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
					$(this).datepicker("option", "defaultDate",new Date(year, month, 1));
					$(this).datepicker('setDate',new Date(year, month, 1));
				}
				datepicker_default.beforeShow = function() {
					var selectDate = $("#orderDate").val().split("-");
					var year = Number(selectDate[0]);
					var month = Number(selectDate[1]) - 1;
					$(this).datepicker("option", "defaultDate",new Date(year, month, 1));
				}
				$("#orderDate").datepicker(datepicker_default);
		});
		
		$(document).ready(function() {
			$.datepicker.regional['ko'] = {
				closeText : '닫기',
				prevText : '이전달',
				nextText : '다음달',
				currentText : '오늘',
				monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)',
								'4월(APR)', '5월(MAY)', '6월(JUN)',
								'7월(JUL)', '8월(AUG)', '9월(SEP)',
								'10월(OCT)', '11월(NOV)', '12월(DEC)' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월',
									'5월', '6월', '7월', '8월', '9월', '10월',
									'11월', '12월' ],
				dateFormat : 'yy-mm',
				isRTL : false,
				showMonthAfterYear : true,
				yearSuffix : '년',
				changeMonth : true,
				changeYear : true,
				showButtonPanel : true,
				yearRange : 'c-3:c+3'
				};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
			var datepicker_default = {
			currentText : "이번달",
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			yearRange : 'c-3:c+3',
			showOtherMonths : true,
			selectOtherMonths : true
			}
		$("select.ui-datepicker-year").css('width', '10%').css('height', '50px');
				datepicker_default.closeText = "선택";
				datepicker_default.dateFormat = "yy-mm";
				datepicker_default.onClose = function(dateText,inst) {
					var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
					var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
					$(this).datepicker("option", "defaultDate",new Date(year, month, 1));
					$(this).datepicker('setDate',new Date(year, month, 1));
				}
				datepicker_default.beforeShow = function() {
					var selectDate = $("#sellDate").val().split("-");
					var year = Number(selectDate[0]);
					var month = Number(selectDate[1]) - 1;
					$(this).datepicker("option", "defaultDate",new Date(year, month, 1));
				}
				$("#sellDate").datepicker(datepicker_default);
		});