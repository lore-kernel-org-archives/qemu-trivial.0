Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W1m7C-0002jW-5n
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2014 19:07:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W1m76-0002cc-3l
	for qemu-trivial@nongnu.org; Fri, 10 Jan 2014 19:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W1m71-0004RJ-OO
	for qemu-trivial@nongnu.org; Fri, 10 Jan 2014 19:07:44 -0500
Received: from mail-lb0-f176.google.com ([209.85.217.176]:54625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W1m71-0004RA-HL
	for qemu-trivial@nongnu.org; Fri, 10 Jan 2014 19:07:39 -0500
Received: by mail-lb0-f176.google.com with SMTP id l4so3885844lbv.35
	for <qemu-trivial@nongnu.org>; Fri, 10 Jan 2014 16:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5vJU/BCjjDD+rJ5xoXvxH0enoDmBH8isf5AyQajRKRI=;
	b=XCGSu2fJXVUzAe797USnlVysYF1zCL9T6LSEff6uYSkMuC9BCghv5gsy829gpFSQWd
	n86Vbh+ErFtENxNbQrPE7lV20lJPnelkH70/j/qal8ppT7O5d3jn19te2lV396tNA6kF
	F6vY2Hr6E6BwnAH+XjY9hpAlDnLTg5XivzSwPvSVWGttDXpf+geRYn2ls0i1BRUgTkw3
	4SmwfKfN3gyXbwKwng8L4wiJtKCOwTw9yiAPl42/4iMupASgnkRl6s2e6rgHu5SmP9vC
	NTCTTlLXFlrmMHLQ+vyhaducpJ8WSKNF+e45Y/YArPEMQKGw8JoqlNsLTOPkb2yIC6R2
	wPfg==
X-Gm-Message-State: ALoCoQkYdsJx4IDZbrRyoMAK7Qm2v2KzJGwWdZm+xCDiPwzmFLRwlRuDs3Eb91erFOMEK5TDBdjB
X-Received: by 10.112.53.201 with SMTP id d9mr4792329lbp.26.1389398858589;
	Fri, 10 Jan 2014 16:07:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Fri, 10 Jan 2014 16:07:18 -0800 (PST)
In-Reply-To: <20140110215148.GE1276@ERROL.INI.CMU.EDU>
References: <20140110215148.GE1276@ERROL.INI.CMU.EDU>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Jan 2014 00:07:18 +0000
Message-ID: <CAFEAcA9FOA7OsODB08Jot==mHRzFAadx4zQehnKkkAGwaH4d2Q@mail.gmail.com>
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Include bios-256k.bin blob
	during "make install"
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
X-List-Received-Date: Sat, 11 Jan 2014 00:07:48 -0000

On 10 January 2014 21:51, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bdff4e4..807054b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -290,7 +290,7 @@ common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr \
>  bepo    cz
>
>  ifdef INSTALL_BLOBS
> -BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
> +BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \

We've now seen this patch four times from four different people.
Previously:
http://lists.gnu.org/archive/html/qemu-devel/2013-12/msg01612.html
https://lists.gnu.org/archive/html/qemu-devel/2014-01/msg00401.html
https://lists.gnu.org/archive/html/qemu-devel/2014-01/msg01036.html

Could somebody apply Eduardo's patch from December before
we get a fifth version? :-)

thanks
-- PMM

