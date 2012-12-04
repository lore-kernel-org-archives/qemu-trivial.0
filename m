Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfldL-0006lZ-JQ
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 01:05:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TfldC-0006LE-SX
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tfld6-0002Dk-Pg
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:22 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:61964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tfld6-0001vz-M1
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:16 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so5375619iej.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Dec 2012 22:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=eBh8j0XDlvct7Ppt5X31Zftz9BCCyhWIRyD7cMYomRc=;
	b=EzbtVCAff2mjt6MdYN08chLn2sPi+rtQgI7eDk/nY86Xubwqcw5gingq+yGg8W6wNi
	DYiwjEDDwcCnqucXN6kcjfVhO8RCOJQutWpnjjjjwtS4EZR5xGDJVmiHtW/gm4ls3lwL
	9MtkxZBKRLH3weIqRyhd91Tun5I3byFLgHzIie+yyx37baYVd/NSXxzFk8+Mn9kGi408
	TbZr2mBaoaiRovPkhhJBaE29L9kyrBfu5jQbbB1iN/35DP/9oHuJYyzpIs2duj6DC0F2
	hELXuVsVFqythP79fB51CaDOCeq4Sn/hO1FSFOeYIPLqVpvlLTg1W2beh36mOcZR3EhC
	i8aQ==
Received: by 10.50.33.138 with SMTP id r10mr1685145igi.6.1354601116399;
	Mon, 03 Dec 2012 22:05:16 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id em3sm9154798igc.7.2012.12.03.22.05.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:05:15 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue,  4 Dec 2012 16:04:35 +1000
Message-Id: <bf5f902df566826015586252b67754889111c27b.1354600680.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQns7nl63XTg1EvXQa/0jL9kv/WSZg7wzPx+Kx7fXenXAYAZlZ1kNFeKYdqTgGlQRJfoDomW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 3/4] zynq_slcr: Compile time warning fixes.
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
X-List-Received-Date: Tue, 04 Dec 2012 06:05:30 -0000

Few warnings when compiled with debug printfs enabled. Fixed all.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/zynq_slcr.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/zynq_slcr.c b/hw/zynq_slcr.c
index dde4306..f55ab8d 100644
--- a/hw/zynq_slcr.c
+++ b/hw/zynq_slcr.c
@@ -334,7 +334,7 @@ static uint64_t zynq_slcr_read(void *opaque, hwaddr offset,
 {
     uint32_t ret = zynq_slcr_read_imp(opaque, offset);
 
-    DB_PRINT("addr: %08x data: %08x\n", offset, ret);
+    DB_PRINT("addr: %08x data: %08x\n", (unsigned)offset, (unsigned)ret);
     return ret;
 }
 
@@ -343,7 +343,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
 {
     ZynqSLCRState *s = (ZynqSLCRState *)opaque;
 
-    DB_PRINT("offset: %08x data: %08x\n", offset, (unsigned)val);
+    DB_PRINT("offset: %08x data: %08x\n", (unsigned)offset, (unsigned)val);
 
     switch (offset) {
     case 0x00: /* SCL */
@@ -476,7 +476,8 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
             break;
         default:
         bad_reg:
-            DB_PRINT("Bad register write %x <= %08x\n", (int)offset, val);
+            DB_PRINT("Bad register write %x <= %08x\n", (int)offset,
+                     (unsigned)val);
         }
     } else {
         DB_PRINT("SCLR registers are locked. Unlock them first\n");
-- 
1.7.0.4


