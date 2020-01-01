$(document).ready ->

  # Formulário de conversão automática
  $('#amount_btc').keyup ->
    conversao();

  # Formulário para troca de moedas
  $('#btn-troca_btc').click ->
    source_currency_btc = $("#source_currency_btc").val();
    target_currency_btc = $("#target_currency_btc").val();

    $("#target_currency_btc").val(source_currency_btc);
    $("#source_currency_btc").val(target_currency_btc);

    conversao();

  # Formulário para conversão na troca da moeda
  $("#source_currency_btc").change ->
    conversao();

  $("#target_currency_btc").change ->
    conversao();

  # Função de conversão automática de valores
  conversao = ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency_btc").val(),
                  target_currency: $("#target_currency_btc").val(),
                  amount: $("#amount_btc").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result_btc').val(data.value.toFixed(2))
        return false;
