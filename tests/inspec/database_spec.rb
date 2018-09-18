# Mariadb  database tests

control 'database-01' do
  impact 1.0
  title 'Database connexion'
  desc 'Connexion to Mariadb should be functional'
  describe mysql_session('root').query('show databases;') do
    its('exit_status') { should eq(0) }
  end
end
