Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwFLV-0007dt-Se
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 15:16:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFLP-0007S7-7u
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFLO-0005ME-6Y
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZwFLG-0005Kj-7q; Tue, 10 Nov 2015 15:16:34 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C1E1E552E8;
	Tue, 10 Nov 2015 20:16:33 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-38.ams2.redhat.com [10.36.6.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAKGBor029221; Tue, 10 Nov 2015 15:16:31 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 10 Nov 2015 21:16:10 +0100
Message-Id: <1447186571-27672-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1447186571-27672-1-git-send-email-thuth@redhat.com>
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 3/4] hw/s390x: Remove superfluous return
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
X-List-Received-Date: Tue, 10 Nov 2015 20:16:48 -0000

The "return;" statements at the end of functions do not make
much sense, so let's remove them.

Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/css.c            |  1 -
 hw/s390x/event-facility.c | 21 ++++++---------------
 hw/s390x/s390-pci-bus.c   |  4 ----
 3 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index c033612..48ba1fd 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1424,7 +1424,6 @@ void subch_device_save(SubchDev *s, QEMUFile *f)
     }
     qemu_put_byte(f, s->ccw_fmt_1);
     qemu_put_byte(f, s->ccw_no_data_cnt);
-    return;
 }
 
 int subch_device_load(SubchDev *s, QEMUFile *f)
diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index 907b485..7551685 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -158,11 +158,11 @@ static void write_event_data(SCLPEventFacility *ef, SCCB *sccb)
 {
     if (sccb->h.function_code != SCLP_FC_NORMAL_WRITE) {
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_FUNCTION);
-        goto out;
+        return;
     }
     if (be16_to_cpu(sccb->h.length) < 8) {
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
-        goto out;
+        return;
     }
     /* first do a sanity check of the write events */
     sccb->h.response_code = cpu_to_be16(write_event_length_check(sccb));
@@ -172,9 +172,6 @@ static void write_event_data(SCLPEventFacility *ef, SCCB *sccb)
         sccb->h.response_code =
                 cpu_to_be16(handle_sccb_write_events(ef, sccb));
     }
-
-out:
-    return;
 }
 
 static uint16_t handle_sccb_read_events(SCLPEventFacility *ef, SCCB *sccb,
@@ -227,7 +224,7 @@ static void read_event_data(SCLPEventFacility *ef, SCCB *sccb)
 
     if (be16_to_cpu(sccb->h.length) != SCCB_SIZE) {
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
-        goto out;
+        return;
     }
 
     sclp_cp_receive_mask = ef->receive_mask;
@@ -243,18 +240,15 @@ static void read_event_data(SCLPEventFacility *ef, SCCB *sccb)
             (sclp_active_selection_mask & ~sclp_cp_receive_mask)) {
             sccb->h.response_code =
                     cpu_to_be16(SCLP_RC_INVALID_SELECTION_MASK);
-            goto out;
+            return;
         }
         break;
     default:
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_FUNCTION);
-        goto out;
+        return;
     }
     sccb->h.response_code = cpu_to_be16(
             handle_sccb_read_events(ef, sccb, sclp_active_selection_mask));
-
-out:
-    return;
 }
 
 static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
@@ -265,7 +259,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
        does. Architecture allows for masks of variable size, though */
     if (be16_to_cpu(we_mask->mask_length) != 4) {
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_MASK_LENGTH);
-        goto out;
+        return;
     }
 
     /* keep track of the guest's capability masks */
@@ -276,9 +270,6 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
     we_mask->receive_mask = cpu_to_be32(get_host_receive_mask(ef));
 
     sccb->h.response_code = cpu_to_be16(SCLP_RC_NORMAL_COMPLETION);
-
-out:
-    return;
 }
 
 /* qemu object creation and initialization functions */
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 560b66a..6be699b 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -123,7 +123,6 @@ void s390_pci_sclp_configure(int configure, SCCB *sccb)
     }
 
     psccb->header.response_code = cpu_to_be16(rc);
-    return;
 }
 
 static uint32_t s390_pci_get_pfid(PCIDevice *pdev)
@@ -435,8 +434,6 @@ static void s390_msi_ctrl_write(void *opaque, hwaddr addr, uint64_t data,
         io_int_word = (pbdev->isc << 27) | IO_INT_WORD_AI;
         s390_io_interrupt(0, 0, 0, io_int_word);
     }
-
-    return;
 }
 
 static uint64_t s390_msi_ctrl_read(void *opaque, hwaddr addr, unsigned size)
@@ -539,7 +536,6 @@ static void s390_pcihost_hot_plug(HotplugHandler *hotplug_dev,
         s390_pci_generate_plug_event(HP_EVENT_TO_CONFIGURED,
                                      pbdev->fh, pbdev->fid);
     }
-    return;
 }
 
 static void s390_pcihost_hot_unplug(HotplugHandler *hotplug_dev,
-- 
1.8.3.1


