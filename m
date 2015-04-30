Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yngij-0000LW-1m
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngid-00008O-Ij
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngic-0003mG-Je
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngiY-0003kN-3n; Thu, 30 Apr 2015 01:08:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A40042B87;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2F40F946;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: (nullmailer pid 4302 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:18 +0300
Message-Id: <bc4b78cfc2b559aed61ed4b7fef4a45c21ced2b4.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PULL 05/42] ui/vnc : remove 'struct' of 'typedef
	struct'
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
X-List-Received-Date: Thu, 30 Apr 2015 05:09:05 -0000

From: Chih-Min Chao <cmchao@gmail.com>

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/vnc-auth-vencrypt.c |  4 ++--
 ui/vnc-tls.c           | 10 +++++-----
 ui/vnc-ws.c            |  4 ++--
 ui/vnc.c               |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/ui/vnc-auth-vencrypt.c b/ui/vnc-auth-vencrypt.c
index 65f1afa..03ea48a 100644
--- a/ui/vnc-auth-vencrypt.c
+++ b/ui/vnc-auth-vencrypt.c
@@ -65,7 +65,7 @@ static void start_auth_vencrypt_subauth(VncState *vs)
 
 static void vnc_tls_handshake_io(void *opaque);
 
-static int vnc_start_vencrypt_handshake(struct VncState *vs)
+static int vnc_start_vencrypt_handshake(VncState *vs)
 {
     int ret;
 
@@ -103,7 +103,7 @@ static int vnc_start_vencrypt_handshake(struct VncState *vs)
 
 static void vnc_tls_handshake_io(void *opaque)
 {
-    struct VncState *vs = (struct VncState *)opaque;
+    VncState *vs = (VncState *)opaque;
 
     VNC_DEBUG("Handshake IO continue\n");
     vnc_start_vencrypt_handshake(vs);
diff --git a/ui/vnc-tls.c b/ui/vnc-tls.c
index eddd39b..028fc4d 100644
--- a/ui/vnc-tls.c
+++ b/ui/vnc-tls.c
@@ -68,7 +68,7 @@ static int vnc_tls_initialize(void)
 static ssize_t vnc_tls_push(gnutls_transport_ptr_t transport,
                             const void *data,
                             size_t len) {
-    struct VncState *vs = (struct VncState *)transport;
+    VncState *vs = (VncState *)transport;
     int ret;
 
  retry:
@@ -85,7 +85,7 @@ static ssize_t vnc_tls_push(gnutls_transport_ptr_t transport,
 static ssize_t vnc_tls_pull(gnutls_transport_ptr_t transport,
                             void *data,
                             size_t len) {
-    struct VncState *vs = (struct VncState *)transport;
+    VncState *vs = (VncState *)transport;
     int ret;
 
  retry:
@@ -170,7 +170,7 @@ static gnutls_certificate_credentials_t vnc_tls_initialize_x509_cred(VncDisplay
 }
 
 
-int vnc_tls_validate_certificate(struct VncState *vs)
+int vnc_tls_validate_certificate(VncState *vs)
 {
     int ret;
     unsigned int status;
@@ -332,7 +332,7 @@ static int vnc_set_gnutls_priority(gnutls_session_t s, int x509)
 
 #endif
 
-int vnc_tls_client_setup(struct VncState *vs,
+int vnc_tls_client_setup(VncState *vs,
                          int needX509Creds) {
     VNC_DEBUG("Do TLS setup\n");
     if (vnc_tls_initialize() < 0) {
@@ -410,7 +410,7 @@ int vnc_tls_client_setup(struct VncState *vs,
 }
 
 
-void vnc_tls_client_cleanup(struct VncState *vs)
+void vnc_tls_client_cleanup(VncState *vs)
 {
     if (vs->tls.session) {
         gnutls_deinit(vs->tls.session);
diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index 62eb97f..38a1b8b 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -24,7 +24,7 @@
 #ifdef CONFIG_VNC_TLS
 #include "qemu/sockets.h"
 
-static int vncws_start_tls_handshake(struct VncState *vs)
+static int vncws_start_tls_handshake(VncState *vs)
 {
     int ret = gnutls_handshake(vs->tls.session);
 
@@ -63,7 +63,7 @@ static int vncws_start_tls_handshake(struct VncState *vs)
 
 void vncws_tls_handshake_io(void *opaque)
 {
-    struct VncState *vs = (struct VncState *)opaque;
+    VncState *vs = (VncState *)opaque;
 
     if (!vs->tls.session) {
         VNC_DEBUG("TLS Websocket setup\n");
diff --git a/ui/vnc.c b/ui/vnc.c
index cffb5b7..9f8ecd0 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1046,7 +1046,7 @@ static void vnc_dpy_cursor_define(DisplayChangeListener *dcl,
     }
 }
 
-static int find_and_clear_dirty_height(struct VncState *vs,
+static int find_and_clear_dirty_height(VncState *vs,
                                        int y, int last_x, int x, int height)
 {
     int h;
-- 
2.1.4


