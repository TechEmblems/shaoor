// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


/**************** with same name *****************/
var email_rules = {
    email_one:{ identifier : 'email1',
        rules: [{ type   : 'empty', prompt : 'Please enter email'}]
    },
    email_two:{ identifier : 'email2',
        rules: [{ type   : 'empty', prompt : 'Please enter email'}]
    }
};
console.log(email_rules);
$(".ui.form").form(email_rules,{
    inline : true,
    on : blur
});

/**************** with same name *****************/
var email_rules = {};
var len = $('.email').length +1;
console.log(len);
for(var i=0 ; i < len; i++){
    $('.email')
    var key = 'email'+i
    var value = {
        identifier : 'email'+i,
        rules: [{ type   : 'empty', prompt : 'Please enter email'}]
    }
    email_rules[key] = value;
}

$(".ui.form").form(email_rules,{
    inline : true,
    on : blur
});


/**************** with dynamic entries *****************/
var email_rules = {};
var len = $('.email').length;
for(var i=0 ; i < len; i++){
    var key = $('.email')[i].name
    var value = {
        identifier : $('.email')[i].name,
        rules: [{ type   : 'empty', prompt : 'Please enter email'}]
    }
    email_rules[key] = value;
}
console.log(email_rules);

$(".ui.form").form(email_rules,{
    inline : true,
    on : blur
});

