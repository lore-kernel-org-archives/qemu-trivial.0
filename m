Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopmn-00055d-Cw
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmg-0004sm-7V
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmb-0001al-9F
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopmQ-0001WG-Pm; Mon, 26 May 2014 03:57:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C429D42FB2;
	Mon, 26 May 2014 11:57:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 85F306AC;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23024 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:05 +0400
Message-Id: <1401088811-22923-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 17/23] libcacard: Convert two leftover
	realloc() to GLib
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
X-List-Received-Date: Mon, 26 May 2014 07:57:31 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/cac.c            |   13 ++-----------
 libcacard/vcard_emul_nss.c |    7 ++-----
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/libcacard/cac.c b/libcacard/cac.c
index 122129e..3887896 100644
--- a/libcacard/cac.c
+++ b/libcacard/cac.c
@@ -169,17 +169,8 @@ cac_applet_pki_process_apdu(VCard *card, VCardAPDU *apdu,
         }
         size = apdu->a_Lc;
 
-        sign_buffer = realloc(pki_applet->sign_buffer,
-                      pki_applet->sign_buffer_len+size);
-        if (sign_buffer == NULL) {
-            g_free(pki_applet->sign_buffer);
-            pki_applet->sign_buffer = NULL;
-            pki_applet->sign_buffer_len = 0;
-            *response = vcard_make_response(
-                            VCARD7816_STATUS_EXC_ERROR_MEMORY_FAILURE);
-            ret = VCARD_DONE;
-            break;
-        }
+        sign_buffer = g_realloc(pki_applet->sign_buffer,
+                                pki_applet->sign_buffer_len + size);
         memcpy(sign_buffer+pki_applet->sign_buffer_len, apdu->a_body, size);
         size += pki_applet->sign_buffer_len;
         switch (apdu->a_p1) {
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 7826593..8e05551 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -1178,11 +1178,8 @@ vcard_emul_options(const char *args)
 
             if (opts->vreader_count >= reader_count) {
                 reader_count += READER_STEP;
-                vreaderOpt = realloc(opts->vreader,
-                                reader_count * sizeof(*vreaderOpt));
-                if (vreaderOpt == NULL) {
-                    return opts; /* we're done */
-                }
+                vreaderOpt = g_renew(VirtualReaderOptions, opts->vreader,
+                                     reader_count);
             }
             opts->vreader = vreaderOpt;
             vreaderOpt = &vreaderOpt[opts->vreader_count];
-- 
1.7.10.4


