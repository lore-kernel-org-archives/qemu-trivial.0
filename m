Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJtLK-0007vY-PP
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2018 23:51:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dongli.zhang@oracle.com>) id 1gJtLH-0007te-Mq
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2018 23:51:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dongli.zhang@oracle.com>) id 1gJtKB-0001s2-KG
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2018 23:50:50 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dongli.zhang@oracle.com>)
	id 1gJtKB-0001qp-Bx; Mon, 05 Nov 2018 23:50:47 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	wA64iLGF059240; Tue, 6 Nov 2018 04:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id; s=corp-2018-07-02;
	bh=eZVOim0q3t69AqKczpfBGu9JfvGjEFx+ZOzm3q6vLx8=;
	b=QJHxrli874GkFJVCecrNI4gunt7kIpIPCvrj59ZSFgnzaGOUxjGQMmXfyZNUfaJkNBBk
	Vf1Wq8ziWdZlHRjMCRffLdMgVRHGEQN9kuIxvW2+1KqkT/VRawKw6ukhz1qplKnx9w03
	Jkb2D75bb2P/2PbhaxB8GmuM4UEQPL9rY+JOR2MGBiUrQVbyNWR+YBtzo5lRNXv9KtcH
	IFlr/ei2g+0R7/5w0zGfbExC6hyM4F4FyoaFeKfP/kQ0GOS8C/A7K3I0ABn6Wd5FM/TS
	hXj/q0XnVakcahUYxsjEYLXthvYnn4Ys4+3a1FRtzIYmadrcyCjO9zF2XT7SHih7p6Yv
	VA== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by aserp2120.oracle.com with ESMTP id 2nh3mpjvh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Nov 2018 04:50:45 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id wA64oeNI016394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 6 Nov 2018 04:50:40 GMT
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id wA64odD8005554;
	Tue, 6 Nov 2018 04:50:40 GMT
Received: from linux.cn.oracle.com (/10.182.71.9)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 05 Nov 2018 20:50:39 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
	mreitz@redhat.com
Date: Tue,  6 Nov 2018 12:52:32 +0800
Message-Id: <1541479952-32355-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9068
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=838
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1807170000 definitions=main-1811060040
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
Subject: [Qemu-trivial] [PATCH 1/1] virtio-blk: fix comment for
 virtio_blk_rw_complete as nalloc is initially -1
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
X-List-Received-Date: Tue, 06 Nov 2018 04:51:56 -0000

The initial value of nalloc is -1, but not 1.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
This is based on git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 83cf5c0..30999c3 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -96,7 +96,7 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
         trace_virtio_blk_rw_complete(vdev, req, ret);
 
         if (req->qiov.nalloc != -1) {
-            /* If nalloc is != 1 req->qiov is a local copy of the original
+            /* If nalloc is != -1 req->qiov is a local copy of the original
              * external iovec. It was allocated in submit_requests to be
              * able to merge requests. */
             qemu_iovec_destroy(&req->qiov);
-- 
2.7.4


