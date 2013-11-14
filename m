Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vh1U3-0004IR-2f
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2013 13:17:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vh1Ty-0004IB-4K
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:17:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vh1Tt-0004vL-Pf
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:17:34 -0500
Received: from mail-la0-f42.google.com ([209.85.215.42]:64684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vh1Tt-0004v6-IA
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:17:29 -0500
Received: by mail-la0-f42.google.com with SMTP id ec20so1925659lab.15
	for <qemu-trivial@nongnu.org>; Thu, 14 Nov 2013 10:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RtGG1ZERU2PtwsMrAiSdIN69NZpmDaDzLdc2RlNA4yw=;
	b=ND8aTg5uZEGuDhUKKGZod7M1xEjzkGQld6vXxMByq538daHLQhflTAO/yMirul/wV1
	OB1Loh0Z/8ecr7yMtx5ox3mu9pMTl1jHVS56oxSNvb/Vfaat7fdShND7YD3I03KcMMME
	a8iw/gbkBg2NwtHsApBX4UTGAnT13fz8Dr1UoBVjgY7Gkop8nOgPSy46eBnK0Fliujy9
	UjheebYqkeFIsySxcKPRWZA7KcrsZS4Ad9gmvkp1sD9B8jOWw+eAHSs0FHIQ64QBmPyL
	cdWwuh7r0py1UpL0i/U2WGCvDLwCG65SUl4PweQfR7hQGdOeTwaAjijkuL2KQXGIwh5Y
	p1nA==
X-Gm-Message-State: ALoCoQktP9AkmEOZpnDqr86EI73tYGdxq2eXfXKFV/0HY4Uv75ynNfQ/tM2pdOTnRvUJtzZt+yew
X-Received: by 10.152.225.129 with SMTP id rk1mr501549lac.74.1384453048398;
	Thu, 14 Nov 2013 10:17:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 14 Nov 2013 10:17:08 -0800 (PST)
In-Reply-To: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2013 18:17:08 +0000
Message-ID: <CAFEAcA9utL_JFX-wqLGMnRdKttkiw2JiADOXGfJJ=PMvb3w=VQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (1.7?)] configure: Use -B
 switch only for Python versions which support it
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
X-List-Received-Date: Thu, 14 Nov 2013 18:17:38 -0000

On 14 November 2013 18:07, Stefan Weil <sw@weilnetz.de> wrote:
> Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
> unconditionally. This breaks Python versions before 2.6 which don't
> support that switch.
>
> Now configure adds -B only if it is accepted by the Python interpreter.
>
> This modification introduces a small incompatiblity because -B might now
> also be added when configure was called with --python=PYTHON_INTERPRETER.

That sounds like it's fixing a bug to me. If we think -B
is right then we should be using it whether we defaulted
to 'python' or the user passed us /usr/local/bin/python2
or whatever.

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> This is an optional patch. We need it for Python versions older than 5 years
> if we don't want to use the workaround --python=python.
>
> I don't think it is needed for 1.7, but maybe other people think different.

I think that as long as our requirements list says
python 2.4 is the minimum then bugs that mean we don't work
on that are fair game for fixing during hardfreeze; and
this is a pretty simple and safe fix. I think it's better
to put it into the release than deal with people after
release trying to run it on RHEL-whatever that doesn't
have a newer python.

> diff --git a/configure b/configure
> index 9a02610..3c25816 100755
> --- a/configure
> +++ b/configure
> @@ -593,7 +593,7 @@ fi
>
>  : ${make=${MAKE-make}}
>  : ${install=${INSTALL-install}}
> -: ${python=${PYTHON-python -B}}
> +: ${python=${PYTHON-python}}
>  : ${smbd=${SMBD-/usr/sbin/smbd}}
>
>  # Default objcc to clang if available, otherwise use CC
> @@ -1420,6 +1420,13 @@ if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_in
>        "Use --python=/path/to/python to specify a supported Python."
>  fi
>
> +# The -B switch was added in Python 2.6.
> +# If it is supplied, compiled files are not written.
> +# Use it for Python versions which support it.
> +if $python -B -c 'import sys; sys.exit(0)' 2>/dev/null; then
> +  $python="$python -B"
> +fi
> +
>  if test -z "${target_list+xxx}" ; then
>      target_list="$default_target_list"
>  else

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

