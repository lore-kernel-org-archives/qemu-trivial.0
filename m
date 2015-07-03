Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB2Dj-0001wH-4M
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 10:45:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZB2Dd-0001u8-AU
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZB2DY-000504-AQ
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:45:33 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:35066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>)
	id 1ZB2DT-0004uY-QA; Fri, 03 Jul 2015 10:45:23 -0400
Received: by wiga1 with SMTP id a1so179857054wig.0;
	Fri, 03 Jul 2015 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=mmxi08gq7PrPH9rkDK/WoYLj6yEXePHlQ7onsens8hM=;
	b=cld1CbDrpBuNphGndRQH55VG+lOqJWrJuKaifq6BNvy7dAEah46K/iF35x2o7e2eAQ
	ZzvARqeQTogP7LsRimhShPNojih96U+MOMjCX94GV5OF7B29Dz0aQKLvdfF473yhqjdo
	t6+2vDMOX0WS/iNVIh8oQ2Uq1hN5MdNEB3K/OEgcHSRQD3j+PeWnqhVcAmMbjHYB8QMZ
	gmyvdlHShbt3A/RbmHSIJ0SQHQNR1UcmJ6zQGvJyBM7IkuwKXsALiO+uHcDdW8PbB9MT
	9dXImbhMBsMc5jKpmE/9B6CrXGy/qA3RiW/Za5+WrYEiz52cmD1sSDC5EBam5nVM31j7
	6Sqg==
X-Received: by 10.194.11.73 with SMTP id o9mr70121901wjb.116.1435934723159;
	Fri, 03 Jul 2015 07:45:23 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org (94-21-30-178.pool.digikabel.hu.
	[94.21.30.178])
	by mx.google.com with ESMTPSA id o9sm1406854wiy.19.2015.07.03.07.45.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Jul 2015 07:45:22 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
	<dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
	<DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 Jul 2015 16:45:36 +0200
Message-Id: <19df383991831bad31163fa0053f996284eeedec.1435934626.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] opts: produce valid command line in
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
X-List-Received-Date: Fri, 03 Jul 2015 14:45:37 -0000

This will let us print options in a format that the user would actually
write it on the command line (foo=bar,baz=asd,etc=def), without
prepending a spurious comma at the beginning of the list, or quoting
values unnecessarily.  This patch provides the following changes:
* write and id=, if the option has an id
* do not print separator before the first element
* do not quote string arguments
* properly escape commas (,) for QEMU

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---

Change from v1:
* updated escaped_print as suggested by Markus

 block.c            |  2 +-
 util/qemu-option.c | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 4 deletions(-)

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
index efe9d27..e54ac0d 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -730,14 +730,35 @@ void qemu_opts_del(QemuOpts *opts)
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
+            putchar(',');
+        }
+        putchar(*ptr);
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
@@ -750,13 +771,15 @@ void qemu_opts_print(QemuOpts *opts, const char *sep)
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


