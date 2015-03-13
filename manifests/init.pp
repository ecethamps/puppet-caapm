# Class: caapm
#
# This module manages caapm
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class caapm (
  $em_role = $caapm::params::em_role,  /* standalone, emc, mom, cdv, tcs */
  $em_home = $caapm::params::em_home,  /* override if needed */
  $version     = $caapm::params::version,  
  $install_dir = $caapm::params::install_dir,  
  $user       = $caapm::params::user,
  $group      = $caapm::params::group,
  

  
) inherits caapm::params {
    $version      = '9.1.4.0'
  

}
