node ip-10-0-2-219 {
    cron { "puppet apply":
	    command => "cd /etc/puppet && git pull -q origin master && puppet apply manifests/site.pp",
	    user    => root,
	    minute  => "*/5",
	}
}

node ip-10-0-2-157 {
    cron { "puppet apply":
	    command => "cd /etc/puppet && git pull -q origin master && puppet apply manifests/site.pp",
	    user    => root,
	    minute  => "*/5",
	 }
}
