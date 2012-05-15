# NeSI global variables etc.

class ganglia::parameters{
  case $operatingsystem{
    Ubuntu: {
      $webfrontend_package    = 'ganglia-webfrontend'
      $metaserver_package     = 'gmetad'
      $metaserver_service     = 'gmetad'
      $metaserver_init        = "/etc/init.d/${metaserver_service}"
      $config_dir             = '/etc/ganglia'
      $metaserver_conf        = "${config_dir}/${metaserver_service}.conf"
      $rrd_parentdir          = '/var/lib/ganglia'
      $rrd_rootdir            = '/var/lib/ganglia/rrds'
      $prefix                 = '/usr'
      $metaserver_bin         = "${prefix}/sbin/${metaserver_service}"
    }
  }

# Installation parameters
  $src_root       = '/src'

# configure options
  $configure_opts     = "--prefix=${prefix} --sysconfdir=${config_dir}"


# Set software versions
  $web_version        = '3.4.2'
  $core_version       = '3.3.7'
  $pyclient_version   = '3.3.0'

# Set software source URLs and files  
  $core_source_file   = "ganglia-${core_version}.tar.gz"
  $core_source_url    = "http://downloads.sourceforge.net/project/ganglia/ganglia%20monitoring%20core/${core_version}/${core_source_file}"
  $src_dir            = "${src_root}/ganglia"
  $src_version_dir    = "${src_dir}-${core_version}"
}