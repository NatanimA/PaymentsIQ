// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



const hamburger = document.querySelector('#hamb');
const navBar = document.querySelector('#mobile-navbar');
const headline = document.querySelector('.container');
const body = document.querySelector('body');
const current = document.querySelector('.current-page')
const searchIcon = document.querySelector('.search-icon')
const recent = document.querySelector('.recent-container')
const login = document.getElementById('.login-btn-touch')


hamburger.addEventListener('click', () => {
    headline.classList.toggle('active');
    hamburger.classList.toggle('active');
    current.classList.toggle('active');
    navBar.classList.toggle('active');
    searchIcon.classList.toggle('active');
    body.classList.toggle('active');
    recent.classList.toggle('active');
});

document.querySelectorAll('.mobile-nav-link').forEach((link) => link.addEventListener('click', () => {
    preventDefault()
    headline.classList.remove('active');
    hamburger.classList.remove('active');
    current.classList.remove('active');
    navBar.classList.remove('active');
    body.classList.remove('active');
    searchIcon.classList.remove('active');
    recent.classList.remove('active');
}));


