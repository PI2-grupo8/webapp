 $(document ).ready(function() {
  var button = $('.save-conf');
  button.on('click', () => {
    $.ajax({url: "/net/setup"}).complete((a,b) => {
      if(a.status != 200) {
        console.log(a);
        alert(a.responseJSON.message);
      }else {
        alert("Arquivo settings.conf escrito com sucesso!");
      }
    });

  });
});
