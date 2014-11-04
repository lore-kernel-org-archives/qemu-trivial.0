Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlbhZ-0004kW-EW
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 05:51:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhU-0004ep-3x
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhP-0005ce-22
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:00 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:6077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlbhN-0005ZP-No; Tue, 04 Nov 2014 05:50:55 -0500
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBV45018; Tue, 04 Nov 2014 18:50:41 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	18:50:30 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 4 Nov 2014 18:50:19 +0800
Message-ID: <1415098223-32404-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, armbru@redhat.com,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, kraxel@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 1/5] qemu-char: fix parameter check in
	some qemu_chr_parse_* functions
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
X-List-Received-Date: Tue, 04 Nov 2014 10:51:04 -0000

For some qemu_chr_parse_* functions, we just check whether the parameter
is NULL or not, but do not check if it is empty.

For example:
qemu-system-x86_64 -chardev pipe,id=id,path=
It will pass the check of NULL but will not find the error until
trying to open it, while essentially missing and empty parameter
is the same thing.

So check the parameters for emptiness too, and avoid emptiness
check at open time.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index bd0709b..a09bbf6 100644
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
@@ -3419,7 +3414,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *path = qemu_opt_get(opts, "path");
 
-    if (path == NULL) {
+    if (path == NULL || !path[0]) {
         error_setg(errp, "chardev: file: no filename given");
         return;
     }
@@ -3453,7 +3448,7 @@ static void qemu_chr_parse_parallel(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *device = qemu_opt_get(opts, "path");
 
-    if (device == NULL) {
+    if (device == NULL || !device[0]) {
         error_setg(errp, "chardev: parallel: no device path given");
         return;
     }
@@ -3466,7 +3461,7 @@ static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *device = qemu_opt_get(opts, "path");
 
-    if (device == NULL) {
+    if (device == NULL || !device[0]) {
         error_setg(errp, "chardev: pipe: no device path given");
         return;
     }
@@ -3515,11 +3510,11 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     SocketAddress *addr;
 
     if (!path) {
-        if (!host) {
+        if (!host || !host[0]) {
             error_setg(errp, "chardev: socket: no host given");
             return;
         }
-        if (!port) {
+        if (!port || !port[0]) {
             error_setg(errp, "chardev: socket: no port given");
             return;
         }
-- 
1.7.12.4


