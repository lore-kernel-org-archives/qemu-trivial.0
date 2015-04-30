Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YngqV-0000Rq-KX
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:17:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqP-0000C3-Al
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqO-0006Ds-D2
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngqH-0006Bf-Qi; Thu, 30 Apr 2015 01:16:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F77F42B8D;
	Thu, 30 Apr 2015 08:16:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5CA2596E;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4321 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:27 +0300
Message-Id: <4123867ca10e413e41d68b91877e9f77d2a900f3.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 14/42] vmxnet: Remove unused function
	vmxnet_rx_pkt_get_num_frags()
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
X-List-Received-Date: Thu, 30 Apr 2015 05:17:06 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

The function is not used anymore and thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Dmitry Fleytman <dmitry@daynix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/vmxnet_rx_pkt.c | 7 -------
 hw/net/vmxnet_rx_pkt.h | 9 ---------
 2 files changed, 16 deletions(-)

diff --git a/hw/net/vmxnet_rx_pkt.c b/hw/net/vmxnet_rx_pkt.c
index a40e346..acbca6a 100644
--- a/hw/net/vmxnet_rx_pkt.c
+++ b/hw/net/vmxnet_rx_pkt.c
@@ -172,13 +172,6 @@ bool vmxnet_rx_pkt_has_virt_hdr(struct VmxnetRxPkt *pkt)
     return pkt->has_virt_hdr;
 }
 
-uint16_t vmxnet_rx_pkt_get_num_frags(struct VmxnetRxPkt *pkt)
-{
-    assert(pkt);
-
-    return pkt->vec_len;
-}
-
 uint16_t vmxnet_rx_pkt_get_vlan_tag(struct VmxnetRxPkt *pkt)
 {
     assert(pkt);
diff --git a/hw/net/vmxnet_rx_pkt.h b/hw/net/vmxnet_rx_pkt.h
index 6b2c60e..5f8352a 100644
--- a/hw/net/vmxnet_rx_pkt.h
+++ b/hw/net/vmxnet_rx_pkt.h
@@ -114,15 +114,6 @@ bool vmxnet_rx_pkt_is_vlan_stripped(struct VmxnetRxPkt *pkt);
 bool vmxnet_rx_pkt_has_virt_hdr(struct VmxnetRxPkt *pkt);
 
 /**
- * returns number of frags attached to the packet
- *
- * @pkt:            packet
- * @ret:            number of frags
- *
- */
-uint16_t vmxnet_rx_pkt_get_num_frags(struct VmxnetRxPkt *pkt);
-
-/**
  * attach data to rx packet
  *
  * @pkt:            packet
-- 
2.1.4


