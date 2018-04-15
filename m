Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKm-0006KU-Br
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKj-0006Hn-SG
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKi-0001fh-FG
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:21 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKi-0001fS-9e; Sun, 15 Apr 2018 19:45:20 -0400
Received: by mail-qk0-x241.google.com with SMTP id a202so1990683qkg.3;
	Sun, 15 Apr 2018 16:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a4c67tmuJ03bQjWgEytgT09SBUdt4htdXGejh+TVX34=;
	b=AVecKybPhFfE9CSFvg6BxtwCF4xuW2Is1pvMIs9m6e1gyW++/Y2FMdPj61Q7ILSwtp
	3C+AIm2nn1ZFseFYIh85vMYI9DK7hTphJXcXu5X6IPKMwzK+M4H4M8MVuoZoP8p5mmhM
	iBJGxsYD0flcTMCGMEoIOS1D+oja/Ithk56avCfLsnA6NPBE0QpmTFlL5FzduxSphoDC
	EU8LdUDLtDdyjgGQG4vB91PzZMtQ8BBuBgBIsJ7mlq7WA4FjrQJyDrbPidpsiKk0qyXZ
	kZFvVEythApEdj9IrhwgNhEpAzks8V6jwrESBfJYyp/eYPCVeQ+3DOOjHMOBf17zLmKN
	e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=a4c67tmuJ03bQjWgEytgT09SBUdt4htdXGejh+TVX34=;
	b=qWOciowzmkEfobYaRPzvrFLJIIURYq4YQdLqBBqbnl3ohsABzKbfOXDbJc2SYBgY12
	38dI1nawVtPrGeWbrwbqvKrzcAZIGcoW6NhUrjXkGb3mv4g8JXA57eLQMyXDHgOAf9ND
	T4WjOOnHLATG1LeTxVdKG1cv9UnYxgd+2BHwHy2bhHWuF19jILLx8O9nkq/V99it+mhZ
	uNXBLVkepSPtfzDoV3YtuD3dVtTLh4S7aVblcapdr3DiYStWI+NEt2x4R/I2FSEzoV5P
	GZYvX6yNwKagN7ClwqR1mcVsNO1CXyAryr+JLG6WqAxSCzMyn3Tfi2Ee0AGhbytJbk67
	Gn6A==
X-Gm-Message-State: ALQs6tDHZt2MfwcdPZ3/odre6POlYkt7C/+/VS2vbA6YSTfTY9DIKQ+o
	JDdt/C5geK+Z+P2nygtzzJo+HQoKgtw=
X-Google-Smtp-Source: AIpwx49sljx9l0ap8n3EdGZ1Gw8rAzEqL9IlxVO3j40JWVeZ3O25jm14fDrbX3pZrc2zpmoXS/BDzQ==
X-Received: by 10.55.25.196 with SMTP id 65mr14973736qkz.64.1523835919656;
	Sun, 15 Apr 2018 16:45:19 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Date: Sun, 15 Apr 2018 20:43:02 -0300
Message-Id: <20180415234307.28132-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 36/41] hw/vfio: Use the BYTE-based
 definitions
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:23 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/vfio/pci-quirks.c | 9 +++++----
 hw/vfio/pci.c        | 3 ++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index e5779a7ad3..4fa181a977 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
@@ -1255,9 +1256,9 @@ static int vfio_igd_gtt_max(VFIOPCIDevice *vdev)
         ggms = 1 << ggms;
     }
 
-    ggms *= 1024 * 1024;
+    ggms *= M_BYTE;
 
-    return (ggms / (4 * 1024)) * (gen < 8 ? 4 : 8);
+    return (ggms / (4 * K_BYTE)) * (gen < 8 ? 4 : 8);
 }
 
 /*
@@ -1514,7 +1515,7 @@ static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     igd->vdev = vdev;
     igd->index = ~0;
     igd->bdsm = vfio_pci_read_config(&vdev->pdev, IGD_BDSM, 4);
-    igd->bdsm &= ~((1 << 20) - 1); /* 1MB aligned */
+    igd->bdsm &= ~((1 * M_BYTE) - 1); /* 1MB aligned */
 
     memory_region_init_io(&quirk->mem[0], OBJECT(vdev), &vfio_igd_index_quirk,
                           igd, "vfio-igd-index-quirk", 4);
@@ -1561,7 +1562,7 @@ static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
      * config offset 0x5C.
      */
     bdsm_size = g_malloc(sizeof(*bdsm_size));
-    *bdsm_size = cpu_to_le64((ggms_mb + gms_mb) * 1024 * 1024);
+    *bdsm_size = cpu_to_le64((ggms_mb + gms_mb) * M_BYTE);
     fw_cfg_add_file(fw_cfg_find(), "etc/igd-bdsm-size",
                     bdsm_size, sizeof(*bdsm_size));
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index b9bc6cd310..fb9450b3a4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -28,6 +28,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/range.h"
+#include "qemu/units.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
 #include "pci.h"
@@ -1417,7 +1418,7 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
     }
 
     /* 2GB max size for 32-bit BARs, cannot double if already > 1G */
-    if (vdev->bars[target_bar].size > (1 * 1024 * 1024 * 1024) &&
+    if (vdev->bars[target_bar].size > 1 * G_BYTE &&
         !vdev->bars[target_bar].mem64) {
         error_setg(errp, "Invalid MSI-X relocation BAR %d, "
                    "no space to extend 32-bit BAR", target_bar);
-- 
2.17.0


