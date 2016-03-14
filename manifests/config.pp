define thruk::config(
    $servers=['127.0.0.1'],
    $titleprefix= "Thruk - ",
    $privuser="*",
   ){
    
#    file{'/etc/thruk/thruk_local.conf':
#	owner  => root,
#	content => template('thruk/thruk_local.conf.erb'),
#        }

    include thruk
        
    }
