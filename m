Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbp5z-0003w7-GX
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 03:58:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tbp5s-0003nj-1Z
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 03:58:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tbp5m-00064L-Ca
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 03:58:39 -0500
Received: from mail-ia0-f173.google.com ([209.85.210.173]:53111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tbp5m-00064C-3w
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 03:58:34 -0500
Received: by mail-ia0-f173.google.com with SMTP id w21so4865478iac.4
	for <qemu-trivial@nongnu.org>; Fri, 23 Nov 2012 00:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=rQj2S1XKHBcsKGnqsvF+KNejRq/PIUvkUucmJ9fVDAc=;
	b=D3PgOcTekAkZS2sbkhPChD1SPnTLnMjQNsdRXs7Ehw8mYjmP3HpfSObptZtZVV10+R
	IBcjZiHTGdvctXSZDQCnkkkmAtXuomOCH6fZlVXqcTxaFJrPUpfpncA6e50rhwHE23cA
	VulUGnCTqQCFfZ9hbEVpWiKfYWeHrcKHxruSGJY6DwDm1ujxq/D7zsD5XfB78fo03Mxc
	cm5mKpOFfnNEOgI75IKuva50CkXL/itpXfvWIQIRj1WRExX2auHSrhUjnuKrkSXaJNkZ
	B2dggN5AhnBZeYDtE3MV+CL/zUtke8uKHVT3/FN2DulHtmC/wb99h3PB4chQk7FAnOlP
	GjDQ==
MIME-Version: 1.0
Received: by 10.50.42.170 with SMTP id p10mr5600414igl.47.1353661113368; Fri,
	23 Nov 2012 00:58:33 -0800 (PST)
Received: by 10.50.45.103 with HTTP; Fri, 23 Nov 2012 00:58:33 -0800 (PST)
In-Reply-To: <8000c1db5e735e027860a47bde50d64ea4a96893.1353660725.git.mprivozn@redhat.com>
References: <8000c1db5e735e027860a47bde50d64ea4a96893.1353660725.git.mprivozn@redhat.com>
Date: Fri, 23 Nov 2012 08:58:33 +0000
Message-ID: <CAFEAcA-+Ji_nCSnAj3p9LYCCZ-PHUMoGPVfqT9uL14E==pTGOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlEWWLLRkdZ59mKj3OeW5ajXbVYQVtOrAHBiiuiDFd0Mr4985uxZV3qn5E9qgg9Is8xVca4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: Fix space at
	EOL
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
X-List-Received-Date: Fri, 23 Nov 2012 08:58:46 -0000

On 23 November 2012 08:52, Michal Privoznik <mprivozn@redhat.com> wrote:
> There's no need to add a space at the end of line.
> Moreover, it can make problems in some projects that
> store the help output into a file (and run couple of
> tests based on that) and have space at EOL forbidden.

I have no problem with this patch but I would suggest that
these other projects have a broken workflow if they're
reliant on QEMU's help output to not have trailing spaces
like that :-)

> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(and cc'd qemu-trivial).

-- PMM

> ---
>  qemu-options.hx |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9bb29d3..8f6d0e3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1331,7 +1331,7 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
>      "                connect the host TAP network interface to VLAN 'n'\n"
>  #else
>      "-net tap[,vlan=n][,name=str][,fd=h][,ifname=name][,script=file][,downscript=dfile][,helper=helper][,sndbuf=nbytes][,vnet_hdr=on|off][,vhost=on|off][,vhostfd=h][,vhostforce=on|off]\n"
> -    "                connect the host TAP network interface to VLAN 'n' \n"
> +    "                connect the host TAP network interface to VLAN 'n'\n"
>      "                use network scripts 'file' (default=" DEFAULT_NETWORK_SCRIPT ")\n"
>      "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
>      "                to deconfigure it\n"

