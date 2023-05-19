class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.145-arm64.tar.gz"
  version "2.0.145"
  sha256 "601bf0699bad0bee5a5062abcf8b96f82af6e30fe84f30b5b8949db9eb47378a"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-macos-macos_arm64" => "husarnet-daemon"
  end

  # def post_install
  #   print "Will attempt to install the service. This requires sudo privileges."
  #   system "sudo", "#{bin}/husarnet", "daemon", "service-install"
  # end

  def caveats
    <<~EOS
      If service installation fails, execute:
        sudo husarnet daemon service-install
      To start husarnet daemon and enable it on startup.
      Enjoy!
    EOS
  end

  service do
    run opt_bin/"husarnet-daemon"
    keep_alive true
    require_root true
    log_path var/"log/husarnet.log"
    error_log_path var/"log/husarnet.err.log"
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
