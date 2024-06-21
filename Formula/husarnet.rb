class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/macos/arm64/husarnet-2.0.246-arm64.tgz"
  version "2.0.246"
  sha256 "b183d94bed3aaf88fd4a59481554a55952fa4b723c3138a5a16bf4e28eda2301"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-macos-macos_arm64" => "husarnet-daemon"
  end

  def caveats
    <<~CAVEATS
      Husarnet daemon requires root privileges to run. To install it as a service execute:
        sudo husarnet daemon service-install
      This will start husarnet daemon and enable it on OS startup.
      Enjoy!
    CAVEATS
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
