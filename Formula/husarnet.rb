class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.137-arm64.tar.gz"
  version "2.0.137"
  sha256 "7ff2fd0c2dbf3b5d2f2114e013134d02ed862d4825f5328ddcbcc85e06c39db3"
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
