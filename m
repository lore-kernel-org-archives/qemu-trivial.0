Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlbhX-0004gz-VO
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 05:51:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhR-0004el-8e
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhK-0005bY-J7
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:50:57 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:49428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlbhJ-0005ZC-UK; Tue, 04 Nov 2014 05:50:50 -0500
Received: from 172.24.2.119 (EHLO SZXEML453-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDX70073; Tue, 04 Nov 2014 18:50:41 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML453-HUB.china.huawei.com
	(10.82.67.196) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	18:50:34 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 4 Nov 2014 18:50:23 +0800
Message-ID: <1415098223-32404-6-git-send-email-zhang.zhanghailiang@huawei.com>
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
Subject: [Qemu-trivial] [PATCH v3 5/5] spice-qemu-char: convert some
	functions to use Error API
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
X-List-Received-Date: Tue, 04 Nov 2014 10:51:02 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 include/ui/qemu-spice.h     |  2 +-
 qemu-char.c                 |  2 +-
 spice-qemu-char.c           | 12 ++++++------
 stubs/qemu-chr-open-spice.c |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index a93b4b2..33882aa 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -48,7 +48,7 @@ int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
 void do_info_spice_print(Monitor *mon, const QObject *data);
 void do_info_spice(Monitor *mon, QObject **ret_data);
 
-CharDriverState *qemu_chr_open_spice_vmc(const char *type);
+CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp);
 #if SPICE_SERVER_VERSION >= 0x000c02
 CharDriverState *qemu_chr_open_spice_port(const char *name);
 void qemu_spice_register_ports(void);
diff --git a/qemu-char.c b/qemu-char.c
index a1d25c7..df24c65 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -4256,7 +4256,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
 #endif
 #ifdef CONFIG_SPICE
     case CHARDEV_BACKEND_KIND_SPICEVMC:
-        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type);
+        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type, errp);
         break;
     case CHARDEV_BACKEND_KIND_SPICEPORT:
         chr = qemu_chr_open_spice_port(backend->spiceport->fqdn);
diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index d3c1f5c..721c895 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -249,16 +249,16 @@ static void print_allowed_subtypes(void)
     const char** psubtype;
     int i;
 
-    fprintf(stderr, "allowed names: ");
+    error_printf("allowed names: ");
     for(i=0, psubtype = spice_server_char_device_recognized_subtypes();
         *psubtype != NULL; ++psubtype, ++i) {
         if (i == 0) {
-            fprintf(stderr, "%s", *psubtype);
+            error_printf("%s", *psubtype);
         } else {
-            fprintf(stderr, ", %s", *psubtype);
+            error_printf(", %s", *psubtype);
         }
     }
-    fprintf(stderr, "\n");
+    error_printf("\n");
 }
 
 static CharDriverState *chr_open(const char *subtype,
@@ -286,7 +286,7 @@ static CharDriverState *chr_open(const char *subtype,
     return chr;
 }
 
-CharDriverState *qemu_chr_open_spice_vmc(const char *type)
+CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp)
 {
     const char **psubtype = spice_server_char_device_recognized_subtypes();
 
@@ -296,7 +296,7 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
         }
     }
     if (*psubtype == NULL) {
-        fprintf(stderr, "spice-qemu-char: unsupported type: %s\n", type);
+        error_setg(errp, "spice-qemu-char: unsupported type: %s", type);
         print_allowed_subtypes();
         return NULL;
     }
diff --git a/stubs/qemu-chr-open-spice.c b/stubs/qemu-chr-open-spice.c
index f1c4849..55826ed 100644
--- a/stubs/qemu-chr-open-spice.c
+++ b/stubs/qemu-chr-open-spice.c
@@ -1,7 +1,7 @@
 #include "qemu-common.h"
 #include "ui/qemu-spice.h"
 
-CharDriverState *qemu_chr_open_spice_vmc(const char *type)
+CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp)
 {
     return NULL;
 }
-- 
1.7.12.4


