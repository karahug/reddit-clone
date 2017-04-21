// needs to be idempotent

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
        upvoteButton.removeClass("loading");
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
        downvoteButton.removeClass("loading");
        voteCountSpan.text(votecount + "");
    });
    upvoteForm.find("svg.upvoteButton").on("click", function(e){
        $(this).addClass("loading");
    });
    downvoteForm.on("click", function(e){
        $(this).find("svg.downvoteButton").addClass("loading");
    });
};

function addLabel(form, buttonType){
    form.not(":has(svg)").each(function(){
        $(this).append("<label class=" + buttonType +"Label></label>");
        var label = $(this).find("label");
        var voteInput = $(this).find("input[type='submit']").first();
        var svg = $(this).parent().find("svg." + buttonType + "Button").first();
        voteInput.appendTo(label);
        svg.appendTo(label);
    });
}

$(document).on('turbolinks:load', ready);
