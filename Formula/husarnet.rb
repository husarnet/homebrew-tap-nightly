class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.143-arm64.tar.gz"
  version "2.0.143"
  sha256 "f8b80b74102f020f0c9870b98891e0119ce5f58ace9c7160f731240c170b4f8c"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-unix-macos_arm64" => "husarnet-daemon"
  end

  def post_install
    print "Will attempt to install the service. This requires sudo privileges."
    system "sudo", "#{bin}/husarnet", "daemon", "service-install"
  end

  def caveats
    <<~EOS
      If service installation fails, execute:
        sudo husarnet daemon service-install
      To start husarnet daemon and enable it on startup.
      Enjoy!
    EOS
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
