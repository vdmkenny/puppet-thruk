class thruk {

    package{"thruk":
        ensure=>present,
        notify=>Service['httpd'],
        require=>Yumrepo['base'],
    }

    
    if defined(Package['thruk']) {
        file{"/etc/thruk/thruk_local.conf":
            mode   => 644,
            owner  => apache,
            group  => apache,
            source => "puppet:///modules/thruk/thruk_local.conf",
        }
              
        service{"httpd":
            ensure=>running,
        }

    }
}
