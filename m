Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XK7Pl-0008H5-Lf
	for mharc-qemu-trivial@gnu.org; Wed, 20 Aug 2014 11:03:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XK7Pg-0008B7-Ga
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 11:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XK7PY-0007P9-UT
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 11:03:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XK7PM-0007NL-78; Wed, 20 Aug 2014 11:02:40 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 99B4543FCB;
	Wed, 20 Aug 2014 19:02:39 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4C48C6E0;
	Wed, 20 Aug 2014 19:02:39 +0400 (MSK)
Received: (nullmailer pid 10112 invoked by uid 1000);
	Wed, 20 Aug 2014 15:02:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 20 Aug 2014 19:02:38 +0400
Message-Id: <1408546958-10074-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
	stefanha@redhat.com, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2] block/vvfat.c: remove debugging code to
	reinit stderr if NULL
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
X-List-Received-Date: Wed, 20 Aug 2014 15:03:05 -0000

Just log to stderr unconditionally, like other similar code does.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 block/vvfat.c |    9 ---------
 1 file changed, 9 deletions(-)

v2: also remove stderr redefinition

diff --git a/block/vvfat.c b/block/vvfat.c
index 70176b1..1c270b2 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -52,10 +52,6 @@
 
 #define DLOG(a) a
 
-#undef stderr
-#define stderr STDERR
-FILE* stderr = NULL;
-
 static void checkpoint(void);
 
 #ifdef __MINGW32__
@@ -1082,11 +1078,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
     vvv = s;
 #endif
 
-DLOG(if (stderr == NULL) {
-    stderr = fopen("vvfat.log", "a");
-    setbuf(stderr, NULL);
-})
-
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     qemu_opts_absorb_qdict(opts, options, &local_err);
     if (local_err) {
-- 
1.7.10.4


