node ip-52-12-236-183 {
    include puppet
    include sshd
    include apache2
    include mailutils
}

node default {
    include puppet
    include sshd
    include apache2
    include mailutils
}

node ip-10-0-2-219 {
    include puppet
    include sshd
    include apache2
    include mailutils
}
