class mailutils {
    package { "mailutils":
        ensure => installed,
    }

    service { "postfix":
        enable => true,
        ensure => running,
    }




}
