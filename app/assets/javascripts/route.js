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
        pageInit: function (event, page) {
          // do something before page gets into the view
	  console.log("test");
        },
     },
  },
  // About page
  {
    path: '/about/',
    url: './pages/about.html',
    name: 'about',
  },
  // Right Panel pages
  {
    path: '/panel-right-1/',
    content: '\
      <div class="page">\
        <div class="navbar">\
          <div class="navbar-inner sliding">\
            <div class="left">\
              <a href="#" class="link back">\
                <i class="icon icon-back"></i>\
                <span class="ios-only">Back</span>\
              </a>\
            </div>\
            <div class="title">Panel Page 1</div>\
          </div>\
        </div>\
        <div class="page-content">\
          <div class="block">\
            <p>This is a right panel page 1</p>\
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo saepe aspernatur inventore dolorum voluptates consequatur tempore ipsum! Quia, incidunt, aliquam sit veritatis nisi aliquid porro similique ipsa mollitia eaque ex!</p>\
          </div>\
        </div>\
      </div>\
    ',
  },
  {
    path: '/panel-right-2/',
    content: '\
      <div class="page">\
        <div class="navbar">\
          <div class="navbar-inner sliding">\
            <div class="left">\
              <a href="#" class="link back">\
                <i class="icon icon-back"></i>\
                <span class="ios-only">Back</span>\
              </a>\
            </div>\
            <div class="title">Panel Page 2</div>\
          </div>\
        </div>\
        <div class="page-content">\
          <div class="block">\
            <p>This is a right panel page 2</p>\
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo saepe aspernatur inventore dolorum voluptates consequatur tempore ipsum! Quia, incidunt, aliquam sit veritatis nisi aliquid porro similique ipsa mollitia eaque ex!</p>\
          </div>\
        </div>\
      </div>\
    ',
  },

  // Components
  {
    path: '/accordion/',
    url: './pages/accordion.html',
  },
  {
    path: '/action-sheet/',
    componentUrl: './pages/action-sheet.html',
  },
  {
    path: '/autocomplete/',
    componentUrl: './pages/autocomplete.html',
  },
  {
    path: '/badge/',
    componentUrl: './pages/badge.html',
  },
  {
    path: '/buttons/',
    url: './pages/buttons.html',
  },
  {
    path: '/calendar/',
    componentUrl: './pages/calendar.html',
  },
  {
    path: '/calendar-page/',
    componentUrl: './pages/calendar-page.html',
  },
  {
    path: '/cards/',
    url: './pages/cards.html',
  },
  {
    path: '/checkbox/',
    url: './pages/checkbox.html',
  },
  {
    path: '/chips/',
    componentUrl: './pages/chips.html',
  },
  {
    path: '/contacts-list/',
    url: './pages/contacts-list.html',
  },
  {
    path: '/content-block/',
    url: './pages/content-block.html',
  },
  {
    path: '/data-table/',
    componentUrl: './pages/data-table.html',
  },
  {
    path: '/dialog/',
    componentUrl: './pages/dialog.html',
  },
  {
    path: '/fab/',
    url: './pages/fab.html',
  },
  {
    path: '/fab-morph/',
    url: './pages/fab-morph.html',
  },
  {
    path: '/form-storage/',
    url: './pages/form-storage.html',
  },
  {
    path: '/grid/',
    url: './pages/grid.html',
  },
  {
    path: '/icons/',
    componentUrl: './pages/icons.html',
  },
  {
    path: '/infinite-scroll/',
    componentUrl: './pages/infinite-scroll.html',
  },
  {
    path: '/inputs/',
    url: './pages/inputs.html',
  },
  {
    path: '/lazy-load/',
    url: './pages/lazy-load.html',
  },
  {
    path: '/list/',
    url: './pages/list.html',
  },
  {
    path: '/login-screen/',
    componentUrl: './pages/login-screen.html',
  },
  {
    path: '/login-screen-page/',
    componentUrl: './pages/login-screen-page.html',
  },
  {
    path: '/login',
    url: './login',
  },
  {
    path: '/messages/',
    componentUrl: './pages/messages.html',
  },
  {
    path: '/navbar/',
    url: './pages/navbar.html',
  },
  {
    path: '/navbar-hide-scroll/',
    url: './pages/navbar-hide-scroll.html',
  },
  {
    path: '/notifications/',
    componentUrl: './pages/notifications.html',
  },
  {
    path: '/panel/',
    url: './pages/panel.html',
  },
  {
    path: '/photo-browser/',
    componentUrl: './pages/photo-browser.html',
  },
  {
    path: '/picker/',
    componentUrl: './pages/picker.html',
  },
  {
    path: '/popup/',
    componentUrl: './pages/popup.html',
  },
  {
    path: '/popover/',
    url: './pages/popover.html',
  },
  {
    path: '/preloader/',
    componentUrl: './pages/preloader.html',
  },
  {
    path: '/progressbar/',
    componentUrl: './pages/progressbar.html',
  },
  {
    path: '/pull-to-refresh/',
    componentUrl: './pages/pull-to-refresh.html',
  },
  {
    path: '/radio/',
    url: './pages/radio.html',
  },
  {
    path: '/range/',
    componentUrl: './pages/range.html',
  },
  {
    path: '/searchbar/',
    url: './pages/searchbar.html',
  },
  {
    path: '/searchbar-expandable/',
    url: './pages/searchbar-expandable.html',
  },
  {
    path: '/sheet-modal/',
    componentUrl: './pages/sheet-modal.html',
  },
  {
    path: '/smart-select/',
    url: './pages/smart-select.html',
  },
  {
    path: '/sortable/',
    url: './pages/sortable.html',
  },
  {
    path: '/statusbar/',
    componentUrl: './pages/statusbar.html',
  },
  {
    path: '/subnavbar/',
    url: './pages/subnavbar.html',
  },
  {
    path: '/subnavbar-title/',
    url: './pages/subnavbar-title.html',
  },
  {
    path: '/swiper/',
    url: './pages/swiper.html',
    routes: [
      {
        path: 'swiper-horizontal/',
        url: './pages/swiper-horizontal.html',
      },
      {
        path: 'swiper-vertical/',
        url: './pages/swiper-vertical.html',
      },
      {
        path: 'swiper-space-between/',
        url: './pages/swiper-space-between.html',
      },
      {
        path: 'swiper-multiple/',
        url: './pages/swiper-multiple.html',
      },
      {
        path: 'swiper-nested/',
        url: './pages/swiper-nested.html',
      },
      {
        path: 'swiper-loop/',
        url: './pages/swiper-loop.html',
      },
      {
        path: 'swiper-3d-cube/',
        url: './pages/swiper-3d-cube.html',
      },
      {
        path: 'swiper-3d-coverflow/',
        url: './pages/swiper-3d-coverflow.html',
      },
      {
        path: 'swiper-3d-flip/',
        url: './pages/swiper-3d-flip.html',
      },
      {
        path: 'swiper-fade/',
        url: './pages/swiper-fade.html',
      },
      {
        path: 'swiper-scrollbar/',
        url: './pages/swiper-scrollbar.html',
      },
      {
        path: 'swiper-gallery/',
        componentUrl: './pages/swiper-gallery.html',
      },
      {
        path: 'swiper-custom-controls/',
        url: './pages/swiper-custom-controls.html',
      },
      {
        path: 'swiper-parallax/',
        url: './pages/swiper-parallax.html',
      },
      {
        path: 'swiper-lazy/',
        url: './pages/swiper-lazy.html',
      },
      {
        path: 'swiper-pagination-progress/',
        url: './pages/swiper-pagination-progress.html',
      },
      {
        path: 'swiper-pagination-fraction/',
        url: './pages/swiper-pagination-fraction.html',
      },
      {
        path: 'swiper-zoom/',
        url: './pages/swiper-zoom.html',
      },
    ],
  },
  {
    path: '/swipeout/',
    componentUrl: './pages/swipeout.html',
  },
  {
    path: '/tabs/',
    url: './pages/tabs.html',
  },
  {
    path: '/tabs-static/',
    url: './pages/tabs-static.html',
  },
  {
    path: '/tabs-animated/',
    url: './pages/tabs-animated.html',
  },
  {
    path: '/tabs-swipeable/',
    url: './pages/tabs-swipeable.html',
  },
  {
    path: '/tabs-routable/',
    url: './pages/tabs-routable.html',
    tabs: [
      {
        path: '/',
        id: 'tab1',
        content: ' \
        <div class="block"> \
          <p>Tab 1 content</p> \
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam enim quia molestiae facilis laudantium voluptates obcaecati officia cum, sit libero commodi. Ratione illo suscipit temporibus sequi iure ad laboriosam accusamus?</p> \
          <p>Saepe explicabo voluptas ducimus provident, doloremque quo totam molestias! Suscipit blanditiis eaque exercitationem praesentium reprehenderit, fuga accusamus possimus sed, sint facilis ratione quod, qui dignissimos voluptas! Aliquam rerum consequuntur deleniti.</p> \
          <p>Totam reprehenderit amet commodi ipsum nam provident doloremque possimus odio itaque, est animi culpa modi consequatur reiciendis corporis libero laudantium sed eveniet unde delectus a maiores nihil dolores? Natus, perferendis.</p> \
        </div> \
        ',
      },
      {
        path: '/tab2/',
        id: 'tab2',
        content: '\
        <div class="block"> \
          <p>Tab 2 content</p> \
          <p>Suscipit, facere quasi atque totam. Repudiandae facilis at optio atque, rem nam, natus ratione cum enim voluptatem suscipit veniam! Repellat, est debitis. Modi nam mollitia explicabo, unde aliquid impedit! Adipisci!</p> \
          <p>Deserunt adipisci tempora asperiores, quo, nisi ex delectus vitae consectetur iste fugiat iusto dolorem autem. Itaque, ipsa voluptas, a assumenda rem, dolorum porro accusantium, officiis veniam nostrum cum cumque impedit.</p> \
          <p>Laborum illum ipsa voluptatibus possimus nesciunt ex consequatur rem, natus ad praesentium rerum libero consectetur temporibus cupiditate atque aspernatur, eaque provident eligendi quaerat ea soluta doloremque. Iure fugit, minima facere.</p> \
        </div> \
        ',
      },
      {
        path: '/tab3/',
        id: 'tab3',
        content: '\
        <div class="block"> \
          <p>Tab 3 content</p> \
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam enim quia molestiae facilis laudantium voluptates obcaecati officia cum, sit libero commodi. Ratione illo suscipit temporibus sequi iure ad laboriosam accusamus?</p> \
          <p>Deserunt adipisci tempora asperiores, quo, nisi ex delectus vitae consectetur iste fugiat iusto dolorem autem. Itaque, ipsa voluptas, a assumenda rem, dolorum porro accusantium, officiis veniam nostrum cum cumque impedit.</p> \
          <p>Laborum illum ipsa voluptatibus possimus nesciunt ex consequatur rem, natus ad praesentium rerum libero consectetur temporibus cupiditate atque aspernatur, eaque provident eligendi quaerat ea soluta doloremque. Iure fugit, minima facere.</p> \
        </div> \
        ',
      },
    ],
  },
  {
    path: '/toast/',
    componentUrl: './pages/toast.html',
  },
  {
    path: '/toggle/',
    url: './pages/toggle.html',
  },
  {
    path: '/toolbar-tabbar/',
    componentUrl: './pages/toolbar-tabbar.html',
    routes: [
      {
        path: 'tabbar/',
        componentUrl: './pages/tabbar.html',
      },
      {
        path: 'tabbar-labels/',
        componentUrl: './pages/tabbar-labels.html',
      },
      {
        path: 'tabbar-scrollable/',
        componentUrl: './pages/tabbar-scrollable.html',
      },
      {
        path: 'toolbar-hide-scroll/',
        url: './pages/toolbar-hide-scroll.html',
      },
    ],
  },
  {
    path: '/timeline/',
    url: './pages/timeline.html',
  },
  {
    path: '/timeline-vertical/',
    url: './pages/timeline-vertical.html',
  },
  {
    path: '/timeline-horizontal/',
    url: './pages/timeline-horizontal.html',
  },
  {
    path: '/timeline-horizontal-calendar/',
    url: './pages/timeline-horizontal-calendar.html',
  },
  {
    path: '/virtual-list/',
    componentUrl: './pages/virtual-list.html',
  },
  {
    path: '/vi/',
    componentUrl: './pages/vi.html',
  },

  // Color Themes
  {
    path: '/color-themes/',
    componentUrl: './pages/color-themes.html',
  },

  // Page Loaders
  {
    path: '/page-loader-template7/:user/:userId/:posts/:postId/',
    templateUrl: './pages/page-loader-template7.html',
  },
  {
    path: '/page-loader-component/:user/:userId/:posts/:postId/',
    componentUrl: './pages/page-loader-component.html',
  },
  {
    path: '/logout',
    url: './logout',
  },
