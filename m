Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZM-0007ne-A8
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:28:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZJ-0007ka-Jx
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZI-0001f2-Gg
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:49 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZD-0001cU-Q3; Mon, 28 May 2018 19:28:43 -0400
Received: by mail-qt0-x242.google.com with SMTP id d3-v6so16549258qtp.11;
	Mon, 28 May 2018 16:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tspries07RO9lbtHgrMtVgX5wqh+md/lgead8DTWYkQ=;
	b=UhlvRcS+1I4ZC/RQS83WBodINKaQaRmLT1/lhN21pMiC8N9hgpCpzlphzDqhG62yAp
	3NZ++NdYTLqGe7U35/f4fzX9dcmsLthTXZ88AJefd7PB5VyVWdPcDhjpMigGn4KrvFBR
	vPrbaZEOtg7NCEJZwnKl0j8DWejJ7/vld5zbEPvhRZc+05Yfi7d/Y8yWcUDm3yeyEK40
	5Au/X8+5YTw0LqS94cjY8xYujmnWtFP4qPjqJF8H1y5C/h5W3Sly/+JaKKHQBowhnrS+
	AFQmt/pO+DoMhbzyyoh8z7E9x+lkcaq8IvGUAX+PVwzUvvgv6dI55KaCO968ChG0Hu2o
	04wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tspries07RO9lbtHgrMtVgX5wqh+md/lgead8DTWYkQ=;
	b=XzWLIraKKIGPVJ1k2JvE0o+SwekSU9vKFinI6Ij47W16oeDXzXSFU0Rj5Wk2R6rSnG
	Al+rhwt/DlHfFN3kNs3g2HSco+uc4vmTB3Yg8vHOI3PllFoouAhfFcBnfsfAWCvsJw5n
	w3+y/w+H+oh1P8CqiM+wKI+6aImBk+masnTbS1i5AA2iYkihfSUzbpBwAtHw8dPtP4Oo
	frDKzlT5kRpPzGPUdnm28IACVELGTfmIg0umRMzh8+p4dd0ct3bwUW397dZ33Qd2/4n7
	dFPGWbpL8cnqM2+QBeDeA7xkRM5Fnub4UwaqDA69vzLb5mNFRKvOS/TlgboYqKwXs8fU
	W7Vw==
X-Gm-Message-State: ALKqPwe835EpcuLFJS6IS5g9R9u5mGFCI6wwAANRoQbpjkpLBPeR2cEU
	woZlruDNhTWHWGK5yXWDhwM=
X-Google-Smtp-Source: ADUXVKJtPQQAk4kjrkkGwSgXJn40vore/b+kP47pA83kgSgZQihGRvjMr05yJ+ZsP9pcR9rZLR4fcQ==
X-Received: by 2002:ac8:73d5:: with SMTP id
	v21-v6mr14662053qtp.329.1527550123323; 
	Mon, 28 May 2018 16:28:43 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>,
	Fam Zheng <famz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core),
	xen-devel@lists.xenproject.org (open list:X86),
	qemu-s390x@nongnu.org (open list:virtio-ccw)
Date: Mon, 28 May 2018 20:27:12 -0300
Message-Id: <20180528232719.4721-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 14/21] hw: Do not include
 "sysemu/blockdev.h" if it is not necessary
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
X-List-Received-Date: Mon, 28 May 2018 23:28:50 -0000

Remove those unneeded includes to speed up the compilation
process a little bit.

Code change produced with:

    $ git grep '#include "sysemu/blockdev.h"' | \
      cut -d: -f-1 | \
      xargs egrep -L "(BlockInterfaceType|DriveInfo|drive_get|blk_legacy_dinfo|blockdev_mark_auto_del)" | \
      xargs sed -i.bak '/#include "sysemu\/blockdev.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/m25p80.c          | 1 -
 hw/block/onenand.c         | 1 -
 hw/i386/xen/xen-mapcache.c | 1 -
 hw/s390x/virtio-ccw.c      | 1 -
 hw/scsi/scsi-generic.c     | 1 -
 hw/sd/sdhci.c              | 1 -
 hw/usb/dev-storage.c       | 1 -
 monitor.c                  | 1 -
 8 files changed, 8 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b49c8e9caa..a5ccffb4aa 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index ab0c7ea1b3..0cb8d7fa13 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -25,7 +25,6 @@
 #include "hw/block/flash.h"
 #include "hw/irq.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index efa35dc6e0..541b7693b3 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -14,7 +14,6 @@
 #include <sys/resource.h>
 
 #include "hw/xen/xen_backend.h"
-#include "sysemu/blockdev.h"
 #include "qemu/bitmap.h"
 
 #include <xen/hvm/params.h>
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index b68798ac52..0a9bec484b 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "net/net.h"
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 381f04e339..03bce8ff39 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -17,7 +17,6 @@
 #include "qemu/error-report.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
 
 #ifdef __linux__
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index b65403947b..3017e5a95a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -26,7 +26,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index b56c75a73a..d02acda945 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -20,7 +20,6 @@
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
 #include "qapi/visitor.h"
 #include "qemu/cutils.h"
 
diff --git a/monitor.c b/monitor.c
index 46814af533..d75cb20815 100644
--- a/monitor.c
+++ b/monitor.c
@@ -44,7 +44,6 @@
 #include "qemu/readline.h"
 #include "ui/console.h"
 #include "ui/input.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
 #include "audio/audio.h"
 #include "disas/disas.h"
-- 
2.17.0


