Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoqUR-0006rx-Dv
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 04:42:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqUJ-0006e1-V9
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqUD-0000oh-O9
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:42:31 -0400
Received: from mail-qg0-f44.google.com ([209.85.192.44]:44172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqUD-0000oR-E1
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:42:25 -0400
Received: by mail-qg0-f44.google.com with SMTP id i50so11837610qgf.31
	for <qemu-trivial@nongnu.org>; Mon, 26 May 2014 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=gFFymBhUDMoOM90WypH5ese1Ojnl2cVdX0/S3iszwso=;
	b=S4mEO3318EebHIR26T8IF0e31jLR7TPepcbeFHqhyMKc0kmStoAnxhz3RO2VbYcq+v
	Bn9o/1LJnbCNVEkY2qExdtHIgpq8vR/rTmdeI+SNWBK/l6DZ2jTMV7cejCrn08OU/clt
	k0SN7wF8QDSoWCrPoj+mx0akJX3db35iO6OVNkl1B83Tbk44b2CMusgEP895XF8HOTXH
	Mf0Pje++tqUX3CHAthbMyZXDGOHptv7axCcKwtmy9Dh51YlAeyylHpQZeoPhUcfx6NOm
	mr/+yW8i1fg9aZCFG5OxkuSY7g0SwwTOIqtTO0m5nPNwXZPbRDo5d2wK8cyhr7UvnwpG
	Hung==
X-Gm-Message-State: ALoCoQntzT9oUY/ntJfaCsBEYBcM87akysXWeyKil+ijAl8s6kTxyhyFFIBo138X9HPjkMz9jPUg
X-Received: by 10.229.89.65 with SMTP id d1mr30224529qcm.14.1401093745076;
	Mon, 26 May 2014 01:42:25 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id j3sm19100441qaf.6.2014.05.26.01.42.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 01:42:24 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 01:39:29 -0700
Message-Id: <a522692571b31f0e467d5a3c23fdbab9fa7878b1.1401092237.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.9.3.1.ga73a6ad
In-Reply-To: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
References: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.44
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial v2 4/4] net: cadence_gem: Remove
	&desc[0] usages
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
X-List-Received-Date: Mon, 26 May 2014 08:42:38 -0000

Just use desc instead.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/net/cadence_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7cd4b54..7d3355e 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -883,7 +883,7 @@ static void gem_transmit(GemState *s)
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
-                             (uint8_t *)&desc[0], sizeof(desc));
+                             (uint8_t *)desc, sizeof(desc));
     /* Handle all descriptors owned by hardware */
     while (tx_desc_get_used(desc) == 0) {
 
@@ -966,7 +966,7 @@ static void gem_transmit(GemState *s)
         }
         DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)&desc[0], sizeof(desc));
+                                 (uint8_t *)desc, sizeof(desc));
     }
 
     if (tx_desc_get_used(desc)) {
-- 
1.9.3.1.ga73a6ad


