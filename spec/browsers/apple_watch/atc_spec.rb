# frozen_string_literal: true

require 'user_agent'

describe UserAgent::Browsers::AppleWatch::ATC do
  let(:user_agent) { UserAgent.parse(ua_string) }

  shared_examples 'an ATC browser on watchOS' do |os_version = nil, version = nil|
    it { expect(user_agent.browser).to eql 'AirTraffic.framework' }
    it { expect(user_agent).not_to be_bot }
    it { expect(user_agent).to be_mobile }
    it { expect(user_agent.os).to eql ['watchOS', os_version].compact.join(' ') }
    it { expect(user_agent.platform).to eql 'Apple Watch' }

    if version
      it { expect(user_agent.version.to_s).to eql version }
    else
      it { expect(user_agent.version).to be_nil }
    end
  end

  context 'with "(null)/(null) watchOS/5.0 model/Watch2 ,7 hwp/t8002 build/16R349 (6; dt:149)"' do
    let(:ua_string) { '(null)/(null) watchOS/5.0 model/Watch2 ,7 hwp/t8002 build/16R349 (6; dt:149)' }

    it_behaves_like 'an ATC browser on watchOS', '5.0', nil
  end

  context 'with "(null)/(null) model/Watch2"' do
    let(:ua_string) { '(null)/(null) model/Watch2' }

    it { expect(user_agent.browser).to eql '(null)' }
    it { expect(user_agent).not_to be_bot }
    it { expect(user_agent).not_to be_mobile }
    it { expect(user_agent.os).to be_nil }
    it { expect(user_agent.platform).to be_nil }
    it { expect(user_agent.version.to_s).to eql '(null)' }
  end

  context 'with "atc/1.0 watchOS/5.0 model/Watch3 ,1 hwp/t8004 build/16R120 (6; dt:153)"' do
    let(:ua_string) { 'atc/1.0 watchOS/4.2 model/Watch3 ,1 hwp/t8004 build/16R120 (6; dt:153)' }

    it_behaves_like 'an ATC browser on watchOS', '4.2', '1.0.16R120'
  end

  context 'with "atc/1.0 watchOS model/Watch3 ,1 hwp/t8004 build/17R90 (6; dt:153)"' do
    let(:ua_string) { 'atc/1.0 watchOS model/Watch3 ,1 hwp/t8004 build/17R90 (6; dt:153)' }

    it_behaves_like 'an ATC browser on watchOS', nil, '1.0.17R90'
  end

  context 'with "atc/1.0 watchOS/6.0 model/Watch3 ,1 hwp/t8004"' do
    let(:ua_string) { 'atc/1.0 watchOS/6.0 model/Watch3 ,1 hwp/t8004' }

    it_behaves_like 'an ATC browser on watchOS', '6.0', '1.0'
  end

  context 'with "atc watchOS"' do
    let(:ua_string) { 'atc watchOS' }

    it_behaves_like 'an ATC browser on watchOS', nil, nil
  end

  context 'with "atc watchOS build/19R150"' do
    let(:ua_string) { 'atc watchOS' }

    it_behaves_like 'an ATC browser on watchOS', nil, nil
  end
end
