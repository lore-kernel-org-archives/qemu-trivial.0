Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfldO-0006vl-VD
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 01:05:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TfldI-0006dY-TH
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TfldC-0002Eg-No
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:28 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:55792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TfldC-0002Do-KO
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:22 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so5375899iej.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Dec 2012 22:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=nljpLKr1/doGEu3hI9Xs3KRRkMMV2SdU4qAVc/SlzXk=;
	b=ZtlTXmo7oJZk6soCScdM4tGuntq2NMtky7EHUOF01dhd4szFrqWnE26uOV30OdqlRQ
	KlUG1pxtdVmQO1iFLedQqyc5yvJwxDaiK1QdTNfbshFPtNDD/LmnCV2t+aGiHq8joMj9
	aihwe/ZI6PcAX7MPGtLCQOKyA6kffS9w/llYd1dxan1v4cK6k96gfNwJHtEI5t6uB6RW
	w8fiKD4ZsDWgxBB2cT0CNltPr70QLltvR7nCraD0h5eO7oHy/NOFROOtdxwHPYQE+/5L
	bvDT0eQ7wBEPpILRhtDc+PMd3Xrm/4RoqPMAbTCb6Y4yfcu3ayvosbmGPube1bGNk0wj
	kblg==
Received: by 10.43.110.132 with SMTP id ek4mr10107803icc.32.1354601122317;
	Mon, 03 Dec 2012 22:05:22 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id v12sm263218igv.3.2012.12.03.22.05.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:05:21 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue,  4 Dec 2012 16:04:36 +1000
Message-Id: <10b87716a125ba44a314d7a185a48d001fd3d338.1354600680.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQm3Cyb6cEGtAkPfCR1ZLki3C6CqIjTMDAKsLYi42Bp1nCmb1xBWY53FEf2sRNxxMzjr1h5x
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 4/4] arm_gic: Add cpu nr to Raised IRQ
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
X-List-Received-Date: Tue, 04 Dec 2012 06:05:33 -0000

Add the relevant CPU nr to this debug message to make IRQ debugging more
informative.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/arm_gic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/arm_gic.c b/hw/arm_gic.c
index f9e423f..7a10188 100644
--- a/hw/arm_gic.c
+++ b/hw/arm_gic.c
@@ -76,7 +76,7 @@ void gic_update(GICState *s)
         if (best_prio <= s->priority_mask[cpu]) {
             s->current_pending[cpu] = best_irq;
             if (best_prio < s->running_priority[cpu]) {
-                DPRINTF("Raised pending IRQ %d\n", best_irq);
+                DPRINTF("Raised pending IRQ %d (cpu %d)\n", best_irq, cpu);
                 level = 1;
             }
         }
-- 
1.7.0.4


