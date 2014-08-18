Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJBCw-0007HO-LC
	for mharc-qemu-trivial@gnu.org; Sun, 17 Aug 2014 20:53:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XJBCp-000792-Qi
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XJBCi-0002Jl-Vo
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:53:51 -0400
Received: from mail-yk0-f176.google.com ([209.85.160.176]:55482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XJBCi-0002Jf-Rt
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:53:44 -0400
Received: by mail-yk0-f176.google.com with SMTP id 19so3741618ykq.7
	for <qemu-trivial@nongnu.org>; Sun, 17 Aug 2014 17:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=H1mycaO4XvFBE8yVjVYooktZfpEyDFQ3oclmstXGAqI=;
	b=kZTqTEWRx7Yfeob92h9l8zEqv2V0PSBtQg8VqtgR1cOPpABWnD/c7lH/R4w1622yvi
	hIo+zbzCmvuQECSiQ9CsVpfIMA+w0MCcYOIR462Tt3zw0V7xvHQXZmrMIzJzKCiafVvc
	TOWyOLwP4E8qbYg7TuEU/0yGG9G2kJEsBjsdhipVKhgD65hJ/IsH3Tq27n9bJ78vnhzF
	0s6bGwoE4X4OABX8Nmzhwt+3d2im/f2wcWNzLAy9fjx7mCBq4aejLNn0lujRr7hDpVDw
	IY0S2PLQeij/G1wNOHCHZKm2BQbLPVqWHdsR9bRw6Ii5wDbv/BzlJ4hJt436KTKo7lV5
	L6eg==
X-Gm-Message-State: ALoCoQkm6t/UPRnHdEW/KklOGsGNEMpl+ttgQQgOD70RZ7U1mQqDL161R3YruBEx/QzGDXTuGDGa
X-Received: by 10.236.38.225 with SMTP id a61mr40407066yhb.35.1408323224429;
	Sun, 17 Aug 2014 17:53:44 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id o43sm2571633yha.42.2014.08.17.17.53.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 17 Aug 2014 17:53:43 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Aug 2014 17:53:12 -0700
Message-Id: <ab48c3d1b327507c78da35cfa004dbaedfbab346.1408322869.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
In-Reply-To: <737df733ddb4779e1dcb24b14d1b5d223509dce7.1408322869.git.peter.crosthwaite@xilinx.com>
References: <737df733ddb4779e1dcb24b14d1b5d223509dce7.1408322869.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.176
Cc: qemu-trivial@nongnu.org, edgar.iglesias@xilinx.com
Subject: [Qemu-trivial] [PATCH trivial v1 2/2] dma: axidma: Variablise
	repeated s->streams[i] sub-expr
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
X-List-Received-Date: Mon, 18 Aug 2014 00:53:58 -0000

This have 6 inline usages. Make it a bit more readable by using a local
variable.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
Theres three more usages of this in coming patches, that would push
the number of usages higher

 hw/dma/xilinx_axidma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index ee60d3f..d06002d 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -553,10 +553,12 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
     int i;
 
     for (i = 0; i < 2; i++) {
-        s->streams[i].nr = i;
-        s->streams[i].bh = qemu_bh_new(timer_hit, &s->streams[i]);
-        s->streams[i].ptimer = ptimer_init(s->streams[i].bh);
-        ptimer_set_freq(s->streams[i].ptimer, s->freqhz);
+        struct Stream *st = &s->streams[i];
+
+        st->nr = i;
+        st->bh = qemu_bh_new(timer_hit, st);
+        st->ptimer = ptimer_init(st->bh);
+        ptimer_set_freq(st->ptimer, s->freqhz);
     }
     return;
 
-- 
2.0.1.1.gfbfc394


