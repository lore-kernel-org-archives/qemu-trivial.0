Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XICgd-00072x-E5
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 04:16:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICgW-0006uY-Ba
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICgQ-0008MU-18
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:16:28 -0400
Received: from mail-pd0-f175.google.com ([209.85.192.175]:41956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICgP-0008MQ-T3
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:16:21 -0400
Received: by mail-pd0-f175.google.com with SMTP id r10so3001414pdi.20
	for <qemu-trivial@nongnu.org>; Fri, 15 Aug 2014 01:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=TO9AwliOvlQTeX1KcJkHwXt8EuhyOk1f9W6dxi2hSWE=;
	b=CENYF5bCtYJnSPdV1jlZRnGBre8CJZTfDU7PZOc5dokjhf3W21rVW5AO8cS66iD49L
	EzDvBh2uI64azL5y4DXXlGueFi4xFNEmkkX/dEcrt4aVXNu1YiYJXvxa5kQ+M7LfNX3w
	Lw7f3fZWdMDvepR35qxb1xZmLdM2aBaE5xkytf2Fn3uFvp9oJ3Nz/VOgZQNvG/RdY62N
	ORzuJQ0oGhaM5InUsOUMr59xA3iJ4+7Gjm9Y2UcwKhiypk2Rf/belkp2i4MoxB85fRcX
	YVOHfqmOsPauLCuxCsMcR4lAabkylC8/IzdhAUFenmUTGGEyrN7yv7IxIJUIPK6Cu6Xo
	hUcg==
X-Gm-Message-State: ALoCoQkyo7LZxCTGvRf4HmRuZTM1bUppQV4skDJQYy3qfSQl6/1zD5IvlokpDCmytPD7Lb/yrNBx
X-Received: by 10.66.159.8 with SMTP id wy8mr10186996pab.17.1408090576454;
	Fri, 15 Aug 2014 01:16:16 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id c5sm11037259pdh.93.2014.08.15.01.16.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Aug 2014 01:16:15 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 01:15:44 -0700
Message-Id: <30a825d50934513a70416b9132094468ddc440e4.1408090247.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
In-Reply-To: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
References: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.175
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH trivial v1 3/3] intc: i8259: Convert Array
	allocation to g_new0
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
X-List-Received-Date: Fri, 15 Aug 2014 08:16:35 -0000

To be more array friendly and to indicate the IRQs are initially
disconnected.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/intc/i8259.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index d0b0c52..a563b82 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -472,7 +472,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
     ISADevice *isadev;
     int i;
 
-    irq_set = g_malloc(ISA_NUM_IRQS * sizeof(qemu_irq));
+    irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
 
     isadev = i8259_init_chip(TYPE_I8259, bus, true);
     dev = DEVICE(isadev);
-- 
2.0.1.1.gfbfc394


