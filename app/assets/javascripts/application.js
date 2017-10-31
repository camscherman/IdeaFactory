// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .


document.addEventListener('DOMContentLoaded',function(){

$('#new-idea').click(function(){
    console.log('Clicked')
    $('.modal').addClass('is-active')

})

$('.modal-close').click(function(){
  $('.modal').removeClass('is-active')
})

$('button.delete').click(function(){
  $('.message.is-success').fadeOut();
  $('.message.is-warning').fadeOut();
})



let m = document.querySelectorAll('div.box i')

m.forEach(function(node){
  node.addEventListener('click', function(event){
    let ancestor = event.currentTarget.parentNode.parentNode.parentNode.parentNode.parentNode
    let content = ancestor.querySelector('.content')
    content.classList.toggle('gone')

  })
})


document.querySelector('.navbar-burger').addEventListener('click', function(){
  this.classList.toggle('is-active');
  document.querySelector('.navbar-menu').classList.toggle('is-active');
  })

})
