class caapm::profile::collector { 
  class { "caapm::em":
#  caapm::em { 'emc':
#    version => '9.1.4.0',
#    install_dir => '/opt/caapm/Introscope9.1.4.0/',
    version => '9.6.0.0',
    install_dir => "/opt/caapm/Introscope9.6.0.0/",
    features => 'Enterprise Manager',
    clusterEM => true,
    cluster_role => 'Collector',
    txnTraceDir => '/var/caapm/traces',
    smartstor_dir => '/var/caapm/smartstor',
    threaddump_dir => '/var/caapm/threaddumps',
    emLaxNlJavaOptionAdditional => '-Xms1024m -Xmx1024m -XX:MaxPermSize=256m -Dorg.owasp.esapi.resources=./config/esapi',
    database => 'postgres',
    db_host => 'win28r2.diamond.org',
    service_name => 'introscope',
    config_as_service => true,
  } 
  
}