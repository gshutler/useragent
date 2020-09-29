# frozen_string_literal: true

require 'user_agent'

describe UserAgent::Browsers::AppleWatch::Pod2Watch do
  let(:user_agent) { UserAgent.parse(ua_string) }

  shared_examples 'a Pod2Watch browser on watchOS' do |os_version = nil, version = nil|
    it { expect(user_agent.browser).to eql 'Pod2Watch' }
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

  context 'with "Pod2Watch"' do
    let(:ua_string) { 'Pod2Watch' }

    it_behaves_like 'a Pod2Watch browser on watchOS', nil, nil
  end

  context 'with "Pod2Watch WatchKit Extension/2.0 (com.hollingsware.Pod2Watch.watchkitapp.watchkitextension; build:9; watchOS 4.0.0) Alamofire/4.5.1"' do
    let(:ua_string) { 'Pod2Watch WatchKit Extension/2.0 (com.hollingsware.Pod2Watch.watchkitapp.watchkitextension; build:9; watchOS 4.0.0) Alamofire/4.5.1' }

    it_behaves_like 'a Pod2Watch browser on watchOS', '4.0.0', '2.0'
  end

  context 'with a watchOS product but no version' do
    let(:ua_string) { 'Pod2Watch%20WatchKit%20Extension fancy/2.1 (build:9; watchOS) Alamofire/4.5.1' }

    it_behaves_like 'a Pod2Watch browser on watchOS', nil, '2.1'
  end

  context 'with "Pod2Watch%20WatchKit%20Extension/14 CFNetwork/889.7 Darwin/17.2.0"' do
    let(:ua_string) { 'Pod2Watch%20WatchKit%20Extension/14 CFNetwork/889.7 Darwin/17.2.0' }

    it_behaves_like 'a Pod2Watch browser on watchOS', '4.1', '14'
  end

  context 'with an unmappable Darwin version' do
    let(:ua_string) { 'Pod2Watch%20WatchKit%20Extension/14 CFNetwork/889.7 Darwin/0.1.2' }

    it_behaves_like 'a Pod2Watch browser on watchOS', nil, '14'
  end

  context 'with a version on a subsequent product' do
    let(:ua_string) { 'Pod2Watch%20WatchKit%20Extension CFNetwork/889.7 Darwin/18.0.0' }

    it_behaves_like 'a Pod2Watch browser on watchOS', '5.0.x', '889.7'
  end
end
