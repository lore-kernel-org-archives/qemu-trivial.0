Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlECQ-0006nU-Sv
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 04:45:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlECH-0006ar-Ss
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlECC-000090-13
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:13 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:42287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlECB-0008Jf-9Q; Mon, 03 Nov 2014 04:45:07 -0500
Received: from 172.24.2.119 (EHLO szxeml462-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBU09725; Mon, 03 Nov 2014 17:45:00 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml462-hub.china.huawei.com
	(10.82.67.205) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Nov 2014
	17:44:40 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 3 Nov 2014 17:44:28 +0800
Message-ID: <1415007872-8228-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/5] qemu-char: fix parameter check for
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
X-List-Received-Date: Mon, 03 Nov 2014 09:45:21 -0000

For some qemu_chr_parse_* functions, we just check whether the parameter
is NULL or not, not check its length.

For example:
qemu-system-x86_64 -chardev pipe,id=id,path=
It will pass the check of NULL, and finds the error until trying
to open it.

So we should find the error by check its length, just like what
qemu_chr_parse_udp does, it will help find what exactly is wrong.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index bd0709b..04d747a 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3419,7 +3419,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *path = qemu_opt_get(opts, "path");
 
-    if (path == NULL) {
+    if (path == NULL || strlen(path) == 0) {
         error_setg(errp, "chardev: file: no filename given");
         return;
     }
@@ -3453,7 +3453,7 @@ static void qemu_chr_parse_parallel(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *device = qemu_opt_get(opts, "path");
 
-    if (device == NULL) {
+    if (device == NULL || strlen(device) == 0) {
         error_setg(errp, "chardev: parallel: no device path given");
         return;
     }
@@ -3466,7 +3466,7 @@ static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *device = qemu_opt_get(opts, "path");
 
-    if (device == NULL) {
+    if (device == NULL || strlen(device) == 0) {
         error_setg(errp, "chardev: pipe: no device path given");
         return;
     }
@@ -3515,11 +3515,11 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     SocketAddress *addr;
 
     if (!path) {
-        if (!host) {
+        if (!host || strlen(host) == 0) {
             error_setg(errp, "chardev: socket: no host given");
             return;
         }
-        if (!port) {
+        if (!port || strlen(port) == 0) {
             error_setg(errp, "chardev: socket: no port given");
             return;
         }
-- 
1.7.12.4


