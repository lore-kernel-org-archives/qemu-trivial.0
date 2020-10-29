Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kY8DT-0003MX-NQ
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2020 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kY8DS-0003Ip-37; Thu, 29 Oct 2020 09:43:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kY8DP-0000Nk-Mu; Thu, 29 Oct 2020 09:43:45 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMRVJ0jfZzkbrF;
 Thu, 29 Oct 2020 21:43:36 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 21:43:27 +0800
Message-ID: <5F9AC6FF.4000301@huawei.com>
Date: Thu, 29 Oct 2020 21:43:27 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <yuval.shaia.ml@gmail.com>, <marcel.apfelbaum@gmail.com>,
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
CC: QEMU <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>, <zhengchuan@huawei.com>
Subject: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 09:43:35
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
X-List-Received-Date: Thu, 29 Oct 2020 13:43:46 -0000

When fd is not found according to ifid, the _hash_tbl_search_fd_by_ifid()
returns 0 and assigns the result to *fd, so We have to check that *fd is 0,
not that fd is 0.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index bd82abbad3..771ca01e03 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -186,7 +186,7 @@ static int hash_tbl_search_fd_by_ifid(int *fd, __be64 *gid_ifid)
     *fd = _hash_tbl_search_fd_by_ifid(gid_ifid);
     pthread_rwlock_unlock(&server.lock);

-    if (!fd) {
+    if (!*fd) {
         syslog(LOG_WARNING, "Can't find matching for ifid 0x%llx\n", *gid_ifid);
         return -ENOENT;
     }
-- 
2.19.1

