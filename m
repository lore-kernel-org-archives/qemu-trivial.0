Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzgKC-0002GF-RV
	for mharc-qemu-trivial@gnu.org; Thu, 09 Aug 2012 23:55:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzgK7-0001yX-Ht
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 23:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzgK5-0001or-GF
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 23:55:43 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:64262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzgK5-0001o7-A9
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 23:55:41 -0400
Received: by mail-pb0-f45.google.com with SMTP id rp12so1872820pbb.4
	for <qemu-trivial@nongnu.org>; Thu, 09 Aug 2012 20:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=eTstQQLzAE8okP/Jf3hfR/UxtHG6IPa8zaH0Icf7jUY=;
	b=itwfRZyz0Vv+R1EimRNCfhGBJdv/sNDkeut9IVq8OsOIpRvEixgoUnzQgmFPi7aWUK
	G+/EUb4f3GEO1BTA8mCgf21rUMfQOOcjR65mxITxCID8OZ/rXdzzU8yDVMFETMcYlm+T
	Zl3jRl+0VQICzWgOZ3bo2D2fCvui6xO30D2iaed5Fq++HQ1GxQt6fkq0HRSLocbGAUdT
	vq8pEr81/Wib23O4Ttiq7GAP7iN88rL6atiURdvGGT/q1FkLWA+O3ci+4zB0nxlfNt4y
	5uUXtpYdRlTqwd7q5o2Fik7d1Gwt+nYV2/ljh7p4Rx7EUycliZC94WO5S5uOM5dIZLQq
	C3zA==
Received: by 10.68.129.168 with SMTP id nx8mr9019095pbb.112.1344570940867;
	Thu, 09 Aug 2012 20:55:40 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id ng8sm2451413pbc.13.2012.08.09.20.55.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 20:55:40 -0700 (PDT)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: peter.crosthwaite@petalogix.com, qemu-trivial@nongnu.org, agraf@suse.de,
	qemu-devel@nongnu.org
Date: Fri, 10 Aug 2012 13:54:26 +1000
Message-Id: <1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Gm-Message-State: ALoCoQkybyl7A1D5rIQnuXkl8PEP1Gvnqrqoh9VTq/o/paQqnQQzqokT7sUCH8pYb2XVbds6wzKe
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Subject: [Qemu-trivial] [PATCH] device_tree: load_device_tree(): Allow NULL
	sizep
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
X-List-Received-Date: Fri, 10 Aug 2012 03:55:46 -0000

The sizep arg is populated with the size of the loaded device tree. Since this
is one of those informational "please populate" type arguments it should be
optional. Guarded writes to *sizep against NULL accordingly.

Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
Acked-by: Alexander Graf <agraf@suse.de>
---
 device_tree.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index d7a9b6b..641a48a 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
     int ret;
     void *fdt = NULL;
 
-    *sizep = 0;
+    if (sizep) {
+        *sizep = 0;
+    }
     dt_size = get_image_size(filename_path);
     if (dt_size < 0) {
         printf("Unable to get size of device tree file '%s'\n",
@@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
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
1.7.0.4


