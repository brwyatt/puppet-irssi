require 'spec_helper'

describe 'irssi::user_config' do
  let(:title) { '/test/path' }
  let(:params) do
    {
      'owner' => 'user',
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
