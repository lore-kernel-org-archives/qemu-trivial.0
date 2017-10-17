Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0g-0002Hd-Cy
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0e-0002FQ-Ll
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0d-0003Xk-OF
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:28 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:45780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0Z-0003WA-RU; Tue, 17 Oct 2017 12:46:23 -0400
Received: by mail-qk0-x244.google.com with SMTP id f199so2846388qke.2;
	Tue, 17 Oct 2017 09:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Pt4KacQigml0SV8PYhGe5cs0b6lrPZPsSP1cWonGq7U=;
	b=sE0XTajxsBtN/VfPbkGwS6i762Wo/jsetM3xYQM7ZgdC9dNm70AsQDp9TrYsB3HDGl
	PHZEOuuyHipZZeUXkvO4sZ3jUB6v+s/TblYoyqvAmqvPcc2oteP+luLDesC0IHFAkMPm
	wEjLdHmRmr9M/7Twq2dNz5qEyvKrNzNj1ftjDtaqSkjTL7Xlm2vjFS429Elqr+HlOGfy
	5Gxc50fZYVmQeg1xFZDBwPqvQgNTdUx3mihqBYqZ3hG58gNK9a/sh89HV18zSL3wkpiI
	RyUDd7Svgo1FfUGVe1bD+1zpjEukB+EDxxQMjdC9AhPg1lr/BfZ7HHXL7HZu4ZJCY4tK
	1LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Pt4KacQigml0SV8PYhGe5cs0b6lrPZPsSP1cWonGq7U=;
	b=BvU+yizFi4uJfq6TGr9OA402IpmAaWlnfRqB2jLT9Ipz0C2EUxX1aBPnvamW7xysJa
	jAhaw0kG7yXNi7G4Jkpy+zoWaWTUAY45zOA0sLPyPsc+hPi8Q8pGYae8PjrJEcgVmXDu
	dbM8EV+JaPqq4iPV1YYHrX+W8lYCEov+rrgjEKHkmQJGR/fqGL9JH9vO3nsuxqTfiJfv
	A7DTGDU3FAgmliBZoUlNBJywvIjUT3X+xvpRGX6Lkhv+q8vB2Gwmhb0bbp8ErFXOCOM5
	8fKjC6cvMBgf7r0yJZmD3jmMNPlNSZEjo3XfiZiBomMISlEPnl5Pg/3YROxQeugSm/pl
	1Brw==
X-Gm-Message-State: AMCzsaXK3EU5d7V6lvjdn+zMcQfWvJYuoX8u7QsJsJz5THzEd6+iNHh0
	sw+2Cb7MuTol+ahirMAjITU=
X-Google-Smtp-Source: ABhQp+TqV8UOIOOSIIvNdRSDIOsaZtHR/Ge/OgFh0DM0PhA4cnVwTKZ5L/2OjoUhKY+qUORG2ZzY9Q==
X-Received: by 10.55.149.70 with SMTP id x67mr19641599qkd.62.1508258783310;
	Tue, 17 Oct 2017 09:46:23 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:09 -0300
Message-Id: <20171017164426.25277-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 25/42] hw/ide: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:29 -0000

and remove a duplicated include

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: John Snow <jsnow@redhat.com>
---
 hw/ide/ahci.c       | 1 -
 hw/ide/cmd646.c     | 1 -
 hw/ide/core.c       | 3 +--
 hw/ide/ich.c        | 1 -
 hw/ide/isa.c        | 1 -
 hw/ide/microdrive.c | 1 -
 hw/ide/pci.c        | 1 -
 hw/ide/piix.c       | 2 +-
 hw/ide/via.c        | 1 -
 9 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 32d1296a64..2634f8db3d 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/pci/msi.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 
 #include "qemu/error-report.h"
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 86b2a8f504..65aff518ec 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -24,7 +24,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5f1cd3b91f..ceb1e32a32 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -24,17 +24,16 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
 #include "sysemu/block-backend.h"
 #include "qemu/cutils.h"
-#include "qemu/error-report.h"
 
 #include "hw/ide/internal.h"
 #include "trace.h"
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 8dd0ced6b3..c01b24ecbe 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -63,7 +63,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/pci/msi.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 40213d662c..9fb24fc92b 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -24,7 +24,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/dma.h"
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 17917c0b30..fde4d4645e 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -24,7 +24,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pcmcia.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/dma.h"
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 25f1d36f3a..1ab0a892d0 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -24,7 +24,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index dfb21f65fa..a3afe1fd29 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -25,11 +25,11 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 
 #include "hw/ide/pci.h"
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 35c3059325..117ac4d95e 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -25,7 +25,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
-- 
2.15.0.rc0


