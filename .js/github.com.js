$(function () {
  var match = $('#slider .tree-browser a').filter(function () {
    return 'package.json' == $(this).text();
  });
  if (match.length) {
    $.get(match.attr('href'), function (res) {
      var file = $(res).find('#files');

      // make it look good
      file.css({
          marginTop: -15
        , marginBottom: 15
      });

      // append package.json title
      file.find('.info span.icon').append($('<b>package.json</b>').css({
          padding: '8px 4px'
        , display: 'inline-block'
      }));

      $('.tree-browser-wrapper').after(file);
    });
  }
});