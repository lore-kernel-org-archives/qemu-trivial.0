Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j60Om-0001If-KO
	for mharc-qemu-trivial@gnu.org; Sun, 23 Feb 2020 18:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j60Oj-0001Hq-Ud
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j60Oi-00089H-J5
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35654
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j60Oi-00088f-Eq
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582499452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyXYVtWhp6qL8hE5dy2LdXvwOXEHU2mr4RpD1naeFOQ=;
 b=ZluuA7O41WJmekFyt9UYvHWRRMcJUEeLXR74RyJCXSKX8xZee15oKmkS41sYaRjQZ8alcu
 2teMvu99JJ4A6CKvMdg1XCC48JcBxDHCFJkGnkp+FWsSkXYJQIbXgYZnr93/Mz9ZfxwECG
 Y1NZZLCjWN/TenHsHmNQphPN+U58o/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-YxoOimQ0OcOyb8G6VQpI5A-1; Sun, 23 Feb 2020 18:10:50 -0500
X-MC-Unique: YxoOimQ0OcOyb8G6VQpI5A-1
Received: by mail-wm1-f69.google.com with SMTP id n17so1924387wmk.1
 for <qemu-trivial@nongnu.org>; Sun, 23 Feb 2020 15:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQ+Dd+23qu9EG86MqcX+Rg8VXyUHQRNEJK1Q2ZO2kEM=;
 b=XMGq/wR2gwSdxxcDGmkWGSYZl7pubxIpQsVpuq1mzmnPRcoeiu7Vz5brMBr/T3aIV6
 bXnSip6IenQFFZG0rblfWMnbXxeqRaN61QVerx6U7Lw7VtPw9EEBhi9u8WuZIkUM5pUs
 i3aSTi/CkhadxdgXvf5GSqoFSx023Cghg7XOIhKk2mXD8xESqTR6iOLQrDbSJxdZrYKB
 gpgonjRMcCk3sSVgDz1pCs2qY53BejE/LuRLdKajYAywdbBU7n4BbM3nEFPj00Vvypt3
 Lz52jr9doEOYSgVnvl/ce+5uCW70vGjCYFn7LGyW9mdjtELDYSxrAcoVA93nMH0+gOva
 N3QA==
X-Gm-Message-State: APjAAAUZgt8Rl/xGJ/RPq2d8GmVL9yCQdbKpYht+qTot3N6k9PyiGEyL
 Rm69xjUJrxQBlN8thW4k+Od8RI7Egm8sqBTuZHPvTg2eEXwTdvI0ny8bDHw9JSe6OXdr+E8Cfn7
 2fzz0/4o6mB6Avk5sUA==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr66197021wrn.152.1582499449180; 
 Sun, 23 Feb 2020 15:10:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZoQ700ID/waMVgYsmMsEiFTbrkAh6K3jfcjsVa16gmVRAtqj696JoZxW8/TlEBfZU8DnFLA==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr66196999wrn.152.1582499448921; 
 Sun, 23 Feb 2020 15:10:48 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r6sm15777598wrp.95.2020.02.23.15.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:10:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] hw/arm/gumstix: Simplify since the machines are
 little-endian only
Date: Mon, 24 Feb 2020 00:10:43 +0100
Message-Id: <20200223231044.8003-2-philmd@redhat.com>
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
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Sun, 23 Feb 2020 23:10:55 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

As the Connex and Verdex machines only boot in little-endian,
we can simplify the code.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/gumstix.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index f26a0e8010..94904d717b 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -51,7 +51,6 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    int be;
     MemoryRegion *address_space_mem =3D get_system_memory();
=20
     uint32_t connex_rom =3D 0x01000000;
@@ -66,14 +65,9 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
=20
-#ifdef TARGET_WORDS_BIGENDIAN
-    be =3D 1;
-#else
-    be =3D 0;
-#endif
     if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, be)) {
+                               sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
@@ -87,7 +81,6 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    int be;
     MemoryRegion *address_space_mem =3D get_system_memory();
=20
     uint32_t verdex_rom =3D 0x02000000;
@@ -102,14 +95,9 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
=20
-#ifdef TARGET_WORDS_BIGENDIAN
-    be =3D 1;
-#else
-    be =3D 0;
-#endif
     if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, be)) {
+                               sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
@@ -152,6 +140,9 @@ static const TypeInfo verdex_type =3D {
=20
 static void gumstix_machine_init(void)
 {
+    if (target_words_bigendian()) {
+        return;
+    }
     type_register_static(&connex_type);
     type_register_static(&verdex_type);
 }
--=20
2.21.1


