'use strict';

document.addEventListener("turbolinks:load", function(){
	{
	  const menuItems = document.querySelectorAll('.switch li a');
	  const contents = document.querySelectorAll('.content');

	  menuItems.forEach(clickedItem => {
	    clickedItem.addEventListener('click', e => {
	      e.preventDefault();

	      menuItems.forEach(item => {
	        item.classList.remove('active');
	      });
	      clickedItem.classList.add('active');

	      contents.forEach(content => {
	        content.classList.remove('active');
	      });
	      document.getElementById(clickedItem.dataset.id).classList.add('active');
	    });
	  });
	};
})