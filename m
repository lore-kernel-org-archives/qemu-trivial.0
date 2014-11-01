Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkNq6-0006w1-0i
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 21:50:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNpz-0006s0-6A
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNps-000249-K9
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:43 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:18665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XkNpr-000202-MF; Fri, 31 Oct 2014 21:50:36 -0400
Received: from 172.24.2.119 (EHLO szxeml456-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWL33047; Sat, 01 Nov 2014 09:50:30 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml456-hub.china.huawei.com
	(10.82.67.199) with Microsoft SMTP Server id 14.3.158.1; Sat, 1 Nov 2014
	09:50:24 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 1 Nov 2014 09:50:00 +0800
Message-ID: <1414806603-22556-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.54543C67.00B2, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fae15f0533c1a452026d8ef5bda035e7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 1/4] qemu-char: fix parameter check for
	qemu_chr_open_pipe
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
X-List-Received-Date: Sat, 01 Nov 2014 01:50:48 -0000

The filename parameter never to be NULL, because in qemu_chr_parse_pipe
it is return value of g_strdup(device), where device will not be
NULL.

We should check its length.
After this patch, when run command:
 qemu-system-x86_64 -chardev pipe,id=pipe1,path=
It will report error:
 chardev: pipe: no filename given

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index bd0709b..42b1d8f 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1084,7 +1084,7 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
     char filename_out[CHR_MAX_FILENAME_SIZE];
     const char *filename = opts->device;
 
-    if (filename == NULL) {
+    if (filename == NULL || strlen(filename) == 0) {
         fprintf(stderr, "chardev: pipe: no filename given\n");
         return NULL;
     }
-- 
1.7.12.4


