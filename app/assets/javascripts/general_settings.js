 $(document ).ready(function() {
  var saveButton = $('.save-conf');
  var amount_of_rows = $('#settings_amount_of_rows').val();
  var measurements_distance = $('#settings_measurements_distance').val();
  var amount_of_measurements = $('#settings_amount_of_measurementes').val();
  saveButton.on('click', () => {
    $.ajax({
      url: "/net/setup",
      data: {
              'amount_of_rows': amount_of_rows,
              'measurements_distance': measurements_distance,
              'amount_of_measurements': amount_of_measurements
            }
    }).complete((a,b) => {
      if(a.status != 200) {
        console.log(a);
        alert(a.responseJSON.message);
      }else {
        alert("Arquivo settings.conf escrito com sucesso!");
      }
    });

  });

  var syncButton = $('.sync');
  syncButton.on('click', () => {
    $.ajax({url: "/net/sync_data"}).complete((a,b) => {
      if(a.status != 200) {
        console.log(a);
        alert(a.responseJSON.message);
      }else {
        alert(a.status + a.responseJSON.message);
      }
    });
  });
});
