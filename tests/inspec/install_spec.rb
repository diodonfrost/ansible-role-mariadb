# Mariadb  install

mariadb_package = 'mariadb-server'
mariadb_package = 'MariaDB-server' if os.family == 'redhat' && os[:release].to_i >= 6
mariadb_package = 'MariaDB-server' if os.name == 'fedora' && os[:release].to_i >= 27
mariadb_package = 'MariaDB-server' if os.family == 'suse'

mariadb_service = 'mariadb'
mariadb_service = 'mysql' if os.family == 'redhat' && os[:release].to_i <= 6
mariadb_service = 'mysql' if os.family == 'debian' && os[:release].to_i <= 14

control 'install-01' do
  impact 1.0
  title 'Mariadb install'
  desc 'Mariadb should be installed'
  describe package(mariadb_package) do
    it { should be_installed }
  end
end

control 'install-02' do
  impact 1.0
  title 'Mariadb service'
  desc 'Mariadb should be running and enabled'
  describe service(mariadb_service) do
    it { should be_enabled }
    it { should be_running }
  end
end
