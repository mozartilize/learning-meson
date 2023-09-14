project(
        'meson-learn',
        'c',
        version: '0.1',
        default_options: [
                'warning_level=3'
        ]
)

datadir = get_option('datadir')
sysconfdir = get_option('sysconfdir')
prefix = get_option('prefix')

add_project_arguments('-DSYSCONFDIR="/@0@"'.format(join_paths(prefix, sysconfdir)), language: 'c')

fs = import('fs')

cluster_name = get_option('cluster_name')
pg_version = get_option('pg_version')
pg_port = get_option('pg_port')
host_ip = get_option('host_ip')
pg_data_dir = get_option('pg_data_dir')
network = get_option('network')
hostname = get_option('hostname')
pwd_fp = get_option('pwd_fp')
passwd_list = fs.read(pwd_fp).strip().split('\n')

conf_data = configuration_data()
conf_data.set('VERSION', pg_version)
conf_data.set('CLUSTER', cluster_name)
conf_data.set('HOSTIP', host_ip)
conf_data.set('API_PORT', '8008')
conf_data.set('NETWORK', network)
conf_data.set('PORT', pg_port)
conf_data.set('DATADIR_BASE', pg_data_dir)
conf_data.set('HOSTNAME', hostname)
conf_data.set('HOSTNAME', hostname)
conf_data.set('HOSTNAME', hostname)
conf_data.set('SUPERUSER_PASSWD', passwd_list[0])
conf_data.set('REPLICATOR_PASSWD', passwd_list[1])
conf_data.set('REWIND_PASSWD', passwd_list[2])
conf_data.set('ADMIN_PASSWD', passwd_list[3])

configure_file(
        input: 'config.yml.in',
        output: '@BASENAME@',
        configuration: conf_data,
        install_dir: join_paths(sysconfdir, 'patroni')
)