/*  {
    path: '/orders/:order_id/order_items/:item_id/add_item',
    url: 'http://127.0.0.1:3000/orders/{{order_id}}/order_items/{{item_id}}/add_item',
    options: {
	ignoreCache:true,
    },
  },*/
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
			if(response !=""){
				lee.funAndroid(response.split('|')[0],response.split('|')[1]);
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
			app.toast.create({
                                                text: '清桌完成',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                },
                error: function(){
                  console.log("error");
                }
              }
            )
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
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
                //app.router.back("/dining_tables", {force:true});
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
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
                //app.router.back("/dining_tables", {force:true});
          });
        },
        pageAfterIn: function (event, page) {
        // do something after page gets into the view
        if(parseInt($("#number_people").html()) == 0){
        app.dialog.create({
          title: "<a href='#' class='link back'><i class='icon icon-back color-blue'></i></a><span style='margin-top: 3px; position: absolute; top: 21px;'>选择人数</span>",
          buttons: [
            {
                    text: "<b><font style='font-size:16px;'>1</font></b>",
                    onClick: function() {
                       app.request(
                               {
                                 url: '/orders',
                                 method: 'POST',
                                 crossDomain: false,
                                 data: {
                                          "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                                          "order[quantity]": 1 //,
                                          // "authenticity_token":AUTH_TOKEN
                                },
                                statusCode: {
                                        404: function(xhr) {
                                                console.log('page not found');
                                        }
                                },
                                complete: function() {
                                        console.log('complete');
                                },
                                success: function(response) {
                                        app.toast.create({
                                                text: '订单生成',
                                                position: 'top',
                                                closeTimeout: 2000,
                                        }).open();
                                        app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                                },
                                error: function(){
                                        console.log("error");
                                }
                               }
                       );
                    }
            },
            {
              text: "<b><font style='font-size:16px;'>2</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 2,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>3</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 3,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
	    {
              text: "<b><font style='font-size:16px;'>4</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 4,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>5</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 5,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>6</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 6,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
	    {
              text: "<b><font style='font-size:16px;'>7</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 7,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>8</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 8,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>9</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 9,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
	    {
              text: "<b><font style='font-size:16px;'>10</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 10,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>11</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 11,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>12</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": $("#diningtable").html().split(" ")[0],
                   			  "order[quantity]": 12,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+$("#diningtable").html().split(" ")[0]+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
          ],
          verticalButtons: true,
        }).open();
	}
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
                //ac3.open();
                app.router.navigate("/dining_tables", {reloadAll:true, ignoreCache:true});
                //app.router.back("/dining_tables", {force:true});
          });
        },
        pageAfterIn: function (event, page) {
        // do something after page gets into the view
        if(parseInt($("#number_people").html()) == 0){
        app.dialog.create({
          title: "<a href='#' class='link back'><i class='icon icon-back color-blue'></i></a><span style='margin-top: 3px; position: absolute; top: 21px;'>选择人数</span>",
          buttons: [
            {
		    text: "<b><font style='font-size:16px;'>1</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 1 //,
                   			  // "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>2</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 2,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>3</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 3,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
	    {
              text: "<b><font style='font-size:16px;'>4</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 4,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>5</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 5,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>6</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 6,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
	    {
              text: "<b><font style='font-size:16px;'>7</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 7,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>8</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 8,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>9</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 9,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
	    {
              text: "<b><font style='font-size:16px;'>10</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 10,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>11</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 11,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
            {
              text: "<b><font style='font-size:16px;'>12</font></b>",
		    onClick: function() {
                       app.request(
			       {
			         url: '/orders',
				 method: 'POST',
				 crossDomain: false,
                                 data: {
                 			  "order[dining_table_id]": page.route.params.id,
                   			  "order[quantity]": 12,
                   			  "authenticity_token":AUTH_TOKEN
                   		},
                		statusCode: {
                  			404: function(xhr) {
                    				console.log('page not found');
                  			}
                		},
                		complete: function() {
                  			console.log('complete');
                		},
                		success: function(response) {
                  			app.toast.create({
            					text: '订单生成',
            					position: 'top',
            					closeTimeout: 2000,
          				}).open();
					app.router.navigate("/dining_tables/"+page.route.params.id+"/edit", {reloadCurrent:true, ignoreCache:true});
                		},
                		error: function(){
                  			console.log("error");
                		}
			       }
		       );
		    }
            },
          ],
          verticalButtons: true,
        }).open();
	}
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
