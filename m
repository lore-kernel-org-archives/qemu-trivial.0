Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xlbhl-00055O-BC
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 05:51:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhZ-0004lh-NC
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhK-0005bQ-Hw
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:05 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:49429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlbhH-0005ZE-OZ; Tue, 04 Nov 2014 05:50:50 -0500
Received: from 172.24.2.119 (EHLO szxeml406-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDX70076; Tue, 04 Nov 2014 18:50:42 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml406-hub.china.huawei.com
	(10.82.67.93) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	18:50:31 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 4 Nov 2014 18:50:20 +0800
Message-ID: <1415098223-32404-3-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, armbru@redhat.com,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, kraxel@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 2/5] spice-qemu-char: fix parameter checks
	in qemu_chr_parse_* functions
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
X-List-Received-Date: Tue, 04 Nov 2014 10:51:13 -0000

For functions qemu_chr_parse_spice_vmc and qemu_chr_parse_spice_port,
we should also check if parameter name is empty, and it will help finding
the wrong configure, such as
'qemu-system-x86_64 -chardev spiceport(or spiceport),id=id,name='

After check the parameter in parse function, we can remove the
superfluous parameter checks in qemu_chr_open_spice_*

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 spice-qemu-char.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 8106e06..d3c1f5c 100644
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
@@ -345,7 +335,7 @@ static void qemu_chr_parse_spice_vmc(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *name = qemu_opt_get(opts, "name");
 
-    if (name == NULL) {
+    if (name == NULL || !name[0]) {
         error_setg(errp, "chardev: spice channel: no name given");
         return;
     }
@@ -358,7 +348,7 @@ static void qemu_chr_parse_spice_port(QemuOpts *opts, ChardevBackend *backend,
 {
     const char *name = qemu_opt_get(opts, "name");
 
-    if (name == NULL) {
+    if (name == NULL || !name[0]) {
         error_setg(errp, "chardev: spice port: no name given");
         return;
     }
-- 
1.7.12.4


