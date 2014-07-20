describe "UserAgent: 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
  end

  it { expect(@useragent).to be_bot }
end

describe "UserAgent: 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)")
  end

  it { expect(@useragent).to be_bot }
end

describe "UserAgent: 'Twitterbot/1.0'" do
  before do
    @useragent = UserAgent.parse("Twitterbot/1.0")
  end

  it { expect(@useragent).to be_bot}
end
