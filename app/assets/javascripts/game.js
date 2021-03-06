chars = ["A","B","C","D","E","F","G","H","I","J","K","L"];

$(document).ready(function() {
    polling_wrapper();

    $(".gameCell").hover(
        function() {$(this).css("background-color", "gray")}, 
        function() {$(this).css("background-color", "white")}
    );
});

function polling_wrapper() {
    $.getJSON("poll_game_state.json", null, function(data) {
        render(data.board, data.game_description.width, data.game_description.height);
    });
    setTimeout(polling_wrapper, 15000);
}

function render(board, width, height) {
    r = 0
    c = 0
    for (chr = 0; chr < board.length; chr++)
    {
        cellID = "#cell" + r + "_" + c;

        $(cellID).text(chars[r] + (c+1));

        c++;
        if (c >= width)
        {
            c = 0;
            r++;
        }
    }
}
