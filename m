Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShZMw-0005UV-Jt
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2012 00:51:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1ShZMu-0005TS-0h
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2012 00:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1ShZMs-0003lE-3N
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2012 00:51:43 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:57435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1ShZMr-0003kM-Tv
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2012 00:51:42 -0400
Received: by pbbro12 with SMTP id ro12so1602332pbb.4
	for <qemu-trivial@nongnu.org>; Wed, 20 Jun 2012 21:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=37m6OXvxihrVutW45e8Q0ZJSudkgBs9AAbtvb6RCYH8=;
	b=HkOdUHt5G9jSVwbQq0KpYHexo2z7+VZEWlpum4BR5htg/5FuMcWeK1JEoVIyH+SHh4
	XrFHECUOQ7HGoA+2otNNzMQUmAQ1Xcdum3j9TVZjSpGg8lP/X/X16C4kc3yjtm15I7I6
	zL1+0eBaz8hzjYSB5LhWdpTztEa0T1g0tnTnPDsBupCwrTdQvHhVJtgVoqp1apNeGvDw
	Y56QYj6JGmBM53G+cZY9VPU5g9azWo7M5JZ6p3GNleBxJ2Lo+HiRxM1qsKOoAuWi9Mg5
	vsqPMQu+VUWjMi8Khp1H1jwuy4O0BxT5//lpiv620b8QO+NgVpOOuwUlDwbVveTzwXrA
	YROg==
Received: by 10.68.228.2 with SMTP id se2mr83464385pbc.109.1340254299189;
	Wed, 20 Jun 2012 21:51:39 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id np8sm34460969pbc.71.2012.06.20.21.51.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 21:51:38 -0700 (PDT)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: qemu-devel@nongnu.org, edgar.iglesias@gmail.com, qemu-trivial@nongnu.org
Date: Thu, 21 Jun 2012 14:51:24 +1000
Message-Id: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.3.2
X-Gm-Message-State: ALoCoQnBIth3WxotRuz4lotwZWM0Igc8ePpIGeYejmQPjKW23q3FrlVSyUU0u748xtv6SX8dG3GR
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: peter.crosthwaite@petalogix.com, john.williams@petalogix.com
Subject: [Qemu-trivial] [PATCH v1] device_tree: load_device_tree(): Allow
	NULL sizep
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
X-List-Received-Date: Thu, 21 Jun 2012 04:51:45 -0000

The sizep arg is populated with the size of the loaded device tree. Since this
is one of those informational "please populate" type arguments it should be
optional. Guarded writes to *sizep against NULL accordingly.

Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
---
 device_tree.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 86a694c..0ed0256 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -32,7 +32,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
     int ret;
     void *fdt = NULL;
 
-    *sizep = 0;
+    if (sizep) {
+        *sizep = 0;
+    }
     dt_size = get_image_size(filename_path);
     if (dt_size < 0) {
         printf("Unable to get size of device tree file '%s'\n",
@@ -65,7 +67,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
             filename_path);
         goto fail;
     }
-    *sizep = dt_size;
+    if (sizep) {
+        *sizep = dt_size;
+    }
     return fdt;
 
 fail:
-- 
1.7.3.2


