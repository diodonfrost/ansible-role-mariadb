# Mariadb  configuration tests

mariadb_service = 'mariadb'
mariadb_service = 'mysql' if os.name == 'centos' or  os.name == 'redhat' && os[:release].to_i <= 6
mariadb_service = 'mysql' if os.family == 'debian' && os[:release].to_i <= 14
mariadb_service = 'mariadb' if os.name == 'Amazon Linux' && os[:release].to_i >= 2

control 'config-01' do
  impact 1.0
  title 'Mariadb port'
  desc 'Mariadb should be listenning on 3306 port'
  describe port(3306) do
    it { should be_listening }
    its('processes') {should include 'mysqld'}
  end
end
