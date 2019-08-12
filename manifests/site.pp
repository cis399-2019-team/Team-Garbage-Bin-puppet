node ip-52-12-236-183 {
    include puppet
    include sshd
    include apache2
    include mail
}

node default {
    include puppet
    include sshd
    include apache2
    include mail
}

node ip-10-0-2-219 {
    include puppet
    include sshd
    include apache2
    include mail
}
