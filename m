Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROseo-0001fk-6e
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 10:04:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu@ghalkes.nl>) id 1ROsek-0001SQ-AD
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 10:04:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu@ghalkes.nl>) id 1ROsei-0006x2-Ve
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 10:04:38 -0500
Received: from mail.otvi.nl ([178.21.19.65]:40376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu@ghalkes.nl>)
	id 1ROsee-0006uB-Dg; Fri, 11 Nov 2011 10:04:32 -0500
Received: from s51476e0b.adsl.wanadoo.nl ([81.71.110.11] helo=revolver)
	by mail.otvi.nl with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <qemu@ghalkes.nl>)
	id 1ROsec-0008Fd-1j; Fri, 11 Nov 2011 16:04:30 +0100
Date: Fri, 11 Nov 2011 16:04:20 +0100
From: Gertjan Halkes <qemu@ghalkes.nl>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20111111160420.787aee5c@revolver>
In-Reply-To: <4EBD3004.3080301@codemonkey.ws>
References: <20111111125818.444e400b@revolver> <4EBD3004.3080301@codemonkey.ws>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.22.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 178.21.19.65
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] make user networking
 hostfwd work with restrict=y
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
X-List-Received-Date: Fri, 11 Nov 2011 15:04:39 -0000

On Fri, 11 Nov 2011 08:24:04 -0600, Anthony Liguori <anthony@codemonkey.ws>
wrote:

>Please submit against qemu.git master with a Signed-off-by.

Ok, here goes:

This patch allows the hostfwd option to override the restrict=y setting in
the user network stack, as explicitly stated in the documentation on the
restrict option:

     restrict=on|off
         If this option is enabled, the guest will be isolated, i.e. it
         will not be able to contact the host and no guest IP packets
         will be routed over the host to the outside. This option does
         not affect any explicitly set forwarding rules.

Qemu bug tracker:
https://bugs.launchpad.net/qemu/+bug/829455

Signed-off-by: Gertjan Halkes <qemu@ghalkes.nl>
---
 slirp/tcp_input.c |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/slirp/tcp_input.c b/slirp/tcp_input.c
index 942aaf4..ed09c27 100644
--- a/slirp/tcp_input.c
+++ b/slirp/tcp_input.c
@@ -316,16 +316,6 @@ tcp_input(struct mbuf *m, int iphlen, struct socket *inso)
 	m->m_data += sizeof(struct tcpiphdr)+off-sizeof(struct tcphdr);
 	m->m_len  -= sizeof(struct tcpiphdr)+off-sizeof(struct tcphdr);
 
-    if (slirp->restricted) {
-        for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next) {
-            if (ex_ptr->ex_fport == ti->ti_dport &&
-                ti->ti_dst.s_addr == ex_ptr->ex_addr.s_addr) {
-                break;
-            }
-        }
-        if (!ex_ptr)
-            goto drop;
-    }
 	/*
 	 * Locate pcb for segment.
 	 */
@@ -354,7 +344,23 @@ findso:
 	 * the only flag set, then create a session, mark it
 	 * as if it was LISTENING, and continue...
 	 */
-        if (so == NULL) {
+    if (so == NULL) {
+        if (slirp->restricted) {
+            /* Any hostfwds will have an existing socket, so we only get here
+             * for non-hostfwd connections. These should be dropped, unless it
+             * happens to be a guestfwd.
+             */
+            for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next) {
+                if (ex_ptr->ex_fport == ti->ti_dport &&
+                    ti->ti_dst.s_addr == ex_ptr->ex_addr.s_addr) {
+                    break;
+                }
+            }
+            if (!ex_ptr) {
+                goto dropwithreset;
+            }
+        }
+
 	  if ((tiflags & (TH_SYN|TH_FIN|TH_RST|TH_URG|TH_ACK)) != TH_SYN)
 	    goto dropwithreset;
 
-- 
1.7.1


