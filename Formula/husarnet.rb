class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.152-arm64.tar.gz"
  version "2.0.152"
  sha256 "f24bb3d3ced372e6265946eb8424c10494ae929a66d1d2a16d2aae5aa012a9f6"
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
