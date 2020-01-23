require 'user_agent'

shared_examples_for 'Pandora' do
  it "should return 'Pandora' as its browser" do
    expect(useragent.browser).to eq('Pandora')
  end
end

describe "Mozilla/5.0 (iPad; CPU OS 10_3_4 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G61 Pandora/1812.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPad; CPU OS 10_3_4 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G61 Pandora/1812.1") }

  it_should_behave_like "Pandora"

  it "should return '1812.1' as its version" do
    expect(useragent.version).to eq('1812.1')
  end

  it "should return 'iPad' as its platform" do
    expect(useragent.platform).to eq('iPad')
  end

  it "should return 'iOS 10.3.4' as its os" do
    expect(useragent.os).to eq('iOS 10.3.4')
  end

  it { expect(useragent).to be_mobile }
end

describe "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Pandora/1901.1.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Pandora/1901.1.1") }

  it_should_behave_like "Pandora"

  it "should return '1901.1.1' as its version" do
    expect(useragent.version).to eq('1901.1.1')
  end

  it "should return 'iPhone' as its platform" do
    expect(useragent.platform).to eq('iPhone')
  end

  it "should return 'iOS 10.3.2' as its os" do
    expect(useragent.os).to eq('iOS 10.3.2')
  end

  it { expect(useragent).to be_mobile }
end

describe "Mozilla/5.0 (iPod touch; CPU iPhone OS 11_2_5 like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) Mobile/15D60 Pandora/1908.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPod touch; CPU iPhone OS 11_2_5 like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) Mobile/15D60 Pandora/1908.1") }

  it_should_behave_like "Pandora"

  it "should return '1908.1' as its version" do
    expect(useragent.version).to eq('1908.1')
  end

  it "should return 'iPod touch' as its platform" do
    expect(useragent.platform).to eq('iPod touch')
  end

  it "should return 'iOS 11.2.5' as its os" do
    expect(useragent.os).to eq('iOS 11.2.5')
  end

  it { expect(useragent).to be_mobile }
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.3" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.3") }

  it_should_behave_like "Pandora"

  it "should return '15.0.3' as its version" do
    expect(useragent.version).to eq('15.0.3')
  end

  it "should return 'Macintosh' as its platform" do
    expect(useragent.platform).to eq('Macintosh')
  end

  it "should return 'OS X 10.10.5' as its os" do
    expect(useragent.os).to eq('OS X 10.10.5')
  end

  it { expect(useragent).not_to be_mobile }
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.2" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.2") }

  it_should_behave_like "Pandora"

  it "should return '15.0.2' as its version" do
    expect(useragent.version).to eq('15.0.2')
  end

  it "should return 'Windows' as its platform" do
    expect(useragent.platform).to eq('Windows')
  end

  it "should return 'Windows 10' as its os" do
    expect(useragent.os).to eq('Windows 10')
  end

  it { expect(useragent).not_to be_mobile }
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) -0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36 PandoraDesktopApp/1.8.4" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) -0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36 PandoraDesktopApp/1.8.4") }

  it_should_behave_like "Pandora"

  it "should return '1.8.4' as its version" do
    expect(useragent.version).to eq('1.8.4')
  end

  it "should return 'Macintosh' as its platform" do
    expect(useragent.platform).to eq('Macintosh')
  end

  it "should return 'OS X 10.10.5' as its os" do
    expect(useragent.os).to eq('OS X 10.10.5')
  end

  it { expect(useragent).not_to be_mobile }
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.106 Electron/4.0.6 Safari/537.36 PandoraDesktopApp/1.8.2" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.106 Electron/4.0.6 Safari/537.36 PandoraDesktopApp/1.8.2") }

  it_should_behave_like "Pandora"

  it "should return '1.8.2' as its version" do
    expect(useragent.version).to eq('1.8.2')
  end

  it "should return 'Windows' as its platform" do
    expect(useragent.platform).to eq('Windows')
  end

  it "should return 'Windows 10' as its os" do
    expect(useragent.os).to eq('Windows 10')
  end

  it { expect(useragent).not_to be_mobile }
end
