Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRKtg-0007EU-Ue
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 13:09:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtY-0007AZ-PJ
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtW-0008Nf-V4
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56866 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fRKtT-0008Kl-0b; Fri, 08 Jun 2018 13:09:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A188A818BAF1;
	Fri,  8 Jun 2018 17:09:42 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 637D42157F43;
	Fri,  8 Jun 2018 17:09:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Fri,  8 Jun 2018 18:09:27 +0100
Message-Id: <20180608170933.9137-3-berrange@redhat.com>
In-Reply-To: <20180608170933.9137-1-berrange@redhat.com>
References: <20180608170933.9137-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 08 Jun 2018 17:09:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 08 Jun 2018 17:09:42 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 2/8] hw/usb: switch MTP to use new inotify
 APIs
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
X-List-Received-Date: Fri, 08 Jun 2018 17:09:50 -0000

The internal inotify APIs allow alot of conditional statements to be
cleared out, and provide a simpler callback for handling events.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 hw/usb/dev-mtp.c | 238 +++++++++++++++++++----------------------------
 1 file changed, 97 insertions(+), 141 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 560c61c7c1..d7188b2b62 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -15,13 +15,11 @@
 #include <dirent.h>
=20
 #include <sys/statvfs.h>
-#ifdef CONFIG_INOTIFY1
-#include <sys/inotify.h>
-#include "qemu/main-loop.h"
-#endif
+
=20
 #include "qemu-common.h"
 #include "qemu/iov.h"
+#include "qemu/inotify.h"
 #include "trace.h"
 #include "hw/usb.h"
 #include "desc.h"
@@ -123,7 +121,6 @@ enum {
     EP_EVENT,
 };
=20
-#ifdef CONFIG_INOTIFY1
 typedef struct MTPMonEntry MTPMonEntry;
