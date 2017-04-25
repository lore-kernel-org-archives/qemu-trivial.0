Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d30bS-0003NU-MN
	for mharc-qemu-trivial@gnu.org; Tue, 25 Apr 2017 09:34:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d30bM-0003Iz-1A
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d30bL-0007bv-5J
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:33:56 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:34184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d30bK-0007aS-W1
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:33:55 -0400
Received: by mail-wr0-x22c.google.com with SMTP id l9so6745601wre.1
	for <qemu-trivial@nongnu.org>; Tue, 25 Apr 2017 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sSGPW2qcb8SWlZojxz6ZrtF946ebV8Vwl00+QrZrT2s=;
	b=FIrgaqm8K/LuT2CP/AcxoDaBCsGxId/qX59ZDrWpaiLNI8Dm990FReK/iqA4iDLQNM
	RT9/mzGQnQZyidckSjhnxmv0RSwzIVNypKy4C7/OOj6py83A+3WrJ372XFPYmfMtIetB
	hh2ZOrczbQHV7NNfyj8aHsvrhYZTc02opJdes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sSGPW2qcb8SWlZojxz6ZrtF946ebV8Vwl00+QrZrT2s=;
	b=bwwJSvRYrAJyEGHolxwocYex1Ernu687O8mBMQ9tHMYMBWFVIe0zTRyo1xrTrLHYor
	IUj9+DXL5SZ8hMtlJg5BC8HJlvoBSQqW2lDQTvlR5q9hBdeN5RzyTopOa9+4CSpvp5DG
	9zr3mOGQt4zR9K+dCGVrpL1NAa/HwPyPGlbpmYN9c7rGgW6MV9abnQl30X7hDEsPNoo+
	LTIIlLSZ5JmTKvdolJNpz5hWvLtq0z7kSJBmnDDpOts36o5Wah/N7onm1VI7EVQSsLPl
	JPvZZxL/nx1WSZDj4lSRkeFhXUBBMIZWrhwqUVevzPJvBrg2+kqFmY8lnTyqEuN0tvaz
	dhRQ==
X-Gm-Message-State: AN3rC/4L+sCVhb4RwplAy7M6TaQUn7dZ3yOlDz2MWHBFedy4Ad31IQaF
	HyIZ8spke3hlE+nYwKw/uHSUORFQEOC/
X-Received: by 10.223.152.238 with SMTP id w101mr11037763wrb.151.1493127233925;
	Tue, 25 Apr 2017 06:33:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Tue, 25 Apr 2017 06:33:33 -0700 (PDT)
In-Reply-To: <20170425131828.22480-1-n54@gmx.com>
References: <20170425131828.22480-1-n54@gmx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2017 14:33:33 +0100
Message-ID: <CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
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
X-List-Received-Date: Tue, 25 Apr 2017 13:34:01 -0000

On 25 April 2017 at 14:18, Kamil Rytarowski <n54@gmx.com> wrote:
> Appease pkgsrc and use portable shell variable comparison.
> This switches "==" to "=". It should not be a functional change.
>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---

Thanks for this patch; it's an easy bug to let slip in
if your /bin/sh happens to be bash.

PS: you forgot to cc qemu-devel@ on this patch.

>  scripts/qemu-binfmt-conf.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 0f1aa63872..8afc3eb5bb 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -284,12 +284,12 @@ while true ; do
>          shift
>          # check given cpu is in the supported CPU list
>          for cpu in ${qemu_target_list} ; do
> -            if [ "$cpu" == "$1" ] ; then
> +            if [ "$cpu" = "$1" ] ; then
>                  break
>              fi
>          done
>
> -        if [ "$cpu" == "$1" ] ; then
> +        if [ "$cpu" = "$1" ] ; then
>              qemu_target_list="$1"
>          else
>              echo "ERROR: unknown CPU \"$1\"" 1>&2
> --
> 2.12.2

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

