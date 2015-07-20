$(document).ready( function () {
    $('#table_id').DataTable( {
      "oLanguage": {
      "sEmptyTable": "There are no games that match your search!"
      },
      "bScrollInfinite": true,
      "bScrollCollapse": true,
      "sScrollY": "430"
    })
    $('.dataTables_filter input').attr("placeholder", "Sport, Date, etc");
} );
