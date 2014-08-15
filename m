Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XICg7-0006Or-Ux
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 04:16:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICfz-0006CW-OI
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICfn-00086A-4B
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:15:55 -0400
Received: from mail-pd0-f179.google.com ([209.85.192.179]:53018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICfm-00084x-VP
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:15:43 -0400
Received: by mail-pd0-f179.google.com with SMTP id v10so3020935pde.10
	for <qemu-trivial@nongnu.org>; Fri, 15 Aug 2014 01:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=hzvaZJ6oRMYiwf/iVbvZA5AUMjT7MhFJmoYS4shLhyk=;
	b=P07QMUTkbzmDyrJBSubkxSQ/ghpNSK5vyG+dhdPEGxZCgbkMq5eyX17r3kOLs0AFfj
	m5jK+wIwGrf+F5P7+kvPeRsY4aygkyVra4ZiZvjep1pTujRCNgTVRMY+yb6UOtF6Kn5O
	ZfowIs72Q7x/mQGPJFEhV3sNUti8qe9C3pF+1CxlLwfZp8/oOb1NjzHDPqj20GgYsOjp
	WumK0RG2mtyV1s4e1cJ/7bCwp12n1PTotAcXzp2O+4MPxFvEVCef39vF4db0TrGEoeet
	FX5VMFs0toQUqgXFIfrPoj91V7yYCB6aKuEa608nt6ZCcsif746r/JYY8LN1Y9guv4Kh
	jbdw==
X-Gm-Message-State: ALoCoQm9D1obXfF0DHx+YY4jZ5fegWppt/MmQc54GKlCQWL5jKO4he0GXZeIlyIV+6/p62D/hpk2
X-Received: by 10.70.34.73 with SMTP id x9mr15770358pdi.27.1408090542214;
	Fri, 15 Aug 2014 01:15:42 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id a5sm11057599pdp.38.2014.08.15.01.15.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Aug 2014 01:15:41 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 01:15:10 -0700
Message-Id: <3b7cd7cf633cb4b51b6dbb8f9bf9b955ba5470be.1408090247.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
In-Reply-To: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
References: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.179
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH trivial v1 2/3] ppc: convert g_new(qemu_irq
	usages to g_new0
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
X-List-Received-Date: Fri, 15 Aug 2014 08:16:02 -0000

To indicate the IRQs are initially disconnected.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/intc/openpic.c     | 2 +-
 hw/ppc/e500.c         | 2 +-
 hw/ppc/mac_newworld.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 028529e..7d1f3b9 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1627,7 +1627,7 @@ static void openpic_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < opp->nb_cpus; i++) {
-        opp->dst[i].irqs = g_new(qemu_irq, OPENPIC_OUTPUT_NB);
+        opp->dst[i].irqs = g_new0(qemu_irq, OPENPIC_OUTPUT_NB);
         for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
             sysbus_init_irq(d, &opp->dst[i].irqs[j]);
         }
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 1a5b30d..16c85ef 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -583,7 +583,7 @@ static qemu_irq *ppce500_init_mpic(PPCE500Params *params, MemoryRegion *ccsr,
     SysBusDevice *s;
     int i;
 
-    mpic = g_new(qemu_irq, 256);
+    mpic = g_new0(qemu_irq, 256);
 
     if (kvm_enabled()) {
         QemuOpts *machine_opts = qemu_get_machine_opts();
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index f5bccd2..1ec4bb4 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -346,7 +346,7 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    pic = g_new(qemu_irq, 64);
+    pic = g_new0(qemu_irq, 64);
 
     dev = qdev_create(NULL, TYPE_OPENPIC);
     qdev_prop_set_uint32(dev, "model", OPENPIC_MODEL_RAVEN);
-- 
2.0.1.1.gfbfc394


