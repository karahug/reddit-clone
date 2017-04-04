$(document).ready(function(){
    console.log("js ready");
    var upvoteButton = $(".upvoteButton");
    var downvoteButton = $(".downvoteButton");
    upvoteButton.on("ajax:success", function(e){
        console.log("upvotebutton clicked");
    });
});
