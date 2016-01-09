$ = require 'jquery/dist/jquery'

function update-relative-times
	now = new Date!
	$ "time[data-display-type='relative']" .each ->
		date = new Date($ @ .attr \datetime)
		ago = ~~((now - date) / 1000)
		time-text = switch
			| ago >= 31536000s => ~~(ago / 31536000s) + '年前'
			| ago >= 2592000s  => ~~(ago / 2592000s) + 'ヶ月前'
			| ago >= 604800s   => ~~(ago / 604800s) + '週間前'
			| ago >= 86400s    => ~~(ago / 86400s) + '日前'
			| ago >= 3600s     => ~~(ago / 3600s) + '時間前'
			| ago >= 60s       => ~~(ago / 60s) + '分前'
			| ago >= 10s       => ~~(ago % 60s) + '秒前'
			| ago <  10s       => 'たった今'
			| _ => ''
		$ @ .text time-text

$ ->
	update-relative-times!
	set-interval update-relative-times, 1000ms
