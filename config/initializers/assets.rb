# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.compile = true
#Rails.application.config.assets.precompile +=  %w(*.js *.css)
Rails.application.config.assets.precompile +=  %w(registrations.js bootstrap.js classie.js device.js easing.js home.js jquery.jscrollpane.min.js
jquery.magnific-popup.js jquery.min.js modernizr.custom.js move-top.js responsiveslides.min.js)
Rails.application.config.assets.precompile +=  %w(registrations.css bootstrap_and_overrides.css component.css home.css
popup-box.css simple-sidebar.css user-section.css)
# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
