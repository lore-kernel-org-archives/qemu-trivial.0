Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kY12Z-0002gN-Km
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2020 02:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kY12W-0002fg-VH; Thu, 29 Oct 2020 02:04:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kY12V-0006SI-0B; Thu, 29 Oct 2020 02:04:00 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMFHw3RF2zhYkF;
 Thu, 29 Oct 2020 14:03:56 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 14:03:52 +0800
Message-ID: <5F9A5B48.9030509@huawei.com>
Date: Thu, 29 Oct 2020 14:03:52 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Raphael Norwitz <raphael.s.norwitz@gmail.com>, QEMU
 <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH V2] vhost-user-blk/scsi: Fix broken error handling for socket
 call
References: <5F997B84.9040900@huawei.com>
In-Reply-To: <5F997B84.9040900@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 02:03:54
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Oct 2020 06:04:01 -0000

When socket() fails, it returns -1, 0 is the normal return value and should not return error.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c   | 2 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index 25eccd02b5..40a2dfc544 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -474,7 +474,7 @@ static int unix_sock_new(char *unix_fn)
     assert(unix_fn);

     sock = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (sock <= 0) {
+    if (sock < 0) {
         perror("socket");
         return -1;
     }
diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 3c912384e9..0f9ba4b2a2 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -320,7 +320,7 @@ static int unix_sock_new(char *unix_fn)
     assert(unix_fn);

     sock = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (sock <= 0) {
+    if (sock < 0) {
         perror("socket");
         return -1;
     }
-- 
2.19.1

