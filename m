Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIbsQ-0000PO-9e
	for mharc-qemu-trivial@gnu.org; Fri, 02 Nov 2018 12:00:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dongli.zhang@oracle.com>) id 1gISjL-0002Lv-4V
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2018 02:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dongli.zhang@oracle.com>) id 1gISjH-0000Nn-Vj
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2018 02:14:51 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:54106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dongli.zhang@oracle.com>)
	id 1gISjH-0000K9-Kp; Fri, 02 Nov 2018 02:14:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	wA26Ej7v013968; Fri, 2 Nov 2018 06:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id; s=corp-2018-07-02;
	bh=sgSYpLKOqjNGlA7EA2kNa2+UPTvxwkgvtB/Rk1FsHNw=;
	b=z76OzYdGVOfbjaRLcZDDxVIlGKlH4h/lHhBPAzx0FbFt9cjUnwvFgGbcQiiAXcIHob5y
	8PPXnCjSnypp1qyZz22X4AHzTEJGlZXfSL2xkSP/k+hBp+2i0BsvOhTO/LKCpqk+i5bb
	4+STN+CjUImYojySCOn2URHVh6MWpv3bK5eIhQwSENFHYW2rkHmpa3WE5FuR8P6LnNwv
	CvmHUzhxPPGP8/+/cs2G0YDjAq1a2tslHccvELvqU10JSa6++uHu0n3oyUJtsNR8YXqp
	0S7vvfcLTKVpdxYYWoBHiNH0j7CloHVp49o7m+IgrEmx14qxyZQmMW1+50jMxb4DreFd
	2Q== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by userp2130.oracle.com with ESMTP id 2nducmhayr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 Nov 2018 06:14:45 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id wA26EdEF005535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 2 Nov 2018 06:14:39 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id wA26EcKY009248;
	Fri, 2 Nov 2018 06:14:39 GMT
Received: from linux.cn.oracle.com (/10.182.71.9)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 01 Nov 2018 23:14:38 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu-trivial@nongnu.org
Date: Fri,  2 Nov 2018 14:16:36 +0800
Message-Id: <1541139396-4727-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9064
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=518
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1807170000 definitions=main-1811020059
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
X-Mailman-Approved-At: Fri, 02 Nov 2018 12:00:49 -0400
Subject: [Qemu-trivial] [PATCH 1/1] virtio: pass argument by value for
 virtqueue_map_iovec()
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
X-List-Received-Date: Fri, 02 Nov 2018 06:14:52 -0000

Pass num_sg by value instead of by pointer, as num_sg is never modified in
virtqueue_map_iovec().

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/virtio/virtio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 4136d23..a5cb4e6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -796,13 +796,13 @@ static void virtqueue_undo_map_desc(unsigned int out_num, unsigned int in_num,
 }
 
 static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
-                                hwaddr *addr, unsigned int *num_sg,
+                                hwaddr *addr, unsigned int num_sg,
                                 int is_write)
 {
     unsigned int i;
     hwaddr len;
 
-    for (i = 0; i < *num_sg; i++) {
+    for (i = 0; i < num_sg; i++) {
         len = sg[i].iov_len;
         sg[i].iov_base = dma_memory_map(vdev->dma_as,
                                         addr[i], &len, is_write ?
@@ -821,8 +821,8 @@ static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
 
 void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem)
 {
-    virtqueue_map_iovec(vdev, elem->in_sg, elem->in_addr, &elem->in_num, 1);
-    virtqueue_map_iovec(vdev, elem->out_sg, elem->out_addr, &elem->out_num, 0);
+    virtqueue_map_iovec(vdev, elem->in_sg, elem->in_addr, elem->in_num, 1);
+    virtqueue_map_iovec(vdev, elem->out_sg, elem->out_addr, elem->out_num, 0);
 }
 
 static void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
-- 
2.7.4


