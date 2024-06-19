class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/macos/arm64/husarnet-2.0.243-arm64.tgz"
  version "2.0.243"
  sha256 "2ca5d278411d92b66fa41d041920c7243c6636634dfafe80afe923ccbb78309e"
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
