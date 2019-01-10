var routes = [
  // Index page
  {
	  path: '/',
    url: './',
    name: 'home',
  },
  {       
    path: '/dining_tables',
    templateUrl: './dining_tables',
    on: {
	pageBeforeIn: function (event, page) {
	  $(".chinatown").on('click', function () {
		 app.views.create('.view-main', {
			 path: '/dining_tables'
		 })
          });
        },
     },
  },
  {
    path: '/login',
    url: './login',
  },
  {
    path: '/logout',
    url: './logout',
  },
  {
          path: '/orders/:id/valid',
          async: function(routeto, routefrom, resolve, reject) {
		if(routeto.query.promotion_id != null){
			if(routeto.query.promotion_id != 0){
		  app.dialog.confirm("<b>您确定要使用折扣快捷键吗？</b>",function(){
		    app.request(
		      {
			url: routeto.url,
			method: 'GET',
			crossDomain: false,
			statusCode: {
			  404: function(xhr) {
			  }
			},
			complete: function() {
			},
			success: function(response) {
				resolve(
				  // How and what to load: template
					{
						template: '{{res}}'
					},
				  // Custom template context
					{
						context: {
							res: response,
						},
					});
			},
			error: function(){
			}
		      }
		    )});}else{
		    
		    app.dialog.confirm("<b>您确定要取消折扣吗？</b>",function(){
                    app.request(
                      {
                        url: routeto.url,
                        method: 'GET',
                        crossDomain: false,
                        statusCode: {
                          404: function(xhr) {
                          }
                        },
                        complete: function() {
                        },
                        success: function(response) {
                                resolve(
                                  // How and what to load: template
                                        {
                                                template: '{{res}}'
                                        },
                                  // Custom template context
                                        {
                                                context: {
                                                        res: response,
                                                },
                                        });
                        },
                        error: function(){
                        }
                      }
                    )});
		    }
		
		}else{
		    
		    app.request(
                      {
                        url: routeto.url,
                        method: 'GET',
                        crossDomain: false,
                        statusCode: {
                          404: function(xhr) {
                          }
                        },
                        complete: function() {
                        },
                        success: function(response) {
                                resolve(
                                  // How and what to load: template
                                        {
                                                template: '{{res}}'
                                        },
                                  // Custom template context
                                        {
                                                context: {
                                                        res: response,
                                                },
                                        });
                        },
                        error: function(){
                        }
                      }
                    );
		    }
          }
  },
  {
          path: '/orders/:id/cart',
          async: function(routeto, routefrom, resolve, reject) {
		  app.dialog.confirm("您确定要刷卡支付？",function(){
		    app.request(
		      {
			url: routeto.url,
			method: 'GET',
			crossDomain: false,
			statusCode: {
			  404: function(xhr) {
			    console.log('page not found');
			  }
			},
			complete: function() {
				app.toast.create({
							text: '操作完成',
							position: 'top',
							closeTimeout: 2000,
						}).open();
			},
			success: function(response) {
				if(response !=""){
					app.views.create('.view-main', {
					  url: '/dining_tables'
					});
					$('.page-current').html('<br><br><div class="card"><div class="card-content card-content-padding"><center><b style="font-size: 20px; color: #cc0000;">此单已经支付</b><br><a href="#" class="button button-big button-raised" onclick="zhang.callCameraScan()">扫码</a></center><br><a href="#" class="button button-big button-raised" onclick="app.router.navigate(\'/dining_tables\', {reloadCurrent:true, ignoreCache:true});">大厅</a></div></div>');
					lee.printWithoutQR(response.split('|')[0],response.split('|')[1]);
					zhang.callCameraScan();
				}else{
				app.toast.create({
							text: '不可重复打印',
							position: 'top',
							closeTimeout: 2000,
						}).open();
				}
			},
			error: function(){
			  console.log("error");
			}
		      }
		    );
		  });
          }
  },
  {
          path: '/orders/:id/multiPayOk',
          async: function(routeto, routefrom, resolve, reject) {

		  app.dialog.confirm("<b>多方式支付明细：</b><br><b>现金:&nbsp;&nbsp;"+routeto.query.cash+"<br>刷卡:&nbsp;&nbsp;"+routeto.query.cart+"<br>支票:&nbsp;&nbsp;"+routeto.query.cheque+"<br>c.v.:&nbsp;&nbsp;"+routeto.query.tkresto+"<br>其他:&nbsp;&nbsp;"+routeto.query.others+"</b>",function(){
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                },
                success: function(response) {
			if(response !=""){
				app.views.create('.view-main', {
                                  url: '/dining_tables'
                                });
				app.popup.close();
					$('.page-current').html('<br><br><div class="card"><div class="card-content card-content-padding"><center><b style="font-size: 20px; color: #cc0000;">此单已经支付</b><br><a href="#" class="button button-big button-raised" onclick="zhang.callCameraScan()">扫码</a></center><br><a href="#" class="button button-big button-raised" onclick="app.router.navigate(\'/dining_tables\', {reloadCurrent:true, ignoreCache:true});">大厅</a></div></div>');
				if(!response.split('|')[0].includes("CB : 0")){
                                	lee.printWithoutQR(response.split('|')[0],response.split('|')[1]);
				}
                                zhang.callCameraScan();
			}else{
			app.toast.create({
                                                text: '不可重复打印',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
			}
                },
                error: function(){
                  console.log("error");
                }
              }
            )

		  });

          }
  },
  {
          path: '/orders/:id/multiPay',
          async: function(routeto, routefrom, resolve, reject) {
		  
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                },
                success: function(response) {
			getval = function() {
				if($("#restOfMoney").html() == ""){
					return $("#amountTotal").html();
				}else if($("#restOfMoney").html() == "0.00"){
					return "";
				}else{
					return $("#restOfMoney").html();
				}
			};
			calcul = function() {
					var cash = $("#cash").val() == "" ? 0 : parseFloat($("#cash").val());
					var cart = $("#cart").val() == "" ? 0 : parseFloat($("#cart").val());
					var cheque = $("#cheque").val() == "" ? 0 : parseFloat($("#cheque").val());
					var tkresto = $("#tkresto").val() == "" ? 0 : parseFloat($("#tkresto").val());
					var others = $("#others").val() == "" ? 0 : parseFloat($("#others").val());
					var amountTotal = parseFloat($("#amountTotal").html());

					$("#restOfMoney").html((amountTotal - (cash+cart+cheque+tkresto+others).toFixed(2)).toFixed(2));
					

			      if((cash+cart+cheque+tkresto+others) != 0 && amountTotal- (cash+cart+cheque+tkresto+others) <= 0 ){ 
					$("#but_link").html('<a href="/orders/'+$("#orderId").val()+'/multiPayOk?cash='+cash.toString().replace(".",",")+'&cart='+cart.toString().replace(".",",")+'&cheque='+cheque.toString().replace(".",",")+'&tkresto='+tkresto.toString().replace(".",",")+'&others='+others.toString().replace(".",",")+'" class="col button button-fill color-green">确定</a>');
				}else{
					$("#but_link").html("");
				}
			    };
			get_bon_value = function(t){
				     var v = "";
				     var is_add = false;
				     if(t.includes("+")){
					 is_add = true;
					 t = t.replace('+','')
				     }
					 if(t.length == 1) {
					     v = "0.0"+t;
					 }else{
					     		v = [(t.slice(0, t.length-2) == 0 ? 0 : parseInt(t.slice(0, t.length-2).replace('.',''))), '.', t.slice(t.length-2).replace('.','')].join('');
					 }
				     if(is_add){
					 return v+"+";
				     }else{
					 return parseFloat(v) == 0 ? '' : v;
				     }
			};
			app.popup.create(
                          {
				  content: "<div class='popup'><div class='page'><div class='navbar'><div class='navbar-inner'><div class='title'>多方式支付</div><div class='right'><a href='#' class='link popup-close'>Close</a></div></div></div><div class='page-content'><div class='block'>"+response+"</div></div></div></div>"
			  }).open();
			$("#keypad_general").focus();
			$(".keypad-button").on('click',function(){
				if($(this).html() == '+'){
					$("#keypad_general").val($("#keypad_general").val()+$(this).html());
				}else if($(this).hasClass('keypad-delete-button')){
					$("#keypad_general").val($("#keypad_general").val().slice(0, -1));
				}else{
					$("#keypad_general").val($("#keypad_general").val()+$(this).find(".keypad-button-number").html());
				}
				$("#keypad_general").val(get_bon_value($("#keypad_general").val()));

				$("#keypad_general").focus();
			});
                },
                error: function(){
                  console.log("error");
                }
              }
            )
          }
  },
  {
          path: '/orders/:id/cheque',
          async: function(routeto, routefrom, resolve, reject) {
		  app.dialog.confirm("您确定要支票支付？",function(){
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
			app.toast.create({
                                                text: '操作完成',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                },
                success: function(response) {
			if(response !=""){
				app.views.create('.view-main', {
                                  url: '/dining_tables'
                                });
					$('.page-current').html('<br><br><div class="card"><div class="card-content card-content-padding"><center><b style="font-size: 20px; color: #cc0000;">此单已经支付</b><br><a href="#" class="button button-big button-raised" onclick="zhang.callCameraScan()">扫码</a></center><br><a href="#" class="button button-big button-raised" onclick="app.router.navigate(\'/dining_tables\', {reloadCurrent:true, ignoreCache:true});">大厅</a></div></div>');
				zhang.callCameraScan();
			}else{
			app.toast.create({
                                                text: '不可重复打印',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
			}
                },
                error: function(){
                  console.log("error");
                }
              }
            );
		  });
          },
        on: {
        pageBeforeIn: function (event, page) {
          // do something before page gets into the view
          $(".back_tables").on('click', function () {
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
          });
        }
	}
  },
  {
          path: '/orders/:id/ticket',
          async: function(routeto, routefrom, resolve, reject) {
		  app.dialog.confirm("您确定要饭票或c.v.支付？",function(){
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
			app.toast.create({
                                                text: '操作完成',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                },
                success: function(response) {
			if(response !=""){
				app.views.create('.view-main', {
                                  url: '/dining_tables'
                                });
					$('.page-current').html('<br><br><div class="card"><div class="card-content card-content-padding"><center><b style="font-size: 20px; color: #cc0000;">此单已经支付</b><br><a href="#" class="button button-big button-raised" onclick="zhang.callCameraScan()">扫码</a></center><br><a href="#" class="button button-big button-raised" onclick="app.router.navigate(\'/dining_tables\', {reloadCurrent:true, ignoreCache:true});">大厅</a></div></div>');
				zhang.callCameraScan();
			}else{
			app.toast.create({
                                                text: '不可重复打印',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
			}
                },
                error: function(){
                  console.log("error");
                }
              }
            );
		  });
          },
        on: {
        pageBeforeIn: function (event, page) {
          // do something before page gets into the view
          $(".back_tables").on('click', function () {
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
          });
        }
	}
  },
  {
          path: '/orders/:id/cash',
          async: function(routeto, routefrom, resolve, reject) {
		  app.dialog.confirm("您确定要现金支付？",function(){
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
			app.toast.create({
                                                text: '操作完成',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                },
                success: function(response) {
			if(response !=""){
				app.views.create('.view-main', {
                                  url: '/dining_tables'
                                });
					$('.page-current').html('<br><br><div class="card"><div class="card-content card-content-padding"><center><b style="font-size: 20px; color: #cc0000;">此单已经支付</b><br><a href="#" class="button button-big button-raised" onclick="zhang.callCameraScan()">扫码</a></center><br><a href="#" class="button button-big button-raised" onclick="app.router.navigate(\'/dining_tables\', {reloadCurrent:true, ignoreCache:true});">大厅</a></div></div>');
				zhang.callCameraScan();
			}else{
			app.toast.create({
                                                text: '不可重复打印',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
			}
                },
                error: function(){
                  console.log("error");
                }
              }
            );
	  });
          },
        on: {
        pageBeforeIn: function (event, page) {
          // do something before page gets into the view
          $(".back_tables").on('click', function () {
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
          });
        }
	}
  },
  {
          path: '/orders/:id/print',
          async: function(routeto, routefrom, resolve, reject) {
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                  console.log('complete');
                },
                success: function(response) {
			resolve(
                          // How and what to load: template
                                {
                                        template: '{{res}}'
                                },
                          // Custom template context
                                {
                                        context: {
                                                res: response,
                                        },
                                });
				lee.funAndroid(response.split('|')[0],response.split('|')[1], response.split('|')[2], response.split('|')[3]);
                },
                error: function(){
                  console.log("error");
                }
              }
            )
          },
        on: {
        pageBeforeIn: function (event, page) {
          // do something before page gets into the view
          $(".back_tables").on('click', function () {
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
          });
        }
	}
  },
  {
          path: '/orders/:id/finish',
          async: function(routeto, routefrom, resolve, reject) {
		  app.dialog.confirm("<b>点击确定即可回到大厅，但此单将作废，你要回到大厅吗？</b>",function(){
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                  console.log('complete');
                },
                success: function(response) {
                        resolve(
                          // How and what to load: template
                                {
                                        template: '{{res}}'
                                },
                          // Custom template context
                                {
                                        context: {
                                                res: response,
                                        },
                                });
			if(response == "non"){
				app.toast.create({
                                                text: '此单已经打印，不可清除!',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
			}else{
				        app.toast.create({
                                                text: '清桌完成',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
				var searchpad = app.keypad.create({
                              inputEl: '#searchbar',
                                buttons: [
                                        {
              html: '<span class="keypad-button-number">1</span>',
              value: 1,
            },
            {
              html: '<span class="keypad-button-number">2</span>',
              value: 2,
            },
            {
              html: '<span class="keypad-button-number">3</span>',
              value: 3,
            },
            {
              html: '<span class="keypad-button-number">4</span>',
              value: 4,
            },
            {
              html: '<span class="keypad-button-number">5</span>',
              value: 5,
            },
            {
              html: '<span class="keypad-button-number">6</span>',
              value: 6,
            },
            {
              html: '<span class="keypad-button-number">7</span>',
              value: 7,
            },
            {
              html: '<span class="keypad-button-number">8</span>',
              value: 8,
            },
            {
              html: '<span class="keypad-button-number">9</span>',
              value: 9,
            },
            {
              html: 'A',
              value: 'a',
            },
            {
              html: 'B',
              value: 'b',
            },
            {
              html: 'C',
              value: 'c',
            },
            {
              html: '.',
              value: '.',
              dark: true,
            },
            {
              html: '<span class="keypad-button-number">0</span>',
              value: 0,
            },
            {
              html: '<i class="icon icon-keypad-delete"></i>',
              cssClass: 'keypad-delete-button',
              dark: true,
            }
                                ]
                            });
$("#searchbar").on('focus',function(){
        searchpad.open();
});
			}
                },
                error: function(){
                  console.log("error");
                }
              }
            )});
          }
  },
  {
          path: '/orders/:id',
          async: function(routeto, routefrom, resolve, reject) {
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                  console.log('complete');
                },
                success: function(response) {
                        resolve(
                          // How and what to load: template
                                {
                                        template: '{{res}}'
                                },
                          // Custom template context
                                {
                                        context: {
                                                res: response,
                                        },
                                });
                },
                error: function(){
                  console.log("error");
                }
              }
            )
          },
        on: {
        pageBeforeIn: function (event, page) {
          // do something before page gets into the view
          $(".back_tables").on('click', function () {
                //ac3.open();
                //app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
                //app.router.back("/dining_tables", {force:true});
		app.request(
                      {
                        url: "/orders/"+$("#number_order").html()+"/is_print",
                        method: 'GET',
                        crossDomain: false,
                        statusCode: {
                          404: function(xhr) {
                            console.log('page not found');
                          }
                        },
                        complete: function() {
                        },
                        success: function(response) {
                                if(response == "true"){
					app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
                                }else{
						  app.router.navigate("/orders/"+$("#number_order").html()+"/finish", {reloadAll:true, ignoreCache:true});
                                }
                        },
                        error: function(){
                        }
                      }
                    );
          });
        }
	}
  },
  {
  	path: '/dining_tables/new',
	async: function(routeto, routefrom, resolve, reject) {
            app.request(
              {
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                  console.log('complete');
                },
                success: function(response) {

			getLink = function() {
			      if ($("#chooseNameTable").val() != "" && $("#chooseNbPeople").val() != ""){
					$("#but_link").html('<a href="/dining_tables/'+$("#chooseNameTable").val()+'/orders/'+$("#chooseNbPeople").val()+'/new" class="col button button-big button-fill">确定</a>');
				}else{
					$("#but_link").html("");
				}
			    };

			app.popup.create(
				{
            content: "<div class='popup'><div class='page'><div class='navbar'><div class='navbar-inner'><div class='title'>填写桌号及人数</div><div class='right'><a href='#' class='link popup-close'>Close</a></div></div></div><div class='page-content'><div class='block'>"+response+"</div></div></div></div>"
          }).open();
			app.keypad.create({
			      inputEl: '.numpad',
				buttons: [
					{
              html: '<span class="keypad-button-number">1</span>',
              value: 1,
            },
            {
              html: '<span class="keypad-button-number">2</span>',
              value: 2,
            },
            {
              html: '<span class="keypad-button-number">3</span>',
              value: 3,
            },
            {
              html: '<span class="keypad-button-number">4</span>',
              value: 4,
            },
            {
              html: '<span class="keypad-button-number">5</span>',
              value: 5,
            },
            {
              html: '<span class="keypad-button-number">6</span>',
              value: 6,
            },
            {
              html: '<span class="keypad-button-number">7</span>',
              value: 7,
            },
            {
              html: '<span class="keypad-button-number">8</span>',
              value: 8,
            },
            {
              html: '<span class="keypad-button-number">9</span>',
              value: 9,
            },
            {
              html: 'A',
              value: 'a',
            },
            {
              html: 'B',
              value: 'b',
            },
            {
              html: 'C',
              value: 'c',
            },
            {
              html: '.',
              value: '.',
              dark: true,
            },
            {
              html: '<span class="keypad-button-number">0</span>',
              value: 0,
            },
            {
              html: '<i class="icon icon-keypad-delete"></i>',
              cssClass: 'keypad-delete-button',
              dark: true,
            }
				],
	on: {
                  buttonClick(keypad, button) {
			getLink();
		  }
	}
			    }).open();

                },
                error: function(){
                  //console.log("error");
                }
              }
            )
     },
	  on : {
	  pageInit: function (event, page) {
                ahandleAjaxSuccess = function(event) {
                        ref = event.detail, data = ref[0], status = ref[1], xhr = ref[2];
		  //console.log(ref);
		  //console.log(data);
		  //console.log(xhr);
                }
                	document.body.addEventListener('ajax:success', ahandleAjaxSuccess, false);
        	}
	  
	  }
  },
  {
  	path: '/orders/:order_id/change_table',
	async: function(routeto, routefrom, resolve, reject) {
		app.dialog.prompt('换桌吗?',"此单已经打印", function (new_name) {

                        app.request(
                              {
                                url: routeto.url+"?new_name="+new_name,
                                method: 'GET',
                                crossDomain: false,
                                statusCode: {
                                  404: function(xhr) {
                                    console.log('page not found');
                                  }
                                },
                                complete: function() {
                                  console.log('complete');
                                },
                                success: function(response) {
                                        //app.sheet.close();
                                        //app.router.navigate(response, {reloadAll:true, ignoreCache:true});
                                        //$("#items_choosen").html(JSON.parse(response).htmltext);
					//app.router.navigate("/dining_tables", {clearPreviousHistory:true, ignoreCache:true});
					//lee.funAndroid(response.split('|')[0],response.split('|')[1], response.split('|')[2], response.split('|')[3]);
					app.views.create('.view-main', {
						 path: '/dining_tables'
					 });
					$("#yazhuodan").html(response.split('|')[4]);
					lee.funAndroid(response.split('|')[0],response.split('|')[1], response.split('|')[2], response.split('|')[3]);
                                },
                                error: function(response){
					app.views.create('.view-main', {
                                                 path: '/dining_tables'
                                         });
                                        app.toast.create({
                                                                text: response.responseText,
                                                                position: 'top',
                                                                closeTimeout: 2000,
                                                        }).open();
                                }
                              }
                            );
                }, function(){
			app.views.create('.view-main', {
                                                 path: '/dining_tables'
                                         });
		});
		app.keypad.create({
                              inputEl: '.dialog-input',
                                buttons: [
                                        {
                              html: '<span class="keypad-button-number">1</span>',
                              value: 1,
                            },
                            {
                              html: '<span class="keypad-button-number">2</span>',
                              value: 2,
                            },
                            {
                              html: '<span class="keypad-button-number">3</span>',
                              value: 3,
                            },
                            {
                              html: '<span class="keypad-button-number">4</span>',
                              value: 4,
                            },
                            {
                              html: '<span class="keypad-button-number">5</span>',
                              value: 5,
                            },
                            {
                              html: '<span class="keypad-button-number">6</span>',
                              value: 6,
                            },
                            {
                              html: '<span class="keypad-button-number">7</span>',
                              value: 7,
                            },
                            {
                              html: '<span class="keypad-button-number">8</span>',
                              value: 8,
                            },
                            {
                              html: '<span class="keypad-button-number">9</span>',
                              value: 9,
                            },
                            {
                              html: 'A',
                              value: 'a',
                            },
                            {
                              html: 'B',
                              value: 'b',
                            },
                            {
                              html: 'C',
                              value: 'c',
                            },
                            {
                              html: '.',
                              value: '.',
                              dark: true,
                            },
                            {
                              html: '<span class="keypad-button-number">0</span>',
                              value: 0,
                            },
                            {
                              html: '<i class="icon icon-keypad-delete"></i>',
                              cssClass: 'keypad-delete-button',
                              dark: true,
                            }
                                ]
                        });
	}
  },
  {
	  path: '/orders/:order_id/order_items/:item_id/add_new_item_sup',
          async: function(routeto, routefrom, resolve, reject) {
		  /*
		if ($("#items_choosen").html().indexOf("Supplémentaire") > -1){
		app.request(
                              {
                                url: routeto.url,
                                method: 'GET',
                                crossDomain: false,
                                statusCode: {
                                  404: function(xhr) {
                                    console.log('page not found');
                                  }
                                },
                                complete: function() {
                                  console.log('complete');
                                },
                                success: function(response) {
                                        //app.sheet.close();
                                        //app.router.navigate(response, {reloadAll:true, ignoreCache:true});
                                        $("#items_choosen").html(JSON.parse(response).htmltext);
                                        $("#amount_updated").html(JSON.parse(response).amount);
                                },
                                error: function(response){
                                        app.toast.create({
                                                                text: response.responseText,
                                                                position: 'top',
                                                                closeTimeout: 2000,
                                                        }).open();
                                }
                              }
                            );
		}else{*/
		app.dialog.prompt('金额?',"Supplémentaire", function (amount_v) {
			
			app.request(
			      { 
				url: routeto.url+"?amount_v="+amount_v,
				method: 'GET',
				crossDomain: false,
				statusCode: {
				  404: function(xhr) {
				    console.log('page not found');
				  }
				},
				complete: function() {
				  console.log('complete');
				},
				success: function(response) {
					//app.sheet.close();
					//app.router.navigate(response, {reloadAll:true, ignoreCache:true});
					$("#items_choosen").html(JSON.parse(response).htmltext);
                        		$("#amount_updated").html(JSON.parse(response).amount);
				},
				error: function(response){
					app.toast.create({
								text: response.responseText,
								position: 'top',
								closeTimeout: 2000,
							}).open();
				}
			      }
			    );

		});
		app.keypad.create({
                              inputEl: '.dialog-input',
                                buttons: [
                                        {
			      html: '<span class="keypad-button-number">1</span>',
			      value: 1,
			    },
			    { 
			      html: '<span class="keypad-button-number">2</span>',
			      value: 2,
			    },
			    { 
			      html: '<span class="keypad-button-number">3</span>',
			      value: 3,
			    },
			    { 
			      html: '<span class="keypad-button-number">4</span>',
			      value: 4,
			    },
			    { 
			      html: '<span class="keypad-button-number">5</span>',
			      value: 5,
			    },
			    { 
			      html: '<span class="keypad-button-number">6</span>',
			      value: 6,
			    },
			    { 
			      html: '<span class="keypad-button-number">7</span>',
			      value: 7,
			    },
			    { 
			      html: '<span class="keypad-button-number">8</span>',
			      value: 8,
			    },
			    { 
			      html: '<span class="keypad-button-number">9</span>',
			      value: 9,
			    },
			    {
			      html: 'A',
			      value: 'a',
			    },
			    {
			      html: 'B',
			      value: 'b',
			    },
			    {
			      html: 'C',
			      value: 'c',
			    },
			    {
			      html: '.',
			      value: '.',
			      dark: true,
			    },
			    {
			      html: '<span class="keypad-button-number">0</span>',
			      value: 0,
			    },
			    {
			      html: '<i class="icon icon-keypad-delete"></i>',
			      cssClass: 'keypad-delete-button',
			      dark: true,
			    }
                                ]
	  		});
		//}
            /*app.request(
              { 
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                  console.log('complete');
                },
                success: function(response) {
			//app.sheet.close();
			app.router.navigate(response, {reloadAll:true, ignoreCache:true});
			app.popup.close();

                },
                error: function(response){
			app.toast.create({
                                                text: response.responseText,
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                }
              }
            )*/
          }
  },
  {
	  path: '/dining_tables/:dining_table_id/orders/:id/new',
          async: function(routeto, routefrom, resolve, reject) {
            app.request(
              { 
                url: routeto.url,
                method: 'GET',
                crossDomain: false,
                statusCode: {
                  404: function(xhr) {
                    console.log('page not found');
                  }
                },
                complete: function() {
                  console.log('complete');
                },
                success: function(response) {
			//app.sheet.close();
			app.router.navigate(response, {reloadAll:true, ignoreCache:true});
			app.popup.close();
			/*
                        resolve(
                          // How and what to load: template
                                {
                                        template: '{{res}}'
                                },
                          // Custom template context
                                {
                                        context: {
                                                res: response,
                                        },
                                });*/

                },
                error: function(response){
			app.toast.create({
                                                text: response.responseText,
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                }
              }
            )
          }
  },
  {
	  path: '/dining_tables/:id/edit',
	  async: function(routeto, routefrom, resolve, reject) {
	    app.request(
	      {
	        url: routeto.url,
		method: 'GET',
		crossDomain: false,
		statusCode: {
		  404: function(xhr) {
		    console.log('page not found');
		  }
		},
		complete: function() {
		  console.log('complete');
		},
		success: function(response) {
			resolve(
                          // How and what to load: template
          			{
            				template: '{{res}}'
          			},
          		  // Custom template context
          			{
            				context: {
              					res: response,
            				},
          			});
		},
		error: function(){
		  console.log("error");
		}
	      }
	    )
	  },
        on: {
        pageBeforeIn: function (event, page) {
          // do something before page gets into the view
	  $(".back_tables").on('click', function () {
		  app.request(
                      {
                        url: "/orders/"+$("#number_order").html()+"/is_print",
                        method: 'GET',
                        crossDomain: false,
                        statusCode: {
                          404: function(xhr) {
                            console.log('page not found');
                          }
                        },
                        complete: function() {
                        },
                        success: function(response) {
                                if(response == "true"){
                                        app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
                                }else{
                                                  app.router.navigate("/orders/"+$("#number_order").html()+"/finish", {reloadAll:true, ignoreCache:true});
                                }
                        },
                        error: function(){
                        }
                      }
                    );
          });
        },
        pageAfterIn: function (event, page) {
        // do something after page gets into the view
        /*if(parseInt($("#number_people").html()) == 0){
        app.dialog.create({
          title: "<a href='#' class='link back'><i class='icon icon-back color-blue'></i></a><span style='margin-top: 3px; position: absolute; top: 21px;'>选择人数</span>",
          buttons: [
          ],
          verticalButtons: true,
        }).open();*/
        },
        pageInit: function (event, page) {
		handleAjaxSuccess = function(event) {
  			ref = event.detail, data = ref[0], status = ref[1], xhr = ref[2];
			$("#items_choosen").html(data.htmltext);
			$("#amount_updated").html(data.amount);
		}
		document.body.addEventListener('ajax:success', handleAjaxSuccess, false)
		openAlert =  function () {
			app.dialog.alert('Hello!');
	        }
        },
        pageBeforeRemove: function (event, page) {
          // do something beofore page gets removed from DOM
	  app.dialog.close();
	},
     },
  },
  // Default route (404 page). MUST BE THE LAST
  /*{
    path: '(.*)',
    url: './pages/404.html',
  },*/
  
];
