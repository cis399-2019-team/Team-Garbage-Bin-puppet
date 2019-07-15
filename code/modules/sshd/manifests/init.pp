class sshd {
        # Part 1
        package { "openssh-server":
                ensure => installed,
                provider => apt,
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
        service { "sshd":
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

        ssh_authorized_key { "dev-priv":
        ensure => present,
        user => "ubuntu",
        type => "ssh_rsa",
        key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCVnXtI1h5eDPlFLKaRJX971Jd/5V0AhEdxg13HpG7bRlS1/25xs8T7fbPNiUkyaewvWUxU9wFh/YDOhkLgivXH0XDx/Fmdl0e79XchbK/63xisuLEDf/6mHBjo/1eS9iBjUEv/l/Q191hZPQab5mUabcVzsR8BHCvxtMg0MPeB73K/9C3EGHvctVjDiSx4cFc2LkQtlt4hJ2Itfg9730FgR2J5Mdj8cr9k+EbUxz0HzmJXVu6q8p4ASGVtoqK82VGRB7lQWAf2raJCyL0UXyQ1A1aVKivnG2voxPVIlEoG7GlFuRa87LO/bzRasQjCZVSD9sBHD+QxSWG16iyILPdv",
        }
}
