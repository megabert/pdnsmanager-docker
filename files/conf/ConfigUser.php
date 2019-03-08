<?PHP
# pdnsmanager user config
return [
    'db' => [
	'host'     => '%%MYSQL_HOST%%',
        'user'     => '%%MYSQL_USER%%',
        'password' => '%%MYSQL_PASS%%',
        'dbname'   => '%%MYSQL_DBNAME%%',
        'port'     => '%%MYSQL_PORT%%' 
    ],
    'logging' => [
        'level' => 'debug',
        'path' => '/tmp/pdnsmanager.log'
    ]
];

