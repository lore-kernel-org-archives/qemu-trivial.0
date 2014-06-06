Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wszqx-0000PN-3y
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 15:31:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Wszqp-0000De-8N
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 15:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Wszqj-0005jg-4m
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 15:30:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WszqW-0005fM-4k; Fri, 06 Jun 2014 15:30:36 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s56JUZIX030765
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 6 Jun 2014 15:30:35 -0400
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s56JUXPm014829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 6 Jun 2014 15:30:35 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B5A2330403AF; Fri,  6 Jun 2014 21:30:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Jun 2014 21:30:32 +0200
Message-Id: <1402083032-13852-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1402072328-6871-1-git-send-email-armbru@redhat.com>
References: <1402072328-6871-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, alevy@redhat.com
Subject: [Qemu-trivial] [PATCH 2/1] libcacard: Clean up dead stores before
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
X-List-Received-Date: Fri, 06 Jun 2014 19:31:01 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 libcacard/vcard.c   | 4 ----
 libcacard/vreader.c | 2 --
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
1.9.3


