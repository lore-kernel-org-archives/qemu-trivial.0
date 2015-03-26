Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yb5gc-0004bP-2L
	for mharc-qemu-trivial@gnu.org; Thu, 26 Mar 2015 07:10:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1Yb5gW-0004VV-OK
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 07:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1Yb5gM-0001wa-FW
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 07:10:48 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:33933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1Yb5gM-0001wL-6g
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 07:10:38 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Thu, 26 Mar 2015 11:10:35 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 26 Mar 2015 11:10:32 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 26B7A1B0804B; 
	Thu, 26 Mar 2015 11:10:58 +0000 (GMT)
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
	[9.149.37.252])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2QBAVgf3146164; Thu, 26 Mar 2015 11:10:31 GMT
Received: from d06av11.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2QBAVYO027885; Thu, 26 Mar 2015 05:10:31 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2QBAVEa027880; Thu, 26 Mar 2015 05:10:31 -0600
Received: from bahia.local (sig-9-83-75-234.evts.uk.ibm.com [9.83.75.234])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 7B0AF22015D;
	Thu, 26 Mar 2015 12:10:30 +0100 (CET)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 26 Mar 2015 12:10:29 +0100
Message-ID: <20150326111029.4249.43831.stgit@bahia.local>
User-Agent: StGit/0.17-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15032611-0041-0000-0000-000003B83C16
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vhost: fix typo in vq_index description
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
X-List-Received-Date: Thu, 26 Mar 2015 11:10:52 -0000

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
 include/hw/virtio/vhost.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 71ef18f..88e1e56 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -36,7 +36,7 @@ struct vhost_dev {
     MemoryRegionSection *mem_sections;
     struct vhost_virtqueue *vqs;
     int nvqs;
-    /* the first virtuque which would be used by this vhost dev */
+    /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
     unsigned long long features;
     unsigned long long acked_features;


