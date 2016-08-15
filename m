Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZDCn-00052e-7H
	for mharc-qemu-trivial@gnu.org; Mon, 15 Aug 2016 04:25:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bZDCk-0004yM-2f
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 04:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bZDCh-0003i9-TB
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 04:25:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bZDCc-0003hf-4I; Mon, 15 Aug 2016 04:24:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C0DB8553C;
	Mon, 15 Aug 2016 08:24:57 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u7F8Ot1d027648; Mon, 15 Aug 2016 04:24:55 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, samuel.thibault@ens-lyon.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, brad@comstyle.com
Date: Mon, 15 Aug 2016 10:24:54 +0200
Message-Id: <1471249494-17392-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 15 Aug 2016 08:24:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.7] slirp: Rename "struct arphdr" to
 "struct slirp_arphdr"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 08:25:07 -0000

struct arphdr is already used by the system headers on OpenBSD
and thus QEMU does not compile here anymore. Fix it by renaming
our struct to slirp_arphdr instead.

Reported-by: Brad Smith
Buglink: https://bugs.launchpad.net/qemu/+bug/1613133
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 slirp/slirp.c | 10 +++++-----
 slirp/slirp.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index 47a1652..d67eda1 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -773,10 +773,10 @@ void slirp_pollfds_poll(GArray *pollfds, int select_error)
 
 static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
 {
-    struct arphdr *ah = (struct arphdr *)(pkt + ETH_HLEN);
-    uint8_t arp_reply[max(ETH_HLEN + sizeof(struct arphdr), 64)];
+    struct slirp_arphdr *ah = (struct slirp_arphdr *)(pkt + ETH_HLEN);
+    uint8_t arp_reply[max(ETH_HLEN + sizeof(struct slirp_arphdr), 64)];
     struct ethhdr *reh = (struct ethhdr *)arp_reply;
-    struct arphdr *rah = (struct arphdr *)(arp_reply + ETH_HLEN);
+    struct slirp_arphdr *rah = (struct slirp_arphdr *)(arp_reply + ETH_HLEN);
     int ar_op;
     struct ex_list *ex_ptr;
 
@@ -890,9 +890,9 @@ static int if_encap4(Slirp *slirp, struct mbuf *ifm, struct ethhdr *eh,
         return 1;
     }
     if (!arp_table_search(slirp, iph->ip_dst.s_addr, ethaddr)) {
-        uint8_t arp_req[ETH_HLEN + sizeof(struct arphdr)];
+        uint8_t arp_req[ETH_HLEN + sizeof(struct slirp_arphdr)];
         struct ethhdr *reh = (struct ethhdr *)arp_req;
-        struct arphdr *rah = (struct arphdr *)(arp_req + ETH_HLEN);
+        struct slirp_arphdr *rah = (struct slirp_arphdr *)(arp_req + ETH_HLEN);
 
         if (!ifm->resolution_requested) {
             /* If the client addr is not known, send an ARP request */
diff --git a/slirp/slirp.h b/slirp/slirp.h
index 624a850..a1f3139 100644
--- a/slirp/slirp.h
+++ b/slirp/slirp.h
@@ -105,7 +105,7 @@ struct ethhdr {
     unsigned short h_proto;            /* packet type ID field */
 };
 
-struct arphdr {
+struct slirp_arphdr {
     unsigned short ar_hrd;      /* format of hardware address */
     unsigned short ar_pro;      /* format of protocol address */
     unsigned char  ar_hln;      /* length of hardware address */
@@ -124,7 +124,7 @@ struct arphdr {
 #define ARP_TABLE_SIZE 16
 
 typedef struct ArpTable {
-    struct arphdr table[ARP_TABLE_SIZE];
+    struct slirp_arphdr table[ARP_TABLE_SIZE];
     int next_victim;
 } ArpTable;
 
-- 
1.8.3.1


