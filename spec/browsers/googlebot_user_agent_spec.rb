require 'user_agent'

shared_examples_for 'Googlebot' do
  it "returns 'Googlebot' as its browser" do
    expect(useragent.browser).to eq('Googlebot')
  end

  it { expect(useragent.platform).to be nil }
  it { expect(useragent.os).to be nil }
  it { expect(useragent).to be_bot }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_speaker }
end

describe "UserAgent: Googlebot" do
  let!(:useragent) { UserAgent.parse("Googlebot") }

  it_should_behave_like 'Googlebot'
end

describe "UserAgent: Googlebot/2.1" do
  let!(:useragent) { UserAgent.parse("Googlebot/2.1") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot/2.1 (http://www.googlebot.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Googlebot/2.1 (http://www.googlebot.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot/2.1 ( http://www.googlebot.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Googlebot/2.1 ( http://www.googlebot.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot/2.1 (+http://www.googlebot.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Googlebot/2.1 (+http://www.googlebot.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot/2.1 (+http://www.google.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Googlebot/2.1 (+http://www.google.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Mozilla/5.0 (compatible; Googlebot/2.1;++http://www.google.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (compatible; Googlebot/2.1;++http://www.google.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Mozilla/5.0 (compatible; Googlebot/2.1;  http://www.google.com/bot.html)" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (compatible; Googlebot/2.1;  http://www.google.com/bot.html)") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Safari/537.36") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/91.0.4472.90 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/91.0.4472.90 Safari/537.36") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot-Audio" do
  let!(:useragent) { UserAgent.parse("Googlebot-Audio") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot-Image/1.0" do
  let!(:useragent) { UserAgent.parse("Googlebot-Image/1.0") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot-News" do
  let!(:useragent) { UserAgent.parse("Googlebot-News") }

  it_behaves_like 'Googlebot'
end

describe "UserAgent: Googlebot-Video/1.0" do
  let!(:useragent) { UserAgent.parse("Googlebot-Video/1.0") }

  it_behaves_like 'Googlebot'
end
