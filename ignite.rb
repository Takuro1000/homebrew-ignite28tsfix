class Ignite < Formula
  desc "Takuro1000 ignite ts test"
  homepage "https://github.com/Takuro1000/ignite28tsfix"
  url "https://github.com/Takuro1000/ignite28tsfix/archive/refs/tags/v0.27.2.tar.gz" # 最新のバージョンを指定
  sha256 "5b8807d37740fc696a5b60a05f680f889172f8143344a22a0becf587d1cc2779" # 正しいSHA256ハッシュを指定

  depends_on "go"   # Goの依存関係
  depends_on "node" # Node.jsの依存関係

  def install
    system "go", "build", "-mod=readonly", *std_go_args(output: bin/"ignite"), "./ignite/cmd/ignite"
  end

  test do
    ENV["DO_NOT_TRACK"] = "1"
    system bin/"ignite", "s", "chain", "mars"
    assert_predicate testpath/"mars/go.mod", :exist?
  end
end
