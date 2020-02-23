Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j60Oo-0001M2-0x
	for mharc-qemu-trivial@gnu.org; Sun, 23 Feb 2020 18:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j60Ol-0001IT-UV
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j60Ok-0008BW-Bi
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:55 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52362
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j60Ok-0008Al-8W
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582499453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7m6D+UrMt1IvB4PUHC/tuVd2KyfKwnkwiyt52tzSse4=;
 b=TZjCgpG/p4wB1mYkZePbgu/4OM97U+qEg0E0M6FzVyghCMHbzd5BGgSiVMP83c6temyjkk
 BSzpDNDmE06RbuJQGK8sRrQa0vFmKVs3dRz0RskHVasTSzyGC9mBv8D5ca0mhhAQVV965X
 g248yI3frZ3XZoT2hZRCMRnSuS2tnXo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-wBkG3A8bPHGTD8EwBNggLw-1; Sun, 23 Feb 2020 18:10:51 -0500
X-MC-Unique: wBkG3A8bPHGTD8EwBNggLw-1
Received: by mail-wr1-f69.google.com with SMTP id v17so4606279wrm.17
 for <qemu-trivial@nongnu.org>; Sun, 23 Feb 2020 15:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nW/Qaa/Svz2Hcu9Y8ptDu3UYVgh8gHcT0yFJ/Hvj13s=;
 b=QhWguIEb8Xbc0RQbPhUUsxBhDu4ZobHTRkHJTNGUJ8wj9N55qDfB1B/nmA471o50+p
 dvKzsBZ8q8t62fNyrWX3/fdAFONRZyV0q+i57hBU+aWL4c97Ns2dq7D/3/TeGHeuCcU9
 t2LprTz/e1smISnIXAocli2ocNZ1Cr8+TyICc6AmYQJnk39vpRdLUAtb+aRQ5pn2dkZT
 q9Xxhr/AhiSgSzYzkyopxrGVqTVqoPxHWA6V5o1+/IT18ydkJYyo1MVpEQRMmOw5TkPB
 TXsH1HA5n+YPld7vlX0o0ktAuWjFReYZI8T6A+JPdRN1Unqy+1SyXb8O26P2/6esT7Ye
 Bypw==
X-Gm-Message-State: APjAAAUWQJwFgcTBZ8LsZT3+HoWGxYVAYwpV8s7mTe/0IVSg1a4fAjnS
 ufoZGwdg7zbPiq7rnZrNRFvSZtDcE3cH17Ey/qzC8XMUDA0leDD7Ym1l9Vlz/WSXN2hthyvSZ+/
 tbNJGyC/M4oY+IJkmFA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr63988507wrs.92.1582499450480; 
 Sun, 23 Feb 2020 15:10:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzE74xSqP5DvVkbDnITnE/XN24jM+0QL4BBDLSQMAhZ9OOjtn06SjQ2AUlqKiT+dWS25wx0Aw==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr63988493wrs.92.1582499450277; 
 Sun, 23 Feb 2020 15:10:50 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r6sm15777598wrp.95.2020.02.23.15.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:10:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] hw/arm/gumstix: Use the IEC binary prefix definitions
Date: Mon, 24 Feb 2020 00:10:44 +0100
Message-Id: <20200223231044.8003-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200223231044.8003-1-philmd@redhat.com>
References: <20200223231044.8003-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Feb 2020 23:10:57 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

IEC binary prefixes ease code review: the unit is explicit.

Add a comment describing the Connex uses a Numonyx RC28F128J3F75
flash, and the Verdex uses a Micron RC28F256P30TFA.

Correct the Verdex machine description (we model the 'Pro' board).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/gumstix.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 94904d717b..ca918fda0c 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -45,18 +46,14 @@
 #include "sysemu/qtest.h"
 #include "cpu.h"
=20
-static const int sector_len =3D 128 * 1024;
+static const int sector_len =3D 128 * KiB;
=20
 static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    MemoryRegion *address_space_mem =3D get_system_memory();
=20
-    uint32_t connex_rom =3D 0x01000000;
-    uint32_t connex_ram =3D 0x04000000;
-
-    cpu =3D pxa255_init(address_space_mem, connex_ram);
+    cpu =3D pxa255_init(get_system_memory(), 64 * MiB);
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
@@ -65,7 +62,8 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
=20
-    if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
+    /* Numonyx RC28F128J3F75 */
+    if (!pflash_cfi01_register(0x00000000, "connext.rom", 16 * MiB,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
@@ -81,12 +79,8 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    MemoryRegion *address_space_mem =3D get_system_memory();
=20
-    uint32_t verdex_rom =3D 0x02000000;
-    uint32_t verdex_ram =3D 0x10000000;
-
-    cpu =3D pxa270_init(address_space_mem, verdex_ram, machine->cpu_type);
+    cpu =3D pxa270_init(get_system_memory(), 256 * MiB, machine->cpu_type)=
;
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
@@ -95,7 +89,8 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
=20
-    if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
+    /* Micron RC28F256P30TFA */
+    if (!pflash_cfi01_register(0x00000000, "verdex.rom", 32 * MiB,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
@@ -126,7 +121,7 @@ static void verdex_class_init(ObjectClass *oc, void *da=
ta)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
=20
-    mc->desc =3D "Gumstix Verdex (PXA270)";
+    mc->desc =3D "Gumstix Verdex Pro XL6P COMs (PXA270)";
     mc->init =3D verdex_init;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("pxa270-c0");
--=20
2.21.1


