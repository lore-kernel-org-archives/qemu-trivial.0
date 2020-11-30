Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjico-0004ZX-5o
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 07:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kjicl-0004T6-77; Mon, 30 Nov 2020 07:49:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kjich-0000cg-0o; Mon, 30 Nov 2020 07:49:46 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cl4mj1fWfzhYQ8;
 Mon, 30 Nov 2020 20:49:09 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 20:49:23 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <eblake@redhat.com>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <qemu-block@nongnu.org>
Subject: [PATCH] qemu-nbd: Fix a memleak in qemu_nbd_client_list()
Date: Mon, 30 Nov 2020 12:36:51 +0000
Message-ID: <20201130123651.17543-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 30 Nov 2020 12:49:48 -0000

When the qio_channel_socket_connect_sync() fails
we should goto 'out' label to free the 'sioc' instead of return.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 qemu-nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index a7075c5419..47587a709e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -181,7 +181,7 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
     sioc = qio_channel_socket_new();
     if (qio_channel_socket_connect_sync(sioc, saddr, &err) < 0) {
         error_report_err(err);
-        return EXIT_FAILURE;
+        goto out;
     }
     rc = nbd_receive_export_list(QIO_CHANNEL(sioc), tls, hostname, &list,
                                  &err);
-- 
2.19.1


