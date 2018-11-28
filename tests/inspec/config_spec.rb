# Mariadb  configuration tests

mariadb_process = 'mysqld'
mariadb_process = '/var/run/mysql/mysql.sock' if os.name == 'openbsd'

control 'config-01' do
  impact 1.0
  title 'Mariadb port'
  desc 'Mariadb should be listenning on 3306 port'
  describe port(3306) do
    it { should be_listening }
    its('processes') {should include mariadb_process}
  end
end
