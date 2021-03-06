function fcInit() {

	$('#calendar').fullCalendar({
		header: {
			/*      left: 'prev,next today',
			      center: 'title',
			      right: 'month,agendaWeek,agendaDay,listMonth'*/

			left: 'prev,next today button3',
			center: 'title',
			right: 'button1 button2 month,agendaWeek,agendaDay,listMonth'
		},
		monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
		dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
		today: ["今天"],
		firstDay: 1,
		buttonText: {
			today: '回到今天',
			month: '月',
			week: '周',
			day: '日',
			listMonth: "列表",
			prev: '后退',
			next: '前进'
		},
		customButtons: {
			button1: {
				text: "新建",
				click: function() {
					$(".datepicker").datepicker({
						language: "zh-CN",
						format: "yyyy-mm-dd",
						todayHighlight: true,
						autoclose: true,
						weekStart: 0
					});
					$(".timepicki").wickedpicker({
						title: '',
						showSeconds: true,
						twentyFour: true
					});
					$("#isallday").click(function() {
						if($("#isallday").prop("checked") == true) {
							$("#isallday").val("1");
							$("#starttime,#endtime").hide();
						} else {
							$("#isallday").val("0");
							$("#starttime,#endtime").show();
						};
					});
					$("#end").click(function() {
						if($("#end").prop("checked") == true) {
							$("#enddate").show();
						} else {
							$("#enddate").hide();
						};
					});
					$("#repeat").click(function() {
						if($("#repeat").prop("checked") == true) {
							$("#repeattype,#repeattime").show();
						} else {
							$("#repeattype,#repeattime").hide();
						};
					});
					$("#repeatselect").change(function() {
						switch($("#repeatselect").val()) {
							case "1":
								$("#repeatclock").show();
								$("#repeatmonth,#repeatweek,#repeatday").hide();
								break;
							case "2":
								$("#repeatmonth,#repeatday").hide();
								$("#repeatweek,#repeatclock").show();
								break;
							case "3":
								$("#repeatmonth,#repeatweek").hide();
								$("#repeatday,#repeatclock").show();
								break;
							case "4":
								$("#repeatweek").hide();
								$("#repeatmonth,#repeatday,#repeatclock").show();
								break;
							case "5":
								$("#repeatclock").show();
								$("#repeatmonth,#repeatweek,#repeatday").hide();
								break;
						}
					});
					dialog({
						title: "新建日程",
						content: $("#dialog-form"),
						okValue: "确定",
						ok: function() {
							var titledetail = $("#titledetail").val();
							var startdate = $("#startdate").val();
							var starttime = $("#starttime").val().split(" ").join("");
							var enddate = $("#stopdate").val();
							var endtime = $("#endtime").val().split(" ").join("");
							var allDay = $("#isallday").val();
							if(titledetail) {
								$.ajax({
									url: 'http://localhost/fullcalendar/detail.php',
									data: {
										title: titledetail,
										sdate: startdate,
										stime: starttime,
										edate: enddate,
										etime: endtime,
										allDay: allDay
									},
									type: 'POST',
									dataType: 'json',
									success: function(data) {
										$("#calendar").fullCalendar("renderEvent", data, true);
									},
									error: function() {
										alert("Failed");
									}

								});
							};
						},
						cancelValue: "关闭",
						cancel: function() {
							//$("#ui-datepicker-div").remove();
						}
					}).showModal();
				}
			},
			button2: {
				text: "查询",
				click: function() {
					$(".datepicker").datepicker({
						language: "zh-CN",
						format: "yyyy-mm-dd",
						todayHighlight: true,
						autoclose: true,
						weekStart: 0
					});
					dialog({
						title: "查询",
						content: $("#search"),
						okValue: "查询",
						ok: function() {
							$("#ui-datepicker-div").remove();
						},
						button: [{
							value: "打印"
						}],
						cancelValue: "返回",
						cancel: function() {
							$("#ui-datepicker-div").remove();
						}
					}).showModal();

				}
			},
			button3: {
				text: "设置",
				click: function() {
					$("#slider").slider({
						range: true,
						min: 0,
						max: 24,
						values: [8, 18],
						slide: function(event, ui) {
							$("#amount").val(ui.values[0] + ":00 - " + ui.values[1] + ":00");

						}
					});
					$("#amount").val($("#slider").slider("values", 0) +
						":00 - " + $("#slider").slider("values", 1) + ":00");
					dialog({
						title: "设置时间段",
						content: $("#set"),
						okValue: "确定",
						ok: function() {
							var minTime = $("#slider").slider("values", 0) + ":00:00";
							var maxTime = $("#slider").slider("values", 1) + ":00:00";
							$("#calendar").fullCalendar("option", "minTime", minTime);
							$("#calendar").fullCalendar("option", "maxTime", maxTime);
						},
						cancelValue: "关闭",
						cancel: function() {}
					}).showModal();
				}
			}
		},

		allDayDefault: false,
		slotLabelFormat: "H",
		/*		businessHours: {
					dow:[1,2,3,4,5],
					start:"8:00",
					end:"17:00"
				},*/
		allDaySlot: true,
		allDayText: "全天",
		timeFormat: "HH:mm", //设置的是添加的具体的日程上显示的时间
		views: {
			month: {
				titleFormat: "YYYY年M月"
			},
			week: {
				titleFormat: "YYYY年M月D日",
				columnFormat: "M.D dddd"
			},
			day: {
				titleFormat: "YYYY年M月D日 dddd",
				columnFormat: "M/D dddd"
			}
		},

		dayClick: function(date, allDay, jsEvent, view) {
			var selDate = $.fullCalendar.formatDate(date, "YYYY-MM-DD");
			var d = dialog({
				title: "新建事件",
				content: "<textarea rows=5 class='taxt' placeholder='内容' id='eventall'></textarea><p>" + selDate + "</p>",
				width: 460,
				button: [{
					value: "完整编辑",
					callback: function() {
						$(".datepicker").datepicker({
							language: "zh-CN",
							format: "yyyy-mm-dd",
							todayHighlight: true,
							autoclose: true,
							weekStart: 0
						});
						$(".timepicki").wickedpicker({
							title: '',
							showSeconds: true,
							twentyFour: true
						});
						$("#isallday").click(function() {
							if($("#isallday").prop("checked") == true) {
								$("#isallday").val("1");
								$("#starttime,#endtime").hide();
							} else {
								$("#isallday").val("0");
								$("#starttime,#endtime").show();
							};
						});
						$("#end").click(function() {
							if($("#end").prop("checked") == true) {
								$("#enddate").show();
							} else {
								$("#enddate").hide();
							};
						});
						$("#repeat").click(function() {
							if($("#repeat").prop("checked") == true) {
								$("#repeattype,#repeattime").show();
							} else {
								$("#repeattype,#repeattime").hide();
							};
						});
						$("#repeatselect").change(function() {
							switch($("#repeatselect").val()) {
								case "1":
									$("#repeatclock").show();
									$("#repeatmonth,#repeatweek,#repeatday").hide();
									break;
								case "2":
									$("#repeatmonth,#repeatday").hide();
									$("#repeatweek,#repeatclock").show();
									break;
								case "3":
									$("#repeatmonth,#repeatweek").hide();
									$("#repeatday,#repeatclock").show();
									break;
								case "4":
									$("#repeatweek").hide();
									$("#repeatmonth,#repeatday,#repeatclock").show();
									break;
								case "5":
									$("#repeatclock").show();
									$("#repeatmonth,#repeatweek,#repeatday").hide();
									break;
							}
						});
						dialog({
							title: "新建日程",
							content: $("#dialog-form"),
							okValue: "确定",
							ok: function() {
								var titledetail = $("#titledetail").val();
								var startdate = $("#startdate").val();
								var starttime = $("#starttime").val().split(" ").join("");
								var enddate = $("#stopdate").val();
								var endtime = $("#endtime").val().split(" ").join("");
								var allDay = $("#isallday").val();
								if(titledetail) {
									$.ajax({
										url: 'http://localhost/fullcalendar/detail.php',
										data: {
											title: titledetail,
											sdate: startdate,
											stime: starttime,
											edate: enddate,
											etime: endtime,
											allDay: allDay
										},
										type: 'POST',
										dataType: 'json',
										success: function(data) {
											$("#calendar").fullCalendar("renderEvent", data, true);
										},
										error: function() {
											alert("Failed");
										}

									});
								};
							},
							cancelValue: "关闭",
							cancel: function() {}
						}).showModal();
					},
				}],
				okValue: "确定",
				ok: function() {
					var titleall = $("#eventall").val();
					if(titleall) {
						$.ajax({
							url: 'http://localhost/fullcalendar/events.php',
							data: {
								title: titleall,
								start: selDate
							},
							type: 'POST',
							dataType: 'json',
							success: function(data) {
								$("#calendar").fullCalendar("renderEvent", data, true);
							},
							error: function() {
								alert("Failed");
							}

						});
					};
				},
				cancelValue: "取消",
				cancel: function() {}
			});
			d.showModal();

		},

		eventClick: function(event, jsEvent, view) {
			var editstarttime = $.fullCalendar.formatDate(event.start, "YYYY-MM-DD HH:mm:ss");
			$("#edittitle").html(event.title);
			var eventtitle = event.title;
			if(event.end) {
				var editendtime = $.fullCalendar.formatDate(event.end, "YYYY-MM-DD HH:mm:ss");
				$("#edittime").html(editstarttime + "  至  " + editendtime);
			} else {
				$("#edittime").html(editstarttime);
			};
			// var time = '19:00:00';
			dialog({
				title: "编辑日程",
				content: $("#edit"),
				okValue: "编辑",
				ok: function() {
					$(".datepicker").datepicker({
						language: "zh-CN",
						format: "yyyy-mm-dd",
						todayHighlight: true,
						autoclose: true,
						weekStart: 0
					});
					$(".timepicki").wickedpicker({
						// now: time,
						title: '',
						showSeconds: true,
						twentyFour: true
					});
					$("#isallday").click(function() {
						if($("#isallday").prop("checked") == true) {
							$("#isallday").val("1");
							$("#starttime,#endtime").hide();
						} else {
							$("#isallday").val("0");
							$("#starttime,#endtime").show();
						};
					});
					$("#end").click(function() {
						if($("#end").prop("checked") == true) {
							$("#enddate").show();
						} else {
							$("#enddate").hide();
						};
					});
					$("#repeat").click(function() {
						if($("#repeat").prop("checked") == true) {
							$("#repeattype,#repeattime").show();
						} else {
							$("#repeattype,#repeattime").hide();
						};
					});
					$("#repeatselect").change(function() {
						switch($("#repeatselect").val()) {
							case "1":
								$("#repeatclock").show();
								$("#repeatmonth,#repeatweek,#repeatday").hide();
								break;
							case "2":
								$("#repeatmonth,#repeatday").hide();
								$("#repeatweek,#repeatclock").show();
								break;
							case "3":
								$("#repeatmonth,#repeatweek").hide();
								$("#repeatday,#repeatclock").show();
								break;
							case "4":
								$("#repeatweek").hide();
								$("#repeatmonth,#repeatday,#repeatclock").show();
								break;
							case "5":
								$("#repeatclock").show();
								$("#repeatmonth,#repeatweek,#repeatday").hide();
								break;
						}
					});
					dialog({
						title: "新建日程",
						content: $("#dialog-form"),
						okValue: "确定",
						ok: function() {
							var titledetail = $("#titledetail").val();
							var startdate = $("#startdate").val();
							var starttime = $("#starttime").val().split(" ").join("");
							var enddate = $("#stopdate").val();
							var endtime = $("#endtime").val().split(" ").join("");
							var allDay = $("#isallday").val();
							if(titledetail) {
								$.ajax({
									url: 'http://localhost/fullcalendar/detail.php',
									data: {
										title: titledetail,
										sdate: startdate,
										stime: starttime,
										edate: enddate,
										etime: endtime,
										allDay: allDay
									},
									type: 'POST',
									dataType: 'json',
									success: function(data) {
										$("#calendar").fullCalendar("renderEvent", data, true);
									},
									error: function() {
										alert("Failed");
									}

								});
							};
						},
						cancelValue: "关闭",
						cancel: function() {
							//$("#ui-datepicker-div").remove();
						}
					}).showModal();
					$("#calendar").fullCalendar("removeEvents", function(event) {
						if(event.title == eventtitle) {
							return true;
						} else {
							return false;
						}
					});
				},
				button: [{
					value: "删除",
					callback: function() {
						$("#calendar").fullCalendar("removeEvents", function(event) {
							if(event.title == eventtitle) {
								return true;
							} else {
								return false;
							}
						});
					}
				}],
				cancelValue: "取消",
				cancel: function() {}
			}).showModal();
		},

		/* defaultDate: '2018-05-12',*/

		buttonIcons: false, // show the prev/next text
		weekNumbers: true,
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: [{
				title: 'All Day Event',
				start: '2018-05-01',
				color:'yellow'
			},
			{
				title: 'Long Event',
				start: '2018-05-07',
				end: '2018-05-10',
				color:'red'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2018-05-09T01:00:00',
					color:'Khaki'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2018-05-16T16:00:00'
			},
			{
				title: 'Conference',
				start: '2018-05-11',
				end: '2018-05-13'
			},
			{
				title: 'Meeting',
				start: '2018-05-12T10:30:00',
				end: '2018-05-12T12:30:00'
			},
			{
				title: 'Lunch',
				start: '2018-05-12T12:00:00'
			},
			{
				title: 'Meeting',
				start: '2018-05-12T14:30:00'
			},
			{
				title: 'Happy Hour',
				start: '2018-05-12T17:30:00'
			},
			{
				title: 'Dinner',
				start: '2018-05-12T20:00:00'
			},
			{
				title: 'Birthday Party',
				start: '2018-05-13T07:00:00',
				color:'MediumSlateBlue'
			},
			{
				title: 'Click for Google',
				url: 'http://google.com/',
				start: '2018-05-28',
				color:'SlateGray'
			}
		]
	});

}

function resize(){
	/*console*/
$("#note").height($("#schedule").height());
}
