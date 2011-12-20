Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rd3Fq-0000Cy-Im
	for mharc-qemu-trivial@gnu.org; Tue, 20 Dec 2011 12:13:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Rd3Fk-0008KG-Ee
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 12:13:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Rd3Fj-0003Rr-4j
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 12:13:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:35387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Rd3FY-0003Q6-Ii; Tue, 20 Dec 2011 12:13:12 -0500
Received: from blackfin.pond.sub.org (p5B32D09F.dip.t-dialin.net
	[91.50.208.159])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id A0AEB9FF86;
	Tue, 20 Dec 2011 18:13:09 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id DD92060074; Tue, 20 Dec 2011 18:13:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Dec 2011 18:13:08 +0100
Message-Id: <1324401188-9712-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Strip trailing '\n' from error_report()'s
	first argument (again)
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
X-List-Received-Date: Tue, 20 Dec 2011 17:13:29 -0000

Commit 6daf194d got rid of them, but Hans and Gerd added some more
lately.  Tracked down with this Coccinelle semantic patch:

@r@
    expression fmt;
    position p;
@@
    error_report(fmt, ...)@p
@script:python@
    fmt << r.fmt;
    p << r.p;
@@
if "\\n" in str(fmt):
    print "%s:%s:%s:%s" % (p[0].file, p[0].line, p[0].column, fmt)

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/usb-bus.c |   12 ++++++------
 usb-redir.c  |    4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/usb-bus.c b/hw/usb-bus.c
index 8203390..bd4afa7 100644
--- a/hw/usb-bus.c
+++ b/hw/usb-bus.c
@@ -137,7 +137,7 @@ USBDevice *usb_create(USBBus *bus, const char *name)
         bus = usb_bus_find(-1);
         if (!bus)
             return NULL;
-        error_report("%s: no bus specified, using \"%s\" for \"%s\"\n",
+        error_report("%s: no bus specified, using \"%s\" for \"%s\"",
                 __FUNCTION__, bus->qbus.name, name);
     }
 #endif
@@ -152,12 +152,12 @@ USBDevice *usb_create_simple(USBBus *bus, const char *name)
     int rc;
 
     if (!dev) {
-        error_report("Failed to create USB device '%s'\n", name);
+        error_report("Failed to create USB device '%s'", name);
         return NULL;
     }
     rc = qdev_init(&dev->qdev);
     if (rc < 0) {
-        error_report("Failed to initialize USB device '%s'\n", name);
+        error_report("Failed to initialize USB device '%s'", name);
         return NULL;
     }
     return dev;
@@ -244,7 +244,7 @@ int usb_claim_port(USBDevice *dev)
             }
         }
         if (port == NULL) {
-            error_report("Error: usb port %s (bus %s) not found (in use?)\n",
+            error_report("Error: usb port %s (bus %s) not found (in use?)",
                          dev->port_path, bus->qbus.name);
             return -1;
         }
@@ -255,7 +255,7 @@ int usb_claim_port(USBDevice *dev)
         }
         if (bus->nfree == 0) {
             error_report("Error: tried to attach usb device %s to a bus "
-                         "with no free ports\n", dev->product_desc);
+                         "with no free ports", dev->product_desc);
             return -1;
         }
         port = QTAILQ_FIRST(&bus->free);
@@ -302,7 +302,7 @@ int usb_device_attach(USBDevice *dev)
 
     if (!(port->speedmask & dev->speedmask)) {
         error_report("Warning: speed mismatch trying to attach "
-                     "usb device %s to bus %s\n",
+                     "usb device %s to bus %s",
                      dev->product_desc, bus->qbus.name);
         return -1;
     }
diff --git a/usb-redir.c b/usb-redir.c
index a36f2a7..2b53cf3 100644
--- a/usb-redir.c
+++ b/usb-redir.c
@@ -174,7 +174,7 @@ static void usbredir_log(void *priv, int level, const char *msg)
         return;
     }
 
-    error_report("%s\n", msg);
+    error_report("%s", msg);
 }
 
 static void usbredir_log_data(USBRedirDevice *dev, const char *desc,
@@ -193,7 +193,7 @@ static void usbredir_log_data(USBRedirDevice *dev, const char *desc,
         for (j = 0; j < 8 && i + j < len; j++) {
             n += sprintf(buf + n, " %02X", data[i + j]);
         }
-        error_report("%s\n", buf);
+        error_report("%s", buf);
     }
 }
 
-- 
1.7.6.4


