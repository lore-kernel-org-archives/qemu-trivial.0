Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYHs-0001uj-Qg
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:57:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYHp-0001pr-RK
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYHp-0004QD-0T
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:57:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYHk-0004Ov-Ly; Mon, 11 Jan 2016 03:57:08 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 48426403F5;
	Mon, 11 Jan 2016 11:57:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9D34DAE1;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28804 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:58 +0300
Message-Id: <fe02fc5209d497d011b2b4b09395e2503d9dedc6.1452501578.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PULL 19/19] hw/s390x: Remove superfluous return
	statements
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
X-List-Received-Date: Mon, 11 Jan 2016 08:57:15 -0000

From: Thomas Huth <thuth@redhat.com>

The "return;" statements at the end of functions do not make
much sense, so let's remove them.

Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/s390x/css.c          | 1 -
 hw/s390x/s390-pci-bus.c | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 19851ce..343c352 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1430,7 +1430,6 @@ void subch_device_save(SubchDev *s, QEMUFile *f)
     }
     qemu_put_byte(f, s->ccw_fmt_1);
     qemu_put_byte(f, s->ccw_no_data_cnt);
-    return;
 }
 
 int subch_device_load(SubchDev *s, QEMUFile *f)
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 98c726c..8de35ff 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -123,7 +123,6 @@ void s390_pci_sclp_configure(int configure, SCCB *sccb)
     }
 
     psccb->header.response_code = cpu_to_be16(rc);
-    return;
 }
 
 static uint32_t s390_pci_get_pfid(PCIDevice *pdev)
@@ -439,8 +438,6 @@ static void s390_msi_ctrl_write(void *opaque, hwaddr addr, uint64_t data,
         io_int_word = (pbdev->isc << 27) | IO_INT_WORD_AI;
         s390_io_interrupt(0, 0, 0, io_int_word);
     }
-
-    return;
 }
 
 static uint64_t s390_msi_ctrl_read(void *opaque, hwaddr addr, unsigned size)
@@ -561,7 +558,6 @@ static void s390_pcihost_hot_plug(HotplugHandler *hotplug_dev,
         s390_pci_generate_plug_event(HP_EVENT_TO_CONFIGURED,
                                      pbdev->fh, pbdev->fid);
     }
-    return;
 }
 
 static void s390_pcihost_hot_unplug(HotplugHandler *hotplug_dev,
-- 
2.1.4


