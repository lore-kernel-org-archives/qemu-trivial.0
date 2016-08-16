Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZf4M-0007Ib-7V
	for mharc-qemu-trivial@gnu.org; Tue, 16 Aug 2016 10:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brad@comstyle.com>) id 1bZVas-0004jZ-0e
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 00:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brad@comstyle.com>) id 1bZVal-0007WH-SA
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 00:03:12 -0400
Received: from speedy.comstyle.com ([206.51.28.2]:1139 helo=mail.comstyle.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brad@comstyle.com>) id 1bZVal-0007WC-LY
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 00:03:07 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
	by mail.comstyle.com (Postfix) with ESMTP id E79BC9882E;
	Tue, 16 Aug 2016 00:03:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=subject:to
	:references:cc:from:message-id:date:mime-version:in-reply-to
	:content-type:content-transfer-encoding; s=selector1; bh=ve3cSeV
	1EK7HcAMcAUdQwx48b7A=; b=cvda2ioGiqsHGp/izlnKnpgRdAzWuX13Ge5zbzn
	/gnRij8G4Jg7lxAvAHTuCpBfr92/tC2pDZDo+0FNDABWiTOJYoyZIEgFMUdU/LAS
	3cA99nk6j0BmZq4VminAKXwXVeNXNI1B331WfOStE8Id2aLp5694DOvyDnt6JyhE
	Em2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=subject:to
	:references:cc:from:message-id:date:mime-version:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=selector1; b=o
	hp3tBCggYuxXEhBwJluukGyd+Sa0CjZDLvuqfjiKi+bsx2oQYt7kvN3G0vDDkZNe
	Ln07lLrMVhVzrsJtS4dJwnehKXDf7N3cWWpvUzRv+EQ81oGrFt7+DR1SDp+hkvDz
	6foy/AIqyiuWgSiTKel/YFd1fn+HTMQjGNIRIDv8R0=
Received: from humpty.home.comstyle.com
	(CPE80ee73768e89-CMbc4dfbc8cbe0.cpe.net.cable.rogers.com
	[99.234.55.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: brad)
	by mail.comstyle.com (Postfix) with ESMTPSA id B7DC19882D;
	Tue, 16 Aug 2016 00:03:07 -0400 (EDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	samuel.thibault@ens-lyon.org
References: <1471249494-17392-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
From: Brad Smith <brad@comstyle.com>
Message-ID: <f5853dbe-2c39-6c0a-5168-e5309325f1d9@comstyle.com>
Date: Tue, 16 Aug 2016 00:03:05 -0400
User-Agent: Mozilla/5.0 (X11; OpenBSD amd64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471249494-17392-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: OpenBSD 4.x-5.x
X-Received-From: 206.51.28.2
X-Mailman-Approved-At: Tue, 16 Aug 2016 10:10:16 -0400
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
X-List-Received-Date: Tue, 16 Aug 2016 04:03:15 -0000

On 08/15/16 04:24, Thomas Huth wrote:
> struct arphdr is already used by the system headers on OpenBSD
> and thus QEMU does not compile here anymore. Fix it by renaming
> our struct to slirp_arphdr instead.
>
> Reported-by: Brad Smith
> Buglink: https://bugs.launchpad.net/qemu/+bug/1613133
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, this does fix the build.

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
>


