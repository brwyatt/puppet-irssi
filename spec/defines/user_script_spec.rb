require 'spec_helper'

describe 'irssi::user_script' do
  let(:title) { 'script.pl' }
  let(:params) do
    {
      'owner' => 'user',
      'config_dir' => '/test/path'
    }
  end
  let(:pre_condition) do
    'irssi::user_config{ "/test/path": owner => "user" }'
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
