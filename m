Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyfdQ-0002XY-CQ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 04:31:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TyfdK-0002EQ-81
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:31:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TyfdH-0003f5-Qe
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:31:38 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:50127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Tyfd3-0003cB-IK; Fri, 25 Jan 2013 04:31:21 -0500
Received: from blackfin.pond.sub.org (p5B32A326.dip.t-dialin.net
	[91.50.163.38])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id CD17E9FE7B;
	Fri, 25 Jan 2013 10:31:17 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E3607200AA; Fri, 25 Jan 2013 10:31:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 25 Jan 2013 10:31:16 +0100
Message-Id: <1359106276-16449-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, thardeck@suse.de
Subject: [Qemu-trivial] [PATCH v2] vnc: Clean up
	vncws_send_handshake_response()
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
X-List-Received-Date: Fri, 25 Jan 2013 09:31:42 -0000

Use appropriate types, drop superfluous casts, use sizeof, don't
exploit that this particular call of gnutls_fingerprint() doesn't
change its last argument.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/vnc-ws.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index 9ccdc19..3e30209 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -120,10 +120,11 @@ static char *vncws_extract_handshake_entry(const char *handshake,
 static void vncws_send_handshake_response(VncState *vs, const char* key)
 {
     char combined_key[WS_CLIENT_KEY_LEN + WS_GUID_LEN + 1];
-    char hash[SHA1_DIGEST_LEN];
-    size_t hash_size = SHA1_DIGEST_LEN;
+    unsigned char hash[SHA1_DIGEST_LEN];
+    size_t hash_size = sizeof(hash);
     char *accept = NULL, *response = NULL;
     gnutls_datum_t in;
+    int ret;
 
     g_strlcpy(combined_key, key, WS_CLIENT_KEY_LEN + 1);
     g_strlcat(combined_key, WS_GUID, WS_CLIENT_KEY_LEN + WS_GUID_LEN + 1);
@@ -131,9 +132,9 @@ static void vncws_send_handshake_response(VncState *vs, const char* key)
     /* hash and encode it */
     in.data = (void *)combined_key;
     in.size = WS_CLIENT_KEY_LEN + WS_GUID_LEN;
-    if (gnutls_fingerprint(GNUTLS_DIG_SHA1, &in, hash, &hash_size)
-            == GNUTLS_E_SUCCESS) {
-        accept = g_base64_encode((guchar *)hash, SHA1_DIGEST_LEN);
+    ret = gnutls_fingerprint(GNUTLS_DIG_SHA1, &in, hash, &hash_size);
+    if (ret == GNUTLS_E_SUCCESS && hash_size <= SHA1_DIGEST_LEN) {
+        accept = g_base64_encode(hash, hash_size);
     }
     if (accept == NULL) {
         VNC_DEBUG("Hashing Websocket combined key failed\n");
-- 
1.7.11.7


