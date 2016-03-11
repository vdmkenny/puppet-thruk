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
            require => Package['thruk'],
            notify  => Service['httpd'],
        }
              
        service{"httpd":
            ensure=>running,
        }

    }

    thruk::config{"cfg":
        titleprefix => $titleprefix,
        servers     => $servers,
    }

}
