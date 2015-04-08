Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfvcH-0005et-SU
	for mharc-qemu-trivial@gnu.org; Wed, 08 Apr 2015 15:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKy-0001Zw-G3
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKx-0001KP-Fe
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:28 -0400
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:33996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>)
	id 1YfuKv-0001JD-Bc; Wed, 08 Apr 2015 14:04:25 -0400
Received: by pacyx8 with SMTP id yx8so121613885pac.1;
	Wed, 08 Apr 2015 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vu2SNmdV0LIQT4J4AoowEeAmwBXiVYYrffb859C1tto=;
	b=X0p1k3Z/NisPSz1My+AuSWGQWl2q1Opq+PAPvpw5cX4UbnjNcVl5Dj/edGBPKDqJXv
	+csAxGd90DBD3Hpi6i2QF48GpMMiju9j2Z7+4ftSzDuNtzGfgRglg7UC5u0PXLF8NrL+
	zx1vHDBT1lqgop90xIW1+sIz++0k/91kGMG/T8W42iZliEhH54a1YHIiJN+c5TQWLAzq
	LDsqaltLXh2XGR2Gp4KyqGJZaSSB5Gobk4P5TxHz7nZe6DVDe7D80trMewcTsoerqcMZ
	1Ysf0P8YRxbIN5AA56sh/ZWWt4jVkOWqnNpN6ECsPsvIESGNGBjJAEyOf6OKO35NYM50
	kbOA==
X-Received: by 10.70.38.33 with SMTP id d1mr40384234pdk.99.1428516264650;
	Wed, 08 Apr 2015 11:04:24 -0700 (PDT)
Received: from localhost.localdomain (118-167-152-188.dynamic.hinet.net.
	[118.167.152.188])
	by mx.google.com with ESMTPSA id w1sm11968593pdp.25.2015.04.08.11.04.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Apr 2015 11:04:23 -0700 (PDT)
From: Chih-Min Chao <cmchao@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Apr 2015 02:04:12 +0800
Message-Id: <1428516254-23054-4-git-send-email-cmchao@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
X-Mailman-Approved-At: Wed, 08 Apr 2015 15:26:23 -0400
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/5] ui/vnc : remove 'struct' of 'typedef
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
X-List-Received-Date: Wed, 08 Apr 2015 18:04:29 -0000

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
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
1.9.1


