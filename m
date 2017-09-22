Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4z-0004yg-8U
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4v-0004uk-Kv
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4u-0003MZ-Lo
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:21 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4o-0003JR-As; Fri, 22 Sep 2017 11:41:14 -0400
Received: by mail-qk0-x244.google.com with SMTP id d70so875115qkc.1;
	Fri, 22 Sep 2017 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7+kX+8IM7wrHvlHsGN1Tc5Z5e6RO8iBvqBhslr/1bFE=;
	b=B49sM4hG4Lf76BUeuYMHO8o8hfy8bHoaC60hfFuLHWdkW6+1BcNWvn7GTeaW+1idSP
	5w+cnm5AmIEdkFz0TWFrMM5NutvjGW8kDPdjQ0G05UoZy43eeHzIn5obmAg2aM4PE98b
	Ubj+gJFTSVY74LwM443M7muCfZhOH37L/zYSha9hkdbLH8lGXFJczwO1Ztm/O6thho9w
	/l5uZy+mgUanzZ3APqPtWI1XX8+1XdlahXbsZTJEEmML1VqDrGtDrYBxQV9ZmdQTGzZi
	IMlXXqqaV/BHqimkzwzuAavXoixHWS3i45k+7znRvYtb+lom23rOIstb1oImr+MYvO8G
	F0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7+kX+8IM7wrHvlHsGN1Tc5Z5e6RO8iBvqBhslr/1bFE=;
	b=IL4v9QqTstA7Puz/jiFcGAjtygRIzXEV3SPRqv9Wg8tHsCI0lwE7ZhaezgT3xCqGQK
	HRBL61p54DTDm7BMpq/Ml07q+1aprt2NOpDbeKnK8SP2Q9GPsZSeDPU+f2aDc/8RPjBM
	e7zy+0RLLpAEsix+034diB/tprXOG+Dw7+vo//hRgpDbiBJ2AbA0YIhc7eSIAhZxZDQL
	AED9vg06N2YD7914mVDxk22rfnGeVtC4kR7gT4WdOu39uafb5PuJbDAsq9lkAkvOya38
	uODFsUALpnCiVVjj0OUMBcuLWnBVdcHwOEx11D1gZHlzdq7be6wK5vVOTrpnNtkWbhxc
	adPg==
X-Gm-Message-State: AHPjjUiapG/jbHOm4l5E07SDFY/cvIBAUhjijd5jU4peUgVZ+sROiX5j
	pEiNhgKRQbNzLtuYNzRlsmw=
X-Google-Smtp-Source: AOwi7QA8qEK6W34o2wBcURKTQbXLZrV1k4NwEP4pedRsBW8oGitwe2mWfU/wp0hXcvya9zQeYVWggA==
X-Received: by 10.55.191.129 with SMTP id p123mr8515498qkf.47.1506094873798;
	Fri, 22 Sep 2017 08:41:13 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:52 -0300
Message-Id: <20170922154014.29350-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 12/34] misc: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:22 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/pcspk.c                    | 1 -
 hw/i386/kvm/pci-assign.c            | 1 -
 hw/i386/pci-assign-load-rom.c       | 1 -
 hw/i386/xen/xen_platform.c          | 1 -
 hw/isa/vt82c686.c                   | 1 -
 hw/misc/ivshmem.c                   | 1 -
 hw/misc/sga.c                       | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 monitor.c                           | 1 -
 9 files changed, 9 deletions(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 0206f7399b..908696d483 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "hw/audio/soundhw.h"
 #include "audio/audio.h"
diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index 33e20cb3e8..3f103a99db 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -25,7 +25,6 @@
 #include <linux/kvm.h>
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qemu/error-report.h"
 #include "ui/console.h"
 #include "hw/loader.h"
diff --git a/hw/i386/pci-assign-load-rom.c b/hw/i386/pci-assign-load-rom.c
index 43429b66be..2c3a60392e 100644
--- a/hw/i386/pci-assign-load-rom.c
+++ b/hw/i386/pci-assign-load-rom.c
@@ -4,7 +4,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qemu/error-report.h"
 #include "ui/console.h"
 #include "hw/loader.h"
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 9ba7474566..880926f442 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 50dc83df77..2484a956c7 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/vt82c686.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus.h"
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index b3ef3ec1e3..971bd759f4 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -20,7 +20,6 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 03b006d6f0..97fd63f176 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -26,7 +26,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
-#include "hw/i386/pc.h"
 #include "hw/loader.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index ff59abf208..3295af3d20 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -16,7 +16,6 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pci_bridge.h"
-#include "hw/i386/pc.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
diff --git a/monitor.c b/monitor.c
index 058045b3cb..a1ae6a26f2 100644
--- a/monitor.c
+++ b/monitor.c
@@ -28,7 +28,6 @@
 #include "hw/hw.h"
 #include "monitor/qdev.h"
 #include "hw/usb.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "sysemu/watchdog.h"
 #include "hw/loader.h"
-- 
2.14.1


