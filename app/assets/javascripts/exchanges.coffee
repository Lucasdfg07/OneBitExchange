# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # $('form').submit ->
  #   if $('form').attr('action') == '/convert'
  #     $.ajax '/convert',
  #         type: 'GET'
  #         dataType: 'json'
  #         data: {
  #                 source_currency: $("#source_currency").val(),
  #                 target_currency: $("#target_currency").val(),
  #                 amount: $("#amount").val()
  #               }
  #         error: (jqXHR, textStatus, errorThrown) ->
  #           alert textStatus
  #         success: (data, text, jqXHR) ->
  #           $('#result').val(data.value)
  #       return false;

  # Formulário de conversão automática
  $('#amount').keyup ->
    conversao();

  # Formulário para troca de moedas
  $('#btn-troca').click ->
    source_currency = $("#source_currency").val();
    target_currency = $("#target_currency").val();

    $("#target_currency").val(source_currency);
    $("#source_currency").val(target_currency);

    conversao();

  # Formulário para conversão na troca da moeda
  $("#source_currency").change ->
    conversao();

  $("#target_currency").change ->
    conversao();


  # Função de conversão automática de valores
  conversao = ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
         $('#result').val(data.value)
      return false;
