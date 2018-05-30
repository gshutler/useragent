require 'user_agent'

shared_examples 'Stagefright' do
  it "returns 'Stagefright' as its browser" do
    expect(useragent.browser).to eq('Stagefright')
  end
end

shared_examples 'Stagefright/Beyonce' do
  it "returns 'Stagefright/Beyonce' as its browser" do
    expect(useragent.browser).to eq('Stagefright/Beyonce')
  end
end

shared_examples 'NexPlayer' do
  it "returns 'NexPlayer' as its browser" do
    expect(useragent.browser).to eq('NexPlayer')
  end
end

shared_examples 'LG Player' do
  it "returns 'LG Player' as its browser" do
    expect(useragent.browser).to eq('LG Player')
  end
end

describe "UserAgent: stagefright/1.2 (Linux;Android 5.0.1)" do
  let!(:useragent) { UserAgent.parse("stagefright/1.2 (Linux;Android 5.0.1)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.0.1' as its operating system" do
    expect(useragent.os).to eq('Android 5.0.1')
  end
end

describe "UserAgent: SonyD5803 Build/23.0.1.A.5.77 stagefright/1.2 (Linux;Android 4.4.4)" do
  let!(:useragent) { UserAgent.parse("SonyD5803 Build/23.0.1.A.5.77 stagefright/1.2 (Linux;Android 4.4.4)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 4.4.4' as its operating system" do
    expect(useragent.os).to eq('Android 4.4.4')
  end
end

describe "UserAgent: Samsung SAMSUNG-SGH-I747 stagefright/1.2 (Linux;Android 4.4.2)" do
  let!(:useragent) { UserAgent.parse("Samsung SAMSUNG-SGH-I747 stagefright/1.2 (Linux;Android 4.4.2)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 4.4.2' as its operating system" do
    expect(useragent.os).to eq('Android 4.4.2')
  end
end

describe "UserAgent: Samsung SM-G900T stagefright/Beyonce/1.1.9 (Linux;Android 5.1.1)" do
  let!(:useragent) { UserAgent.parse("Samsung SM-G900T stagefright/Beyonce/1.1.9 (Linux;Android 5.1.1)") }

  it_behaves_like 'Stagefright/Beyonce'

  it "returns '1.1.9' as its version" do
    expect(useragent.version).to eq('1.1.9')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.1.1' as its operating system" do
    expect(useragent.os).to eq('Android 5.1.1')
  end
end

describe "UserAgent: AlcatelOneTouch-Alcatel_5044R-SVN/02; stagefright/1.2 (Linux;Android 7.0)" do
  let!(:useragent) { UserAgent.parse("AlcatelOneTouch-Alcatel_5044R-SVN/02; stagefright/1.2 (Linux;Android 7.0)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 7.0' as its operating system" do
    expect(useragent.os).to eq('Android 7.0')
  end
end

describe "UserAgent: BLADE L111-stagefright/1.2 (Linux;Android 5.1)" do
  let!(:useragent) { UserAgent.parse("BLADE L111-stagefright/1.2 (Linux;Android 5.1)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.1' as its operating system" do
    expect(useragent.os).to eq('Android 5.1')
  end
end

describe "UserAgent: Fire OS/5.1.1 stagefright/1.2 (Linux;Android 5.1.1) ,Dalvik/2.1.0 (Linux; U; Android 5.1.1; KFFOWI Build/LMY47O)" do
  let!(:useragent) { UserAgent.parse("Fire OS/5.1.1 stagefright/1.2 (Linux;Android 5.1.1) ,Dalvik/2.1.0 (Linux; U; Android 5.1.1; KFFOWI Build/LMY47O)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.1.1' as its operating system" do
    expect(useragent.os).to eq('Android 5.1.1')
  end
end

describe "UserAgent: Fire OS/6.0 stagefright/1.2 (Linux;Android 7.1.2)" do
  let!(:useragent) { UserAgent.parse("Fire OS/6.0 stagefright/1.2 (Linux;Android 7.1.2)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 7.1.2' as its operating system" do
    expect(useragent.os).to eq('Android 7.1.2')
  end
end

describe "UserAgent: stagefright/1.2 (Linux;Android 5.0 Huawei HUAWEI GRA-L09 GRA-L09V100R001C150B134)" do
  let!(:useragent) { UserAgent.parse("stagefright/1.2 (Linux;Android 5.0 Huawei HUAWEI GRA-L09 GRA-L09V100R001C150B134)") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.0' as its operating system" do
    expect(useragent.os).to eq('Android 5.0')
  end
end

describe "UserAgent: stagefright/1.2 (Linux;Android 4.0.3) Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10" do
  let!(:useragent) { UserAgent.parse("stagefright/1.2 (Linux;Android 4.0.3) Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10") }

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 4.0.3' as its operating system" do
    expect(useragent.os).to eq('Android 4.0.3')
  end
end

describe "UserAgent: LG-E615f/LG-E615f-V10p-SEP-02-2013 Player/NexPlayer 4.0 for Android (stagefright alternative) ,Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("LG-E615f/LG-E615f-V10p-SEP-02-2013 Player/NexPlayer 4.0 for Android (stagefright alternative) ,Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36") }

  it_behaves_like 'NexPlayer'

  it "returns '4.0' as its version" do
    expect(useragent.version).to eq('4.0')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end
end

describe "UserAgent: LG-D802/Desperate Rom LP UX4 V4 Player/LG Player 1.0 for Android 5.0.2 (stagefright alternative)" do
  let!(:useragent) { UserAgent.parse("LG-D802/Desperate Rom LP UX4 V4 Player/LG Player 1.0 for Android 5.0.2 (stagefright alternative)") }

  it_behaves_like 'LG Player'

  it "returns '1.0' as its version" do
    expect(useragent.version).to eq('1.0')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.0.2' as its operating system" do
    expect(useragent.os).to eq('Android 5.0.2')
  end
end

describe "UserAgent: LG-H873/V15c Player/LG Player 1.0 for Android 7.0 (stagefright alternative)" do
  let!(:useragent) { UserAgent.parse("LG-H873/V15c Player/LG Player 1.0 for Android 7.0 (stagefright alternative)") }

  it_behaves_like 'LG Player'

  it "returns '1.0' as its version" do
    expect(useragent.version).to eq('1.0')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 7.0' as its operating system" do
    expect(useragent.os).to eq('Android 7.0')
  end
end

describe "UserAgent: LG-H955/V15c Player/LG Player 1.0 for Android 5.1.1 (stagefright alternative) BMID/E67AB269FB" do
  let!(:useragent) { UserAgent.parse("LG-H955/V15c Player/LG Player 1.0 for Android 5.1.1 (stagefright alternative) BMID/E67AB269FB") }

  it_behaves_like 'LG Player'

  it "returns '1.0' as its version" do
    expect(useragent.version).to eq('1.0')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.1.1' as its operating system" do
    expect(useragent.os).to eq('Android 5.1.1')
  end
end
