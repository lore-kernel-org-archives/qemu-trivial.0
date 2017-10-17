Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVu-0006ge-FL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVq-0006c2-DC
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVp-0004XB-8z
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:38 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:54403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVl-0004V5-VR; Mon, 16 Oct 2017 20:13:34 -0400
Received: by mail-qt0-x244.google.com with SMTP id z19so40115qtg.11;
	Mon, 16 Oct 2017 17:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Pt4KacQigml0SV8PYhGe5cs0b6lrPZPsSP1cWonGq7U=;
	b=uNMrSAFtVTfmK8EiEEfhBUzHeYV6f5ir7eKe5BOh/HABI+xXVMfk2tVbBfEUP6BUGj
	OFreOgau52z+21MkBL+p3ZxBzGsk1GGIe93bY88BHLfcZXFrS1Keal4j0tF8qD7quMaM
	USYajhDkfZ3KqW2Xzb1xS6YRqtgQwew0llLsklL7n4+DkOkCuuNXDKJNqW0gJBVN0Oqm
	shr8ut8Eq6U6KYzhVdS8AbFZP+s2inrjpz3r60Ktmzf1U6etPZJDLkKNvgrhWv4nodDC
	ksAZlETU4zrNs9pxXXAM8Uli+mPvUt4MN+wZ+wjWBhrhvyxyg64a3FJkKdWQMUD7ByGQ
	0Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Pt4KacQigml0SV8PYhGe5cs0b6lrPZPsSP1cWonGq7U=;
	b=QJJFk4OMWKLmqYZEzaYnc2RrR9hZwqNj/6C941Shb8J7dv2ds/2fov9DZ4cKmJd4r9
	Iy6e2hn1i2c4T7cZP/I8ci/OP9RCgMJg9zLA4CXaRwALsUcqrEEqh6MOoSKQBqvZyX99
	aL6PjFOvYUkiXscdUtrgTkzXI335hI74Qq4W3DlyB4DPkw8KJFoX/pOa4wj09tIfT9MI
	idC5Qfsclk9q9v6DW9kfE6MwFyv90yNoqLw5kfsZmjPeoFUGenerUCYyIdkAoko3RStb
	NOjhHwillMJjkeAkwiQVywuYJrj5YR/kMHaxQtk28uhJdk6mpgL9O7XmVCgry32UeYp6
	y9NA==
X-Gm-Message-State: AMCzsaV8VCtdCXODc30UNfb8jzrs49ZtWVgduIMT++LiSH9ATeUUf/G3
	99iVyrImosW4wkNY3K214C7U8M9A
X-Google-Smtp-Source: AOwi7QBC+Tnb6+1wqSpa9GAeMC8i34UWahzRj6gOdkcYI/qijsqecf8S00uwaSi0wk7euMeHEzKRig==
X-Received: by 10.200.48.54 with SMTP id f51mr16901748qte.39.1508199213574;
	Mon, 16 Oct 2017 17:13:33 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:52 -0300
Message-Id: <20171017001209.32276-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 22/39] hw/ide: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:39 -0000

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


