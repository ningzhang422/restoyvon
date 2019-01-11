// Dom7
var $ = Dom7;

// Theme
var theme = 'auto';
if (document.location.search.indexOf('theme=') >= 0) {
  theme = document.location.search.split('theme=')[1].split('&')[0];
}
Framework7.use(Framework7Keypad);
// Init App
var app = new Framework7({

  id: 'io.framework7.testapp',
  root: '#app',
  theme: theme,
  touch: {
     fastClicksDistanceThreshold : 50 
  },
  methods: {
    openAlert: function () {
        app.dialog.alert('Hello!');
      },
    helloWorld: function () {
      app.dialog.alert('Hello World!');
    },
    signIn: function () {
        app.request(
              {
                url: '/users/sign_in',
                method: 'POST',
                crossDomain: false,
                data: {
                   "user[login]": $("input#demo-username-2.focus.input-with-value").val(),
                   "user[password]": $("input#demo-password-2.input-with-value").val(),
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
		  app.request.get('/dining_tables/left_panel', { foo:'bar', id:5 }, function (data) {
		    $('.panel-left')[0].innerHTML = data;
                  });
                  app.router.navigate("/dining_tables", {reloadCurrent:true, ignoreCache:true});
                },
                error: function(){
                  console.log("error");
                }
              }
            )
    },
    signOut: function () {
	    app.panel.close();
	    app.request.get('/logout', { foo:'bar', id:5 }, function (data, status, xhr) {
		    app.router.navigate("/login", {reloadCurrent:true, ignoreCache:true});
                  }, function (data, status, xhr) {
                    app.router.navigate("/login", {reloadCurrent:true, ignoreCache:true});
                  });
    },
  },
  routes: routes,
  panel: {
    swipe: 'right'
  },
  vi: {
    placementId: 'pltd4o7ibb9rc653x14',
  },
  dialog: {
    // set default title for all dialog shortcuts
    title: '系统信息',
    // change default "OK" button text
    buttonOk: 'OK',
    buttonCancel: 'Annuler'
  },
});
//app.statusbar.show();
var searchpad =	app.keypad.create({
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
