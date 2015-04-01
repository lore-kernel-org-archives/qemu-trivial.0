Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdNdi-00019z-Ja
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 14:45:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YdNdg-00017R-Iq
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YdNdf-00026S-Px
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:45:20 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=54741
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YdNdb-00024G-Dz; Wed, 01 Apr 2015 14:45:15 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	CEA9F11810A5; Wed,  1 Apr 2015 20:45:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id iw3RpMtLk3At; Wed,  1 Apr 2015 20:45:11 +0200 (CEST)
Received: from [192.168.178.24] (p54AC86A8.dip0.t-ipconnect.de
	[84.172.134.168])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B510A1180041; Wed,  1 Apr 2015 20:45:11 +0200 (CEST)
Message-ID: <551C3CB7.2030308@weilnetz.de>
Date: Wed, 01 Apr 2015 20:45:11 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org
References: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use $(MAKE) for recursive
	make
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
X-List-Received-Date: Wed, 01 Apr 2015 18:45:21 -0000

Am 01.04.2015 um 19:58 schrieb Ed Maste:
> On BSDs "make" is typically BSD make, while "gmake" is GNU make.
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 88bce56..ee40397 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -331,8 +331,8 @@ distclean: clean
>   	rm -rf $$d || exit 1 ; \
>           done
>   	rm -Rf .sdk
> -	if test -f pixman/config.log; then make -C pixman distclean; fi
> -	if test -f dtc/version_gen.h; then make $(DTC_MAKE_ARGS) clean; fi
> +	if test -f pixman/config.log; then $(MAKE) -C pixman distclean; fi
> +	if test -f dtc/version_gen.h; then $(MAKE) $(DTC_MAKE_ARGS) clean; fi
>   
>   KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  modifiers  no  pt-br  sv \
>   ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \

Reviewed-by: Stefan Weil <sw@weilnetz.de>


