Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaAdQ-0000c9-3Y
	for mharc-qemu-trivial@gnu.org; Sun, 18 Nov 2012 14:34:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TaAdL-0000Mt-1M
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 14:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TaAdH-0007ik-UI
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 14:34:22 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TaAdB-0007cf-Il; Sun, 18 Nov 2012 14:34:13 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1743C728003A; Sun, 18 Nov 2012 20:34:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id eOVIkiVdPm7M; Sun, 18 Nov 2012 20:34:12 +0100 (CET)
Received: from flocke.fritz.box (p54ADBD8C.dip.t-dialin.net [84.173.189.140])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	58176728002F; Sun, 18 Nov 2012 20:34:12 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TaAd9-00017e-Sq; Sun, 18 Nov 2012 20:34:11 +0100
Message-ID: <50A93833.4000607@weilnetz.de>
Date: Sun, 18 Nov 2012 20:34:11 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1351841393-32625-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1351841393-32625-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix comments (adress -> address,
 layed -> laid, wierd -> weird)
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
X-List-Received-Date: Sun, 18 Nov 2012 19:34:26 -0000

Am 02.11.2012 08:29, schrieb Stefan Weil:
> Remove also a duplicated 'the'.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   slirp/ip_icmp.c |    2 +-
>   tcg/tcg.h       |    4 ++--
>   uri.c           |    4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/slirp/ip_icmp.c b/slirp/ip_icmp.c
> index d571fd0..9f1cb08 100644
> --- a/slirp/ip_icmp.c
> +++ b/slirp/ip_icmp.c
> @@ -352,7 +352,7 @@ icmp_error(struct mbuf *msrc, u_char type, u_char code, int minsize,
>
>     ip->ip_ttl = MAXTTL;
>     ip->ip_p = IPPROTO_ICMP;
> -  ip->ip_dst = ip->ip_src;    /* ip adresses */
> +  ip->ip_dst = ip->ip_src;    /* ip addresses */
>     ip->ip_src = m->slirp->vhost_addr;
>
>     (void ) ip_output((struct socket *)NULL, m);
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index a6c9256..db86a73 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -272,8 +272,8 @@ typedef int TCGv_i64;
>   #define TCG_CALL_DUMMY_TCGV     MAKE_TCGV_I32(-1)
>   #define TCG_CALL_DUMMY_ARG      ((TCGArg)(-1))
>
> -/* Conditions.  Note that these are layed out for easy manipulation by
> -   the the functions below:
> +/* Conditions.  Note that these are laid out for easy manipulation by
> +   the functions below:
>        bit 0 is used for inverting;
>        bit 1 is signed,
>        bit 2 is unsigned,
> diff --git a/uri.c b/uri.c
> index dd922de..138547b 100644
> --- a/uri.c
> +++ b/uri.c
> @@ -432,7 +432,7 @@ rfc3986_parse_host(URI *uri, const char **str)
>
>       host = cur;
>       /*
> -     * IPv6 and future adressing scheme are enclosed between brackets
> +     * IPv6 and future addressing scheme are enclosed between brackets
>        */
>       if (*cur == '[') {
>           cur++;
> @@ -1917,7 +1917,7 @@ done:
>    *     http://site1.com/docs/pic1.gif   http://site1.com/docs/pic1.gif
>    *
>    *
> - * Note: if the URI reference is really wierd or complicated, it may be
> + * Note: if the URI reference is really weird or complicated, it may be
>    *       worthwhile to first convert it into a "nice" one by calling
>    *       uri_resolve (using 'base') before calling this routine,
>    *       since this routine (for reasonable efficiency) assumes URI has
>    

ping?

