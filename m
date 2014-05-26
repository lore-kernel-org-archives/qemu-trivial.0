Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopTW-0003C8-K0
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTP-0002zc-FM
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTK-0003rZ-FQ
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopT4-0003mZ-00; Mon, 26 May 2014 03:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 246F442FAC;
	Mon, 26 May 2014 11:37:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6188E644;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23020 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:03 +0400
Message-Id: <1401088811-22923-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 15/23] libcacard/vreader: Drop broken recovery
	from failed assertion
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
X-List-Received-Date: Mon, 26 May 2014 07:37:36 -0000

From: Markus Armbruster <armbru@redhat.com>

We suppress some code when we got unexpected status and assertion
checking is off:

     assert(card_status == VCARD_DONE);
     if (card_status == VCARD_DONE) {
         int size = MIN(*receive_buf_len, response->b_total_len);
         memcpy(receive_buf, response->b_data, size);
         *receive_buf_len = size;
    }

Such "recovery" is of dubious value even when it works.  This one
doesn't: it fails to assign to receive_buf[] and *receive_buf_len,
which the callers expect.

Make the code unconditional.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vreader.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 9304a28..93b01c8 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -284,11 +284,9 @@ vreader_xfr_bytes(VReader *reader,
         }
     }
     assert(card_status == VCARD_DONE);
-    if (card_status == VCARD_DONE) {
-        int size = MIN(*receive_buf_len, response->b_total_len);
-        memcpy(receive_buf, response->b_data, size);
-        *receive_buf_len = size;
-    }
+    int size = MIN(*receive_buf_len, response->b_total_len);
+    memcpy(receive_buf, response->b_data, size);
+    *receive_buf_len = size;
     vcard_response_delete(response);
     vcard_apdu_delete(apdu);
     vcard_free(card); /* free our reference */
-- 
1.7.10.4


