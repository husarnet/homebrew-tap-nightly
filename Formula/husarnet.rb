class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.140-arm64.tar.gz"
  version "2.0.140"
  sha256 "54d567451a037a42f4fb779e79cbd268d6cb288db6296619f224563daf556a1d"
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
