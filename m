Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQL-0006HZ-SJ
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:19:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQK-0006Fc-Hn
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQC-0004BB-FJ
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:48 -0400
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:46862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQC-0004Ai-5e
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:40 -0400
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:38 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp16.uk.ibm.com (192.168.101.146) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:37 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id D677817D8059; 
	Sat, 14 Mar 2015 06:19:59 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6Ja528389084; Sat, 14 Mar 2015 06:19:36 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6JaBP013392; Sat, 14 Mar 2015 02:19:36 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkU013361; Sat, 14 Mar 2015 02:19:35 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:29 +0100
Message-Id: <1426313974-25607-3-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0025-0000-0000-0000044B4629
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.112
Cc: Dmitry Fleytman <dmitry@daynix.com>, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 2/7] vmxnet: Remove unused function
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:49 -0000

The function is not used anymore and thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Dmitry Fleytman <dmitry@daynix.com>
---
 hw/net/vmxnet_rx_pkt.c |    7 -------
 hw/net/vmxnet_rx_pkt.h |    9 ---------
 2 files changed, 0 insertions(+), 16 deletions(-)

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
1.7.1


