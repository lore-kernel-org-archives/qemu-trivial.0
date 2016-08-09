Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWwih-0001jr-PH
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 22:24:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bWwif-0001iT-NO
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 22:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bWwid-0007RB-PI
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 22:24:40 -0400
Received: from blu004-omc2s28.hotmail.com ([65.55.111.103]:53020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>)
	id 1bWwiY-0007Pm-Bb; Mon, 08 Aug 2016 22:24:34 -0400
Received: from BLU437-SMTP43 ([65.55.111.73]) by BLU004-OMC2S28.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Mon, 8 Aug 2016 19:24:33 -0700
X-TMN: [jQDW4NPQvahEarQDOI4kXA3nhKUAj4hP3HgjD5p/eB4=]
X-Originating-Email: [chaojianhu@hotmail.com]
Message-ID: <BLU437-SMTP43591ADA801E900D4BCE81DB1C0@phx.gbl>
From: chaojianhu <chaojianhu@hotmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com, jasowang@redhat.com, qemu-arm@nongnu.org,
	chaojianhu <chaojianhu@hotmail.com>
Date: Tue, 9 Aug 2016 10:24:17 +0800
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 09 Aug 2016 02:24:32.0710 (UTC)
	FILETIME=[2A218660:01D1F1E5]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.103
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
X-List-Received-Date: Tue, 09 Aug 2016 02:24:42 -0000

The .receive callback of xlnx.xps-ethernetlite doesn't check the length
of data before calling memcpy. As a result=2C the NetClientState object in
heap will be overflowd. All versions of qemu with=E3=80=80xlnx.xps-ethernet=
lite
will be affected.

Reported-by: chaojianhu <chaojianhu@hotmail.com>

---
 hw/net/xilinx_ethlite.c | 4 ++++
 1 file changed=2C 4 insertions(+)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 54db2b8..6d3eecc 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -197=2C6 +197=2C10 @@ static ssize_t eth_rx(NetClientState *nc=2C const =
uint8_t *buf=2C size_t size)
     }
=20
     D(qemu_log("%s %zd rxbase=3D%x\n"=2C __func__=2C size=2C rxbase))=3B
+    if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4 ) {
+        D(qemu_log("ethlite packet is too big=2C size=3D%x\n"=2C size)=3B
+        return -1=3B
+    }
     memcpy(&s->regs[rxbase + R_RX_BUF0]=2C buf=2C size)=3B
=20
     s->regs[rxbase + R_RX_CTRL0] |=3D CTRL_S=3B
--=20
1.9.1


