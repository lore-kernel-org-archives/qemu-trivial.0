Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktwh-0005xa-2u
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:07:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktwb-0005me-0A
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktwa-0004hJ-1v
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktwL-0004em-Mz; Sun, 02 Nov 2014 07:07:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 075E9402C0;
	Sun,  2 Nov 2014 15:07:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 791F26FC;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14966 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:20 +0300
Message-Id: <2fd7ae36c5403b14e9c676627a1a0dd2b76b9e1b.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/23] Revert "os-posix: report error message
	when lock file failed"
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
X-List-Received-Date: Sun, 02 Nov 2014 12:07:42 -0000

This reverts commit e5048d15ce6addae869f23514b2a1f0d4466418a.

qemu_create_pidfile() is only created from main(), and there,
if that function returns failure, os_pidfile_error() function
is called, to, guess that, report error (which is done differently
whenever we're daemonizing or not).

qemu_create_pidfile() function has several error returns, this
lockf() failure is one of them, there are others (another shown
in the patch context too).

So this patch makes whole thing inconsistent at least.

If we need to show error message when we're daemonizing, it
looks like we should modify os_pidfile_error() routine to always
report error and only after that check for daemon mode.  This way
all errors will be reported the same way.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 os-posix.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 4898ebf..e31a099 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -319,8 +319,6 @@ int qemu_create_pidfile(const char *filename)
         return -1;
     }
     if (lockf(fd, F_TLOCK, 0) == -1) {
-        fprintf(stderr, "lock file '%s' failed: %s\n",
-                filename, strerror(errno));
         close(fd);
         return -1;
     }
-- 
1.7.10.4


