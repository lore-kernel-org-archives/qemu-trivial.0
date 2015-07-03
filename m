Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB12x-0007KD-M8
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 09:30:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZAzKJ-0005N1-IP
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 07:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZAzKI-0004ss-Et
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 07:40:15 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:33879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>)
	id 1ZAzKA-0004k2-Od; Fri, 03 Jul 2015 07:40:06 -0400
Received: by wiar9 with SMTP id r9so128566632wia.1;
	Fri, 03 Jul 2015 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=OJ5+T7UT/F1W4N4b1YsKUw/kA4mPiVEk+kVf9jVSpGE=;
	b=W0rOfADdFXG9NNuXmnWHL/muA+ha0opYI86bsNzSgRhtKaXrlKkUTPFgWkGzA4dtBP
	9ZqagG3THzPhlSUhRRU2NXdGwZOdpcjiqnCuU9Cey3b/6rN/se259wWXhc3qRs78M9z+
	RVCJa1rszqFOYi7pa1pUDpl7EpvnyARSwA6GxksOm07g6A2SpW0HcubiabZqQDtS2dbF
	sDqyIRhx3zrDcNOGfUnroAd3d/QcPr3hHtT+BbGYuUSq+08X3gs7huJgSCVjrW/DAC0F
	Y4oN7EeAVhI6e9Gjq3x4qoQTRGCUdsP0T0aUZcZsS6lhUblQ9pe/WVXb+yZiDy3az10O
	p/pA==
X-Received: by 10.180.205.139 with SMTP id lg11mr26126895wic.62.1435923605767; 
	Fri, 03 Jul 2015 04:40:05 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org (94-21-30-178.pool.digikabel.hu.
	[94.21.30.178])
	by mx.google.com with ESMTPSA id lq14sm7474026wic.3.2015.07.03.04.40.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Jul 2015 04:40:04 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
	<dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
	<DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 Jul 2015 13:40:19 +0200
Message-Id: <c7aaec779e13932db2c7dd4cce2700b41f162092.1435923273.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
X-Mailman-Approved-At: Fri, 03 Jul 2015 09:30:26 -0400
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>
Subject: [Qemu-trivial] [PATCH] opts: produce valid command line in
	qemu_opts_print
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
X-List-Received-Date: Fri, 03 Jul 2015 11:40:16 -0000

This will let us print options in a format that the user would actually
write it on the command line (foo=bar,baz=asd,etc=def), without
prepending a spurious comma at the beginning of the list, or quoting
values unnecessarily.  This patch provides the following changes:
* write and id=, if the option has an id
* do not print separator before the first element
* do not quote string arguments
* properly escape commas (,) for QEMU

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---

Changes from patch submitted as part of `qapi flattening':
* no longer tries to do proper escaping for the shell

 block.c            |  2 +-
 util/qemu-option.c | 30 +++++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 7e130cc..78a5304 100644
--- a/block.c
+++ b/block.c
@@ -3813,7 +3813,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
     }
 
     if (!quiet) {
-        printf("Formatting '%s', fmt=%s", filename, fmt);
+        printf("Formatting '%s', fmt=%s ", filename, fmt);
         qemu_opts_print(opts, " ");
         puts("");
     }
diff --git a/util/qemu-option.c b/util/qemu-option.c
index efe9d27..55ef172 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -730,14 +730,36 @@ void qemu_opts_del(QemuOpts *opts)
     g_free(opts);
 }
 
-void qemu_opts_print(QemuOpts *opts, const char *sep)
+/* print value, escaping any commas in value */
+static void escaped_print(const char *value)
+{
+    const char *ptr;
+
+    for (ptr = value; *ptr; ++ptr) {
+        if (*ptr == ',') {
+            printf(",,");
+        } else {
+            putchar(*ptr);
+        }
+    }
+}
+
+void qemu_opts_print(QemuOpts *opts, const char *separator)
 {
     QemuOpt *opt;
     QemuOptDesc *desc = opts->list->desc;
+    const char *sep = "";
+
+    if (opts->id) {
+        printf("id=%s", opts->id); /* passed id_wellformed -> no commas */
+        sep = separator;
+    }
 
     if (desc[0].name == NULL) {
         QTAILQ_FOREACH(opt, &opts->head, next) {
-            printf("%s%s=\"%s\"", sep, opt->name, opt->str);
+            printf("%s%s=", sep, opt->name);
+            escaped_print(opt->str);
+            sep = separator;
         }
         return;
     }
@@ -750,13 +772,15 @@ void qemu_opts_print(QemuOpts *opts, const char *sep)
             continue;
         }
         if (desc->type == QEMU_OPT_STRING) {
-            printf("%s%s='%s'", sep, desc->name, value);
+            printf("%s%s=", sep, desc->name);
+            escaped_print(value);
         } else if ((desc->type == QEMU_OPT_SIZE ||
                     desc->type == QEMU_OPT_NUMBER) && opt) {
             printf("%s%s=%" PRId64, sep, desc->name, opt->value.uint);
         } else {
             printf("%s%s=%s", sep, desc->name, value);
         }
+        sep = separator;
     }
 }
 
-- 
2.4.5


