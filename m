Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c7XbI-00064O-Hx
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2016 20:04:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1c7XbF-00062t-UO
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 20:04:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1c7XbF-0002cO-3W
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 20:04:17 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1c7XbA-0002Rz-FL; Thu, 17 Nov 2016 20:04:12 -0500
Received: by mail-pg0-x242.google.com with SMTP id x23so18942755pgx.3;
	Thu, 17 Nov 2016 17:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jNJ1a7bayqp30C2XwCfnj8thv8I8AyS37FX5TYPHEEc=;
	b=hDHsXB5PB9iV3URkn5MR02lhTmT2Im4uie0NudK/eVcqv7Mh47hG/c2ISZ7nr2RDQ0
	Ko7r1w7NyJiRhwjKOS3RR9v/uDxnoLmLgdPRMrnKPQkFT7jk4V71PUawP1KSsCDPWzZN
	RQxN5qz9bLWhisfa9npbyx7YOpcWDwmclvJ6EtLglLEhR5/FWs4gvHfa5rrgwPnBU20Z
	LJRC3eR37jOm6wYCdk303bN9fB7MMGlrvv25lbSSF+t9VtAklZO+D4EenQ3rLQJDTC65
	5Y1zknkrX5QXy+FlvYCsubae+ZQsT6jaIb1IV166wr2xaJCCLceIe4q+5Q9F8B3aSqR7
	VWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jNJ1a7bayqp30C2XwCfnj8thv8I8AyS37FX5TYPHEEc=;
	b=iIe2ibqlOmK4lOrXJiWP642m58pBdZf8lc+dr/jfVobC79u4HW0Lt8+02y79rPuCLc
	dm+BdCffSMu6LdXreBwMaGJ9mcAs3zPzddmyJeOeW4ph+6m3SI9dhraEyR+H5ab9SKy6
	tAYMovgrwQ/RyFT9mdMWep3sVIaxrcfWFXXlGyA7a0CNp9nMjNt+8tf2bAGhRa7k76Is
	LUcgg9LY2rYAQ5n8PxIW8XaAxuhZ6cwIox48uHrzmjprQ/vauo4c0Lqr80JixjyNgfDO
	S5Lg8flDormAy30HyCL4FL2Tt+yRmbr3rFknxWF2zde9sifguT7TO1R4BFWYqRfoPUvd
	HyNg==
X-Gm-Message-State: ABUngvfT0Y69DLp56iDDGYLcC2q5sTXwDy9xma9IM2pDmrbB9zx+5EaRMdkTMtA/SewosA==
X-Received: by 10.99.104.68 with SMTP id d65mr13014787pgc.52.1479431049965;
	Thu, 17 Nov 2016 17:04:09 -0800 (PST)
Received: from anand.j ([117.249.174.47])
	by smtp.googlemail.com with ESMTPSA id
	k67sm11207762pfk.69.2016.11.17.17.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 17:04:09 -0800 (PST)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 18 Nov 2016 06:33:32 +0530
Message-Id: <1479431012-19914-1-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] ppc: add appropriate warning
 message for qemu_find_file() NULL return
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2016 01:04:18 -0000

Add check for qemu_find_file() NULL return and throw a warning message
can provide better visibility to the upcoming error message if any.

Signed-off-by: Anand J <anand.indukala@gmail.com>
---
 hw/ppc/e500.c         | 3 +++
 hw/ppc/mac_newworld.c | 3 +++
 hw/ppc/mac_oldworld.c | 3 +++
 hw/ppc/pnv.c          | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index cf8b122..1fec0f4 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1014,6 +1014,9 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         }
     }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
+    }
 
     bios_size = load_elf(filename, NULL, NULL, &bios_entry, &loadaddr, NULL,
                          1, PPC_ELF_MACHINE, 0, 0);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7d25106..da54436 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -217,6 +217,9 @@ static void ppc_core99_init(MachineState *machine)
     if (bios_name == NULL)
         bios_name = PROM_FILENAME;
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
+    }
     memory_region_set_readonly(bios, true);
     memory_region_add_subregion(get_system_memory(), PROM_ADDR, bios);
 
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 4479487..b9bca61 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -145,6 +145,9 @@ static void ppc_heathrow_init(MachineState *machine)
     if (bios_name == NULL)
         bios_name = PROM_FILENAME;
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
+    }
     memory_region_set_readonly(bios, true);
     memory_region_add_subregion(sysmem, PROM_ADDR, bios);
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9df7b25..282a0d0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -378,6 +378,9 @@ static void ppc_powernv_init(MachineState *machine)
     }
 
     fw_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!fw_filename) {
+        fprintf(stderr, "WARNING: failed to find %s\n", bios_name);
+    }
 
     fw_size = load_image_targphys(fw_filename, FW_LOAD_ADDR, FW_MAX_SIZE);
     if (fw_size < 0) {
-- 
2.7.4


