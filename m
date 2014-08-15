Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XICfT-0005Y8-CH
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 04:15:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICfM-0005PJ-0D
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:15:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICfE-0007t2-Ds
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:15:15 -0400
Received: from mail-yh0-f48.google.com ([209.85.213.48]:33961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICfE-0007sr-AF
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:15:08 -0400
Received: by mail-yh0-f48.google.com with SMTP id i57so1969942yha.35
	for <qemu-trivial@nongnu.org>; Fri, 15 Aug 2014 01:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=tRaWe9lsZzVM3321S0a8EHpszj0IBlY8QGxpi4EaO2I=;
	b=JTe3YEUY+Mm5LGVJ5RNo725RuSwK7tEFSeo/FHJ62TxOMAWO4UPuevthkvwShwU/Ti
	+2K8t6Ybbxt6TNRMQB4eysLqlRtEvAfBcVufT6xGYK1nMHerF1XetKc5KHuFZEk2ePPb
	Uth5STUAsctQZ4nA1aBwM6REklXbnS7sCXNVEEZj7xvUYbHo8QXUDohXUMaIAPsycreZ
	6tdmK8ZgAtXNLalul4ZgO4igBw5cvFzRG80Wq7oW07ei/fRM5GEi8dDHNUVjkHb3yqLo
	ePsrNKfSaDdkPnqF417/l010Ow0wx7vzqvvB9EG5w8HFQ047TH5q0hre+3T4golArbYR
	ZZ6Q==
X-Gm-Message-State: ALoCoQnTEpKUtZQADBpztpKgEgQeVOy1yvpYvkX0wF7LgDKb+NTszGH6L+mhhxxBsFfbojegxJQ4
X-Received: by 10.236.38.71 with SMTP id z47mr26057206yha.18.1408090508028;
	Fri, 15 Aug 2014 01:15:08 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id 28sm16033630yhc.19.2014.08.15.01.15.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Aug 2014 01:15:07 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 01:14:36 -0700
Message-Id: <ec7b7894dcd0b6052f190c9d442e7e54d9d1d5f1.1408090247.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
In-Reply-To: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
References: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.48
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH trivial v1 1/3] ssi: xilinx_spi: Initialise
	CS GPIOs as NULL
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
X-List-Received-Date: Fri, 15 Aug 2014 08:15:22 -0000

To properly indicate they are unconnected.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/ssi/xilinx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 207f47a..620573c 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -329,7 +329,7 @@ static int xilinx_spi_init(SysBusDevice *sbd)
     s->spi = ssi_create_bus(dev, "spi");
 
     sysbus_init_irq(sbd, &s->irq);
-    s->cs_lines = g_new(qemu_irq, s->num_cs);
+    s->cs_lines = g_new0(qemu_irq, s->num_cs);
     ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
     for (i = 0; i < s->num_cs; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
-- 
2.0.1.1.gfbfc394


