require 'spec_helper'
describe 'thruk' do

  context 'with defaults for all parameters' do
    it { should contain_class('thruk') }
  end
end
