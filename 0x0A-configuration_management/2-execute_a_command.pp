# kills a process named killmenow

exec { 'killmenow_process':
    command     => 'pkill -f killmenow',
    path        => '/usr/bin/',
    refreshonly => 'true',
    onlyif      => 'pgrep -f killmenow',
}
