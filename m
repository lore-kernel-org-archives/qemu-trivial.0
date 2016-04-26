Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av35R-0005jo-Ug
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 09:31:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1autmw-000583-DA
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 23:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1autmv-0007iD-GJ
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 23:35:50 -0400
Received: from [59.151.112.132] (port=50640 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1autmp-0007gK-EE; Mon, 25 Apr 2016 23:35:43 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5953544"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 11:35:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 86D2A408D264;
	Tue, 26 Apr 2016 11:35:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.45) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 11:35:32 +0800
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <jcmvbkbc@gmail.com>, Zhou Jie
	<zhoujie2011@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 11:35:13 +0800
Message-ID: <1461641713-32720-1-git-send-email-zhoujie2011@cn.fujitsu.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.45]
X-yoursite-MailScanner-ID: 86D2A408D264.A5342
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 26 Apr 2016 09:31:31 -0400
Subject: [Qemu-trivial] [PATCH] hw/net/opencores_eth: Allocating Large sized
 arrays to heap
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
X-List-Received-Date: Tue, 26 Apr 2016 03:35:51 -0000

open_eth_start_xmit has a huge stack usage of 65536 bytes approx.
Moving large arrays to heap to reduce stack usage.

Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
---
 hw/net/opencores_eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index c6094fb..ba23922 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -483,7 +483,7 @@ static NetClientInfo net_open_eth_info = {
 
 static void open_eth_start_xmit(OpenEthState *s, desc *tx)
 {
-    uint8_t buf[65536];
+    uint8_t *buf = NULL;
     unsigned len = GET_FIELD(tx->len_flags, TXD_LEN);
     unsigned tx_len = len;
 
@@ -498,6 +498,7 @@ static void open_eth_start_xmit(OpenEthState *s, desc *tx)
 
     trace_open_eth_start_xmit(tx->buf_ptr, len, tx_len);
 
+    buf = g_new(uint8_t, tx_len);
     if (len > tx_len) {
         len = tx_len;
     }
@@ -506,6 +507,7 @@ static void open_eth_start_xmit(OpenEthState *s, desc *tx)
         memset(buf + len, 0, tx_len - len);
     }
     qemu_send_packet(qemu_get_queue(s->nic), buf, tx_len);
+    g_free(buf);
 
     if (tx->len_flags & TXD_WR) {
         s->tx_desc = 0;
-- 
2.5.5




