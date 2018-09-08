# Mariadb  install

mariadb_package = 'mariadb-server'
mariadb_package = 'MariaDB-server' if os.family ==  'redhat'
mariadb_package = 'MariaDB-server' if os.name ==  'fedora'

control 'install-01' do
  impact 1.0
  title 'Mariadb install'
  desc 'Mariadb should be installed'
  describe package(mariadb_package) do
    it { should be_installed }
  end
end
