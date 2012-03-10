Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S6Smm-0002ZL-Rz
	for mharc-qemu-trivial@gnu.org; Sat, 10 Mar 2012 15:21:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S6Smk-0002S3-5j
	for qemu-trivial@nongnu.org; Sat, 10 Mar 2012 15:21:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S6Smi-0003lh-GW
	for qemu-trivial@nongnu.org; Sat, 10 Mar 2012 15:21:01 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S6Smf-0003l7-4J; Sat, 10 Mar 2012 15:20:57 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D2605728009F; Sat, 10 Mar 2012 21:20:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id oBrURM9srSIn; Sat, 10 Mar 2012 21:20:54 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 13FBF72800A1; Sat, 10 Mar 2012 21:20:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Mar 2012 21:20:53 +0100
Message-Id: <1331410853-23217-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [Qemu-trivial] [PATCH] slirp: Fix compiler warning for w64
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
X-List-Received-Date: Sat, 10 Mar 2012 20:21:03 -0000

Casting a pointer to an integer value must use uintptr_t or intptr_t
(not long) for portable code. MinGW-w64 requires this because
sizeof(long) != sizeof(void *) for w64 hosts, so casting to long
raises a compiler warning.

I use uintptr_t instead of intptr_t because changing the sign does not
matter here and casting pointers to unsigned values seems more
reasonable (the unsigned value is a non negative offset.

Cc: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 slirp/cksum.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/slirp/cksum.c b/slirp/cksum.c
index e43867d..6328660 100644
--- a/slirp/cksum.c
+++ b/slirp/cksum.c
@@ -75,7 +75,7 @@ int cksum(struct mbuf *m, int len)
 	/*
 	 * Force to even boundary.
 	 */
-	if ((1 & (long) w) && (mlen > 0)) {
+	if ((1 & (uintptr_t)w) && (mlen > 0)) {
 		REDUCE;
 		sum <<= 8;
 		s_util.c[0] = *(uint8_t *)w;
-- 
1.7.9


