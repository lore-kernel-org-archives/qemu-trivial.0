Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1I5C-00005y-28
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 08:54:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1I54-000859-GF
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:54:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1I4z-0007N4-MH
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:54:34 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1I4p-0007MF-Er; Sat, 25 Feb 2012 08:54:19 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	96BD17280099; Sat, 25 Feb 2012 14:54:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id k0k6ke0xKtMq; Sat, 25 Feb 2012 14:54:18 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id EBC5F728009A; Sat, 25 Feb 2012 14:54:17 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 14:54:17 +0100
Message-Id: <1330178057-21503-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] libcacard: Use format specifier %u instead
	of %d for unsigned values
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
X-List-Received-Date: Sat, 25 Feb 2012 13:54:39 -0000

splint reported warnings for those code statements.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 libcacard/vscclient.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index e317a25..0adae13 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -66,7 +66,7 @@ send_msg(
     qemu_mutex_lock(&write_lock);
 
     if (verbose > 10) {
-        printf("sending type=%d id=%d, len =%d (0x%x)\n",
+        printf("sending type=%d id=%u, len =%u (0x%x)\n",
                type, reader_id, length, length);
     }
 
@@ -167,7 +167,7 @@ event_thread(void *arg)
         case VEVENT_READER_REMOVE:
             /* future, tell qemu that an old CCID reader has been removed */
             if (verbose > 10) {
-                printf(" READER REMOVE: %d\n", reader_id);
+                printf(" READER REMOVE: %u\n", reader_id);
             }
             send_msg(VSC_ReaderRemove, reader_id, NULL, 0);
             break;
@@ -178,7 +178,7 @@ event_thread(void *arg)
             vreader_power_on(event->reader, atr, &atr_len);
             /* ATR call functions as a Card Insert event */
             if (verbose > 10) {
-                printf(" CARD INSERT %d: ", reader_id);
+                printf(" CARD INSERT %u: ", reader_id);
                 print_byte_array(atr, atr_len);
             }
             send_msg(VSC_ATR, reader_id, atr, atr_len);
@@ -186,7 +186,7 @@ event_thread(void *arg)
         case VEVENT_CARD_REMOVE:
             /* Card removed */
             if (verbose > 10) {
-                printf(" CARD REMOVE %d:\n", reader_id);
+                printf(" CARD REMOVE %u:\n", reader_id);
             }
             send_msg(VSC_CardRemove, reader_id, NULL, 0);
             break;
@@ -256,7 +256,7 @@ do_command(void)
                        reader ? vreader_get_name(reader)
                        : "invalid reader", error);
             } else {
-                printf("no reader by id %d found\n", reader_id);
+                printf("no reader by id %u found\n", reader_id);
             }
         } else if (strncmp(string, "remove", 6) == 0) {
             if (string[6] == ' ') {
@@ -269,7 +269,7 @@ do_command(void)
                         reader ? vreader_get_name(reader)
                         : "invalid reader", error);
             } else {
-                printf("no reader by id %d found\n", reader_id);
+                printf("no reader by id %u found\n", reader_id);
             }
         } else if (strncmp(string, "select", 6) == 0) {
             if (string[6] == ' ') {
@@ -280,11 +280,11 @@ do_command(void)
                 reader = vreader_get_reader_by_id(reader_id);
             }
             if (reader) {
-                printf("Selecting reader %d, %s\n", reader_id,
+                printf("Selecting reader %u, %s\n", reader_id,
                         vreader_get_name(reader));
                 default_reader_id = reader_id;
             } else {
-                printf("Reader with id %d not found\n", reader_id);
+                printf("Reader with id %u not found\n", reader_id);
             }
         } else if (strncmp(string, "debug", 5) == 0) {
             if (string[5] == ' ') {
@@ -303,7 +303,7 @@ do_command(void)
                 if (reader_id == -1) {
                     continue;
                 }
-                printf("%3d %s %s\n", reader_id,
+                printf("%3u %s %s\n", reader_id,
                        vreader_card_is_present(reader) == VREADER_OK ?
                        "CARD_PRESENT" : "            ",
                        vreader_get_name(reader));
@@ -563,7 +563,7 @@ main(
         mhHeader.reader_id = ntohl(mhHeader.reader_id);
         mhHeader.length = ntohl(mhHeader.length);
         if (verbose) {
-            printf("Header: type=%d, reader_id=%d length=%d (0x%x)\n",
+            printf("Header: type=%d, reader_id=%u length=%d (0x%x)\n",
                     mhHeader.type, mhHeader.reader_id, mhHeader.length,
                                                mhHeader.length);
         }
-- 
1.7.9


