class thruk {

    package{"thruk":
        ensure=>present,
        notify=>Service['httpd'],
    }

    
    if defined(Package['thruk']) {
        file{"/etc/thruk/thruk_local.conf":
            mode   => 644,
            owner  => apache,
            group  => apache,
           # source => "puppet:///modules/thruk/thruk_local.conf",
            content => template('thruk/thruk_local.conf.erb'),
            notify  => Service['thruk'],
            require => Package['thruk'],
        }
              
        service{"httpd":
            ensure=>running,
        }

    }
}
