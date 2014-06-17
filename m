Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wwx1s-0006eF-AY
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jun 2014 13:18:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wwx1q-0006bz-9M
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 13:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wwx1p-0004ZZ-D1
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 13:18:38 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:43887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Wwx1k-0004Ma-T1; Tue, 17 Jun 2014 13:18:33 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 8C62217F88A; Tue, 17 Jun 2014 19:18:29 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 17 Jun 2014 19:18:28 +0200
Message-Id: <1403025508-19171-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] target-ppc: Fix compiler warning
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
X-List-Received-Date: Tue, 17 Jun 2014 17:18:39 -0000

gcc reports a warning which is usually wrong:

target-ppc/dfp_helper.c: In function =E2=80=98dfp_get_digit=E2=80=99:
target-ppc/dfp_helper.c:417:1: warning:
 control reaches end of non-void function [-Wreturn-type]

The compiler shows the warning if assert is not marked with the noreturn
attribute or if the code is compiled with -DNDEBUG.

Using g_assert_not_reached better documents the intention and does not
have these problems.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


