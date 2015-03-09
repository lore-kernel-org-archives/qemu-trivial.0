Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1W9-0003Yy-9S
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:31:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1W0-0003CQ-8T
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vt-0005mC-5N
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:52 -0400
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:37736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vs-0005lK-QF
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:45 -0400
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:43 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:41 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 43F9C1B08069; 
	Mon,  9 Mar 2015 17:31:00 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUeNb52560062; Mon, 9 Mar 2015 17:30:40 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HUdTD025030; Mon, 9 Mar 2015 11:30:39 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7n024224; Mon, 9 Mar 2015 11:30:38 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:09 +0100
Message-Id: <1425922215-20819-3-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0029-0000-0000-000003B0320D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: Dmitry Fleytman <dmitry@daynix.com>, qemu-devel@nongnu.org,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/8] vmxnet: Remove unused function
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
X-List-Received-Date: Mon, 09 Mar 2015 17:30:58 -0000

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


