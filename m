Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YwcNu-00071j-Js
	for mharc-qemu-trivial@gnu.org; Sun, 24 May 2015 16:20:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YwcNs-0006zg-8e
	for qemu-trivial@nongnu.org; Sun, 24 May 2015 16:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YwcNr-0007ek-CZ
	for qemu-trivial@nongnu.org; Sun, 24 May 2015 16:20:32 -0400
Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f]:35688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YwcNn-0007e3-0n; Sun, 24 May 2015 16:20:27 -0400
Received: by pdea3 with SMTP id a3so55767693pde.2;
	Sun, 24 May 2015 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=xLWnAjdb7HwtgDsbPzB+Xp41LtcxzKSok38fnJqzZWo=;
	b=b8UrbetImT0nyZfgCW4lwIJz+s+HhCs5bbHi2UvNq71OmBjcnqvJsIJ139DXecYf+9
	p8pa9I85/KlgFzmggT6klPi4lQ18++QuBwX0ad14b/tt6JDACQGllj0SEKmHVV5+jGKP
	gEu8hprMYD+xgNPyXrLyPrywQbU/wLNP4g/BXpGocf4xt0oVd11y5hVFfhkt681AXacI
	N9qWqH+NQ4iaIF99Nhbh+cBHcLfXdNVx7EQ0loKJVPQNG5npQ2aVD6pHMiiKJy/bVOKR
	rLPgnRLBiRsNkfmM/xqzbkEklBh8cb6wK9hERsGx6jwDubFVJQRwnUScXQwt9g/sYAVl
	jCGg==
X-Received: by 10.70.96.162 with SMTP id dt2mr33487121pdb.20.1432498825294;
	Sun, 24 May 2015 13:20:25 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ei17sm7920307pac.20.2015.05.24.13.20.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 May 2015 13:20:24 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 24 May 2015 13:20:14 -0700
Message-Id: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22f
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	afaerber@suse.de, agraf@suse.de
Subject: [Qemu-trivial] [PATCH v2] device-tree: Make a common-obj
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 May 2015 20:20:33 -0000

There is no reason for device tree API to be built per-target.
common-obj it. There is an extraneous inclusion of config.h that
needs to be removed.

Cc: Alexander Graf <agraf@suse.de>
Reviewed-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 Makefile.objs   | 2 ++
 Makefile.target | 1 -
 device_tree.c   | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 28999d3..4881d2c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -76,6 +76,8 @@ common-obj-$(CONFIG_SECCOMP) += qemu-seccomp.o
 
 common-obj-$(CONFIG_SMARTCARD_NSS) += $(libcacard-y)
 
+common-obj-$(CONFIG_FDT) += device_tree.o
+
 ######################################################################
 # qapi
 
diff --git a/Makefile.target b/Makefile.target
index 1083377..5100013 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -129,7 +129,6 @@ ifdef CONFIG_SOFTMMU
 obj-y += arch_init.o cpus.o monitor.o gdbstub.o balloon.o ioport.o numa.o
 obj-y += qtest.o bootdevice.o
 obj-y += hw/
-obj-$(CONFIG_FDT) += device_tree.o
 obj-$(CONFIG_KVM) += kvm-all.o
 obj-y += memory.o savevm.o cputlb.o
 obj-y += memory_mapping.o
diff --git a/device_tree.c b/device_tree.c
index 3d119ef..d2de580 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -18,7 +18,6 @@
 #include <unistd.h>
 #include <stdlib.h>
 
-#include "config.h"
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
-- 
1.9.1


