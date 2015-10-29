Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrpY6-0004tt-Tu
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 11:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY4-0004oo-5g
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY3-0007YY-0G
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZrpXx-0007Va-95; Thu, 29 Oct 2015 11:55:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DDCD3C0A5247;
	Thu, 29 Oct 2015 15:55:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9TFtMdU027635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Oct 2015 11:55:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 867D6303E3F3; Thu, 29 Oct 2015 16:55:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 16:55:22 +0100
Message-Id: <1446134122-32292-5-git-send-email-armbru@redhat.com>
In-Reply-To: <1446134122-32292-1-git-send-email-armbru@redhat.com>
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 4/4] usb: Use g_new() & friends where that
	makes obvious sense
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
X-List-Received-Date: Thu, 29 Oct 2015 15:55:33 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/usb/ccid-card-emulated.c | 4 ++--
 hw/usb/dev-mtp.c            | 3 +--
 hw/usb/hcd-xhci.c           | 2 +-
 hw/usb/redirect.c           | 6 +++---
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 72329ed..869a63c 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -166,7 +166,7 @@ static void emulated_push_event(EmulatedState *card, EmulEvent *event)
 
 static void emulated_push_type(EmulatedState *card, uint32_t type)
 {
-    EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent));
+    EmulEvent *event = g_new(EmulEvent, 1);
 
     assert(event);
     event->p.gen.type = type;
@@ -175,7 +175,7 @@ static void emulated_push_type(EmulatedState *card, uint32_t type)
 
 static void emulated_push_error(EmulatedState *card, uint64_t code)
 {
-    EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent));
+    EmulEvent *event = g_new(EmulEvent, 1);
 
     assert(event);
     event->p.error.type = EMUL_ERROR;
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 809b1cb..a276267 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -359,8 +359,7 @@ static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
     }
     while ((entry = readdir(dir)) != NULL) {
         if ((o->nchildren % 32) == 0) {
-            o->children = g_realloc(o->children,
-                                    (o->nchildren + 32) * sizeof(MTPObject *));
+            o->children = g_renew(MTPObject *, o->children, o->nchildren + 32);
         }
         o->children[o->nchildren] =
             usb_mtp_object_alloc(s, s->next_handle++, o, entry->d_name);
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 1c57e20..268ab36 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2188,7 +2188,7 @@ static void xhci_kick_ep(XHCIState *xhci, unsigned int slotid,
             xfer->trbs = NULL;
         }
         if (!xfer->trbs) {
-            xfer->trbs = g_malloc(sizeof(XHCITRB) * length);
+            xfer->trbs = g_new(XHCITRB, length);
             xfer->trb_alloced = length;
         }
         xfer->trb_count = length;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 38086cd..30ff742 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -322,7 +322,7 @@ static void packet_id_queue_add(struct PacketIdQueue *q, uint64_t id)
 
     DPRINTF("adding packet id %"PRIu64" to %s queue\n", id, q->name);
 
-    e = g_malloc0(sizeof(struct PacketIdQueueEntry));
+    e = g_new0(struct PacketIdQueueEntry, 1);
     e->id = id;
     QTAILQ_INSERT_TAIL(&q->head, e, next);
     q->size++;
@@ -468,7 +468,7 @@ static void bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
     }
 
-    bufp = g_malloc(sizeof(struct buf_packet));
+    bufp = g_new(struct buf_packet, 1);
     bufp->data   = data;
     bufp->len    = len;
     bufp->offset = 0;
@@ -2234,7 +2234,7 @@ static int usbredir_get_bufpq(QEMUFile *f, void *priv, size_t unused)
 
     endp->bufpq_size = qemu_get_be32(f);
     for (i = 0; i < endp->bufpq_size; i++) {
-        bufp = g_malloc(sizeof(struct buf_packet));
+        bufp = g_new(struct buf_packet, 1);
         bufp->len = qemu_get_be32(f);
         bufp->status = qemu_get_be32(f);
         bufp->offset = 0;
-- 
2.4.3


