Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkNq8-000716-Hj
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 21:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNq1-0006tH-P5
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNpu-00028X-UL
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:45 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:37014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XkNpt-00023c-Mi; Fri, 31 Oct 2014 21:50:38 -0400
Received: from 172.24.2.119 (EHLO szxeml406-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBR29907; Sat, 01 Nov 2014 09:50:35 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml406-hub.china.huawei.com
	(10.82.67.93) with Microsoft SMTP Server id 14.3.158.1; Sat, 1 Nov 2014
	09:50:26 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 1 Nov 2014 09:50:03 +0800
Message-ID: <1414806603-22556-5-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 4/4] spice-qemu-char: convert open functions
	to use Error API
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
X-List-Received-Date: Sat, 01 Nov 2014 01:50:50 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 include/ui/qemu-spice.h     |  9 +++++----
 qemu-char.c                 |  4 ++--
 spice-qemu-char.c           | 10 +++++-----
 stubs/qemu-chr-open-spice.c |  4 ++--
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index a93b4b2..45a4737 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -27,7 +27,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "monitor/monitor.h"
-
+#include "qapi/error.h"
 extern int using_spice;
 
 void qemu_spice_init(void);
@@ -48,12 +48,13 @@ int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
 void do_info_spice_print(Monitor *mon, const QObject *data);
 void do_info_spice(Monitor *mon, QObject **ret_data);
 
-CharDriverState *qemu_chr_open_spice_vmc(const char *type);
+CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp);
 #if SPICE_SERVER_VERSION >= 0x000c02
-CharDriverState *qemu_chr_open_spice_port(const char *name);
+CharDriverState *qemu_chr_open_spice_port(const char *name, Error **errp);
 void qemu_spice_register_ports(void);
 #else
-static inline CharDriverState *qemu_chr_open_spice_port(const char *name)
+static inline CharDriverState *qemu_chr_open_spice_port(const char *name
+                                                        Error **errp)
 { return NULL; }
 #endif
 
diff --git a/qemu-char.c b/qemu-char.c
index 52379cc..6de6221 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -4257,10 +4257,10 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
 #endif
 #ifdef CONFIG_SPICE
     case CHARDEV_BACKEND_KIND_SPICEVMC:
-        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type);
+        chr = qemu_chr_open_spice_vmc(backend->spicevmc->type, errp);
         break;
     case CHARDEV_BACKEND_KIND_SPICEPORT:
-        chr = qemu_chr_open_spice_port(backend->spiceport->fqdn);
+        chr = qemu_chr_open_spice_port(backend->spiceport->fqdn, errp);
         break;
 #endif
     case CHARDEV_BACKEND_KIND_VC:
diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 45e7d69..b693a7d 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -286,12 +286,12 @@ static CharDriverState *chr_open(const char *subtype,
     return chr;
 }
 
-CharDriverState *qemu_chr_open_spice_vmc(const char *type)
+CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp)
 {
     const char **psubtype = spice_server_char_device_recognized_subtypes();
 
     if (type == NULL || strlen(type) == 0) {
-        fprintf(stderr, "spice-qemu-char: missing name parameter\n");
+        error_setg(errp, "spice-qemu-char: missing name parameter");
         print_allowed_subtypes();
         return NULL;
     }
@@ -301,7 +301,7 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
         }
     }
     if (*psubtype == NULL) {
-        fprintf(stderr, "spice-qemu-char: unsupported type: %s\n", type);
+        error_setg(errp, "spice-qemu-char: unsupported type: %s", type);
         print_allowed_subtypes();
         return NULL;
     }
@@ -310,13 +310,13 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
 }
 
 #if SPICE_SERVER_VERSION >= 0x000c02
-CharDriverState *qemu_chr_open_spice_port(const char *name)
+CharDriverState *qemu_chr_open_spice_port(const char *name, Error **errp)
 {
     CharDriverState *chr;
     SpiceCharDriver *s;
 
     if (name == NULL || strlen(name) == 0) {
-        fprintf(stderr, "spice-qemu-char: missing name parameter\n");
+        error_setg(errp, "spice-qemu-char: missing name parameter");
         return NULL;
     }
 
diff --git a/stubs/qemu-chr-open-spice.c b/stubs/qemu-chr-open-spice.c
index f1c4849..98ac0b7 100644
--- a/stubs/qemu-chr-open-spice.c
+++ b/stubs/qemu-chr-open-spice.c
@@ -1,13 +1,13 @@
 #include "qemu-common.h"
 #include "ui/qemu-spice.h"
 
-CharDriverState *qemu_chr_open_spice_vmc(const char *type)
+CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp)
 {
     return NULL;
 }
 
 #if SPICE_SERVER_VERSION >= 0x000c02
-CharDriverState *qemu_chr_open_spice_port(const char *name)
+CharDriverState *qemu_chr_open_spice_port(const char *name, Error **errp)
 {
     return NULL;
 }
-- 
1.7.12.4


