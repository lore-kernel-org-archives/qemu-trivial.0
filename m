Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAdC0-0007rv-LL
	for mharc-qemu-trivial@gnu.org; Fri, 03 Nov 2017 10:43:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAdBy-0007rV-2J
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 10:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAdBx-0000KP-9S
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 10:43:30 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:43487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAdBx-0000Jv-1E
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 10:43:29 -0400
Received: by mail-wm0-x241.google.com with SMTP id r68so1713115wmr.0
	for <qemu-trivial@nongnu.org>; Fri, 03 Nov 2017 07:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZrXGVQENqh6d9KEBxvs8iWG5cUtg62pDYQ6O/NiouiY=;
	b=UU4mV11nLSa/XhMemVtHUVIHoWNyUBroZIV+OXSDEGmTUFXOlrHto95b5qugQ1ikK8
	ggBCIVnTow7fQztOaKIMrSDgVb+e1OGxvRESZU906GWYFPy5bQriy2wKpRuD6AzPyjFa
	hj5B9ygjK1B7Zn5KCTI1LDxhkjY5gj2XdPnqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZrXGVQENqh6d9KEBxvs8iWG5cUtg62pDYQ6O/NiouiY=;
	b=tzcVFw/IHFa8B0xw80oOsxZFKS8+wvB2UqPtw1WvLQksqOjbVgWd0E4c7HRhEAPMt7
	9uxYq9znGSiCUoldgK8gwpfUGCgWKJf333OKGIHGPxfCzO2EvkwaMwoJPhNDylEQttnq
	PfbwrwjcbyGklVwrtAhUyzd8G1Q6LGK1xcOo6vo7LH20ZqvRv5LpLnGDAjWApl/mh8T7
	gpg9WRzbawkl/Ebfy1pmUOm4tGJtl+LiJnf/SA0vxGP+bv+de3uu2nrlzgXMtX81X68q
	25QCjvEdenp2icjyjk5oAKvaiQ3rtRantrBEqH3uow/2xyPWHG/yYjIGyfrEPBdeYhlI
	DFtw==
X-Gm-Message-State: AJaThX4DxV5Zlm255xAbITL3EhXcv4pGgLd3uNVrbWlcj5CEWCGG/v6Q
	fXHmKT9WrCkitrWiWwzLSSUxT9oqThrpyRu7G6WtTg==
X-Google-Smtp-Source: ABhQp+TP24PFjWA1cf70NxJER90xz6028Lwl4OtrnXvpj0+s1w9evKhr54gwTG7oyFf34WOP65mp26SWh6iKWRuyszs=
X-Received: by 10.28.10.147 with SMTP id 141mr45675wmk.40.1509720207930; Fri,
	03 Nov 2017 07:43:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Fri, 3 Nov 2017 07:43:07 -0700 (PDT)
In-Reply-To: <20171102090906.30391-1-danielhb@linux.vnet.ibm.com>
References: <20171102090906.30391-1-danielhb@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Nov 2017 14:43:07 +0000
Message-ID: <CAFEAcA-L4MWw_ES21svL27O6X5dhpjjx6kdp9BW3w4Qei74kjg@mail.gmail.com>
To: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [PATCH v5] configure: check $CC available before
 verifying host CPU
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
X-List-Received-Date: Fri, 03 Nov 2017 14:43:31 -0000

On 2 November 2017 at 09:09, Daniel Henrique Barboza
<danielhb@linux.vnet.ibm.com> wrote:
> When executing 'configure' in a fresh QEMU clone, in a fresh
> OS install running in a ppc64le host, this is the error
> shown:
>
> -----
>
> ../configure --enable-trace-backend=simple --enable-debug
>     --target-list=ppc64-softmmu
>
> ERROR: Unsupported CPU = ppc64le, try --enable-tcg-interpreter
>
> -----
>
> This isn't true, ppc64le host CPU is supported. This happens because,
> in a fresh install, we don't have a C compiler to autodetect
> the $cpu variable to "ppc64".
>
> This patch moves the CC available check up a bit, just before verifying
> the host CPU. This ensures that we bail out with a $CC not available
> error instead of unsupported CPU (the host CPU detection without
> the compiler wouldn't work properly anyway). It also allows --help to
> keep working without a C compiler. With this patch, in the same ppc64le
> host without gcc:
>
> $ ../configure --enable-trace-backend=simple --enable-debug
>     --target-list=ppc64-softmmu
>
> ERROR: "cc" either does not exist or does not work
>
> $ ../configure --help
>
> Usage: configure [options]
> Options: [defaults in brackets after descriptions]
>
> Standard options:
>   --help                   print this message
>   --prefix=PREFIX          install in PREFIX [/usr/local]
>   --interp-prefix=PREFIX   where to find shared libraries, etc.
> (...)
>
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
> ---
>  configure | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

ccing qemu-trivial since that seems like a plausible tree for this.

thanks
-- PMM

