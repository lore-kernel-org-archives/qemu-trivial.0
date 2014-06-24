Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTbJ-0000S2-Ru
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:29:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTbB-0000BZ-Po
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTb7-0006gS-LB
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:29:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTav-0006Xe-KW; Tue, 24 Jun 2014 12:29:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 94AF044085;
	Tue, 24 Jun 2014 20:29:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id ED51A674;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15617 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:10 +0400
Message-Id: <1403626160-15546-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/14] target-ppc: Fix compiler warning
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
X-List-Received-Date: Tue, 24 Jun 2014 16:29:39 -0000

From: Stefan Weil <sw@weilnetz.de>

gcc reports a warning which is usually wrong:

target-ppc/dfp_helper.c: In function =E2=80=98dfp_get_digit=E2=80=99:
target-ppc/dfp_helper.c:417:1: warning:
 control reaches end of non-void function [-Wreturn-type]

The compiler shows the warning if assert is not marked with the noreturn
attribute or if the code is compiled with -DNDEBUG.

Using g_assert_not_reached better documents the intention and does not
have these problems.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alexander Graf <agraf@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-ppc/dfp_helper.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-ppc/dfp_helper.c b/target-ppc/dfp_helper.c
index 773803a..49820bf 100644
--- a/target-ppc/dfp_helper.c
+++ b/target-ppc/dfp_helper.c
@@ -411,9 +411,8 @@ static inline int dfp_get_digit(decNumber *dn, int n)
         return (dn->lsu[unit] / 10) % 10;
     case 2:
         return dn->lsu[unit] / 100;
-    default:
-        assert(0);
     }
+    g_assert_not_reached();
 }
=20
 #define DFP_HELPER_TAB(op, dnop, postprocs, size)                       =
       \
--=20
1.7.10.4


