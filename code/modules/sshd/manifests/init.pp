class sshd {
        package { "openssh-server":
                ensure => installed,
                provider => apt,
        }

        file { "/etc/ssh/sshd_config":
                ensure  => present,
                notify  => Service["ssh"],
                mode    => '444',
                owner   => 'root',
                group   => 'root',
                source  => "puppet:///modules/sshd/sshd_config",
                require => Package["openssh-server"],
        }

        service { "ssh":
                enable    => true,
                ensure    => running,
                subscribe => File["/etc/ssh/sshd_config"],
                require   => [
                        Package["openssh-server"],
                ],
        }

        ssh_authorized_key { "llhyatt98_key":
        ensure => present,
        user => "ubuntu",
        type => "ssh-rsa",
        key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDB3DSqNr3YM9/B+mlVgmG+Q4n+Q2T8crk+F36CI43bB7kM+WeIEl3lJ279ExpI9y4KI/Yuh7eDWFgHriDB0xyq7IQnWvsKVhT4aWJv4Yrjde9UeD+NPUoRgbB8NScBWBUo+aI/VZAUVCg1xKyrxbcj89SBM1FrC8jZalz95VXR/rpJzSTQFN0c9KVZHfsCOBrGdAC9bbMES42Yqo5elnh7JfBsdqnYL+HHqkT7AyVcuqlBC4u+ZYoXmz5da4KyeyIEGFrDQM7h+dnyKQh1caRu7YyxmTvXA6OSjYE4rZtKQ9WZU02yB6o7CxEE/P8xa2mAZQEgUnjUmSXxRHFrobmX",
        }        

        ssh_authorized_key { "dev-key":
        ensure => present,
        user => "ubuntu",
        type => "ssh-rsa",
        key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCVnXtI1h5eDPlFLKaRJX971Jd/5V0AhEdxg13HpG7bRlS1/25xs8T7fbPNiUkyaewvWUxU9wFh/YDOhkLgivXH0XDx/Fmdl0e79XchbK/63xisuLEDf/6mHBjo/1eS9iBjUEv/l/Q191hZPQab5mUabcVzsR8BHCvxtMg0MPeB73K/9C3EGHvctVjDiSx4cFc2LkQtlt4hJ2Itfg9730FgR2J5Mdj8cr9k+EbUxz0HzmJXVu6q8p4ASGVtoqK82VGRB7lQWAf2raJCyL0UXyQ1A1aVKivnG2voxPVIlEoG7GlFuRa87LO/bzRasQjCZVSD9sBHD+QxSWG16iyILPdv",
        }

        ssh_authorized_key { "jerry-key":
        ensure => present,
        user => "jerry",
        type => "ssh-rsa",
        key  => "AAAAB3NzaC1yc2EAAAADAQABAAACAQC1UoDoKsyxL2O6Ugw2WUr7FxupWnuDI7r23sDCoGQHWW60BzHJUR1ZqTk+qdqA7UuInHj/rn6jSoEV2N/jw/cMNb3GKF9cpVnHnXXnf0dwBtKEH0J4IHD/koZZqc88iUqb9fMZ8YlOSDrIakwAuryFK8bhgDmWqZOGZlPZn9WYkMuLIY4ICwqpr3Snes25N1Mac4hKHY3Y8jTsQLQUm478Kx+m4jnpt85Ymfbvzf6LrleNzNppFwA3mWPcpa9T4qhnlpx789k71j5MboAmK5fUQeFxwwcV04/MO8zcZhjqpYAo7noLh6KopwErDYni6LEkNxwOJvjHZIa1dLKJ1jwSodvjDJV2+tDpppdLWD4XSnA21cZq2BD2Sx0uifv9N8TlAbGcvQasJOMiNXfJ3M6m2UQWMMQ3HlXviko7NzNj925CHz+rBIlVhJmt5d6NsvpIiI8D/hQC0ugclLVDZ6jHrCBu9MdB60cZEbzXP6+h9xltapmw5ikF05SuvKP7Mskor5twLoyq59NQi2iTcFzkQOLDzNzi557EquEQNC4yxzdNr9ZmtepVu2fOuY+djq+UKXp9KuLsAfC6sfjBckb5uZCFYEw+LYZMYJwduyPMIUuP/09ffNWzfptYNa2tZ1FPRtcm9GdjlsCufFoXir3cee25T329HTLcPIfxFKx5GQ==",
        }

ssh_authorized_key { "mapu-key":
        ensure => present,
        user => "mapu",
        type => "ssh-rsa",
        key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDHfT9V5ERJ9sGiPwqijec52HiaEKxKoPuW2ehz8Te2g/cBAHWi8jQz8X+KvEb/Nqmv0Q29N1WkUWzGAjjRQP9Cyhe5NN2DVTD5FjX9W8YFoMxHBIBAvK68I1PTSYrkh7A6UtfsRx0bxg/uEfjRzstU+D0mg7T+x6ysuMjs6+HVXVNAj+Qr0NAkaMnMoYFlUP62/jCyiH8xliyW4pk65tNbLLDxD4i1631F4WiWfdSZgX3ZHwA7QgMpaEoRa9Pgee6NpzUBHgyWei9XKEnhfsIZtrx9wIJ824wnqOVqx6XkG8CCGipWyTy50xX5X/YG1YMknotRFvv8/cLar/Tdw5lj",
        }

}
