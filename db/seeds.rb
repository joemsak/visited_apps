# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

App.create([
  { name: 'Facebook',
    reference_url: 'https://fbstatic-a.akamaihd.net/rsrc.php/v2/yV/r/aXwjx2fqSf4.css' },
  { name: 'Google Plus',
    reference_url: 'https://ssl.gstatic.com/gb/js/abc/gcm_57b1882492d4d0138a0a7ea7240394ca.js' },
  { name: 'MySpace',
    reference_url: 'http://x.myspacecdn.com/modules/common/static/css/futuraglobal_kqj36l0b.css' },
  { name: 'Hulu',
   reference_url: 'http://static.huluim.com/system/hulu_0cd8f497_1.css' },
 { name: 'Flickr',
   reference_url: 'http://l.yimg.com/g/css/c_fold_main.css.v109886.64777.105425.23' }
])
