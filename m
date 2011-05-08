Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ6Ut-0006lm-4e
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 12:06:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1QJ6Ul-0006W5-VY
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 12:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1QJ6Ul-0007ae-22
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 12:06:11 -0400
Received: from mtagate1.uk.ibm.com ([194.196.100.161]:38475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>)
	id 1QJ6Ug-0007Z4-Qq; Sun, 08 May 2011 12:06:07 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate1.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p48G66YO023832;
	Sun, 8 May 2011 16:06:06 GMT
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
	[9.149.37.252])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id p48G7Let2523186; Sun, 8 May 2011 17:07:21 +0100
Received: from d06av11.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id p48G65ss021822; Sun, 8 May 2011 10:06:05 -0600
Received: from stefanha-thinkpad.ibm.com (sig-9-146-157-45.uk.ibm.com
	[9.146.157.45])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id p48G5njp021096; Sun, 8 May 2011 10:06:04 -0600
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Sun,  8 May 2011 17:05:19 +0100
Message-Id: <1304870719-20885-25-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1304870719-20885-1-git-send-email-stefanha@linux.vnet.ibm.com>
References: <1304870719-20885-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 194.196.100.161
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	Hannes Reinecke <hare@suse.de>
Subject: [Qemu-trivial] [PATCH 24/24] lsi53c895a: Rename 'sense' to 'status'
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
X-List-Received-Date: Sun, 08 May 2011 16:06:13 -0000

From: Hannes Reinecke <hare@suse.de>

The 'sense' field in the HBA status structure is misnamed, as it
actually carries the SCSI status. Rename it.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 hw/lsi53c895a.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/lsi53c895a.c b/hw/lsi53c895a.c
index be4df58..2ce38a9 100644
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
@@ -2122,7 +2122,7 @@ static const VMStateDescription vmstate_lsi_scsi = {
         VMSTATE_PCI_DEVICE(dev, LSIState),
 
         VMSTATE_INT32(carry, LSIState),
-        VMSTATE_INT32(sense, LSIState),
+        VMSTATE_INT32(status, LSIState),
         VMSTATE_INT32(msg_action, LSIState),
         VMSTATE_INT32(msg_len, LSIState),
         VMSTATE_BUFFER(msg, LSIState),
-- 
1.7.4.4


