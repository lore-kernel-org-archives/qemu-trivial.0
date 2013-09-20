Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4LH-0007XL-7A
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:18:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4LA-0007Jl-9z
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L5-0006CW-Qf
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4Ky-00067Z-TH; Fri, 20 Sep 2013 13:17:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DA264419CC;
	Fri, 20 Sep 2013 21:17:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 60E0F517;
	Fri, 20 Sep 2013 20:58:22 +0400 (MSK)
Received: (nullmailer pid 32192 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:13 +0400
Message-Id: <1379696296-32105-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PULL 14/17] tcg-sparc: Fix parenthesis warning
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
X-List-Received-Date: Fri, 20 Sep 2013 17:18:05 -0000

From: Richard Henderson <rth@twiddle.net>

error: suggest parentheses around comparison in operand of =E2=80=98&=E2=80=
=99 [-Werror=3Dparentheses]

Signed-off-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/sparc/tcg-target.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 2edf858..1ff2922 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -153,7 +153,7 @@ typedef enum {
 static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 {
     uintptr_t p;
-    for (p =3D start & -8; p < (stop + 7) & -8; p +=3D 8) {
+    for (p =3D start & -8; p < ((stop + 7) & -8); p +=3D 8) {
         __asm__ __volatile__("flush\t%0" : : "r" (p));
     }
 }
--=20
1.7.10.4


