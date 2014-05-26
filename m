Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopJm-0003ym-Jv
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:27:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJe-0003hL-67
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJZ-0000qM-8k
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopJO-0000nM-Lq; Mon, 26 May 2014 03:27:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9AE4C42FA7;
	Mon, 26 May 2014 11:27:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D73F16AF;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23014 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:01 +0400
Message-Id: <1401088811-22923-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 13/23] libcacard/vscclient: Bury some dead code
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
X-List-Received-Date: Mon, 26 May 2014 07:27:32 -0000

From: Markus Armbruster <armbru@redhat.com>

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vscclient.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index 3477ab3..29f4958 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -502,8 +502,7 @@ do_command(GIOChannel *source,
             if (reader != NULL) {
                 error = vcard_emul_force_card_insert(reader);
                 printf("insert %s, returned %d\n",
-                       reader ? vreader_get_name(reader)
-                       : "invalid reader", error);
+                       vreader_get_name(reader), error);
             } else {
                 printf("no reader by id %u found\n", reader_id);
             }
@@ -515,8 +514,7 @@ do_command(GIOChannel *source,
             if (reader != NULL) {
                 error = vcard_emul_force_card_remove(reader);
                 printf("remove %s, returned %d\n",
-                        reader ? vreader_get_name(reader)
-                        : "invalid reader", error);
+                       vreader_get_name(reader), error);
             } else {
                 printf("no reader by id %u found\n", reader_id);
             }
-- 
1.7.10.4


