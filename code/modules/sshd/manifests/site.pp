class sshd {
        # Part 1
        package { "openssh-server":
                ensure => installed,
                provider => apt,
                before   => [
                        File["/etc/ssh/sshd_config"],
                        File["/home/ubuntu/.ssh/authorized_keys"],
                ],
        }

        # Part 3
        file { "/etc/ssh/sshd_config":
                ensure  => present,
                notify  => Service["sshd"],
                mode    => '444',
                owner   => 'root',
                group   => 'root',
                source  => "puppet:///modules/sshd/sshd_config",
                require => Package["openssh-server"],
        }

        # Part 2
        service { "ssh":
                enable    => true,
                ensure    => running,
                subscribe => File["/etc/ssh/sshd_config"],
                require   => [
                        Package["openshh-server"],
                ],
        }

        # Part 4
        ssh_authorized_key { "llhyatt98_key":
        ensure => present,
        user => "ubuntu",
        type => "ssh_rsa",
        key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDB3DSqNr3YM9/B+mlVgmG+Q4n+Q2T8crk+F36CI43bB7kM+WeIEl3lJ279ExpI9y4KI/Yuh7eDWFgHriDB0xyq7IQnWvsKVhT4aWJv4Yrjde9UeD+NPUoRgbB8NScBWBUo+aI/VZAUVCg1xKyrxbcj89SBM1FrC8jZalz95VXR/rpJzSTQFN0c9KVZHfsCOBrGdAC9bbMES42Yqo5elnh7JfBsdqnYL+HHqkT7AyVcuqlBC4u+ZYoXmz5da4KyeyIEGFrDQM7h+dnyKQh1caRu7YyxmTvXA6OSjYE4rZtKQ9WZU02yB6o7CxEE/P8xa2mAZQEgUnjUmSXxRHFrobmX",
}
