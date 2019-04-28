Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hKkiQ-000141-QM
	for mharc-qemu-trivial@gnu.org; Sun, 28 Apr 2019 10:23:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hKhp1-0003K5-EH
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2019 07:18:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hKhc1-00020U-6f
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2019 07:04:50 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hKhc0-0001yJ-RY
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2019 07:04:49 -0400
Received: by mail-pl1-x642.google.com with SMTP id d9so3711671pls.8
	for <qemu-trivial@nongnu.org>; Sun, 28 Apr 2019 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AMRBSKPedQ/vao53wTQts4yAXAMhd5iduqdqKtH2vi0=;
	b=tY7SWKCGI4nvwv6XBmywg/wziBked8W6bZJgiVPY7BcbwdXPIXlunxLbAR6Rgeg2Hu
	/g5lwBZ5LuJMeDriIG5KDDxVzcMKl5y7q5kpb2+bmbP/w51fj3T4Tdzz+yLkBuqJ0Uv7
	IEO48cTIa+j2GcztWsmGtoYShuGK4nKSrEMkTTlhfXfc5xvoJ4moW0DTP0tvuH0JZXzn
	gW5JXLmuqDL9iQJ7w61NnmU3UF3+a51+BzQA0bnXLDVtTOQ56S8n/rqYFIYD2SCiqXAY
	J1WdgSaiQMmtdeoL00WcyoLrd1by+99azT+BtUYS3RANdAmhhBQUgJWwipxiiH/EXFbY
	n1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AMRBSKPedQ/vao53wTQts4yAXAMhd5iduqdqKtH2vi0=;
	b=ffntaUjn+u0zMBFreJDLu8jdnjcoroqjAA44ZHX8wH/lRKh2DGWE5uQk5rsT6qT5FE
	QLyaKZGPDxV4E8e6qvbZpu+WmWzqvYNlf/4fPyume6UesJRvEr50kdCPvWrkepRFRNTQ
	RdEu203uZEpsGDa+M7ZfOQmAz7wu7DOa8cdBcwwpJ+9gJdj1VcOVvKNBjeaJFUBwl8s0
	OwX5Y+bnKSI2CnpaQ0+v7xKxJ3TqinSvcvCH6186jugfekqYbsR4rl3PHdMMLVvbM+93
	h9IU+GrsFhCEzT2CuLhs+2V40v2D9oDhYbdkgYzDn2/NfU0TTvQeP+R5um46V28NzxAe
	isVQ==
X-Gm-Message-State: APjAAAWTiLVJ5lQpriTCQpbDxart79HShl0KBlat7jUO3CYjfFoJlTrh
	lDfU/AkLD1dQH+wu5pB0xi3cOw==
X-Google-Smtp-Source: APXvYqw4nsWImWPBjHXMzmzoyQbEjYkogFsZ8Z5CltAI6PYZmzgwB+NEgg5vTx555ohOmb8+VWUeXA==
X-Received: by 2002:a17:902:e793:: with SMTP id
	cp19mr50673035plb.65.1556449485991; 
	Sun, 28 Apr 2019 04:04:45 -0700 (PDT)
Received: from MBP.local.hk ([202.189.108.96])
	by smtp.gmail.com with ESMTPSA id
	s198sm18386461pfs.34.2019.04.28.04.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 Apr 2019 04:04:45 -0700 (PDT)
From: Boxuan Li <liboxuan@connect.hku.hk>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, eblake@redhat.com,
	Boxuan Li <liboxuan@connect.hku.hk>
Date: Sun, 28 Apr 2019 19:02:58 +0800
Message-Id: <20190428110258.86681-1-liboxuan@connect.hku.hk>
X-Mailer: git-send-email 2.13.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-Mailman-Approved-At: Sun, 28 Apr 2019 10:23:37 -0400
Subject: [Qemu-trivial] [PATCH] virtio-mmio: Always compile debug prints
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
X-List-Received-Date: Sun, 28 Apr 2019 11:18:16 -0000

Wrap printf calls inside debug macros (DPRINTF) in `if` statement, and
change output to stderr as well. This will ensure that printf function
will always compile and prevent bitrot of the format strings.

Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
---
 hw/virtio/virtio-mmio.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 5807aa87fe..693b3c9eb4 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -28,15 +28,14 @@
 #include "hw/virtio/virtio-bus.h"
 #include "qemu/error-report.h"
 
-/* #define DEBUG_VIRTIO_MMIO */
-
-#ifdef DEBUG_VIRTIO_MMIO
-
-#define DPRINTF(fmt, ...) \
-do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while (0)
-#endif
+#define DEBUG_VIRTIO_MMIO 0
+
+#define DPRINTF(fmt, ...)                                            \
+    do {                                                             \
+        if (DEBUG_VIRTIO_MMIO) {                                     \
+            fprintf(stderr, "virtio_mmio: " fmt , ## __VA_ARGS__);   \
+        }                                                            \
+    } while (0)
 
 /* QOM macros */
 /* virtio-mmio-bus */
-- 
2.13.2


