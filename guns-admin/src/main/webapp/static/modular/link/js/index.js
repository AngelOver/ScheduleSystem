function fcInit() {
	$('#calendar').fullCalendar({
		header: {
/*			left: 'prev,next today button3',
			center: 'title',
			right: 'button1 button2 month,agendaWeek,agendaDay,listMonth'*/
				left: 'prev,next today',
				center: 'title',
				right: 'button1 month,agendaWeek,agendaDay,listMonth'
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
					$("#remindtime").parent().hide();
					$("#repeatCount").parent().hide();
					$("#isWholeday").click(function() {
						if($("#isWholeday").prop("checked") == true) {
							$("#range").parent().hide();
						} else {
							$("#range").parent().show();
						};
					});
					$("#isRemind").click(function() {
						if($("#isRemind").prop("checked") == true) {
							$("#remindtime").parent().show();
						} else {
							$("#remindtime").parent().hide();
						};
					});
					$("#isRepeat").click(function() {
						if($("#isRepeat").prop("checked") == true) {
							$("#repeatCount").parent().show();
						} else {
							$("#repeatCount").parent().hide();
						};
					});
					dialog({
						title: "新建日程",
						content: $("#dialog-form"),
						okValue: "确定",
						ok: function() {
							
							if($("#title").val()=="") {
									layui.layer.msg("标题不能为空");
									return false;
							}
							if($("#thedate").val()=="") {
								layui.layer.msg("计划时间不能为空");
								return false;
						}
							
							if(!$("#isWholeday").prop("checked")) {
								if($("#range").val()=="") {
									layui.layer.msg("时间范围不能为空");
									return false;
								}else{
									var start = $("#range").val().split(" - ")[0];
									var end = $("#range").val().split(" - ")[1];
									console.log(start+end);
									if(end<start){
										layer.msg("结束时间不能小于开始时间");
										return false;
									}
									
								}
							}
							if($("#isRemind").prop("checked")) {
								if($("#remindtime").val()=="") {
									layui.layer.msg("提醒时间不能为空");
									return false;
								}
							}
							
							if($("#isRepeat").prop("checked")) {
								if($("#repeatSpace").val()=="") {
									layui.layer.msg("间隔天数不能为空");
									return false;
								}
								if($("#repeatCount").val()=="") {
									layui.layer.msg("重复次数不能为空");
									return false;
								}
							}
							
							
						
								$.ajax({
									url: ajaxPath +'/plan/add',
									data: {
										linkcode:linkcode,
										title: $("#title").val(),
										thedate: $("#thedate").val(),
										range: $("#range").val(),
										importantstatus:$("#importantstatus").val(),
										isRemind: $("#isRemind").prop("checked")?'1':'0',   
										isRepeat:$("#isRepeat").prop("checked")?'1':'0',
										isWholeday:$("#isWholeday").prop("checked")?'1':'0',
										repeatSpace: $("#repeatSpace").val(),
										repeatCount: $("#repeatCount").val(),
										remindtime: $("#remindtime").val(),
										address: $("#address").val(),
										remark: $("#remark").val()
									},
									type: 'POST',
									dataType: 'json',
									success: function(data) {
										/*$("#calendar").fullCalendar("renderEvent", data, true);*/
										/*$('#calendar').fullCalendar('updateEvent', event); */
									/*	alert("ok");*/
										top.window.location.reload();
									},
									error: function() {
										alert("Failed");
									}

								});
						},
						cancelValue: "关闭",
						cancel: function() {
							//$("#ui-datepicker-div").remove();
						}
					}).showModal();
				}
			}	
		/*	button2: {
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
			},*/
	/*		button3: {
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
			}*/
		},

		/*allDayDefault: false,*/
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

	/*	dayClick: function(date, allDay, jsEvent, view) {
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

		},*/

/*		eventClick: function(event, jsEvent, view) {
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
				okValue: "确定",
				ok: function() {
					
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
		},*/

		/* defaultDate: '2018-05-12',*/

		buttonIcons: false, // show the prev/next text
		weekNumbers: true,
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: 
			
			function(start,end,timezone, callback) {
	        $.ajax({
	            url: ajaxPath +'/plan/list',
	            dataType: 'json',
	            data: {
	                linkcode:linkcode,
	                start:start._i,
	                end:end._i
	            },
	            success: function(json) { // 获取当前月的数据
	            	console.log(json);
	                var events = [];
	                if (json.success ) {
	                	 events=json.obj;	
	                }else{
	                	layui.layer.alert(json.message);
	                }
	                callback(events);
	            }
	        });
	    }
	});

}

