 $(document ).ready(function() {
      setInterval(() => {
        var button = $('.status-button');
        if(button) {
          $.ajax({url: "/net/conection_status"}).complete((a,b) => {
            if(a.status != 200) {
              button.removeClass('status-connected');
              button.addClass('status-disconnected');
            }else {
              button.removeClass('status-disconnected');
              button.addClass('status-connected');
            }
          });
        }
      }
      , 3000);
});
