Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rus6p-000631-4p
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2012 15:57:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Rus6f-0005Zv-VA
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2012 15:57:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Rus6c-0002CD-1N
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2012 15:57:41 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:33750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Rus6T-0002BG-M4; Tue, 07 Feb 2012 15:57:29 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Rus6R-0007qC-4c; Tue, 07 Feb 2012 20:57:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  7 Feb 2012 20:57:27 +0000
Message-Id: <1328648247-30117-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] vl.c: Fix typo in variable name
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
X-List-Received-Date: Tue, 07 Feb 2012 20:57:49 -0000

Fix a typo in a local variable name.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 vl.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index 63dd725..c4b3aab 100644
--- a/vl.c
+++ b/vl.c
@@ -2030,7 +2030,7 @@ static int configure_accelerator(void)
     const char *p = NULL;
     char buf[10];
     int i, ret;
-    bool accel_initalised = 0;
+    bool accel_initialised = 0;
     bool init_failed = 0;
 
     QemuOptsList *list = qemu_find_opts("machine");
@@ -2043,7 +2043,7 @@ static int configure_accelerator(void)
         p = "tcg";
     }
 
-    while (!accel_initalised && *p != '\0') {
+    while (!accel_initialised && *p != '\0') {
         if (*p == ':') {
             p++;
         }
@@ -2064,7 +2064,7 @@ static int configure_accelerator(void)
                     }
                     *(accel_list[i].allowed) = 0;
                 } else {
-                    accel_initalised = 1;
+                    accel_initialised = 1;
                 }
                 break;
             }
@@ -2074,7 +2074,7 @@ static int configure_accelerator(void)
         }
     }
 
-    if (!accel_initalised) {
+    if (!accel_initialised) {
         fprintf(stderr, "No accelerator found!\n");
         exit(1);
     }
@@ -2083,7 +2083,7 @@ static int configure_accelerator(void)
         fprintf(stderr, "Back to %s accelerator.\n", accel_list[i].name);
     }
 
-    return !accel_initalised;
+    return !accel_initialised;
 }
 
 void qemu_add_exit_notifier(Notifier *notify)
-- 
1.7.5.4


