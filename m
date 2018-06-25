Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrg-0002bf-Pm
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrf-0002Yi-1a
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrd-0008IK-VB
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:03 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:43142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrZ-0008G6-1Q; Mon, 25 Jun 2018 08:44:57 -0400
Received: by mail-qt0-x231.google.com with SMTP id y89-v6so11731475qtd.10;
	Mon, 25 Jun 2018 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5NhtA11DFK/NbIj6IVOslmvAnwYcEY5l2w6PfZU8Vqc=;
	b=LxtRpI+ff9U/N1wkU/RksNNBI6dNn2tel+jIpoZz8lbvTtaGoGYoHIN7iM3ij5NMQ8
	O33FxVXiRGFACiTu9sYXjy6h8jd7ityrhFgCQacJ/v1Ynch6M/jM4WCUVQS2UbBa97Px
	Rdnu+vjcIF6Yvo4fokZ6QX72zQil/sI3COb8fO2V9EED5OKTgVIHjeQlw9I8zMTu5JqV
	JtsRDzXVwuNLVgj+FtBDTPSt9LglZoJJ8tbOJMqtcP3fMBW61C+Eti6qVcoh54JJu2Zc
	gqSOu+phu/E8ebDzjR7ZYZ93DyRB5ivi2K/MCOU4ffnu7M1GDr0ljVuklswzi56SWji4
	V1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5NhtA11DFK/NbIj6IVOslmvAnwYcEY5l2w6PfZU8Vqc=;
	b=QPSPge1MSeMbSNaKCdjc5l+XJNVpzppd44i9Kx5GkmfcAQZ6ZCO7Q9hyZFpDZNLp+L
	VKZszkpwLPmqdZCbvYCpN7tn7xl49HjGPAOTQrscSCWR181LuLoWi7+dZb7c49ILCbig
	Ka6Veek0wqkRHwZT2EDZn2ZP3riYLcMVHSWGZMwr+k31PZVVnTmh/Z0JeXXc5gO9YT24
	n1iH3wGUpOjYu3EhT2QKiaweA3xXqfa7jhN4E8XbmnQxZlwAbQLDJYM4snTcC/JXfIiV
	1eazVdZrrj4aoq9D/jv+wjGAucwxuBk10MZZT3YHvXkXS0rN/AFgedZu2OseUdqjpQCB
	56Bw==
X-Gm-Message-State: APt69E0wik5Kqoc41xp/jKdTo8P2Y9+jfBFGlbOnVO40C/3/FOx8eamM
	7HmITablIB2u109e3SCQ5KM=
X-Google-Smtp-Source: ADUXVKLLYohEKxJ+EYTXvupDuBLzhY854n3kZvwvc+rPGRKKKk/OfnBqeIfN6jtyjlEBcwvIZGHe/Q==
X-Received: by 2002:aed:3f36:: with SMTP id
	p51-v6mr10527639qtf.213.1529930696484; 
	Mon, 25 Jun 2018 05:44:56 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>
Date: Mon, 25 Jun 2018 09:42:29 -0300
Message-Id: <20180625124238.25339-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-trivial] [PATCH v5 37/46] hw/vfio: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:04 -0000

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
2.18.0


