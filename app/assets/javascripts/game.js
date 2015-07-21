$(document).ready(function(){
  $('.join').on('click', function(){
    var gameId = //write jquery to get id - hidden field?
    var currentUserId = //how to get this?

    $.ajax({
      method: 'POST',
      url: 'games/' + gameId + '/players/new',
      dataType: json,
      data: { 'game_id' : gameId }
      success: function(newPlayerCount){
        //select $('table tr td') and replace with newPlayerCount
      }
    })

  })

});
