Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROpkk-0000S7-98
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 06:58:38 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu@ghalkes.nl>) id 1ROpkh-0000Ks-QE
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 06:58:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu@ghalkes.nl>) id 1ROpkg-0007NR-H6
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 06:58:35 -0500
Received: from mail.otvi.nl ([178.21.19.65]:56866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu@ghalkes.nl>)
	id 1ROpkd-00079B-Rk; Fri, 11 Nov 2011 06:58:32 -0500
Received: from [2001:5c0:1400:a::d9b] (helo=revolver)
	by mail.otvi.nl with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <qemu@ghalkes.nl>)
	id 1ROpkV-00057Z-Dv; Fri, 11 Nov 2011 12:58:23 +0100
Date: Fri, 11 Nov 2011 12:58:18 +0100
From: Gertjan Halkes <qemu@ghalkes.nl>
To: qemu-devel@nongnu.org
Message-ID: <20111111125818.444e400b@revolver>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.22.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 178.21.19.65
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] make user networking hostfwd work with
	restrict=y
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
X-List-Received-Date: Fri, 11 Nov 2011 11:58:36 -0000

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

diff -aur qemu-kvm-0.15.0+noroms/slirp/tcp_input.c qemu-kvm-0.15.0+noromsnew/slirp/tcp_input.c
--- qemu-kvm-0.15.0+noroms/slirp/tcp_input.c	2011-08-09 14:40:29.000000000 +0200
+++ qemu-kvm-0.15.0+noromsnew/slirp/tcp_input.c	2011-11-11 12:42:31.000000000 +0100
@@ -316,16 +316,6 @@
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
@@ -354,7 +344,23 @@
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
 
Signed-off-by: Gertjan Halkes <qemu@ghalkes.nl>

