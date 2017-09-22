Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ57-00056e-1C
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ53-00052e-Gp
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ50-0003Pe-DF
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:29 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4r-0003Km-8B; Fri, 22 Sep 2017 11:41:17 -0400
Received: by mail-qk0-x244.google.com with SMTP id c69so868353qke.5;
	Fri, 22 Sep 2017 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Nw1FYjFFtZAvMs9ZZWwyyu0T0Qo3ZSBwXJMMRLTTeyg=;
	b=GBaNG4K6iACj2B5fZrtZg4br2RmNn4kVtEimT2IeATjjx/rxbqyFfdP5q77MKWdATI
	3lti+63XjrKizSTrEXX1fJsftUz6AHm3lJBCgmvFgAtlhdgTeZldAOIRqQf7pzIK09MY
	VeHKPiFtd9LKIVh5dkUNZloLAXwfpjNrycAE1fKvL+CeFN9cAs/Yx4a6X/k357d9stiT
	OCdMThg+O0mlP4yAfJhOk2K7C2iE/T7AxYeGLDva/JowAc9pEzH92RenRKLeMwfJx/0o
	rHf+goafYmuJBsVu3/4HVIx6lCDXjj4PvBPPpMhquhODrFodTRlbEfDHze04TNab8SuU
	NajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Nw1FYjFFtZAvMs9ZZWwyyu0T0Qo3ZSBwXJMMRLTTeyg=;
	b=id5BHOerV8uFXvcVSJ0dblNilQTYMM1N/Deg3RW86PXGJ/51xAvJPkzN5vIinXkLLT
	TfgpG/BYuaSDDwBcLlneuUILP8dcJegmLMGRipW/jfOL2fp2QoAusHVT6vSQ6YEfGe2h
	qQjOhOH9lV2cX9pVSDoWRhXgblPvADMboEst2p0Ut2GNH368s6c6fkBTd9gxdmGyv6l0
	dScaZI4oY+ZhUY4Msj32akzGnkOmaFc3bmhDP909Kk53TrIxwOuU3ikeHQE60I3lZ+qu
	tv21dZ+p26pfyiBePB+5fIdLvvU2Apt78vobWMwYrXYDayqko42O4rtmRw7MbaR513Hc
	tAMQ==
X-Gm-Message-State: AHPjjUibbfC5PEUUKS2v8gageBwIkz4PdaGokdOgfd5QQycGk/QqIN7L
	Ya7A8a9FRbtz2uMJU5Hj21Rq0fnI+dE=
X-Google-Smtp-Source: AOwi7QC81teapmza70n1MhSoKZgHErXeamlyvaHXVGjz0xSVo2ZslB6FCXfABqcEk8gAHwRN40ukhw==
X-Received: by 10.55.121.7 with SMTP id u7mr8421229qkc.130.1506094876653;
	Fri, 22 Sep 2017 08:41:16 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:53 -0300
Message-Id: <20170922154014.29350-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 13/34] hw/ide: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:30 -0000

and remove a duplicated include

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index d63eb4a72e..6438efa8f4 100644
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
index 9472a60cab..48513c7e9d 100644
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
index f2dcc0ed77..34237c92fc 100644
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
2.14.1


