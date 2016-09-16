Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktmo-0002cH-1t
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:06:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktmh-0002Uu-W0
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktmb-0007k6-U8
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:06:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktmV-0007dk-Ig; Fri, 16 Sep 2016 10:06:19 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C0F6C00041D;
	Fri, 16 Sep 2016 13:57:05 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkO024127; Fri, 16 Sep 2016 09:57:03 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	John Snow <jsnow@redhat.com>
Date: Fri, 16 Sep 2016 15:56:13 +0200
Message-Id: <1474034177-17663-23-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 16 Sep 2016 13:57:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 22/26] blockdev: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 14:06:36 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: John Snow <jsnow@redhat.com>
---
 hw/ide/core.c        | 2 +-
 hw/scsi/lsi53c895a.c | 7 ++++---
 hw/sd/ssi-sd.c       | 3 ++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index b0e42a6..b927bd8 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2855,7 +2855,7 @@ void ide_drive_get(DriveInfo **hd, int n)
     if (highest_bus > n_buses) {
         error_report("Too many IDE buses defined (%d > %d)",
                      highest_bus, n_buses);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     for (i = 0; i < n; i++) {
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index feb1191..9cd4796 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -28,7 +28,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("lsi_scsi: " fmt , ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "lsi_scsi: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "lsi_scsi: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
@@ -1205,7 +1206,7 @@ again:
             break;
         default:
             BADF("Unimplemented phase %d\n", s->sstat1 & PHASE_MASK);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         s->dfifo = s->dbc & 0xff;
         s->ctest5 = (s->ctest5 & 0xfc) | ((s->dbc >> 8) & 3);
@@ -1276,7 +1277,7 @@ again:
                 }
                 if (insn & (1 << 9)) {
                     BADF("Target mode not implemented\n");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 if (insn & (1 << 10))
                     s->carry = 1;
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 3ff0886..f188455 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -23,7 +23,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("ssi_sd: " fmt , ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "ssi_sd: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "ssi_sd: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
-- 
2.5.5


