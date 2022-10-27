$(function() {
  $('.panel-tabset-tabby')
    .addClass('drac-tabs drac-tabs-purple');
  $('.panel-tabset-tabby a')
    .addClass('drac-tab-link drac-text')
    .parent('li')
    .addClass('drac-tab');
  
  $('.panel-tabset-tabby a[aria-selected="true"]')
    .addClass('drac-tab-link drac-text')
    .parent('li')
    .addClass('drac-tab drac-tab-active');
  
  $('.drac-tab-link').on('click', function() {
    $(this)
      .parent('li')
      .siblings()
      .removeClass('drac-tab-active');
    $(this).parent('li').toggleClass('drac-tab-active');
  });
});