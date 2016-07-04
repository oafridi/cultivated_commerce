$ ->

# Show and hide sign in
  $(".listing-front").show();
  $(".listing-events").hide();

  $(".flip-to-back").on "click", (e) -> 
    e.preventDefault();
    $(this).parents(".listing-front").hide();
    $(this).parents(".listing-front").siblings(".listing-events").show();

  $(".flip-back").on "click", (e) ->
    e.preventDefault();
    $(this).parents(".listing-events").hide();
    $(this).parents(".listing-events").siblings(".listing-front").show();

  $(".add-button").on "click", (e) ->
    e.preventDefault();
    $(this).hide();
    $(".add-product").removeClass("hide");

  $(".submit-item").on "click", (e) ->       
    $(".add-product").addClass("hide");
    $(".add-button").show();

  #Filtering
  $(".filter-1").click ->
    $("[data-kind=filter-1]").show "slow"
    $("[data-kind=filter-2]").hide "slow"
    $("[data-kind=filter-3]").hide "slow"
    $("[data-kind=filter-4]").hide "slow"
    $("[data-kind=filter-5]").hide "slow"
    $("[data-kind=filter-6]").hide "slow"


  $(".filter-2").click ->
    $("[data-kind=filter-1]").hide "slow"
    $("[data-kind=filter-2]").show "slow"
    $("[data-kind=filter-3]").hide "slow"
    $("[data-kind=filter-4]").hide "slow"
    $("[data-kind=filter-5]").hide "slow"
    $("[data-kind=filter-6]").hide "slow"


  $(".filter-3").click ->
    $("[data-kind=filter-1]").hide "slow"
    $("[data-kind=filter-2]").hide "slow"
    $("[data-kind=filter-3]").show "slow"
    $("[data-kind=filter-4]").hide "slow"
    $("[data-kind=filter-5]").hide "slow"
    $("[data-kind=filter-6]").hide "slow"


  $(".filter-4").click ->
    $("[data-kind=filter-1]").hide "slow"
    $("[data-kind=filter-2]").hide "slow"
    $("[data-kind=filter-3]").hide "slow"
    $("[data-kind=filter-4]").show "slow"
    $("[data-kind=filter-5]").hide "slow"
    $("[data-kind=filter-6]").hide "slow"


  $(".filter-5").click ->
    $("[data-kind=filter-1]").hide "slow"
    $("[data-kind=filter-2]").hide "slow"
    $("[data-kind=filter-3]").hide "slow"
    $("[data-kind=filter-4]").hide "slow"
    $("[data-kind=filter-5]").show "slow"
    $("[data-kind=filter-6]").hide "slow"


  $(".filter-6").click ->
    $("[data-kind=filter-1]").hide "slow"
    $("[data-kind=filter-2]").hide "slow"
    $("[data-kind=filter-3]").hide "slow"
    $("[data-kind=filter-4]").hide "slow"
    $("[data-kind=filter-5]").hide "slow"
    $("[data-kind=filter-6]").show "slow"
