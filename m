Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QGnxc-0003BP-VQ
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2011 03:54:29 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QGnxZ-00035T-RB
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 03:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QGnxY-0003zi-Tb
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 03:54:25 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:55681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1QGnxW-0003yt-Pg; Mon, 02 May 2011 03:54:22 -0400
Received: by mail-yw0-f45.google.com with SMTP id 41so2236353ywl.4
	for <multiple recipients>; Mon, 02 May 2011 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=cfiLpWnxrQTsIs7NozAAR+bUXmtlXRAyO7ycNwUgC7Y=;
	b=ImgSnEO8mmAY0TYpb4Qu20ac/VfIFagW7dUxQm65BJkwA9K9Mj+Bdk24fAHsGIHS9+
	MbRg9Cu3RxjzjwtHs0WeY5tCqPvzNY5xydcSLQc190tnKU8PzWD7RpiZc/lg5BtMyKVp
	9Umz+KCQ0vDt4WIOTT9Zsq+r2iGjZyzMU/rMw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=XdpPecTzNhIppxsbAcYTmUGgZvWfU9aSOnVtQ9Zmq+Px/Mlp19NTm8qmIZtIpVAbW0
	A+cXRskPKzvUkXnOgAOPYQFD98YeA+0hH3TCarP3sOUS0bsPvqIXM790tTbpMobLcufS
	9tUoj2AgQjrgNtv0A/VspsOSrqk/8HDw6dx0U=
Received: by 10.236.170.201 with SMTP id p49mr8601094yhl.236.1304322862428;
	Mon, 02 May 2011 00:54:22 -0700 (PDT)
Received: from localhost.localdomain (93-34-184-88.ip51.fastwebnet.it
	[93.34.184.88])
	by mx.google.com with ESMTPS id t16sm3488849anm.16.2011.05.02.00.54.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 00:54:21 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 May 2011 09:54:05 +0200
Message-Id: <1304322846-24376-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.4.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, Hannes Reinecke <hare@suse.de>
Subject: [Qemu-trivial] [PATCH 3/4] lsi53c895a: Rename 'sense' to 'status'
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
X-List-Received-Date: Mon, 02 May 2011 07:54:26 -0000

From: Hannes Reinecke <hare@suse.de>

The 'sense' field in the HBA status structure is misnamed, as it
actually carries the SCSI status. Rename it.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
---
 hw/lsi53c895a.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/lsi53c895a.c b/hw/lsi53c895a.c
index e4b51a8..68f4ad2 100644
--- a/hw/lsi53c895a.c
+++ b/hw/lsi53c895a.c
@@ -189,7 +189,7 @@ typedef struct {
     uint32_t script_ram_base;
 
     int carry; /* ??? Should this be an a visible register somewhere?  */
-    int sense;
+    int status;
     /* Action to take at the end of a MSG IN phase.
        0 = COMMAND, 1 = disconnect, 2 = DATA OUT, 3 = DATA IN.  */
     int msg_action;
@@ -695,8 +695,8 @@ static void lsi_command_complete(SCSIBus *bus, int reason, uint32_t tag,
 
     out = (s->sstat1 & PHASE_MASK) == PHASE_DO;
     if (reason == SCSI_REASON_DONE) {
-        DPRINTF("Command complete sense=%d\n", (int)arg);
-        s->sense = arg;
+        DPRINTF("Command complete status=%d\n", (int)arg);
+        s->status = arg;
         s->command_complete = 2;
         if (s->waiting && s->dbc != 0) {
             /* Raise phase mismatch for short transfers.  */
@@ -783,14 +783,14 @@ static void lsi_do_command(LSIState *s)
 
 static void lsi_do_status(LSIState *s)
 {
-    uint8_t sense;
-    DPRINTF("Get status len=%d sense=%d\n", s->dbc, s->sense);
+    uint8_t status;
+    DPRINTF("Get status len=%d status=%d\n", s->dbc, s->status);
     if (s->dbc != 1)
         BADF("Bad Status move\n");
     s->dbc = 1;
-    sense = s->sense;
-    s->sfbr = sense;
-    cpu_physical_memory_write(s->dnad, &sense, 1);
+    status = s->status;
+    s->sfbr = status;
+    cpu_physical_memory_write(s->dnad, &status, 1);
     lsi_set_phase(s, PHASE_MI);
     s->msg_action = 1;
     lsi_add_msg_byte(s, 0); /* COMMAND COMPLETE */
@@ -2131,7 +2131,7 @@ static const VMStateDescription vmstate_lsi_scsi = {
         VMSTATE_PCI_DEVICE(dev, LSIState),
 
         VMSTATE_INT32(carry, LSIState),
-        VMSTATE_INT32(sense, LSIState),
+        VMSTATE_INT32(status, LSIState),
         VMSTATE_INT32(msg_action, LSIState),
         VMSTATE_INT32(msg_len, LSIState),
         VMSTATE_BUFFER(msg, LSIState),
-- 
1.7.4.4



