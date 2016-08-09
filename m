Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWy6J-0000Hd-Ob
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 23:53:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bWy6I-0000GC-6Y
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 23:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bWy6H-0006d0-CQ
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 23:53:10 -0400
Received: from blu004-omc2s10.hotmail.com ([65.55.111.85]:55196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>)
	id 1bWy6D-0006c6-0q; Mon, 08 Aug 2016 23:53:05 -0400
Received: from BLU436-SMTP98 ([65.55.111.71]) by BLU004-OMC2S10.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Mon, 8 Aug 2016 20:53:04 -0700
X-TMN: [+6p7uL/wdLvB9XmEiurSQztHeT5cWB3CBKQM7T9Xqik=]
X-Originating-Email: [chaojianhu@hotmail.com]
Message-ID: <BLU436-SMTP98842C445B9A4E4B033261DB1C0@phx.gbl>
From: chaojianhu <chaojianhu@hotmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com, jasowang@redhat.com, qemu-arm@nongnu.org,
	chaojianhu <chaojianhu@hotmail.com>
Date: Tue, 9 Aug 2016 11:52:54 +0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 09 Aug 2016 03:53:03.0763 (UTC)
	FILETIME=[87C3E630:01D1F1F1]
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.85
Subject: [Qemu-trivial] [PATCH] hw/net: Fix a heap overflow in
 xlnx.xps-ethernetlite
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 03:53:11 -0000

The .receive callback of xlnx.xps-ethernetlite doesn't check the length
of data before calling memcpy. As a result, the NetClientState object in
heap will be overflowed. All versions of qemu with xlnx.xps-ethernetlite
will be affected.

Reported-by: chaojianhu <chaojianhu@hotmail.com>
Signed-off-by: chaojianhu <chaojianhu@hotmail.com>

---
 hw/net/xilinx_ethlite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 54db2b8..35de353 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -197,6 +197,10 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
     }
 
     D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
+    if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
+        D(qemu_log("ethlite packet is too big, size=%x\n", size));
+        return -1;
+    }
     memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
 
     s->regs[rxbase + R_RX_CTRL0] |= CTRL_S;
-- 
1.9.1


