node default {

	exec { 'apt-update':
		command => '/usr/bin/apt-get update',
	}

	include core::apache2
	include core::mysql
	include core::curl
	include core::mail
	include core::php5
	include core::openeyes
	include core::composer

	if $mode == 'dev' {
		include dev::vim
		include dev::xdebug
		include dev::nodejs
		include dev::grunt
		include dev::bower
		include dev::ruby
		include dev::compass
	}

	if $mode == 'ci' {
		include dev::xdebug
	}
}