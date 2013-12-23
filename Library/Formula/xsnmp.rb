require 'formula'

class Xsnmp < Formula
  homepage 'https://github.com/gjasny/Xsnmp'
  url 'https://github.com/gjasny/Xsnmp/archive/v1.2.1.tar.gz'
  sha1 '5dc4b3267bc55341e5085b62fc14af2056ef966c'

  head do
    url 'https://github.com/gjasny/Xsnmp.git'

  end

  depends_on :autoconf => :build
  depends_on :automake => :build
  depends_on 'net-snmp'
  depends_on 'pcre'

  def install
    system "autoreconf -f -i"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    (share/"snmp/mibs").install "mib/XSNMP-MIB.txt"
  end
end
