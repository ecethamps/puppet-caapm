# Class: caapm::params
#
# This class manages CA APM parameters.
#
# Parameters:
# - $em_home the installation directory for Introscope on your Enterprise Manager.
# - The $user CA APM runs as.
# - The $group CA APM is a member of.
class caapm::params (
) {

  include staging
  include stdlib
  
  $version = '9.1.4.0'
  $default_port = '5001'  # Port used by Enterprise Manager to listen for incoming connections.
  $ssl_port = '5443'      # Port used by Enterprise Manager for secure channel connections
  $web_port = '8081'      # Port used by Enterprise Manager to serve web applications.
  $webview_port = '8080'  # Port used by Enterprise Manager to serve WebView.
  $admin_passwd = ''      # Password for Enterprise Manager Admin account leave this entry blank to use default
  $guest_passwd = ''      # Password for Enterprise Manager Guest account leave this entry blank to use default
  $txntrace_days_to_keep = 14
  $txntrace_dir = 'traces'
  $txntrace_storage_cap = ''
  $smartstor_dir = 'data'
  $threaddump_dir = 'threaddumps'
  $em_host = "${::fqdn}"
  $apm_db = 'postgres'
  $db_host = 'localhost'
  $db_port = 5432
  $db_name = 'cemdb'
  $db_user_name = 'admin'
  $db_user_passwd = 'wily'
  $pg_dir = 'database'
  $pg_admin_user ='postgres'
  $pg_admin_passwd ='C@wilyapm90'
  $pg_install_timeout = 240000

  $staging_subdir = "${module_name}"
  $accept_eula = 'accept'
  
  $ca_eula    = 'accept'
  $em_role = 'emc'


  # Settings common to a kernel
  case $::kernel {
    default: { fail("CA APM component does not support kernel ${::kernel}") }
    'Linux': {
      $path_delimiter       = '/'
      $em_home = "/opt/caapm/Introscope${version}/"
      $install_dir = "${em_home}"
      $em_confdir = "${em_home}/config"
      $src_perms = ignore
      $pkg_provider = undef
      $src_permissions = ignore
      $owner  = 'caapm'
      $group  =  'apm'
      $mode   = '0644'    
    }
    'SunOS': {
      $path_delimiter       = '/'
      $forwarder_src_subdir = 'universalforwarder/solaris'
      $forwarder_service    = [ 'splunk' ]
      $forwarder_confdir    = '/opt/splunkforwarder/etc/system/local'
      $server_src_subdir    = 'splunk/solaris'
      $server_service       = [ 'splunk', 'splunkd', 'splunkweb' ]
      $server_confdir       = '/opt/splunk/etc/system/local'
      $workstation_features = ['Workstation']
      $mom_features = ['Enterprise Manager, WebView, ProbeBuilder']
      $lbm_features = ['Enterprise Manager']
      $db_features = ['Database']
      $emc_features = ['Enterprise Manager']
    }
    'Windows': {
      $path_delimiter       = '\\'
      $em_home = "D:/Apps/CA/APM/Introscope${version}/"
      $install_dir = "D:/Apps/CA/APM/Introscope${version}/"
      $em_confdir = "${em_home}/config"
      $src_perms = ignore
      $pkg_provider = undef
      $src_permissions = ignore
      $owner  = 'Administrator'
      $group  =  'Users'
      $mode   = '0644'    
    }
  }

    
/*  
  file {'${caapm::params::tempdir}':
    ensure => 'directory',
    owner  => '${caapm::params::user}',
    group  => '${caapm::params::group}',
    mode   => '${caapm::params::mode}',
  }
        
  $osgi_version = ${caapm::version} ? {
    '9.7.0.0' => "9.7.0.27",
    default  => "${caapm::version}",
  }
		
  
  
 */
  
}

