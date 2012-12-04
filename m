Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfldD-0006M4-4A
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 01:05:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tfld5-00061M-W4
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tfld1-0002Bg-EG
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:15 -0500
Received: from mail-ia0-f175.google.com ([209.85.210.175]:62261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tfld1-0002BN-AJ
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:11 -0500
Received: by mail-ia0-f175.google.com with SMTP id z3so2843004iad.20
	for <qemu-trivial@nongnu.org>; Mon, 03 Dec 2012 22:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=2+KBauxdDUReDHm+Q1AbVWBME6w8o2YN4LRmgkuzDLA=;
	b=L2fsO5CXBakUG+ybUeCfq/cvi2QQtvBmoyf1KZkg2MO0UBdcm9FmLStrtuv68+S5qq
	DjiCOqVU+8K8yNXOLqyPIi3oJafNKRVpnghdgc81IxbNg/egmVghQBeFXVpF1PRUF3z2
	TR+tZGtDawqcMNNYjM3ngDGPTiZbi3TAXrgJx+xQLYyDWnTWhRMvA6D5JhHmMMN/dd21
	UjVh9BwKHNw0ypBXD5eNa6qYOxlAc0k4fVFuZVS7F1n5RYP9uSAHZmLnYmWm25i85Eb5
	ei7WbZQW0WNla2m8CR4DtibIgCHo/xHP+rksbrrOPSFigNvmxip5VVS3jLRq098cA4GN
	AenQ==
Received: by 10.50.202.97 with SMTP id kh1mr1653795igc.15.1354601110479;
	Mon, 03 Dec 2012 22:05:10 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id l8sm239304igo.13.2012.12.03.22.05.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:05:10 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue,  4 Dec 2012 16:04:34 +1000
Message-Id: <1406c119ace82fb9e443122c8a99ae278bd373dc.1354600680.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnjeDOXfx36wwRxtQvwDZQauIZoS5rYAUAfy0Iyx3bnciSMsaifuQUKHJUXbQL1R0c7EOs1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.175
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 2/4] pflash_cfi0x: Send debug messages to
	stderr
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
X-List-Received-Date: Tue, 04 Dec 2012 06:05:22 -0000

These debug info messages should go to stderr rather than stdout.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/pflash_cfi01.c |    8 ++++----
 hw/pflash_cfi02.c |    6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
index f9f8e5d..931264f 100644
--- a/hw/pflash_cfi01.c
+++ b/hw/pflash_cfi01.c
@@ -46,15 +46,15 @@
 
 #define PFLASH_BUG(fmt, ...) \
 do { \
-    printf("PFLASH: Possible BUG - " fmt, ## __VA_ARGS__); \
+    fprintf(stderr, "PFLASH: Possible BUG - " fmt, ## __VA_ARGS__); \
     exit(1); \
 } while(0)
 
 /* #define PFLASH_DEBUG */
 #ifdef PFLASH_DEBUG
-#define DPRINTF(fmt, ...)                          \
-do {                                               \
-    printf("PFLASH: " fmt , ## __VA_ARGS__);       \
+#define DPRINTF(fmt, ...)                                   \
+do {                                                        \
+    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
 } while (0)
 #else
 #define DPRINTF(fmt, ...) do { } while (0)
diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index f918e36..c60ae83 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -45,9 +45,9 @@
 
 //#define PFLASH_DEBUG
 #ifdef PFLASH_DEBUG
-#define DPRINTF(fmt, ...)                          \
-do {                                               \
-    printf("PFLASH: " fmt , ## __VA_ARGS__);       \
+#define DPRINTF(fmt, ...)                                  \
+do {                                                       \
+    fprintf(stderr "PFLASH: " fmt , ## __VA_ARGS__);       \
 } while (0)
 #else
 #define DPRINTF(fmt, ...) do { } while (0)
-- 
1.7.0.4