=20
 struct MTPMonEntry {
@@ -132,7 +129,6 @@ struct MTPMonEntry {
=20
     QTAILQ_ENTRY(MTPMonEntry) next;
 };
-#endif
=20
 struct MTPControl {
     uint16_t     code;
@@ -158,10 +154,8 @@ struct MTPObject {
     char         *name;
     char         *path;
     struct stat  stat;
-#ifdef CONFIG_INOTIFY1
     /* inotify watch cookie */
     int          watchfd;
-#endif
     MTPObject    *parent;
     uint32_t     nchildren;
     QLIST_HEAD(, MTPObject) children;
@@ -184,11 +178,8 @@ struct MTPState {
     bool         readonly;
=20
     QTAILQ_HEAD(, MTPObject) objects;
-#ifdef CONFIG_INOTIFY1
-    /* inotify descriptor */
-    int          inotifyfd;
+    QInotify *inotify;
     QTAILQ_HEAD(events, MTPMonEntry) events;
-#endif
     /* Responder is expecting a write operation */
     bool write_pending;
     struct {
@@ -368,7 +359,7 @@ static const USBDesc desc =3D {
 /* ---------------------------------------------------------------------=
-- */
=20
 static MTPObject *usb_mtp_object_alloc(MTPState *s, uint32_t handle,
-                                       MTPObject *parent, char *name)
+                                       MTPObject *parent, const char *na=
me)
 {
     MTPObject *o =3D g_new0(MTPObject, 1);
=20
@@ -450,7 +441,7 @@ static MTPObject *usb_mtp_object_lookup(MTPState *s, =
uint32_t handle)
 }
=20
 static MTPObject *usb_mtp_add_child(MTPState *s, MTPObject *o,
-                                    char *name)
+                                    const char *name)
 {
     MTPObject *child =3D
         usb_mtp_object_alloc(s, s->next_handle++, o, name);
@@ -469,10 +460,14 @@ static MTPObject *usb_mtp_add_child(MTPState *s, MT=
PObject *o,
 }
=20
 static MTPObject *usb_mtp_object_lookup_name(MTPObject *parent,
-                                             char *name, int len)
+                                             const char *name, int len)
 {
     MTPObject *iter;
=20
+    if (len =3D=3D -1) {
+        len =3D strlen(name);
+    }
+
     QLIST_FOREACH(iter, &parent->children, list) {
         if (strncmp(iter->name, name, len) =3D=3D 0) {
             return iter;
@@ -482,7 +477,6 @@ static MTPObject *usb_mtp_object_lookup_name(MTPObjec=
t *parent,
     return NULL;
 }
=20
-#ifdef CONFIG_INOTIFY1
 static MTPObject *usb_mtp_object_lookup_wd(MTPState *s, int wd)
 {
     MTPObject *iter;
@@ -496,126 +490,100 @@ static MTPObject *usb_mtp_object_lookup_wd(MTPSta=
te *s, int wd)
     return NULL;
 }
=20
-static void inotify_watchfn(void *arg)
+static void inotify_watchfn(int wd,
+                            uint32_t mask,
+                            const char *name,
+                            void *opaque)
 {
-    MTPState *s =3D arg;
-    ssize_t bytes;
-    /* From the man page: atleast one event can be read */
-    int pos;
-    char buf[sizeof(struct inotify_event) + NAME_MAX + 1];
-
-    for (;;) {
-        bytes =3D read(s->inotifyfd, buf, sizeof(buf));
-        pos =3D 0;
-
-        if (bytes <=3D 0) {
-            /* Better luck next time */
+    MTPState *s =3D opaque;
+    int watchfd =3D 0;
+    MTPObject *parent =3D usb_mtp_object_lookup_wd(s, wd);
+    MTPMonEntry *entry =3D NULL;
+    MTPObject *o;
+
+    mask &=3D (IN_CREATE | IN_DELETE |
+             IN_MODIFY | IN_IGNORED);
+
+    if (!parent) {
+        return;
+    }
+
+    switch (mask) {
+    case IN_CREATE:
+        if (usb_mtp_object_lookup_name(parent, name, -1)) {
+            /* Duplicate create event */
+            return;
+        }
+        entry =3D g_new0(MTPMonEntry, 1);
+        entry->handle =3D s->next_handle;
+        entry->event =3D EVT_OBJ_ADDED;
+        o =3D usb_mtp_add_child(s, parent, name);
+        if (!o) {
+            g_free(entry);
             return;
         }
+        o->watchfd =3D watchfd;
+        trace_usb_mtp_inotify_event(s->dev.addr, name,
+                                    mask, "Obj Added");
+        break;
=20
+    case IN_DELETE:
         /*
-         * TODO: Ignore initiator initiated events.
-         * For now we are good because the store is RO
+         * The kernel issues a IN_IGNORED event
+         * when a dir containing a watchpoint is
+         * deleted, so we don't have to delete the
+         * watchpoint
          */
-        while (bytes > 0) {
-            char *p =3D buf + pos;
-            struct inotify_event *event =3D (struct inotify_event *)p;
-            int watchfd =3D 0;
-            uint32_t mask =3D event->mask & (IN_CREATE | IN_DELETE |
-                                           IN_MODIFY | IN_IGNORED);
-            MTPObject *parent =3D usb_mtp_object_lookup_wd(s, event->wd)=
;
-            MTPMonEntry *entry =3D NULL;
-            MTPObject *o;
-
-            pos =3D pos + sizeof(struct inotify_event) + event->len;
-            bytes =3D bytes - pos;
-
-            if (!parent) {
-                continue;
-            }
-
-            switch (mask) {
-            case IN_CREATE:
-                if (usb_mtp_object_lookup_name
-                    (parent, event->name, event->len)) {
-                    /* Duplicate create event */
-                    continue;
-                }
-                entry =3D g_new0(MTPMonEntry, 1);
-                entry->handle =3D s->next_handle;
-                entry->event =3D EVT_OBJ_ADDED;
-                o =3D usb_mtp_add_child(s, parent, event->name);
-                if (!o) {
-                    g_free(entry);
-                    continue;
-                }
-                o->watchfd =3D watchfd;
-                trace_usb_mtp_inotify_event(s->dev.addr, event->name,
-                                            event->mask, "Obj Added");
-                break;
-
-            case IN_DELETE:
-                /*
-                 * The kernel issues a IN_IGNORED event
-                 * when a dir containing a watchpoint is
-                 * deleted, so we don't have to delete the
-                 * watchpoint
-                 */
-                o =3D usb_mtp_object_lookup_name(parent, event->name, ev=
ent->len);
-                if (!o) {
-                    continue;
-                }
-                entry =3D g_new0(MTPMonEntry, 1);
-                entry->handle =3D o->handle;
-                entry->event =3D EVT_OBJ_REMOVED;
-                trace_usb_mtp_inotify_event(s->dev.addr, o->path,
-                                      event->mask, "Obj Deleted");
-                usb_mtp_object_free(s, o);
-                break;
-
-            case IN_MODIFY:
-                o =3D usb_mtp_object_lookup_name(parent, event->name, ev=
ent->len);
-                if (!o) {
-                    continue;
-                }
-                entry =3D g_new0(MTPMonEntry, 1);
-                entry->handle =3D o->handle;
-                entry->event =3D EVT_OBJ_INFO_CHANGED;
-                trace_usb_mtp_inotify_event(s->dev.addr, o->path,
-                                      event->mask, "Obj Modified");
-                break;
-
-            case IN_IGNORED:
-                trace_usb_mtp_inotify_event(s->dev.addr, parent->path,
-                                      event->mask, "Obj parent dir ignor=
ed");
-                break;
-
-            default:
-                fprintf(stderr, "usb-mtp: failed to parse inotify event\=
n");
-                continue;
-            }
+        o =3D usb_mtp_object_lookup_name(parent, name, -1);
+        if (!o) {
+            return;
+        }
+        entry =3D g_new0(MTPMonEntry, 1);
+        entry->handle =3D o->handle;
+        entry->event =3D EVT_OBJ_REMOVED;
+        trace_usb_mtp_inotify_event(s->dev.addr, o->path,
+                                    mask, "Obj Deleted");
+        usb_mtp_object_free(s, o);
+        break;
=20
-            if (entry) {
-                QTAILQ_INSERT_HEAD(&s->events, entry, next);
-            }
+    case IN_MODIFY:
+        o =3D usb_mtp_object_lookup_name(parent, name, -1);
+        if (!o) {
+            return;
         }
+        entry =3D g_new0(MTPMonEntry, 1);
+        entry->handle =3D o->handle;
+        entry->event =3D EVT_OBJ_INFO_CHANGED;
+        trace_usb_mtp_inotify_event(s->dev.addr, o->path,
+                                    mask, "Obj Modified");
+        break;
+
+    case IN_IGNORED:
+        trace_usb_mtp_inotify_event(s->dev.addr, parent->path,
+                                    mask, "Obj parent dir ignored");
+        break;
+
+    default:
+        fprintf(stderr, "usb-mtp: failed to parse inotify event\n");
+        return;
+    }
+
+    if (entry) {
+        QTAILQ_INSERT_HEAD(&s->events, entry, next);
     }
 }
=20
 static int usb_mtp_inotify_init(MTPState *s)
 {
-    int fd;
-
-    fd =3D inotify_init1(IN_NONBLOCK);
-    if (fd =3D=3D -1) {
+    s->inotify =3D qemu_inotify_new(inotify_watchfn,
+                                  s,
+                                  NULL,
+                                  &error_abort);
+    if (!s->inotify) {
         return 1;
     }
=20
     QTAILQ_INIT(&s->events);
-    s->inotifyfd =3D fd;
-
-    qemu_set_fd_handler(fd, inotify_watchfn, NULL, s);
-
     return 0;
 }
=20
@@ -623,12 +591,7 @@ static void usb_mtp_inotify_cleanup(MTPState *s)
 {
     MTPMonEntry *e, *p;
=20
-    if (!s->inotifyfd) {
-        return;
-    }
-
-    qemu_set_fd_handler(s->inotifyfd, NULL, NULL, s);
-    close(s->inotifyfd);
+    qemu_inotify_free(s->inotify);
=20
     QTAILQ_FOREACH_SAFE(e, &s->events, next, p) {
         QTAILQ_REMOVE(&s->events, e, next);
@@ -636,14 +599,17 @@ static void usb_mtp_inotify_cleanup(MTPState *s)
     }
 }
=20
-static int usb_mtp_add_watch(int inotifyfd, char *path)
+static int usb_mtp_add_watch(MTPState *s, char *path)
 {
+#ifdef CONFIG_INOTIFY1
     uint32_t mask =3D IN_CREATE | IN_DELETE | IN_MODIFY |
         IN_ISDIR;
=20
-    return inotify_add_watch(inotifyfd, path, mask);
-}
+    return qemu_inotify_add_watch(s->inotify, path, mask, NULL);
+#else
+    return -1;
 #endif
+}
=20
 static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
 {
@@ -659,8 +625,8 @@ static void usb_mtp_object_readdir(MTPState *s, MTPOb=
ject *o)
     if (!dir) {
         return;
     }
-#ifdef CONFIG_INOTIFY1
-    int watchfd =3D usb_mtp_add_watch(s->inotifyfd, o->path);
+
+    int watchfd =3D usb_mtp_add_watch(s, o->path);
     if (watchfd =3D=3D -1) {
         fprintf(stderr, "usb-mtp: failed to add watch for %s\n", o->path=
);
     } else {
@@ -668,7 +634,7 @@ static void usb_mtp_object_readdir(MTPState *s, MTPOb=
ject *o)
                                     0, "Watch Added");
         o->watchfd =3D watchfd;
     }
-#endif
+
     while ((entry =3D readdir(dir)) !=3D NULL) {
         usb_mtp_add_child(s, o, entry->d_name);
     }
@@ -1172,13 +1138,11 @@ enum {
 /* Assumes that children, if any, have been already freed */
 static void usb_mtp_object_free_one(MTPState *s, MTPObject *o)
 {
-#ifndef CONFIG_INOTIFY1
     assert(o->nchildren =3D=3D 0);
     QTAILQ_REMOVE(&s->objects, o, next);
     g_free(o->name);
     g_free(o->path);
     g_free(o);
-#endif
 }
=20
 static int usb_mtp_deletefn(MTPState *s, MTPObject *o, uint32_t trans)
@@ -1304,19 +1268,15 @@ static void usb_mtp_command(MTPState *s, MTPContr=
ol *c)
         trace_usb_mtp_op_open_session(s->dev.addr);
         s->session =3D c->argv[0];
         usb_mtp_object_alloc(s, s->next_handle++, NULL, s->root);
-#ifdef CONFIG_INOTIFY1
         if (usb_mtp_inotify_init(s)) {
             fprintf(stderr, "usb-mtp: file monitoring init failed\n");
         }
-#endif
         break;
     case CMD_CLOSE_SESSION:
         trace_usb_mtp_op_close_session(s->dev.addr);
         s->session =3D 0;
         s->next_handle =3D 0;
-#ifdef CONFIG_INOTIFY1
         usb_mtp_inotify_cleanup(s);
-#endif
         usb_mtp_object_free(s, QTAILQ_FIRST(&s->objects));
         assert(QTAILQ_EMPTY(&s->objects));
         break;
@@ -1529,9 +1489,7 @@ static void usb_mtp_handle_reset(USBDevice *dev)
=20
     trace_usb_mtp_reset(s->dev.addr);
=20
-#ifdef CONFIG_INOTIFY1
     usb_mtp_inotify_cleanup(s);
-#endif
     usb_mtp_object_free(s, QTAILQ_FIRST(&s->objects));
     s->session =3D 0;
     usb_mtp_data_free(s->data_in);
@@ -1891,7 +1849,6 @@ static void usb_mtp_handle_data(USBDevice *dev, USB=
Packet *p)
         }
         break;
     case EP_EVENT:
-#ifdef CONFIG_INOTIFY1
         if (!QTAILQ_EMPTY(&s->events)) {
             struct MTPMonEntry *e =3D QTAILQ_LAST(&s->events, events);
             uint32_t handle;
@@ -1915,7 +1872,6 @@ static void usb_mtp_handle_data(USBDevice *dev, USB=
Packet *p)
             g_free(e);
             return;
         }
-#endif
         p->status =3D USB_RET_NAK;
         return;
     default:
--=20
2.17.0


