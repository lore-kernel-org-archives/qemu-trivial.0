Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoqSq-0003kh-Jk
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 04:41:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqSh-0003Sg-Cc
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqSa-0000L9-EB
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:40:51 -0400
Received: from mail-qg0-f49.google.com ([209.85.192.49]:33217)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqSZ-0000Kn-OO
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:40:44 -0400
Received: by mail-qg0-f49.google.com with SMTP id a108so11535110qge.36
	for <qemu-trivial@nongnu.org>; Mon, 26 May 2014 01:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=/BqXxvXi5ke4Vu68g/qvTTDU8jw5LIeaj5zNomDBb3I=;
	b=AH9zYTpGHA2anvyh7xfj+R5p2JdV26kI1gOjO6v6IdbPF7VtQE5IONbsHgtap/I668
	cSK5rM7UsJlBM7UKFCjWWd0zhqbCo4YhNODyl2EBVWv0dpC7adsWTfPXce1clIG5FsQX
	gi4/kZuanAK/5p/7Gn+maylHJsYlnRJpeYxZ/p9NsmQlNj661Pyjk0EiZaRfU9IOFI2o
	O4D7jVta2l6p+4ixVxUnIcywad9XmQuTgbYn59P/UcHdJK2EmIOKIZZypUXf9SfAY9mW
	iEAbyknkM/w5tCpBI9D6m2WEtGiToT9bu+yJQNDi+0efycOO2RIBlviIzn8QS70C7wHf
	WGVQ==
X-Gm-Message-State: ALoCoQkOP/0+FsR7h0+M4oy89MI7RGH6fY5JFEx/MoJJ+pSLSDRcsnqk3v/T3DM2+a1V+Fyn0gOQ
X-Received: by 10.140.98.234 with SMTP id o97mr29032298qge.35.1401093643188;
	Mon, 26 May 2014 01:40:43 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by mx.google.com with ESMTPSA id
	il9sm19082810qab.22.2014.05.26.01.40.42 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 01:40:42 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 01:37:47 -0700
Message-Id: <ade8fddd98e7f3b401ca0f35737963620f173bb5.1401092237.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.9.3.1.ga73a6ad
In-Reply-To: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
References: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.49
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial v2 1/4] net: cadence_gem: Fix Tx
	descriptor update
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
X-List-Received-Date: Mon, 26 May 2014 08:40:59 -0000

The local variable "desc" was being used to read-modify-write the
first descriptor (of a multi-desc packet) upon packet completion.
desc however continues to be used by the code as the current
descriptor. Give this first desc RMW it's own local variable to
avoid trampling.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
changed since v1 (MJT review):
Removed &foo[0] usage
Corrected sizeof(desc) to sizeof(desc_first)

 hw/net/cadence_gem.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 47e7038..1721fb7 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -911,14 +911,16 @@ static void gem_transmit(GemState *s)
 
         /* Last descriptor for this packet; hand the whole thing off */
         if (tx_desc_get_last(desc)) {
+            unsigned    desc_first[2];
+
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr,
-                                     (uint8_t *)&desc[0], sizeof(desc));
-            tx_desc_set_used(desc);
-            cpu_physical_memory_write(s->tx_desc_addr,
-                                      (uint8_t *)&desc[0], sizeof(desc));
+            cpu_physical_memory_read(s->tx_desc_addr, (uint8_t *)desc_first,
+                                     sizeof(desc_first));
+            tx_desc_set_used(desc_first);
+            cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
+                                      sizeof(desc_first));
             /* Advance the hardare current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
                 s->tx_desc_addr = s->regs[GEM_TXQBASE];
-- 
1.9.3.1.ga73a6ad


