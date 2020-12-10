Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knNrm-0004bP-CS
	for mharc-qemu-trivial@gnu.org; Thu, 10 Dec 2020 10:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1knNrk-0004aT-K5; Thu, 10 Dec 2020 10:28:24 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1knNrh-0002qu-Uc; Thu, 10 Dec 2020 10:28:24 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CsHpb6GqJz7Bxg;
 Thu, 10 Dec 2020 23:27:19 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Dec 2020
 23:27:43 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <dgilbert@redhat.com>, <stefanha@redhat.com>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: [PATCH] virtiofsd: Fix potential NULL pointer dereference in
 virtio_send_msg()
Date: Thu, 10 Dec 2020 15:14:26 +0000
Message-ID: <20201210151426.89244-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2020 15:28:25 -0000

The 'ch' will be NULL in the following stack:
send_notify_iov()->fuse_send_msg()->virtio_send_msg(),
so we should check 'ch' is valid before dereferencing it

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 tools/virtiofsd/fuse_virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 623812c432..31b2187a15 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -205,6 +205,8 @@ static void copy_iov(struct iovec *src_iov, int src_count,
 int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
                     struct iovec *iov, int count)
 {
+    assert(ch);
+
     FVRequest *req = container_of(ch, FVRequest, ch);
     struct fv_QueueInfo *qi = ch->qi;
     VuDev *dev = &se->virtio_dev->dev;
-- 
2.19.1


