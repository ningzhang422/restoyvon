// Dom7
var $ = Dom7;

// Theme
var theme = 'auto';
if (document.location.search.indexOf('theme=') >= 0) {
  theme = document.location.search.split('theme=')[1].split('&')[0];
}

// Init App
var app = new Framework7({

  id: 'io.framework7.testapp',
  root: '#app',
  theme: theme,
  data: function () {
    return {
      user: {
        firstName: 'John',
        lastName: 'Doe',
      },
    };
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
	    app.request.get('/logout', { foo:'bar', id:5 }, function (data) {
		    app.router.navigate("/login", {reloadCurrent:true, ignoreCache:true});
                  });
    },
  },
  routes: routes,
  vi: {
    placementId: 'pltd4o7ibb9rc653x14',
  },
});
