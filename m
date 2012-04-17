Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKBsv-0000Rp-0Q
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 13:08:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SKBsp-00008A-6b
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:08:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SKBsk-0001av-LX
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:08:02 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:60446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SKBsZ-0001WN-MM; Tue, 17 Apr 2012 13:07:47 -0400
Received: by ggnp2 with SMTP id p2so4209945ggn.4
	for <multiple recipients>; Tue, 17 Apr 2012 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=4RJS5PFgRu2XUuZGzD5F5Mdv0IaJKJB8dAQ9wypoQYs=;
	b=AT9ceMPqahErZoytqB5uU7PxBShaYrdeQEYjnZSEpfXAMD5X125pJrFczQYlwqOq0w
	5DiXoRbCmsEdt/afzsD8BOy9opafWYH50pj80o4mcblA2Mxhytw2P5xh5wR8tGAqO8he
	Dejc3/8FU6KVVrM4sVIP0hqxN913SCcoEne1JQaIB1Q0AGAM8fsdgZvOdBBy9MUBkGhG
	mqBdvzm9/w99CByvKMSVP+rZn8R6T+kqiqBiRiG05H04S5P7xzziuYJg844Y3/4hQxSR
	7BFUc6Ogmh6SV+k7ZXJsQG1hGkzKOL52Xeuc/oj3cyIBcHq8g2jAtlf3QHP7OIt/8Duw
	HM8w==
Received: by 10.60.22.138 with SMTP id d10mr22110687oef.69.1334682465252;
	Tue, 17 Apr 2012 10:07:45 -0700 (PDT)
Received: from localhost.localdomain ([32.97.110.59])
	by mx.google.com with ESMTPS id m2sm23700149obk.9.2012.04.17.10.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 10:07:44 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Apr 2012 12:07:38 -0500
Message-Id: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, afaerber@suse.de, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] qemu-ga: generate missing stubs for
	fsfreeze
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
X-List-Received-Date: Tue, 17 Apr 2012 17:08:07 -0000

When linux-specific commands (including guest-fsfreeze-*) were consolidated
under defined(__linux__), we forgot to account for the case where
defined(__linux__) && !defined(FIFREEZE). As a result stubs are no longer
being generated on linux hosts that don't have FIFREEZE support. Fix
this.

Tested-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/commands-posix.c |   36 ++++++++++++++++++++----------------
 1 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index faf970d..087c3af 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -881,46 +881,50 @@ error:
 
 #else /* defined(__linux__) */
 
-GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **err)
+void qmp_guest_suspend_disk(Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
-
-    return 0;
 }
 
-int64_t qmp_guest_fsfreeze_freeze(Error **err)
+void qmp_guest_suspend_ram(Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
-
-    return 0;
 }
 
-int64_t qmp_guest_fsfreeze_thaw(Error **err)
+void qmp_guest_suspend_hybrid(Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
-
-    return 0;
 }
 
-void qmp_guest_suspend_disk(Error **err)
+GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
-    error_set(err, QERR_UNSUPPORTED);
+    error_set(errp, QERR_UNSUPPORTED);
+    return NULL;
 }
 
-void qmp_guest_suspend_ram(Error **err)
+#endif
+
+#if !defined(CONFIG_FSFREEZE)
+
+GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
+
+    return 0;
 }
 
-void qmp_guest_suspend_hybrid(Error **err)
+int64_t qmp_guest_fsfreeze_freeze(Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
+
+    return 0;
 }
 
-GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
+int64_t qmp_guest_fsfreeze_thaw(Error **err)
 {
-    error_set(errp, QERR_UNSUPPORTED);
-    return NULL;
+    error_set(err, QERR_UNSUPPORTED);
+
+    return 0;
 }
 
 #endif
-- 
1.7.4.1


