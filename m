Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8Ypm-00030M-O8
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 11:45:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8Ypf-0002o0-7r
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 11:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8YpY-00072k-7e
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 11:44:59 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:60075)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8YpY-00072b-2r
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 11:44:52 -0400
Received: by iakx26 with SMTP id x26so7595193iak.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Sep 2012 08:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=h9lmcIWlpwMQy83vp+s8zW+V8V2+SMHLLsTzQDXdGxM=;
	b=Sd4ByPESdmPeMhiSC/6Xu+UuBdsLvrQa2YMCEBj7BpxF067kDtySvKxIvkWDAnplmW
	BoE3vPEVFuERdTYFc2Hj5YTKwsVe6O7UyrMrHMuxwl1hTC/NaBcV6D1w7XZpTwrPg6Np
	UqzmuwCJz0StYLf9UIJaqDGx31ts4p9GG3A3Nx0LZuS/sbeuhqrkRCFHwCMFB3PMGOlx
	nwbSb3VVoEAylHEAMGi2zxpoxEOUzQ+Dl3CUzqB51Hk77q72tbaiorIl9nb/G660qDqu
	OWmsHniF8+Bozmwwi1Wt3so+tCtus+9p+xi/BVH+hM6+ul3bxnhQP88sTh2aVrJQiGog
	QiCQ==
MIME-Version: 1.0
Received: by 10.50.188.134 with SMTP id ga6mr11192217igc.51.1346687091298;
	Mon, 03 Sep 2012 08:44:51 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Mon, 3 Sep 2012 08:44:51 -0700 (PDT)
In-Reply-To: <5044CFBC.9050800@suse.de>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
	<5044CFBC.9050800@suse.de>
Date: Mon, 3 Sep 2012 16:44:51 +0100
Message-ID: <CAFEAcA88-bBA57REcsfU+FmLr7J2y_qD+n+_G_mBp6f1EtxuBw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQl93EtDhDtzSByvdDtq3o6N7/zTpZIs3ps95VjKcFZKBN8gLrs8HYwFnZFBKg1MeQLcWur9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2 v3] Fix static linking
	for cURL and SDL
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
X-List-Received-Date: Mon, 03 Sep 2012 15:45:05 -0000

On 3 September 2012 16:41, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> The only use case for QEMU's --static compilation I know is linux-user,
> and that doesn't need cURL or SDL AFAIK. Shouldn't we rather sanitize
> our configure-time checks to only look for the actually needed stuff
> than making sure that unnecessary dependencies are generated nicely?

In particular it might be nice to be able to build in a single
run both (a) dynamically linked softmmu targets and (b) statically
linked linux-user targets (and maybe even also (c) dynamically
linked linux-user targets?).

Personally I think it might indeed be a good idea to just say
"statically linked softmmu isn't supported" and forbid it, unless
somebody has a good use case for it...

-- PMM

