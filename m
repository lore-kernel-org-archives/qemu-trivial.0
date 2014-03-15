Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlSP-0004br-R4
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 06:04:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlSJ-0004RD-T9
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlSF-0007El-MA
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlRu-00076M-EX; Sat, 15 Mar 2014 06:04:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0751141D9B;
	Sat, 15 Mar 2014 14:04:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4DCAD66D;
	Sat, 15 Mar 2014 13:57:05 +0400 (MSK)
Received: (nullmailer pid 20029 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:57 +0400
Message-Id: <1394877419-19949-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PULL 11/13] configure: Don't use __int128_t for
	clang versions before 3.2
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Mar 2014 10:04:44 -0000

From: Stefan Weil <sw@weilnetz.de>

Those versions don't fully support __int128_t.

Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure b/configure
index 8c2838e..2bc6b77 100755
--- a/configure
+++ b/configure
@@ -3822,6 +3822,11 @@ fi
 
 int128=no
 cat > $TMPC << EOF
+#if defined(__clang_major__) && defined(__clang_minor__)
+# if ((__clang_major__ < 3) || (__clang_major__ == 3) && (__clang_minor__ < 2))
+#  error __int128_t does not work in CLANG before 3.2
+# endif
+#endif
 __int128_t a;
 __uint128_t b;
 int main (void) {
-- 
1.7.10.4


