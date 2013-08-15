require 'spec_helper'

describe 'ganglia', :type => :class do
  before(:each) do
    sub_const('rrd', double('Test double for rrd'))
  end
  context 'on a Debian OS' do
    let :facts do
      {
        :osfamily               => 'Debian',
      }
    end
    it {should include_class('ganglia::params')}
    it {should_not include_class('rrd')}
    it {should_not contain_package('librrd4')}
    describe 'with manage_rrd => package' do
      let :params do
        { :manage_rrd => 'package'}
      end
      it {should_not include_class('rrd')}
      it {should contain_package('librrd4')}
    end
    describe 'with manage_rrd => module' do
      let :params do
        { :manage_rrd => 'module'}
      end
      it {should include_class('rrd')}
      it {should_not contain_package('librrd4')}
    end
    describe 'with manage_rrd => require' do
      let :params do
        { :manage_rrd => 'require'}
      end
      it {should include_class('rrd')}
      it {should_not contain_package('librrd4')}
    end
  end
  context 'on a RedHat OS' do
    let :facts do
      {
        :osfamily               => 'RedHat',
      }
    end
    it {should include_class('ganglia::params')}
    it {should_not include_class('rrd')}
    it {should_not contain_package('rrdtool')}
    describe 'with manage_rrd => package' do
      let :params do
        { :manage_rrd => 'package'}
      end
      it {should_not include_class('rrd')}
      it {should contain_package('rrdtool')}
    end
    describe 'with manage_rrd => module' do
      let :params do
        { :manage_rrd => 'module'}
      end
      it {should include_class('rrd')}
      it {should_not contain_package('rrdtool')}
    end
    describe 'with manage_rrd => require' do
      let :params do
        { :manage_rrd => 'require'}
      end
      it {should include_class('rrd')}
      it {should_not contain_package('rrdtool')}
    end
  end
end