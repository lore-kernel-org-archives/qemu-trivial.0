Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6HET-0007M2-AH
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 03:28:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R6HEQ-0007Lw-VS
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 03:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R6HEP-0002aC-P0
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 03:28:34 -0400
Received: from david.siemens.de ([192.35.17.14]:31539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1R6HEP-0002a1-B1; Wed, 21 Sep 2011 03:28:33 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id p8L7SWXr009737;
	Wed, 21 Sep 2011 09:28:32 +0200
Received: from mchn199C.mchp.siemens.de ([139.22.37.23])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p8L7SVst009775;
	Wed, 21 Sep 2011 09:28:31 +0200
Message-ID: <4E79921F.5080605@siemens.com>
Date: Wed, 21 Sep 2011 09:28:31 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Abort on thread layer errors
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
X-List-Received-Date: Wed, 21 Sep 2011 07:28:36 -0000

Makes it easier to catch the bug in gdb as there is no need to set an
explicit breakpoint.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 qemu-thread-posix.c |    2 +-
 qemu-thread-win32.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-thread-posix.c b/qemu-thread-posix.c
index 2bd02ef..ac3c0c9 100644
--- a/qemu-thread-posix.c
+++ b/qemu-thread-posix.c
@@ -22,7 +22,7 @@
 static void error_exit(int err, const char *msg)
 {
     fprintf(stderr, "qemu: %s: %s\n", msg, strerror(err));
-    exit(1);
+    abort();
 }
 
 void qemu_mutex_init(QemuMutex *mutex)
diff --git a/qemu-thread-win32.c b/qemu-thread-win32.c
index a27332e..db8e744 100644
--- a/qemu-thread-win32.c
+++ b/qemu-thread-win32.c
@@ -24,7 +24,7 @@ static void error_exit(int err, const char *msg)
                   NULL, err, 0, (LPTSTR)&pstr, 2, NULL);
     fprintf(stderr, "qemu: %s: %s\n", msg, pstr);
     LocalFree(pstr);
-    exit(1);
+    abort();
 }
 
 void qemu_mutex_init(QemuMutex *mutex)
-- 
1.7.3.4

