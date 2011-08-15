Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qst2N-000458-4A
	for mharc-qemu-trivial@gnu.org; Mon, 15 Aug 2011 05:00:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1Qst2J-0003s6-Hw
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2011 05:00:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1Qst2I-0003TG-QO
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2011 05:00:43 -0400
Received: from nog.sh.bytemark.co.uk ([212.110.161.168]:46772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>)
	id 1Qst2G-0003SW-14; Mon, 15 Aug 2011 05:00:40 -0400
Received: from bytemail.bytemark.co.uk ([212.110.161.227])
	by nog.sh.bytemark.co.uk with esmtp (Exim 4.69)
	(envelope-from <nick@bytemark.co.uk>)
	id 1Qst2B-00072p-2L; Mon, 15 Aug 2011 10:00:35 +0100
Received: from desk4.office.bytemark.co.uk ([89.16.168.152])
	by bytemail.bytemark.co.uk with esmtp (Exim 4.72)
	(envelope-from <nick@bytemark.co.uk>)
	id 1Qst2A-0005Nb-Td; Mon, 15 Aug 2011 10:00:34 +0100
From: Nicholas Thomas <nick@bytemark.co.uk>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Organization: Bytemark
Date: Mon, 15 Aug 2011 10:00:34 +0100
Message-ID: <1313398834.17401.135.camel@desk4.office.bytemark.co.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.110.161.168
Cc: qemu-trivial@nongnu.org, nick@bytemark.co.uk
Subject: [Qemu-trivial] [PATCH] block/curl: Handle failed reads gracefully.
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
X-List-Received-Date: Mon, 15 Aug 2011 09:00:44 -0000

Current behaviour if a read fails is for the acb to not get finished.
This causes an infinite loop in bdrv_read_em (block.c). The read failure
never gets reported to the  guest and if the error condition clears, the
process never recovers.

With this patch, when curl reports a failure we finish the acb as a
failure. This results in the guest receiving an I/O error (rather than
the read hanging indefinitely) and if the error condition subsequently
clears, retries work as expected.

The simplest test is to put an ISO on a web server you have control over
and open it with qemu-io. Then move the ISO out of the way and attempt
to read some data - you should see behaviour matching the above.

Signed-off-by: Nick Thomas <nick@bytemark.co.uk>
---
 block/curl.c |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 407f095..52c6463 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -229,6 +229,23 @@ static void curl_multi_do(void *arg)
             {
                 CURLState *state = NULL;
                 curl_easy_getinfo(msg->easy_handle, CURLINFO_PRIVATE, (char**)&state);
+
+                /* ACBs for successful messages get completed in curl_read_cb */
+                if (msg->data.result != CURLM_OK) {
+                    int i;
+                    for (i = 0; i < CURL_NUM_ACB; i++) {
+                        CURLAIOCB *acb = state->acb[i];
+
+                        if (acb == NULL) {
+                            continue;
+                        }
+
+                        acb->common.cb(acb->common.opaque, -EIO);
+                        qemu_aio_release(acb);
+                        state->acb[i] = NULL;
+                    }
+                }
+
                 curl_clean_state(state);
                 break;
             }
@@ -277,7 +294,8 @@ static CURLState *curl_init_state(BDRVCURLState *s)
     curl_easy_setopt(state->curl, CURLOPT_FOLLOWLOCATION, 1);
     curl_easy_setopt(state->curl, CURLOPT_NOSIGNAL, 1);
     curl_easy_setopt(state->curl, CURLOPT_ERRORBUFFER, state->errmsg);
-    
+    curl_easy_setopt(state->curl, CURLOPT_FAILONERROR, 1);
+
 #ifdef DEBUG_VERBOSE
     curl_easy_setopt(state->curl, CURLOPT_VERBOSE, 1);
 #endif
-- 
1.7.0.4




