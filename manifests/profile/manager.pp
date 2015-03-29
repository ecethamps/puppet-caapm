class caapm::profile::manager { 
  class { "caapm::em":
    version => '9.1.4.0',
    install_dir => 'C:/Ecetera/Introscope9.1.4.0/',
    features => 'Enterprise Manager,Database,WebView',
    clusterEM => true,
    cluster_role => 'Manager',
    txnTraceDir => 'C:/Ecetera/Traces',
    smartstor_dir => 'C:/Ecetera/Smartstor',
    threaddump_dir => 'C:/Ecetera/ThreadDump',
    emLaxNlJavaOptionAdditional => '-Xms1024m -Xmx1024m -XX:MaxPermSize=256m -Dorg.owasp.esapi.resources=./config/esapi',
    database => 'postgres',
    db_host => 'win28r2.diamond.org',
    postgres_dir => 'C:/Ecetera/PostgreSQL-8.4/',
    config_as_service => true,
    config_wv_as_service => true,
  } 
  
}