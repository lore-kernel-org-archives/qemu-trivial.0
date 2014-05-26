Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoqTM-0004nF-DR
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 04:41:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqTE-0004Vb-2O
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqT7-0000RL-M9
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:41:23 -0400
Received: from mail-qg0-f45.google.com ([209.85.192.45]:41811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqT7-0000RA-Io
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:41:17 -0400
Received: by mail-qg0-f45.google.com with SMTP id z60so11683865qgd.32
	for <qemu-trivial@nongnu.org>; Mon, 26 May 2014 01:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=r9fyrai68T/UyxWjRw/RWf4Z7IGFu0BnKVWnefMIees=;
	b=fWpjgOtlqphDMMicabF4el0GQe6FYabtoWkfPTsvSKBp4wjA/BkUilEjuRIM3aDAEf
	G7BCXDut1qVtnpS+or8mTPWx12OjmynUlr7YlZ8E+CWINSFoQ00dPqsDP+A9HDy06669
	SQNyCoEPQPFZxt7Ti8L73Eco8Ru6M9P371b53eG2bweHAvppddGpjmOdDd3UH2zZb7Wv
	D42w58gUe6HUrPGghVksgdb/IS2ZXCqTJ6M41mAL05IIfM6IsaDFnD+47VJ3P6f2mXZD
	k87DOHTkzfNkEyURBueDobVRuNh4n8TF8vxCSpXVk9xaVuo2M/RhaHOubK2Sdt/lNmzK
	MQ3Q==
X-Gm-Message-State: ALoCoQnzNvdu6mjRqPeSZp3/m+Bgc23vYy3rCfGzBbA4X51tIGyLkp6SR4ZanHsOcDi85lO35fcN
X-Received: by 10.140.94.225 with SMTP id g88mr27875418qge.101.1401093677184; 
	Mon, 26 May 2014 01:41:17 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id l10sm6363007qae.41.2014.05.26.01.41.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 01:41:16 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 01:38:21 -0700
Message-Id: <cdfdcb5953afd653a7664b2e59aa5d89ad8fa172.1401092237.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.9.3.1.ga73a6ad
In-Reply-To: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
References: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial v2 2/4] net: cadence_gem: Add Tx
	descriptor fetch printf
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
X-List-Received-Date: Mon, 26 May 2014 08:41:30 -0000

Add a debug printf for TX descriptor fetching. This helpful to anyone
needing to debug TX ring buffer traversal. Its also now consistent with
the RX code which has a similar printf.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
changed since v1:
don't cast to unsigned (mjt review).

 hw/net/cadence_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 1721fb7..f0e9f5b 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -880,6 +880,8 @@ static void gem_transmit(GemState *s)
 
     /* read current descriptor */
     packet_desc_addr = s->tx_desc_addr;
+
+    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
                              (uint8_t *)&desc[0], sizeof(desc));
     /* Handle all descriptors owned by hardware */
@@ -962,6 +964,7 @@ static void gem_transmit(GemState *s)
         } else {
             packet_desc_addr += 8;
         }
+        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         cpu_physical_memory_read(packet_desc_addr,
                                  (uint8_t *)&desc[0], sizeof(desc));
     }
-- 
1.9.3.1.ga73a6ad


