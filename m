Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMbGm-00034s-Qk
	for mharc-qemu-trivial@gnu.org; Wed, 27 Aug 2014 07:20:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XMbGe-0002uG-Oq
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 07:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XMbGZ-0000d1-QR
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 07:19:56 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:10393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XMbGP-0000be-2i; Wed, 27 Aug 2014 07:19:41 -0400
Received: from 172.24.2.119 (EHLO szxeml421-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAW50457; Wed, 27 Aug 2014 19:19:33 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml421-hub.china.huawei.com
	(10.82.67.160) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 27 Aug 2014 19:19:24 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 27 Aug 2014 19:18:53 +0800
Message-ID: <1409138333-12644-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, lersek@redhat.com
Subject: [Qemu-trivial] [PATCH] dump: let dump_error printf the error reason
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
X-List-Received-Date: Wed, 27 Aug 2014 11:20:01 -0000

The second parameter of dump_error is unused, but one purpose of
using this function is to report the error info.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 dump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dump.c b/dump.c
index 71d3e94..0f44e9d 100644
--- a/dump.c
+++ b/dump.c
@@ -83,6 +83,9 @@ static int dump_cleanup(DumpState *s)
 
 static void dump_error(DumpState *s, const char *reason)
 {
+    if (reason) {
+        error_report("%s", reason);
+    }
     dump_cleanup(s);
 }
 
-- 
1.7.12.4



