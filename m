Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSm-0006LJ-QG
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSj-0006HC-8Y
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSi-0003jm-D7
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:37 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:34551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSg-0003gx-5n; Sun, 10 Jun 2018 21:17:34 -0400
Received: by mail-qk0-x236.google.com with SMTP id q70-v6so12083003qke.1;
	Sun, 10 Jun 2018 18:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FHamKv4AfT+EvThBowUaI0R0XC/vymACKWtW42qttts=;
	b=T24WoXcnDMjAsuh11Piq6ZtYUIMgWy1qxcycodjPRt2qHdSkT7FzDPCYjfCRb4jkj6
	CqDlsAzmrlq4RepuOctKV8gkxsKt1pCFsXyhG5jnOvRB51I3KK4YPhZ8DDaZDcq0CZpI
	AZzt9A4YGNE+WOYKYJHuYsn9cUIGOsa5A1Of0ZI7016MfyKGlA2S16wN+GXxpwEzEPr7
	4mZnh94WImPEqS6t588MiJd1Fm8VGqB/4h6eFFzz4ByXv+y9uMOvJMw5LcmtFERPJ1SY
	x3Y7I9INKqjSiFWS3qwsFjvAgLWljmSnxYz1E6iE0J4KucbMsbMjxuBt/hRzYMRJSmzz
	zqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FHamKv4AfT+EvThBowUaI0R0XC/vymACKWtW42qttts=;
	b=Nvgo6plA5qXL5f2g8wCRyo8MTGVQXs4YKTAEbWTeiPViTkSPSK2qpF7oNrrKfoJBmT
	isc2VF2ZUtvWJpd+B4SuT5TRwWk264cFqqKpbgemvd+/pU/TLOzFHsx+koJ23qxGgDvC
	rIlkX8hj8s2eaPvhtunbwBlFucxgH4AIgaVoPR7Eq9VxbvyEKSs2p3C6S5DmlwpcotkR
	OPbiTy1bLZ9XNeG0/CGMWBzqjayjMz/pee52VRqgzFTwSaFfLdXjPnRpo3ZPGGf9fUcv
	d/u/B96sHO8cFzUyinNiJVhdPKzN6+k4y6J1Iviyjbr/zCgmrFbL2/DK3Hdc4/grmXQj
	KaQw==
X-Gm-Message-State: APt69E2Mqd1VF7fXPzPgFc588UK0zgEHnzKvVeaIQO0NjRYfK71wQ4sJ
	nvxn6rZoiY31V7MFOW1HhrA=
X-Google-Smtp-Source: ADUXVKL8qmx9HCWzTzTG1wBV2sGRnxQ1uT4x20N2xLHmmXwh/FVny1TCrtS7A3I7E6I/89jq+N5GfQ==
X-Received: by 2002:a37:9543:: with SMTP id
	x64-v6mr12623725qkd.368.1528679853702; 
	Sun, 10 Jun 2018 18:17:33 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>
Date: Sun, 10 Jun 2018 22:14:58 -0300
Message-Id: <20180611011501.10235-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: [Qemu-trivial] [PATCH v4 37/40] hw/vfio: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:38 -0000

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
index 061259b86b..481fd08df7 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -1448,9 +1449,9 @@ static int vfio_igd_gtt_max(VFIOPCIDevice *vdev)
         ggms = 1 << ggms;
     }
 
-    ggms *= 1024 * 1024;
+    ggms *= MiB;
 
-    return (ggms / (4 * 1024)) * (gen < 8 ? 4 : 8);
+    return (ggms / (4 * KiB)) * (gen < 8 ? 4 : 8);
 }
 
 /*
@@ -1705,7 +1706,7 @@ static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     igd->vdev = vdev;
     igd->index = ~0;
     igd->bdsm = vfio_pci_read_config(&vdev->pdev, IGD_BDSM, 4);
-    igd->bdsm &= ~((1 << 20) - 1); /* 1MB aligned */
+    igd->bdsm &= ~((1 * MiB) - 1); /* 1MB aligned */
 
     memory_region_init_io(&quirk->mem[0], OBJECT(vdev), &vfio_igd_index_quirk,
                           igd, "vfio-igd-index-quirk", 4);
@@ -1752,7 +1753,7 @@ static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
      * config offset 0x5C.
      */
     bdsm_size = g_malloc(sizeof(*bdsm_size));
-    *bdsm_size = cpu_to_le64((ggms_mb + gms_mb) * 1024 * 1024);
+    *bdsm_size = cpu_to_le64((ggms_mb + gms_mb) * MiB);
     fw_cfg_add_file(fw_cfg_find(), "etc/igd-bdsm-size",
                     bdsm_size, sizeof(*bdsm_size));
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 18c493b49e..a1577dea7f 100644
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
+    if (vdev->bars[target_bar].size > 1 * GiB &&
         !vdev->bars[target_bar].mem64) {
         error_setg(errp, "Invalid MSI-X relocation BAR %d, "
                    "no space to extend 32-bit BAR", target_bar);
-- 
2.17.1


