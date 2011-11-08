Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNiPX-0002jE-BQ
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 04:56:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNiPU-0002b8-CV
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:56:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNiPT-0001it-8F
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:56:04 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:58109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNiPM-0001fu-Bb; Tue, 08 Nov 2011 04:55:56 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 075BD9FFC5;
	Tue,  8 Nov 2011 10:55:52 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 4B4486006D; Tue,  8 Nov 2011 10:55:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 10:55:52 +0100
Message-Id: <1320746152-31620-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] ui/vnc: Convert sasl.mechlist to g_malloc()
	& friends
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
X-List-Received-Date: Tue, 08 Nov 2011 09:56:05 -0000

Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
fails.  Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/vnc-auth-sasl.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index 23b1bf5..a88973b 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -35,7 +35,7 @@ void vnc_sasl_client_cleanup(VncState *vs)
         vs->sasl.encodedLength = vs->sasl.encodedOffset = 0;
         vs->sasl.encoded = NULL;
         g_free(vs->sasl.username);
-        free(vs->sasl.mechlist);
+        g_free(vs->sasl.mechlist);
         vs->sasl.username = vs->sasl.mechlist = NULL;
         sasl_dispose(&vs->sasl.conn);
         vs->sasl.conn = NULL;
@@ -430,7 +430,7 @@ static int protocol_client_auth_sasl_start_len(VncState *vs, uint8_t *data, size
 
 static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_t len)
 {
-    char *mechname = malloc(len + 1);
+    char *mechname = g_malloc(len + 1);
     if (!mechname) {
         VNC_DEBUG("Out of memory reading mechname\n");
         vnc_client_error(vs);
@@ -460,7 +460,7 @@ static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_
         }
     }
 
-    free(vs->sasl.mechlist);
+    g_free(vs->sasl.mechlist);
     vs->sasl.mechlist = mechname;
 
     VNC_DEBUG("Validated mechname '%s'\n", mechname);
@@ -469,7 +469,7 @@ static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_
 
  fail:
     vnc_client_error(vs);
-    free(mechname);
+    g_free(mechname);
     return -1;
 }
 
@@ -608,7 +608,7 @@ void start_auth_sasl(VncState *vs)
     }
     VNC_DEBUG("Available mechanisms for client: '%s'\n", mechlist);
 
-    if (!(vs->sasl.mechlist = strdup(mechlist))) {
+    if (!(vs->sasl.mechlist = g_strdup(mechlist))) {
         VNC_DEBUG("Out of memory");
         sasl_dispose(&vs->sasl.conn);
         vs->sasl.conn = NULL;
-- 
1.7.6.4


