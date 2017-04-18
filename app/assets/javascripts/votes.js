console.log('running js');
var ready = function(){
    var upvoteForm = $(".upvoteForm");
    var downvoteForm = $(".downvoteForm");
    addLabel(upvoteForm, "upvote");
    addLabel(downvoteForm, "downvote");
    upvoteForm.on("ajax:success", function(e, xhr){
        var upvoteButton = $("svg.upvoteButton", this);
        var downvoteButton = $(this).parent().find("svg.downvoteButton");
        var voteCountSpan = $(this).parent().find("span");
        var voteValue = xhr.voteValue;
        var votecount = xhr.voteCount;
        upvoteButton.toggleClass("clicked", voteValue == 1);
        downvoteButton.toggleClass("clicked", voteValue == -1);
        voteCountSpan.text(votecount + "");
    });
    downvoteForm.on("ajax:success", function(e, xhr){
        var downvoteButton = $("svg.downvoteButton", this);
        var upvoteButton = $(this).parent().find("svg.upvoteButton");
        var voteCountSpan = $(this).parent().find("span");
        var voteValue = xhr.voteValue;
        var votecount = xhr.voteCount;
        downvoteButton.toggleClass("clicked", voteValue == -1);
        upvoteButton.toggleClass("clicked", voteValue == 1);
        voteCountSpan.text(votecount + "");
    });
};

function addLabel(form, buttonType){
    form.each(function(){
        $(this).append("<label class=" + buttonType +"Label></label>");
        var label = $(this).find("label");
        var voteInput = $(this).find("input[type='submit']");
        var svg = $(this).parent().find("svg." + buttonType + "Button");
        console.log(label);
        console.log($(this).parent());
        voteInput.appendTo(label);
        svg.appendTo(label);
    });
}

//$(document).ready(ready);
$(document).on('turbolinks:load', ready);
