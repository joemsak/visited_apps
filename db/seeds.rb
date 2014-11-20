# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

App.create([
  { name: 'Facebook',
    reference_url: 'https://fbstatic-a.akamaihd.net/rsrc.php/v2/y5/r/fkc5PiXbosU.css' },
  { name: 'Google Plus',
    reference_url: 'https://ssl.gstatic.com/gb/js/abc/gcm_57b1882492d4d0138a0a7ea7240394ca.js' },
  { name: 'MySpace',
    reference_url: 'https://x.myspacecdn.com/new/common/css/sprite.BBF12BA9520AC949E116469AF39D9231.min.css' },
  { name: 'Hulu',
   reference_url: 'http://static.huluim.com/huluguru/fonts-f0256c577f48b8362cb10853ae225a12.css' },
 { name: 'Flickr',
   reference_url: 'https://s.yimg.com/pw/combo/1/3.11.0?c/c_.X_nav_.GWguide.BC.vB&c/c_.J_.D.BC.vV&c/c_.J_.D.BC.vV&c/c_.EM_.D.BC.vvgvNCM&' }
])
