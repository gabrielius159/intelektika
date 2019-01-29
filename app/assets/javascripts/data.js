

$(document).on('turbolinks:load', function() {
    setTextForData();
    $('#best_internetas').change(function() {
        setTextForData();
    });

    $('#best_zinutes').change(function() {
        setTextForData();
    });

    $('#best_pokalbiai').change(function() {
        setTextForData();
    });
});

function setTextForData()
{
    if($('#best_internetas').val() == 11000)
    {
        $('#internetas_js').text('Neribotas');
    }
    else
    {
        $('#internetas_js').text($('#best_internetas').val() + ' MB');
    }

    if($('#best_zinutes').val() == 1000)
    {
        $('#zinutes_js').text('Neribotos');
    }
    else
    {
        $('#zinutes_js').text($('#best_zinutes').val() + ' žinučių');
    }

    if($('#best_pokalbiai').val() == 420)
    {
        $('#pokalbiai_js').text('Neriboti');
    }
    else
    {
        $('#pokalbiai_js').text($('#best_pokalbiai').val() + ' min');
    }
}