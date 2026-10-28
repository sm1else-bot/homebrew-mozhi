class Mozhi < Formula
  desc "Tamil-inspired, verb-final interpreted programming language"
  homepage "https://github.com/sm1else-bot/mozhi"
  version "0.1.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/sm1else-bot/mozhi/releases/download/v0.1.0/mozhi-0.1.0-macos-arm64.tar.gz"
      sha256 "810355f2189aac3da738887fa3642d4100ef557edbaaacfe425f6c92134b9608"
    end
    on_intel do
      url "https://github.com/sm1else-bot/mozhi/releases/download/v0.1.0/mozhi-0.1.0-macos-x64.tar.gz"
      sha256 "8ad9fb36a568aaf3bead593ee3d88da098acfc664a57d039ba4f82d32c17f684"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/sm1else-bot/mozhi/releases/download/v0.1.0/mozhi-0.1.0-linux-x64.tar.gz"
      sha256 "c41939967a45164f712cd6e1de1db8c4732993e10fdc6ae672d425335dbdfd36"
    end
  end
  def install
    bin.install "mozhi"
    pkgshare.install "LICENSE", "LICENSES", "build-info.json"
  end
  test do
    assert_match "Mozhi #{version}", shell_output("#{bin}/mozhi --version")
    (testpath/"hello.mozhi").write("\"Vanakkam!\" sollu\n")
    assert_equal "Vanakkam!\n", shell_output("#{bin}/mozhi run #{testpath}/hello.mozhi")
    assert_match "syntax OK", shell_output("#{bin}/mozhi check #{testpath}/hello.mozhi")
    assert_match "6", pipe_output("#{bin}/mozhi repl", "n = 6 vechukko\nn\nquit\n", 0)
  end
end
