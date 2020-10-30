Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYKRc-0003sg-S3
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2020 22:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYKRc-0003sV-0p; Thu, 29 Oct 2020 22:47:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYKRZ-0002YO-OA; Thu, 29 Oct 2020 22:47:11 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMmtL2Czgz15Nmp;
 Fri, 30 Oct 2020 10:47:06 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 30 Oct 2020 10:46:55 +0800
Message-ID: <5F9B7E9F.8050004@huawei.com>
Date: Fri, 30 Oct 2020 10:46:55 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <jasowang@redhat.com>
CC: QEMU <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>, <zhengchuan@huawei.com>
Subject: [PATCH] net/l2tpv3: Remove redundant check in net_init_l2tpv3()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 20:41:14
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
X-List-Received-Date: Fri, 30 Oct 2020 02:47:12 -0000

The result has been checked to be NULL before, it cannot be NULL here,
so the check is redundant. Remove it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 net/l2tpv3.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 55fea17c0f..e4d4218db6 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -655,9 +655,8 @@ int net_init_l2tpv3(const Netdev *netdev,
         error_setg(errp, "could not bind socket err=%i", errno);
         goto outerr;
     }
-    if (result) {
-        freeaddrinfo(result);
-    }
+
+    freeaddrinfo(result);

     memset(&hints, 0, sizeof(hints));

@@ -686,9 +685,7 @@ int net_init_l2tpv3(const Netdev *netdev,
     memcpy(s->dgram_dst, result->ai_addr, result->ai_addrlen);
     s->dst_size = result->ai_addrlen;

-    if (result) {
-        freeaddrinfo(result);
-    }
+    freeaddrinfo(result);

     if (l2tpv3->has_counter && l2tpv3->counter) {
         s->has_counter = true;
-- 
2.19.1