function getNote(){
	
	 $.ajax({
         url: ajaxPath +'/note/list',
         dataType: 'json',
         data: {
             linkcode:linkcode
         },
         success: function(date) { // 获取当前月的数据
         	console.log(date);
             var list = [];
            
             if (date.success ) {
            	 list=date.obj;	
            	 appenNote(list);
             }else{
             	/*alert(date.message);*/
             }
         }
     });
	
}
function appenNote(list){
	console.log("开始");
	console.log($("#noteUl"));
	 $("#noteUl").empty();
	 
	 if(list.length==0){
		 $("#noteUl").append("<li style='padding: 5px;'>有什么想写的吗？</li>");
	 }
	  $.each(list, function(i,item){   
		
		  _html = "	<li style='padding: 5px;'>"+item.num+"."+item.text;
		  if(item.is_top=='1'){
			  _html+=  " <label class='label '>置顶</label>";
		  }
		  _html+=  " -- "+item.time+"</li>";
		
		  $("#noteUl").append(_html);
			console.log(_html);
	  });
}
function addNote(){
	
	dialog({
		title: "新建便签",
		content: $("#noteform"),
		okValue: "确定",
		ok: function() {
			console.log("add");
			console.log($("#textNote").val());

			if($("#textNote").val()=="" ){
				layui.layer.msg("便签内容不能为空");
				return false;
			}
			
			
			
				$.ajax({
					url:  ajaxPath +'/note/add',
					data: {
						linkcode:linkcode,
						title: $("#titleNote").val(),
						text:  $("#textNote").val(),
						isTop:  $("#isTopNote").prop("checked")?'1':'0',
						isShow:  $("#isShowNote").prop("checked")?'1':'0',
						isWait:  $("#isWaitNote").prop("checked")?'1':'0',
						waitStatus: '0'
					},
					type: 'POST',
					dataType: 'json',
					success: function(data) {
						getNote();
					},
					error: function() {
						alert("Failed");
					}

				});
		},
		cancelValue: "关闭",
		cancel: function() {}
	}).showModal();
	
}


function addRemind(list){
	var timestamp = Date.parse(new Date());
	  $.each(list, function(i,item){   
		  var _html="";
			var title =item.title;
			var thedate =item.thedate;	
			var range =item.rangetime;	
			var address =item.address;	
			var remark =item.remark;	
			var time = item.time;	
			if(time!=null&&time>timestamp){
				console.log("新增提醒")
			_html += '<div style="padding: 20px 80px;" class="reminddiv"> <audio controls preload="auto" autoplay="autoplay" style="display:none">  <source src="'+mp3Url+'" type="audio/ogg" ></audio>';
			_html +='<p>标题：'+title+'</p>';
			_html +='<p>日期：'+thedate+' </p>';
			_html +='<p>时间：'+range+'</p>';
		
			if(address!=""){
			_html +='<p>地址：'+address+'</p>';
			}
			if(remark!=""){
			_html +='<p>备注：'+remark+'</p>';
			}
			_html +='</div>';
			console.log(_html);
			console.log(time-timestamp);
			
			setTimeout(function(){
				openRemind(_html);
			},time-timestamp);
			}
	  });
}

function openRemind(_html){
	var index = layui.layer.open({
		  type: 1
		    ,title: '您有一条新提醒'
		   ,area: ['420px', '320px']
		  ,offset: 'rb' //具体配置参考：offset参数项
		  ,content: _html
		  ,btn: '知道了'
		  ,btnAlign: 'c' //按钮居中	
		  ,tipsMore: true
		  ,shade: 0 //不显示遮罩
		  ,yes: function(){
		    layer.close(index);
		  }
		  });
}
function getRemind(){
	$.ajax({
		url:  ajaxPath +'/plan/remindlist',
		data: {
			linkcode:linkcode
		},
		type: 'POST',
		dataType: 'json',
		success: function(data) {
			addRemind(data.obj);
		},
		error: function() {
			alert("Failed");
		}
	});
}







function resize(){
	/*console*/
$("#note").height($("#schedule").height());
}
