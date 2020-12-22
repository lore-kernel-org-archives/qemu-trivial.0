Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kri8v-00018D-Ik
	for mharc-qemu-trivial@gnu.org; Tue, 22 Dec 2020 08:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBU-0001iQ-SG; Tue, 22 Dec 2020 03:38:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBR-0002cZ-Uu; Tue, 22 Dec 2020 03:38:20 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y4qPJz7JYV;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:54 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
CC: <hunongda@huawei.com>, <alex.chen@huawei.com>,
 <hang.zhanghailiang@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH 8/9] net: Remove initialization of static ints
Date: Tue, 22 Dec 2020 16:23:39 +0800
Message-ID: <20201222082340.67405-9-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201222082340.67405-1-zhanghan64@huawei.com>
References: <20201222082340.67405-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhanghan64@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:59 -0500
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
X-List-Received-Date: Tue, 22 Dec 2020 08:38:21 -0000

Do not initialise statics to 0 or NULL

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/tap-solaris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index d5af4efd60..0b4f709abc 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -63,10 +63,10 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     /* FIXME leaks like a sieve on error paths */
     /* FIXME suspicious: many errors are reported, then ignored */
     int tap_fd, if_fd, ppa = -1;
-    static int ip_fd = 0;
+    static int ip_fd;
     char *ptr;
 
-    static int arp_fd = 0;
+    static int arp_fd;
     int ip_muxid, arp_muxid;
     struct strioctl  strioc_if, strioc_ppa;
     int link_type = I_PLINK;
-- 
2.29.1.59.gf9b6481aed


