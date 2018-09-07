# Mariadb  install

control 'install-01' do
  impact 1.0
  title 'Mariadb install'
  desc 'Mariadb should be installed'
  describe package('mariadb-server') do
    it { should be_installed }
  end
end
