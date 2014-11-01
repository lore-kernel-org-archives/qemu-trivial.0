Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkNq7-0006xZ-5h
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 21:50:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNq0-0006sP-6Q
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNpu-00028J-Ha
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:43 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:61864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XkNpt-00022s-KK; Fri, 31 Oct 2014 21:50:38 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDT51032; Sat, 01 Nov 2014 09:50:34 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1; Sat, 1 Nov 2014
	09:50:24 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 1 Nov 2014 09:50:01 +0800
Message-ID: <1414806603-22556-3-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 2/4] spice-qemu-char: fix check for
	in-parameter
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
X-List-Received-Date: Sat, 01 Nov 2014 01:50:49 -0000

For qemu_chr_open_spice_vmc and qemu_chr_open_spice_port, the in-parameter
never to be NULL, because the checks in qemu_chr_parse_spice_vmc
and qemu_chr_parse_spice_port have ensured this.

So we should check the length of the in-parameter.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 spice-qemu-char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 8106e06..45e7d69 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -290,7 +290,7 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
 {
     const char **psubtype = spice_server_char_device_recognized_subtypes();
 
-    if (type == NULL) {
+    if (type == NULL || strlen(type) == 0) {
         fprintf(stderr, "spice-qemu-char: missing name parameter\n");
         print_allowed_subtypes();
         return NULL;
@@ -315,7 +315,7 @@ CharDriverState *qemu_chr_open_spice_port(const char *name)
     CharDriverState *chr;
     SpiceCharDriver *s;
 
-    if (name == NULL) {
+    if (name == NULL || strlen(name) == 0) {
         fprintf(stderr, "spice-qemu-char: missing name parameter\n");
         return NULL;
     }
-- 
1.7.12.4


