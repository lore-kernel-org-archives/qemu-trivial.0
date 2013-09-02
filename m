Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGS2s-0001DA-R4
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:11:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2l-0000x0-GO
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2g-00008i-JA
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGS2V-0008Vg-1x; Mon, 02 Sep 2013 07:11:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1A6F640229;
	Mon,  2 Sep 2013 15:11:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D5EF2212;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: (nullmailer pid 14645 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:30 +0400
Message-Id: <1378119695-14568-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Antony Pavlov <antonynpavlov@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/15] pflash_cfi02.c: fix debug macro
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
X-List-Received-Date: Mon, 02 Sep 2013 11:11:44 -0000

From: Antony Pavlov <antonynpavlov@gmail.com>

If PFLASH_DEBUG is enabled then we have some build errors:

hw/block/pflash_cfi02.c: In function =E2=80=98pflash_timer=E2=80=99:
hw/block/pflash_cfi02.c:128:5: error: expected =E2=80=98)=E2=80=99 before=
 string constant
hw/block/pflash_cfi02.c:128:5: error: too few arguments to function =E2=80=
=98fprintf=E2=80=99

This patch fixes the problem.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/pflash_cfi02.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 99445b0..8d4b828 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -47,7 +47,7 @@
 #ifdef PFLASH_DEBUG
 #define DPRINTF(fmt, ...)                                  \
 do {                                                       \
-    fprintf(stderr "PFLASH: " fmt , ## __VA_ARGS__);       \
+    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
 } while (0)
 #else
 #define DPRINTF(fmt, ...) do { } while (0)
--=20
1.7.10.4


