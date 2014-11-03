Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlECK-0006dq-Sy
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 04:45:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlECE-0006Y5-ST
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlEC9-0008Vt-A1
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:10 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:23081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlEC8-0008Iv-9m; Mon, 03 Nov 2014 04:45:05 -0500
Received: from 172.24.2.119 (EHLO szxeml449-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWO13450; Mon, 03 Nov 2014 17:44:56 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml449-hub.china.huawei.com
	(10.82.67.192) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Nov 2014
	17:44:47 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 3 Nov 2014 17:44:29 +0800
Message-ID: <1415007872-8228-3-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A02020A.54574E98.0190, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c9f0cdee0a4d5f0cd0daa6fa519dd80a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 2/5] qemu-char: remove unnecessary
	in-parameter check for qemu_chr_parse_pipe
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
X-List-Received-Date: Mon, 03 Nov 2014 09:45:15 -0000

The check has been done in qemu_chr_parse_pipe, so we don't need to
check it again in qemu_chr_parse_pipe.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 04d747a..e1f0e28 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1084,11 +1084,6 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
     char filename_out[CHR_MAX_FILENAME_SIZE];
     const char *filename = opts->device;
 
-    if (filename == NULL) {
-        fprintf(stderr, "chardev: pipe: no filename given\n");
-        return NULL;
-    }
-
     snprintf(filename_in, CHR_MAX_FILENAME_SIZE, "%s.in", filename);
     snprintf(filename_out, CHR_MAX_FILENAME_SIZE, "%s.out", filename);
     TFR(fd_in = qemu_open(filename_in, O_RDWR | O_BINARY));
-- 
1.7.12.4


