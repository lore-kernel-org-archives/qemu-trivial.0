Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaJfn-0006bl-IO
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 00:13:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TaJfk-0006ad-0U
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 00:13:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TaJfg-0007BV-VM
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 00:13:27 -0500
Received: from mail-pa0-f45.google.com ([209.85.220.45]:33006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TaJfg-00079l-P3
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 00:13:24 -0500
Received: by mail-pa0-f45.google.com with SMTP id bg2so673070pad.4
	for <qemu-trivial@nongnu.org>; Sun, 18 Nov 2012 21:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=NHjSGrGBSSJoFK7sSSWB1XFRyQPNGJVTydAgmfDLGt4=;
	b=nPzHMv2XeYFtF8eI78kTI+l6IqC1zn41r/pCuhzne0NIRBGKRlmuOB4mYkHcUpxFD1
	SOijfultzyvYXTdKrSdiqVfXkdfEcwHNGzc1QD5AsHZKQz10bJHXcWqlHKguY76ROJdy
	KwjEOZF912uxxucWLYKrzHS9Z+A0eWaNl3LKVpizeXKeQxJsnqFiHGPR6migK4HKqqEe
	LJV9KyhhZqGUrgYsRaPpe8xiF5ftsioXVyQQy27WXew8QZR50K9DZunrNPUOSK167tjo
	u+3rNEEVVmIt7kucOxdxes4GWGoGaap2hMvbpFqxA8J7nrroT4SF6lWaUJnyQMkm1cT2
	ac8A==
Received: by 10.68.189.8 with SMTP id ge8mr36673524pbc.24.1353302003538;
	Sun, 18 Nov 2012 21:13:23 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id bh9sm1008826pab.12.2012.11.18.21.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Nov 2012 21:13:22 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 19 Nov 2012 15:13:49 +1000
Message-Id: <1353302029-14255-1-git-send-email-peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQlhKbUBoU6FjnQUfgnDrMYsO1DO/U/5aI8I/HpMCSf9RX+Ja2NcDtvykN1oyK97OKwQtpjT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH] arm: a9mpcore: remove un-used ptimer_iomem
	field
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
X-List-Received-Date: Mon, 19 Nov 2012 05:13:31 -0000

I'm guessing this is a hangover from a previous coreification of the mptimer
sub-module. This field is completely unused - removed.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/a9mpcore.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/a9mpcore.c b/hw/a9mpcore.c
index 824ff0a..f802de0 100644
--- a/hw/a9mpcore.c
+++ b/hw/a9mpcore.c
@@ -19,7 +19,6 @@ typedef struct a9mp_priv_state {
     uint32_t old_timer_status[8];
     uint32_t num_cpu;
     MemoryRegion scu_iomem;
-    MemoryRegion ptimer_iomem;
     MemoryRegion container;
     DeviceState *mptimer;
     DeviceState *gic;
-- 
1.7.0.4


