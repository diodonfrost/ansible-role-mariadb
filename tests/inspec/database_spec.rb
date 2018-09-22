# Mariadb  database tests

control 'database-01' do
  impact 1.0
  title 'Database connexion'
  desc 'Connexion to Mariadb should be functional'
  describe mysql_session('root').query('show databases;') do
    its('exit_status') { should eq(0) }
  end
end

control 'database-02' do
  impact 1.0
  title 'Display database test'
  desc 'Mariadb database test should be exist'
  describe mysql_session('root').query('show databases like "mysql";') do
    its('stdout') { should match(/mysql/) }
  end
end

control 'database-03' do
  impact 1.0
  title 'Test for user creation'
  desc 'Mariadb database query user creation should  be functional'
  describe mysql_session('root').query('create user "myuser" identified by "secret";') do
    its('exit_status') { should eq(0) }
  end
end

control 'database-04' do
  impact 1.0
  title 'Test for a successful query'
  desc 'Mariadb database query should  be functional'
  describe mysql_session('root').query('show tables in mysql;') do
    its('exit_status') { should eq(0) }
  end
end

control 'database-05' do
  impact 1.0
  title 'Test for a faiing query'
  desc 'Mariadb database query should not be functional'
  describe mysql_session('root').query('show tables in non_existent_database;') do
    its('exit_status') { should_not eq(0) }
  end
end
