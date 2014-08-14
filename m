Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv32-00026v-WA
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWl-00063d-GY
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWg-0006Te-M0
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:51 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpWV-0006RU-Gb; Thu, 14 Aug 2014 03:32:36 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11818; Thu, 14 Aug 2014 15:30:56 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:52 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:13 +0800
Message-ID: <1408001361-13580-3-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 02/10] monitor: fix access freed memory
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 07:32:59 -0000

The function monitor_fdset_dup_fd_find_remove() references member of 'mon_fdset'
which may be freed in function monitor_fdset_cleanup()

Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 monitor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index cdbaa60..42ba1b6 100644
--- a/monitor.c
+++ b/monitor.c
@@ -2533,8 +2533,10 @@ static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
 {
     MonFdset *mon_fdset;
     MonFdsetFd *mon_fdset_fd_dup;
+    int64_t id = -1;
 
     QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+        id = mon_fdset->id;
         QLIST_FOREACH(mon_fdset_fd_dup, &mon_fdset->dup_fds, next) {
             if (mon_fdset_fd_dup->fd == dup_fd) {
                 if (remove) {
@@ -2543,7 +2545,7 @@ static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
                         monitor_fdset_cleanup(mon_fdset);
                     }
                 }
-                return mon_fdset->id;
+                return id;
             }
         }
     }
-- 
1.7.12.4



