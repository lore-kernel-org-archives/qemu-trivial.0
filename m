Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tfld8-00068g-LL
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 01:05:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tfld1-0005nx-7c
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tflcv-00024Z-5B
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:11 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:61964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tflcv-0001vz-1G
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:05 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so5375619iej.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Dec 2012 22:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=AGe2MbHE9Z6tBNiLXbMD/5EaN/B2RgMDokZ/Effo44A=;
	b=YkJTTrWOKzkU7Ae3ZJcUSZGaGgiVdyiltpj6T+O8Bk5Pi4LXW/zA254cs5KXn9PbeV
	LH+wknXUbQtjoPNh2cvGolHIJYPQZTzE74prQ1jzk8KTehr1sn2a1UkWiaXhM+Wq5pyK
	EH1caiJK8W0oxR46VTnbVBhRa+usYcAKd0cmop9NNPIoLRxtkeI0oW0CmWkyE3ab4vqu
	cENngO/6VPlCgfofjZqUOa0+7RhYp5rRVFhtkVehOw7b2ujjmnjsssZo6E+j4uQeOBHY
	5KwfIyJ7ie6tLNSjRjz8IMeylMjYhJMeSUbs0YfG2MQtODAGj8n0cA94d3knhfWEFhmt
	ONgw==
Received: by 10.42.212.4 with SMTP id gq4mr10138268icb.38.1354601104704;
	Mon, 03 Dec 2012 22:05:04 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id xn10sm9164123igb.4.2012.12.03.22.05.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:05:04 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue,  4 Dec 2012 16:04:33 +1000
Message-Id: <6e3d31ea164ba3e26312398c7382f247023654bb.1354600680.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQlYFae+pIn4VbpR4HX0pwzkuq1CQD3JkFygbqcvxk8+SvNt28Q/AxNsHTvg9LtGfl6pSFda
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 1/4] pflash_cfi01: qemu_log_mask
	"unimplemented" msg
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
X-List-Received-Date: Tue, 04 Dec 2012 06:05:17 -0000

This printf is informing the user of unimplemented functionality. It should be
re-directed to qemu_log(LOG_UNIMP, ...) accordingly.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/pflash_cfi01.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
index 7d040b5..f9f8e5d 100644
--- a/hw/pflash_cfi01.c
+++ b/hw/pflash_cfi01.c
@@ -438,9 +438,9 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
     return;
 
  error_flash:
-    printf("%s: Unimplemented flash cmd sequence "
-           "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)\n",
-           __func__, offset, pfl->wcycle, pfl->cmd, value);
+    qemu_log_mask(LOG_UNIMP, "%s: Unimplemented flash cmd sequence "
+                  "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)"
+                  "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  reset_flash:
     memory_region_rom_device_set_readable(&pfl->mem, true);
-- 
1.7.0.4


