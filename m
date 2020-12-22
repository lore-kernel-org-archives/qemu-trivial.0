Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kri8v-00018p-PQ
	for mharc-qemu-trivial@gnu.org; Tue, 22 Dec 2020 08:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBW-0001jW-GB; Tue, 22 Dec 2020 03:38:22 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBU-0002cX-U4; Tue, 22 Dec 2020 03:38:22 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y4dmJz7JXT;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:54 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
CC: <hunongda@huawei.com>, <alex.chen@huawei.com>,
 <hang.zhanghailiang@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH 7/9] net: Remove assignment in if condition
Date: Tue, 22 Dec 2020 16:23:38 +0800
Message-ID: <20201222082340.67405-8-zhanghan64@huawei.com>
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
X-List-Received-Date: Tue, 22 Dec 2020 08:38:22 -0000

Put the assignment before the if condition

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/tap-bsd.c     | 3 ++-
 net/tap-solaris.c | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index dc8f9c8658..d1dca793f9 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -176,7 +176,8 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
 
     if (fd < 0) {
         /* Tap device not specified or does not exist. */
-        if ((fd = tap_open_clone(ifname, ifname_size, errp)) < 0) {
+        fd = tap_open_clone(ifname, ifname_size, errp);
+        if (fd < 0) {
             return -1;
         }
     }
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index a0a5456ab6..d5af4efd60 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -105,7 +105,8 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
     strioc_ppa.ic_timout = 0;
     strioc_ppa.ic_len = sizeof(ppa);
     strioc_ppa.ic_dp = (char *)&ppa;
-    if ((ppa = ioctl(tap_fd, I_STR, &strioc_ppa)) < 0) {
+    ppa = ioctl(tap_fd, I_STR, &strioc_ppa));
+    if (ppa < 0) {
         error_report("Can't assign new interface");
     }
 
@@ -162,12 +163,14 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
         error_report("Can't set ifname to arp");
     }
 
-    if ((ip_muxid = ioctl(ip_fd, I_LINK, if_fd)) < 0) {
+    ip_muxid = ioctl(ip_fd, I_LINK, if_fd);
+    if (ip_muxid < 0) {
         error_setg(errp, "Can't link TAP device to IP");
         return -1;
     }
 
-    if ((arp_muxid = ioctl(ip_fd, link_type, arp_fd)) < 0) {
+    arp_muxid = ioctl(ip_fd, link_type, arp_fd);
+    if (arp_muxid < 0) {
         error_report("Can't link TAP device to ARP");
     }
 
-- 
2.29.1.59.gf9b6481aed


