Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopTW-0003Cb-P3
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTP-000306-VK
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTK-0003rh-Sy
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopT3-0003mX-WC; Mon, 26 May 2014 03:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1229C42FA9;
	Mon, 26 May 2014 11:37:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3C2646B2;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23022 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:04 +0400
Message-Id: <1401088811-22923-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 16/23] libcacard/vreader: Tighten assertion to
	clarify intent
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
X-List-Received-Date: Mon, 26 May 2014 07:37:37 -0000

From: Markus Armbruster <armbru@redhat.com>

Bonus: hushes up Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vreader.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 93b01c8..f1288d9 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -283,7 +283,7 @@ vreader_xfr_bytes(VReader *reader,
                   response->b_sw2, response->b_len, response->b_total_len);
         }
     }
-    assert(card_status == VCARD_DONE);
+    assert(card_status == VCARD_DONE && response);
     int size = MIN(*receive_buf_len, response->b_total_len);
     memcpy(receive_buf, response->b_data, size);
     *receive_buf_len = size;
-- 
1.7.10.4


