Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaMqg-0004kp-9I
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 03:36:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaMqa-0004ib-Gu
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:36:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaMqX-0001N6-Ed
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:36:52 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TaMqX-0001My-7p; Mon, 19 Nov 2012 03:36:49 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so782792bkc.4
	for <multiple recipients>; Mon, 19 Nov 2012 00:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h3cx2L/7yFMPvvscyUFWLcAK8gk8oqv0tVn7q19ZgaA=;
	b=N5K1PXL9bDOLAPJzGK2bHUY0YG/eYUyO/wa/id8J/k3uZ+n/cGSdZoZGdUv58UArdJ
	Kr4DkfZUbZJ++bulPCbKq12arQBmF32I0juZDshCUhohmVS8cZH1ChpPkes94WR9pRSO
	7dejsIYHqUG5CDitiaZHFKbkEhV61fBpyastbaRqAdmcL6J2JlXOvy2LYfOuqgO56nF9
	zPhJjonVDT8wnQCR5evBFs+XoeqFswhc2AtssmWYnQ5sgtny212Me3LMbUwDMVUEubBc
	F6T6juCva7gsub1ihRTzuI8walCljWUt5HlC2mMBe6trwE4ikQZADieD18ZFsCWtjFwI
	pgFA==
Received: by 10.204.145.217 with SMTP id e25mr4537674bkv.123.1353314208066;
	Mon, 19 Nov 2012 00:36:48 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id t11sm3603796bkv.11.2012.11.19.00.36.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 00:36:47 -0800 (PST)
Date: Mon, 19 Nov 2012 09:36:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121119083646.GB17444@stefanha-thinkpad.redhat.com>
References: <1351841393-32625-1-git-send-email-sw@weilnetz.de>
	<50A93833.4000607@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50A93833.4000607@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix comments (adress ->
 address, layed -> laid, wierd -> weird)
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
X-List-Received-Date: Mon, 19 Nov 2012 08:36:55 -0000

On Sun, Nov 18, 2012 at 08:34:11PM +0100, Stefan Weil wrote:
> Am 02.11.2012 08:29, schrieb Stefan Weil:
> >Remove also a duplicated 'the'.
> >
> >Signed-off-by: Stefan Weil<sw@weilnetz.de>
> >---
> >  slirp/ip_icmp.c |    2 +-
> >  tcg/tcg.h       |    4 ++--
> >  uri.c           |    4 ++--
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> >diff --git a/slirp/ip_icmp.c b/slirp/ip_icmp.c
> >index d571fd0..9f1cb08 100644
> >--- a/slirp/ip_icmp.c
> >+++ b/slirp/ip_icmp.c
> >@@ -352,7 +352,7 @@ icmp_error(struct mbuf *msrc, u_char type, u_char code, int minsize,
> >
> >    ip->ip_ttl = MAXTTL;
> >    ip->ip_p = IPPROTO_ICMP;
> >-  ip->ip_dst = ip->ip_src;    /* ip adresses */
> >+  ip->ip_dst = ip->ip_src;    /* ip addresses */
> >    ip->ip_src = m->slirp->vhost_addr;
> >
> >    (void ) ip_output((struct socket *)NULL, m);
> >diff --git a/tcg/tcg.h b/tcg/tcg.h
> >index a6c9256..db86a73 100644
> >--- a/tcg/tcg.h
> >+++ b/tcg/tcg.h
> >@@ -272,8 +272,8 @@ typedef int TCGv_i64;
> >  #define TCG_CALL_DUMMY_TCGV     MAKE_TCGV_I32(-1)
> >  #define TCG_CALL_DUMMY_ARG      ((TCGArg)(-1))
> >
> >-/* Conditions.  Note that these are layed out for easy manipulation by
> >-   the the functions below:
> >+/* Conditions.  Note that these are laid out for easy manipulation by
> >+   the functions below:
> >       bit 0 is used for inverting;
> >       bit 1 is signed,
> >       bit 2 is unsigned,
> >diff --git a/uri.c b/uri.c
> >index dd922de..138547b 100644
> >--- a/uri.c
> >+++ b/uri.c
> >@@ -432,7 +432,7 @@ rfc3986_parse_host(URI *uri, const char **str)
> >
> >      host = cur;
> >      /*
> >-     * IPv6 and future adressing scheme are enclosed between brackets
> >+     * IPv6 and future addressing scheme are enclosed between brackets
> >       */
> >      if (*cur == '[') {
> >          cur++;
> >@@ -1917,7 +1917,7 @@ done:
> >   *     http://site1.com/docs/pic1.gif   http://site1.com/docs/pic1.gif
> >   *
> >   *
> >- * Note: if the URI reference is really wierd or complicated, it may be
> >+ * Note: if the URI reference is really weird or complicated, it may be
> >   *       worthwhile to first convert it into a "nice" one by calling
> >   *       uri_resolve (using 'base') before calling this routine,
> >   *       since this routine (for reasonable efficiency) assumes URI has
> 
> ping?
> 

Thanks, applied to the trivial patches tree.  There is currently a
pending pull request - this patch will be in the next pull request.

Stefan

