Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOkc-0002Pi-IG
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:18:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkV-0002BK-FW
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkP-0003hs-MX
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOkE-0003fD-JI; Tue, 10 Jun 2014 12:17:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 80567412C0;
	Tue, 10 Jun 2014 20:17:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D98736C6;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13336 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:40 +0400
Message-Id: <1402416523-13212-23-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 22/25] libcacard: Clean up dead stores before
	g_free()
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
X-List-Received-Date: Tue, 10 Jun 2014 16:18:17 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vcard.c   |    4 ----
 libcacard/vreader.c |    2 --
 2 files changed, 6 deletions(-)

diff --git a/libcacard/vcard.c b/libcacard/vcard.c
index bf342aa..87ad516 100644
--- a/libcacard/vcard.c
+++ b/libcacard/vcard.c
@@ -117,10 +117,8 @@ vcard_delete_applet(VCardApplet *applet)
     }
     if (applet->applet_private_free) {
         applet->applet_private_free(applet->applet_private);
-        applet->applet_private = NULL;
     }
     g_free(applet->aid);
-    applet->aid = NULL;
     g_free(applet);
 }
 
@@ -174,8 +172,6 @@ vcard_free(VCard *vcard)
     }
     if (vcard->vcard_private_free) {
         (*vcard->vcard_private_free)(vcard->vcard_private);
-        vcard->vcard_private_free = 0;
-        vcard->vcard_private = 0;
     }
     for (current_applet = vcard->applet_list; current_applet;
                                         current_applet = next_applet) {
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index ffa05b6..9f42f0f 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -343,8 +343,6 @@ vreader_list_delete(VReaderList *list)
         next_entry = vreader_list_get_next(current_entry);
         vreader_list_entry_delete(current_entry);
     }
-    list->head = NULL;
-    list->tail = NULL;
     g_free(list);
 }
 
-- 
1.7.10.4


