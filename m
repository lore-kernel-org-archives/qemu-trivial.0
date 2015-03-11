Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVktm-0006Nz-00
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 13:58:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1YVktg-0006Hz-WA
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 13:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1YVktb-0001u6-8M
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 13:58:20 -0400
Received: from mail-qc0-x233.google.com ([2607:f8b0:400d:c01::233]:39647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1YVktT-0001rj-5z; Wed, 11 Mar 2015 13:58:07 -0400
Received: by qcvs11 with SMTP id s11so12257455qcv.6;
	Wed, 11 Mar 2015 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SNp/s+/V8bQB6sWBICb6WqCItVc1FAaI8bEvwswyzPg=;
	b=LxZLItuzmpWDaS60SE5gtwp3nl3PboBEDyGjKi0F/0EvgaOlHUajZC4rveqUWwyy4Q
	v6huPbMXOTS2TpaU4S3Lrx1BDo+3F1d66Y6gp31FoOrFPHsdMpYQsj5siQm0RUUVWlpP
	QwI1lQAxYhJ3zWOXbm/dHY0EpRa1Euw4brPP4h4MRRELxqbFjNCwF292BKp0dhZb/KkJ
	xoEp1XjvSZ0HDRhmS0LGycxVAHaeA1Vq98Y5GiX06VpDiNoRXyB7D/Lv7nyaOudxV9lC
	oEg3SUDhjWgB4pL4GnFR/cVIfJLdsQJql6VgdvlAcutqwqbHwqLlxg7Aaa102UKA87IU
	Axog==
X-Received: by 10.140.148.17 with SMTP id 17mr51534630qhu.0.1426096686363;
	Wed, 11 Mar 2015 10:58:06 -0700 (PDT)
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.51])
	by mx.google.com with ESMTPSA id z78sm3009201qkg.44.2015.03.11.10.58.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 10:58:05 -0700 (PDT)
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
X-Google-Original-From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Wed, 11 Mar 2015 13:58:01 -0400
Message-Id: <1426096681-13442-1-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <5D7F9996EA547448BC6C54C8C5AAF4E5010291BAF1@CERNXCHG43.cern.ch>
References: <5D7F9996EA547448BC6C54C8C5AAF4E5010291BAF1@CERNXCHG43.cern.ch>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::233
Cc: qemu-trivial@nongnu.org, Tim.Bell@cern.ch, kvm@vger.kernel.org
Subject: [Qemu-trivial] [PATCH] smbios: add max speed comdline option for
	type-17 (meory device) structure
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
X-List-Received-Date: Wed, 11 Mar 2015 17:58:24 -0000

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---
 hw/i386/smbios.c | 10 ++++++++--
 qemu-options.hx  |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/i386/smbios.c b/hw/i386/smbios.c
index f2e9ab6..1341e02 100644
--- a/hw/i386/smbios.c
+++ b/hw/i386/smbios.c
@@ -91,6 +91,7 @@ static struct {
 
 static struct {
     const char *loc_pfx, *bank, *manufacturer, *serial, *asset, *part;
+    uint16_t speed;
 } type17;
 
 static QemuOptsList qemu_smbios_opts = {
@@ -304,6 +305,10 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
         .name = "part",
         .type = QEMU_OPT_STRING,
         .help = "part number",
+    },{
+        .name = "speed",
+        .type = QEMU_OPT_NUMBER,
+        .help = "maximum capable speed",
     },
     { /* end of list */ }
 };
@@ -697,13 +702,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     SMBIOS_TABLE_SET_STR(17, bank_locator_str, type17.bank);
     t->memory_type = 0x07; /* RAM */
     t->type_detail = cpu_to_le16(0x02); /* Other */
-    t->speed = cpu_to_le16(0); /* Unknown */
+    t->speed = cpu_to_le16(type17.speed);
     SMBIOS_TABLE_SET_STR(17, manufacturer_str, type17.manufacturer);
     SMBIOS_TABLE_SET_STR(17, serial_number_str, type17.serial);
     SMBIOS_TABLE_SET_STR(17, asset_tag_number_str, type17.asset);
     SMBIOS_TABLE_SET_STR(17, part_number_str, type17.part);
     t->attributes = 0; /* Unknown */
-    t->configured_clock_speed = cpu_to_le16(0); /* Unknown */
+    t->configured_clock_speed = t->speed; /* reuse value for max speed */
     t->minimum_voltage = cpu_to_le16(0); /* Unknown */
     t->maximum_voltage = cpu_to_le16(0); /* Unknown */
     t->configured_voltage = cpu_to_le16(0); /* Unknown */
@@ -1083,6 +1088,7 @@ void smbios_entry_add(QemuOpts *opts)
             save_opt(&type17.serial, opts, "serial");
             save_opt(&type17.asset, opts, "asset");
             save_opt(&type17.part, opts, "part");
+            type17.speed = qemu_opt_get_number(opts, "speed", 0);
             return;
         default:
             error_report("Don't know how to build fields for SMBIOS type %ld",
diff --git a/qemu-options.hx b/qemu-options.hx
index 837624d..c4f7946 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1392,7 +1392,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "              [,asset=str][,part=str]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
-    "               [,asset=str][,part=str]\n"
+    "               [,asset=str][,part=str][,speed=%d]\n"
     "                specify SMBIOS type 17 fields\n",
     QEMU_ARCH_I386)
 STEXI
@@ -1415,7 +1415,7 @@ Specify SMBIOS type 3 fields
 @item -smbios type=4[,sock_pfx=@var{str}][,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
 Specify SMBIOS type 4 fields
 
-@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
+@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}][,speed=@var{%d}]
 Specify SMBIOS type 17 fields
 ETEXI
 
-- 
2.1.0


