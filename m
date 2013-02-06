Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U35oq-0006je-Up
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2013 09:17:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U35on-0006Yx-C1
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 09:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U35oi-0001q2-GO
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 09:17:45 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:60474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1U35ob-0001o9-TA; Wed, 06 Feb 2013 09:17:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 5D3A929004D;
	Wed,  6 Feb 2013 15:17:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at eu.adacore.com
Received: from mel.act-europe.fr ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gczQCvMdiUCA; Wed,  6 Feb 2013 15:17:27 +0100 (CET)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mel.act-europe.fr (Postfix) with ESMTP id 3D16B290008;
	Wed,  6 Feb 2013 15:17:27 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Wed,  6 Feb 2013 15:17:23 +0100
Message-Id: <1360160243-31611-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 194.98.77.210
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH V2] get_tmp_filename: add explicit error
	message
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
X-List-Received-Date: Wed, 06 Feb 2013 14:17:47 -0000

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 block.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index ba67c0d..79fe01b 100644
--- a/block.c
+++ b/block.c
@@ -428,9 +428,16 @@ int get_tmp_filename(char *filename, int size)
     /* GetTempFileName requires that its output buffer (4th param)
        have length MAX_PATH or greater.  */
     assert(size >= MAX_PATH);
-    return (GetTempPath(MAX_PATH, temp_dir)
-            && GetTempFileName(temp_dir, "qem", 0, filename)
-            ? 0 : -GetLastError());
+    if (GetTempPath(MAX_PATH, temp_dir) == 0) {
+        error_report("%s: GetTempPath() error: %d\n", __func__, GetLastError());
+        return -GetLastError();
+    }
+    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
+        error_report("%s: GetTempFileName(%s) error: %d\n", __func__, temp_dir,
+                GetLastError());
+        return -GetLastError();
+    }
+    return 0;
 #else
     int fd;
     const char *tmpdir;
@@ -442,9 +449,11 @@ int get_tmp_filename(char *filename, int size)
     }
     fd = mkstemp(filename);
     if (fd < 0) {
+        error_report("%s: mkstemp() error: %s\n", __func__, strerror(errno));
         return -errno;
     }
     if (close(fd) != 0) {
+        error_report("%s: close() error: %s\n", __func__, strerror(errno));
         unlink(filename);
         return -errno;
     }
-- 
1.7.9.5


