Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNLi-0005F5-Iv
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:10:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLb-00059R-Ac
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLW-0003jX-Ab
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNLJ-0003hC-UN; Mon, 05 May 2014 14:10:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 085D240750;
	Mon,  5 May 2014 22:10:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D26476BB;
	Mon,  5 May 2014 22:02:09 +0400 (MSK)
Received: (nullmailer pid 24263 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:02:03 +0400
Message-Id: <1399312923-24129-23-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alon Levy <alevy@redhat.com>
Subject: [Qemu-trivial] [PULL 22/22] libcacard: remove unnecessary EOL from
	debug prints
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
X-List-Received-Date: Mon, 05 May 2014 18:10:44 -0000

From: Alon Levy <alevy@redhat.com>

Signed-off-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vreader.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 5793d73..7720295 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -273,12 +273,12 @@ vreader_xfr_bytes(VReader *reader,
         response = vcard_make_response(status);
         card_status = VCARD_DONE;
     } else {
-        g_debug("%s: CLS=0x%x,INS=0x%x,P1=0x%x,P2=0x%x,Lc=%d,Le=%d %s\n",
+        g_debug("%s: CLS=0x%x,INS=0x%x,P1=0x%x,P2=0x%x,Lc=%d,Le=%d %s",
               __func__, apdu->a_cla, apdu->a_ins, apdu->a_p1, apdu->a_p2,
               apdu->a_Lc, apdu->a_Le, apdu_ins_to_string(apdu->a_ins));
         card_status = vcard_process_apdu(card, apdu, &response);
         if (response) {
-            g_debug("%s: status=%d sw1=0x%x sw2=0x%x len=%d (total=%d)\n",
+            g_debug("%s: status=%d sw1=0x%x sw2=0x%x len=%d (total=%d)",
                   __func__, response->b_status, response->b_sw1,
                   response->b_sw2, response->b_len, response->b_total_len);
         }
-- 
1.7.10.4


