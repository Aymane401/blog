// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js";
import "controllers/myscript"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("packs/application")