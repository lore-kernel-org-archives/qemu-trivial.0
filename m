Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoI3-0004E3-Js
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHz-0003v8-Bl
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHw-0007FZ-RO
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:19 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:53119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHw-0007EZ-DW; Mon, 05 Mar 2018 06:28:16 -0500
Received: by mail-wm0-x242.google.com with SMTP id t3so15060263wmc.2;
	Mon, 05 Mar 2018 03:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PpICu03Y2hdoUfZWzyZFQzJpk3duGFJoav2QlXLtXok=;
	b=ZGTzK/6eSNia1fDw7ednL1E+Px+wiYpbWtC/wbyQ/C6DRjsLIL9seT7oliWGn9wMa5
	4y8rtVDdwfTAQkbBYzIeN9V+TLlkzPpqsRRtUFncTVyfd2N6sKbcTR1eD0yyHW6TDhOS
	E5WPxPSf3S9nTQBdEdVjyzZ/+UwBoU8Z2nmfO4I4dKI5Q/7oH9dkMiQrtt1sEeoe9d8V
	tv1PohugB5Zr6KRdQjkBURBj6f4Lik/6298VJhXvEPdxEsbvuzAGgeqLHM/S4Ff05MT2
	X2x+uXcrHzTtxABDR9Cyl4QLSbaYiMAS+lxzxKk+/A36sUU/JcVYtD497wns5nWsWLhT
	p43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PpICu03Y2hdoUfZWzyZFQzJpk3duGFJoav2QlXLtXok=;
	b=JDi3V8+hn095VdN/7+7PEUJkeBLr53tAq7TdqoBwN2taIaV+L17jQcLnBL5/SMtMe9
	Zbxot9I3xFq9xobo5vkK+RTiLVF3fo89bEF9DCS1tG1prLXeFD0T4fbNd28XeK1N7304
	PIA4iltAX2noYuQEYBGblA5cLnOWBp4gfe6zEOQ50flBglWz1Tt01lVsPZBOIB7TahM6
	OzQqe4H3wJ8HkOTRY22ok9cIdVzf4XkD8DvCrxMstjjlZEEiovNVrhfAmCBNzXbbbpcN
	A30zZw/kadvux4cAZ0x9ePebNChx/8PFwvpUUbB1a+4vNkb5Po7SzjdXlKYzBFLxXq4F
	ZwRA==
X-Gm-Message-State: AElRT7HnuG9hD9m4auatnqT2w+ngvvK+E0bOahMTpI08OrW7+oGBO0Cj
	mJlXAUQFiyQxenwMpvQFwpB6M4dWS3M=
X-Google-Smtp-Source: AG47ELscgAerxv6kPqZKH+y0ABGpSSqkcE0Iw0A/Slkro7d0QAxYUXqtg4k+cahXO1+mN3LAIdnHJA==
X-Received: by 10.28.93.82 with SMTP id r79mr7519342wmb.73.1520249295244;
	Mon, 05 Mar 2018 03:28:15 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Date: Mon,  5 Mar 2018 08:27:29 -0300
Message-Id: <20180305112732.26471-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 27/30] vfio/pci: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:20 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/vfio/pci-quirks.c | 8 ++++----
 hw/vfio/pci.c        | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index e5779a7ad3..3c091106dd 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1255,9 +1255,9 @@ static int vfio_igd_gtt_max(VFIOPCIDevice *vdev)
         ggms = 1 << ggms;
     }
 
-    ggms *= 1024 * 1024;
+    ggms *= M_BYTE;
 
-    return (ggms / (4 * 1024)) * (gen < 8 ? 4 : 8);
+    return (ggms / (4 * K_BYTE)) * (gen < 8 ? 4 : 8);
 }
 
 /*
@@ -1514,7 +1514,7 @@ static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     igd->vdev = vdev;
     igd->index = ~0;
     igd->bdsm = vfio_pci_read_config(&vdev->pdev, IGD_BDSM, 4);
-    igd->bdsm &= ~((1 << 20) - 1); /* 1MB aligned */
+    igd->bdsm &= ~((1 * M_BYTE) - 1); /* 1MB aligned */
 
     memory_region_init_io(&quirk->mem[0], OBJECT(vdev), &vfio_igd_index_quirk,
                           igd, "vfio-igd-index-quirk", 4);
@@ -1561,7 +1561,7 @@ static void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
      * config offset 0x5C.
      */
     bdsm_size = g_malloc(sizeof(*bdsm_size));
-    *bdsm_size = cpu_to_le64((ggms_mb + gms_mb) * 1024 * 1024);
+    *bdsm_size = cpu_to_le64((ggms_mb + gms_mb) * M_BYTE);
     fw_cfg_add_file(fw_cfg_find(), "etc/igd-bdsm-size",
                     bdsm_size, sizeof(*bdsm_size));
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 033cc8dea1..db337476ef 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1408,7 +1408,7 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
     }
 
     /* 2GB max size for 32-bit BARs, cannot double if already > 1G */
-    if (vdev->bars[target_bar].size > (1 * 1024 * 1024 * 1024) &&
+    if (vdev->bars[target_bar].size > 1 * G_BYTE &&
         !vdev->bars[target_bar].mem64) {
         error_setg(errp, "Invalid MSI-X relocation BAR %d, "
                    "no space to extend 32-bit BAR", target_bar);
-- 
2.16.2


