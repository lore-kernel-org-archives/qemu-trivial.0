Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLrJn-00071G-T1
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 04:43:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLrJl-0006x1-Jr
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 04:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLrJk-0001wB-Lc
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 04:43:49 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:39439
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLrJg-0001pD-6r; Fri, 07 Mar 2014 04:43:44 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 999E717FC70; Fri,  7 Mar 2014 10:43:39 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  7 Mar 2014 10:43:38 +0100
Message-Id: <1394185418-30197-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] configure: Don't use __int128_t for clang
	versions before 3.2
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
X-List-Received-Date: Fri, 07 Mar 2014 09:43:51 -0000

Those versions don't fully support __int128_t.

Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

See http://stackoverflow.com/questions/16447808/bug-with-int128-t-in-clang
for more details. Debian wheezy uses clang 3.0 and shows this bug.

I did not test whether the QEMU code will work nevertheless, but I think
it's better to be on the safe side and disable __int128_t for old clang
versions.

Regards
Stefan

 configure |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure b/configure
index 1212d2d..761a1a4 100755
--- a/configure
+++ b/configure
@@ -3820,6 +3820,11 @@ fi
 
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


