Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopTR-00034Q-VL
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:37:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTL-0002ru-Fz
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTG-0003qt-Id
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopT3-0003mW-Vr; Mon, 26 May 2014 03:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1010942F3F;
	Mon, 26 May 2014 11:37:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BAF206B8;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23017 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:02 +0400
Message-Id: <1401088811-22923-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 14/23] libcacard: Plug memory leaks around
	vreader_get_reader_list()
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
X-List-Received-Date: Mon, 26 May 2014 07:37:32 -0000

From: Markus Armbruster <armbru@redhat.com>

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vcard_emul_nss.c |    4 ++++
 libcacard/vscclient.c      |    1 +
 2 files changed, 5 insertions(+)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 75b9d79..7826593 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -433,11 +433,13 @@ vcard_emul_find_vreader_from_slot(PK11SlotInfo *slot)
         VReader *reader = vreader_list_get_reader(current_entry);
         VReaderEmul *reader_emul = vreader_get_private(reader);
         if (reader_emul->slot == slot) {
+            vreader_list_delete(reader_list);
             return reader;
         }
         vreader_free(reader);
     }
 
+    vreader_list_delete(reader_list);
     return NULL;
 }
 
@@ -1059,6 +1061,8 @@ vcard_emul_replay_insertion_events(void)
         next_entry = vreader_list_get_next(current_entry);
         vreader_queue_card_event(vreader);
     }
+
+    vreader_list_delete(list);
 }
 
 /*
diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index 29f4958..f2a753a 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -570,6 +570,7 @@ do_command(GIOChannel *source,
                        "CARD_PRESENT" : "            ",
                        vreader_get_name(reader));
             }
+            vreader_list_delete(list);
         } else if (*string != 0) {
             printf("valid commands:\n");
             printf("insert [reader_id]\n");
-- 
1.7.10.4


