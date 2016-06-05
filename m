Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Sqa-0001QI-C8
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:51:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqY-0001NZ-6U
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqX-0005ZV-DB
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SqK-0005Wv-PQ; Sun, 05 Jun 2016 03:51:32 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6601A40911;
	Sun,  5 Jun 2016 10:51:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D6E84B0C;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1140 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Steven Luo <steven+qemu@steven676.net>, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:02 +0300
Message-Id: <9107c19122dfafd151a8e6da5a545b43f3cc5264.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 25/52] Fix configure test for PBKDF2 in nettle
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 07:51:47 -0000

From: Steven Luo <steven+qemu@steven676.net>

On my Debian jessie system, including nettle/pbkdf2.h does not cause
NULL to be defined, which causes the test to fail to compile.  Include
stddef.h to bring in a definition of NULL.

Cc: qemu-trivial@nongnu.org
Cc: qemu-stable@nongnu.org
Signed-off-by: Steven Luo <steven+qemu@steven676.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index f37909d..fd71618 100755
--- a/configure
+++ b/configure
@@ -2343,6 +2343,7 @@ if test "$nettle" != "no"; then
         nettle="yes"
 
         cat > $TMPC << EOF
+#include <stddef.h>
 #include <nettle/pbkdf2.h>
 int main(void) {
      pbkdf2_hmac_sha256(8, NULL, 1000, 8, NULL, 8, NULL);
-- 
2.1.4


