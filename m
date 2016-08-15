Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZG0f-000354-7z
	for mharc-qemu-trivial@gnu.org; Mon, 15 Aug 2016 07:24:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bZG0c-00032x-Pf
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 07:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bZG0a-0005L8-DX
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 07:24:45 -0400
Received: from hera.aquilenet.fr ([141.255.128.1]:54378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1bZG0U-0005Ig-NI; Mon, 15 Aug 2016 07:24:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 13DC588C2;
	Mon, 15 Aug 2016 13:24:36 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsmSK4pIfmOp; Mon, 15 Aug 2016 13:24:35 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:1af:4600:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id D5C6988BD;
	Mon, 15 Aug 2016 13:24:35 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1bZG0R-0004fC-37; Mon, 15 Aug 2016 13:24:35 +0200
Date: Mon, 15 Aug 2016 13:24:35 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	brad@comstyle.com
Message-ID: <20160815112435.GA17471@var.home>
References: <1471249494-17392-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471249494-17392-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.21+34 (58baf7c9f32f) (2010-12-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 141.255.128.1
Subject: Re: [Qemu-trivial] [PATCH for-2.7] slirp: Rename "struct arphdr" to
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
X-List-Received-Date: Mon, 15 Aug 2016 11:24:48 -0000

Thomas Huth, on Mon 15 Aug 2016 10:24:54 +0200, wrote:
> struct arphdr is already used by the system headers on OpenBSD
> and thus QEMU does not compile here anymore. Fix it by renaming
> our struct to slirp_arphdr instead.
> 
> Reported-by: Brad Smith
> Buglink: https://bugs.launchpad.net/qemu/+bug/1613133
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  slirp/slirp.c | 10 +++++-----
>  slirp/slirp.h |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/slirp/slirp.c b/slirp/slirp.c
> index 47a1652..d67eda1 100644
> --- a/slirp/slirp.c
> +++ b/slirp/slirp.c
> @@ -773,10 +773,10 @@ void slirp_pollfds_poll(GArray *pollfds, int select_error)
>  
>  static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
>  {
> -    struct arphdr *ah = (struct arphdr *)(pkt + ETH_HLEN);
> -    uint8_t arp_reply[max(ETH_HLEN + sizeof(struct arphdr), 64)];
> +    struct slirp_arphdr *ah = (struct slirp_arphdr *)(pkt + ETH_HLEN);
> +    uint8_t arp_reply[max(ETH_HLEN + sizeof(struct slirp_arphdr), 64)];
>      struct ethhdr *reh = (struct ethhdr *)arp_reply;
> -    struct arphdr *rah = (struct arphdr *)(arp_reply + ETH_HLEN);
> +    struct slirp_arphdr *rah = (struct slirp_arphdr *)(arp_reply + ETH_HLEN);
>      int ar_op;
>      struct ex_list *ex_ptr;
>  
> @@ -890,9 +890,9 @@ static int if_encap4(Slirp *slirp, struct mbuf *ifm, struct ethhdr *eh,
>          return 1;
>      }
>      if (!arp_table_search(slirp, iph->ip_dst.s_addr, ethaddr)) {
> -        uint8_t arp_req[ETH_HLEN + sizeof(struct arphdr)];
> +        uint8_t arp_req[ETH_HLEN + sizeof(struct slirp_arphdr)];
>          struct ethhdr *reh = (struct ethhdr *)arp_req;
> -        struct arphdr *rah = (struct arphdr *)(arp_req + ETH_HLEN);
> +        struct slirp_arphdr *rah = (struct slirp_arphdr *)(arp_req + ETH_HLEN);
>  
>          if (!ifm->resolution_requested) {
>              /* If the client addr is not known, send an ARP request */
> diff --git a/slirp/slirp.h b/slirp/slirp.h
> index 624a850..a1f3139 100644
> --- a/slirp/slirp.h
> +++ b/slirp/slirp.h
> @@ -105,7 +105,7 @@ struct ethhdr {
>      unsigned short h_proto;            /* packet type ID field */
>  };
>  
> -struct arphdr {
> +struct slirp_arphdr {
>      unsigned short ar_hrd;      /* format of hardware address */
>      unsigned short ar_pro;      /* format of protocol address */
>      unsigned char  ar_hln;      /* length of hardware address */
> @@ -124,7 +124,7 @@ struct arphdr {
>  #define ARP_TABLE_SIZE 16
>  
>  typedef struct ArpTable {
> -    struct arphdr table[ARP_TABLE_SIZE];
> +    struct slirp_arphdr table[ARP_TABLE_SIZE];
>      int next_victim;
>  } ArpTable;
>  
> -- 
> 1.8.3.1
> 

-- 
Samuel
> No manual is ever necessary.
May I politely interject here: BULLSHIT.  That's the biggest Apple lie of all!
(Discussion in comp.os.linux.misc on the intuitiveness of interfaces.)

