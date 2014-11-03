Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlECG-0006Yx-JS
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 04:45:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlECA-0006V0-7Z
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlEC5-0008J8-Dx
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:06 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:23091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlEC3-0008Hy-Mj; Mon, 03 Nov 2014 04:45:01 -0500
Received: from 172.24.2.119 (EHLO szxeml459-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWO13454; Mon, 03 Nov 2014 17:44:57 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml459-hub.china.huawei.com
	(10.82.67.202) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Nov 2014
	17:44:48 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 3 Nov 2014 17:44:30 +0800
Message-ID: <1415007872-8228-4-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.54574E99.008D, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b15f4b24d28609fb1e1df0d95f811e60
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 3/5] spice-qemu-char: fix parameter checks
	for qemu_chr_parse_* functions
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
X-List-Received-Date: Mon, 03 Nov 2014 09:45:11 -0000

For functions qemu_chr_parse_spice_vmc and qemu_chr_parse_spice_port,
we should also check the length of parameter name, and it will help findind
the wrong configure, such as
'qemu-system-x86_64 -chardev spiceport(or spiceport),id=id,name='

Also remove the superfluous parameter checks in qemu_chr_open_spice_*

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 spice-qemu-char.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 8106e06..48ee37f 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -290,11 +290,6 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
 {
     const char **psubtype = spice_server_char_device_recognized_subtypes();
 
-    if (type == NULL) {
-        fprintf(stderr, "spice-qemu-char: missing name parameter\n");
-        print_allowed_subtypes();
-        return NULL;
-    }
     for (; *psubtype != NULL; ++psubtype) {
         if (strcmp(type, *psubtype) == 0) {
             break;
@@ -315,11 +310,6 @@ CharDriverState *qemu_chr_open_spice_port(const char *name)
     CharDriverState *chr;
     SpiceCharDriver *s;
 
-    if (name == NULL) {
-        fprintf(stderr, "spice-qemu-char: missing name parameter\n");
-        return NULL;
-    }
-
     chr = chr_open("port", spice_port_set_fe_open);
     s = chr->opaque;
     s->sin.portname = g_strdup(name);
@@ -345,8 +335,9 @@ static void qemu_chr_parse_spice_vmc(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *name = qemu_opt_get(opts, "name");
 
-    if (name == NULL) {
+    if (name == NULL || strlen(name) == 0) {
         error_setg(errp, "chardev: spice channel: no name given");
+        print_allowed_subtypes();
         return;
     }
     backend->spicevmc = g_new0(ChardevSpiceChannel, 1);
@@ -358,7 +349,7 @@ static void qemu_chr_parse_spice_port(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *name = qemu_opt_get(opts, "name");
 
-    if (name == NULL) {
+    if (name == NULL || strlen(name) == 0) {
         error_setg(errp, "chardev: spice port: no name given");
         return;
     }
-- 
1.7.12.4


