Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SI3FJ-00030c-1i
	for mharc-qemu-trivial@gnu.org; Wed, 11 Apr 2012 15:30:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SI3FG-0002rj-7H
	for qemu-trivial@nongnu.org; Wed, 11 Apr 2012 15:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SI3FE-0000bu-5r
	for qemu-trivial@nongnu.org; Wed, 11 Apr 2012 15:30:21 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SI3FA-0000Yr-AC; Wed, 11 Apr 2012 15:30:16 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D03EE72800B4; Wed, 11 Apr 2012 21:30:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1hNYuFe3fPKS; Wed, 11 Apr 2012 21:30:13 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADA6B6.dip.t-dialin.net [84.173.166.182])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6A5F2728009B; Wed, 11 Apr 2012 21:30:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1SI3F7-00033O-5W; Wed, 11 Apr 2012 21:30:13 +0200
Message-ID: <4F85DBC5.7050607@weilnetz.de>
Date: Wed, 11 Apr 2012 21:30:13 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120317 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1332868527-11909-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1332868527-11909-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Always set LC_ALL=C for
	makeinfo
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
X-List-Received-Date: Wed, 11 Apr 2012 19:30:23 -0000

Am 27.03.2012 19:15, schrieb Stefan Weil:
> Otherwise the generated file qemu-doc.html will contain "Anhang"
> instead of "Appendix" with a German locale (de_DE.UTF-8).
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   Makefile |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d8e1f36..b48c019 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -327,7 +327,7 @@ TEXIFLAG=$(if $(V),,--quiet)
>   	$(call quiet-command,texi2dvi $(TEXIFLAG) -I . $<,"  GEN   $@")
>
>   %.html: %.texi
> -	$(call quiet-command,$(MAKEINFO) $(MAKEINFOFLAGS) --html $<  -o $@, \
> +	$(call quiet-command,LC_ALL=C $(MAKEINFO) $(MAKEINFOFLAGS) --html $<  -o $@, \
>   	"  GEN   $@")
>
>   %.info: %.texi
>    

Ping? Please apply this patch to the trivial patches tree.

Thanks,
Stefan


