Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjz7o-0002Cu-0k
	for mharc-qemu-trivial@gnu.org; Tue, 01 Dec 2020 01:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kjz7j-0002CO-VW; Tue, 01 Dec 2020 01:26:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kjz7h-0001oB-Ie; Tue, 01 Dec 2020 01:26:51 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ClXDK2VDSz76jj;
 Tue,  1 Dec 2020 14:26:09 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Dec 2020
 14:26:24 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <eblake@redhat.com>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <qemu-block@nongnu.org>
Subject: [PATCH] qemu-nbd: Fix a memleak in nbd_client_thread()
Date: Tue, 1 Dec 2020 06:13:49 +0000
Message-ID: <20201201061349.110262-1-alex.chen@huawei.com>
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
X-List-Received-Date: Tue, 01 Dec 2020 06:26:53 -0000

When the qio_channel_socket_connect_sync() fails
we should goto 'out_socket' label to free the 'sioc' instead of
goto 'out' label.
In addition, now the 'out' label is useless, delete it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 qemu-nbd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 47587a709e..643b0777c0 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -275,7 +275,7 @@ static void *nbd_client_thread(void *arg)
                                         saddr,
                                         &local_error) < 0) {
         error_report_err(local_error);
-        goto out;
+        goto out_socket;
     }
 
     ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
@@ -325,7 +325,6 @@ out_fd:
     close(fd);
 out_socket:
     object_unref(OBJECT(sioc));
-out:
     g_free(info.name);
     kill(getpid(), SIGTERM);
     return (void *) EXIT_FAILURE;
-- 
2.19.1


