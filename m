Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ty3wI-0000gl-9g
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2013 12:16:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Ty3w9-0000Hm-5F
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2013 12:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Ty3vx-0000tz-97
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2013 12:16:27 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Ty3vl-0000qk-MN; Wed, 23 Jan 2013 12:16:09 -0500
Received: from blackfin.pond.sub.org (p5B32AAD4.dip.t-dialin.net
	[91.50.170.212])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 9455C9FE47;
	Wed, 23 Jan 2013 18:16:00 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 110FA200AA; Wed, 23 Jan 2013 18:16:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Jan 2013 18:16:00 +0100
Message-Id: <1358961360-15623-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, thardeck@suse.de
Subject: [Qemu-trivial] [PATCH] vnc: Clean up vncws_send_handshake_response()
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
X-List-Received-Date: Wed, 23 Jan 2013 17:16:40 -0000

Use appropriate types, drop superfluous casts, use sizeof, don't
exploit that this particular call of gnutls_fingerprint() doesn't
change its last argument.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/vnc-ws.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index 9ccdc19..de7e74c 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -120,8 +120,8 @@ static char *vncws_extract_handshake_entry(const char *handshake,
 static void vncws_send_handshake_response(VncState *vs, const char* key)
 {
     char combined_key[WS_CLIENT_KEY_LEN + WS_GUID_LEN + 1];
-    char hash[SHA1_DIGEST_LEN];
-    size_t hash_size = SHA1_DIGEST_LEN;
+    unsigned char hash[SHA1_DIGEST_LEN];
+    size_t hash_size = sizeof(hash);
     char *accept = NULL, *response = NULL;
     gnutls_datum_t in;
 
@@ -133,7 +133,7 @@ static void vncws_send_handshake_response(VncState *vs, const char* key)
     in.size = WS_CLIENT_KEY_LEN + WS_GUID_LEN;
     if (gnutls_fingerprint(GNUTLS_DIG_SHA1, &in, hash, &hash_size)
             == GNUTLS_E_SUCCESS) {
-        accept = g_base64_encode((guchar *)hash, SHA1_DIGEST_LEN);
+        accept = g_base64_encode(hash, hash_size);
     }
     if (accept == NULL) {
         VNC_DEBUG("Hashing Websocket combined key failed\n");
-- 
1.7.11.7


