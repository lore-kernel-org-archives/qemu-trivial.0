Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmdL-0006JS-7g
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:26:39 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmdF-0005wq-CI
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:26:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmd9-0004EP-Lo
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:26:33 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:53523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNmd4-0004D9-9h; Tue, 08 Nov 2011 09:26:22 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 35D0B9FFC5;
	Tue,  8 Nov 2011 15:26:19 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 6404E6006D; Tue,  8 Nov 2011 15:26:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 15:26:19 +0100
Message-Id: <1320762379-9276-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, berrange@redhat.com
Subject: [Qemu-trivial] [PATCH v3] ui/vnc: Convert sasl.mechlist to
	g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 14:26:37 -0000

Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
fails.  Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/vnc-auth-sasl.c |   19 +++++--------------
 1 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index 23b1bf5..e2045fc 100644
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
@@ -430,11 +430,7 @@ static int protocol_client_auth_sasl_start_len(VncState *vs, uint8_t *data, size
 
 static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_t len)
 {
-    char *mechname = malloc(len + 1);
-    if (!mechname) {
-        VNC_DEBUG("Out of memory reading mechname\n");
-        vnc_client_error(vs);
-    }
+    char *mechname = g_malloc(len + 1);
     strncpy(mechname, (char*)data, len);
     mechname[len] = '\0';
     VNC_DEBUG("Got client mechname '%s' check against '%s'\n",
@@ -460,7 +456,7 @@ static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_
         }
     }
 
-    free(vs->sasl.mechlist);
+    g_free(vs->sasl.mechlist);
     vs->sasl.mechlist = mechname;
 
     VNC_DEBUG("Validated mechname '%s'\n", mechname);
@@ -469,7 +465,7 @@ static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_
 
  fail:
     vnc_client_error(vs);
-    free(mechname);
+    g_free(mechname);
     return -1;
 }
 
@@ -608,12 +604,7 @@ void start_auth_sasl(VncState *vs)
     }
     VNC_DEBUG("Available mechanisms for client: '%s'\n", mechlist);
 
-    if (!(vs->sasl.mechlist = strdup(mechlist))) {
-        VNC_DEBUG("Out of memory");
-        sasl_dispose(&vs->sasl.conn);
-        vs->sasl.conn = NULL;
-        goto authabort;
-    }
+    vs->sasl.mechlist = g_strdup(mechlist);
     mechlistlen = strlen(mechlist);
     vnc_write_u32(vs, mechlistlen);
     vnc_write(vs, mechlist, mechlistlen);
-- 
1.7.6.4


