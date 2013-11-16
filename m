Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vhfi6-0005Uq-8D
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 08:14:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vhfhy-0005M3-RD
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 08:14:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vhfhs-0003U8-IR
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 08:14:42 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=40555
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vhfhg-0003SS-S9; Sat, 16 Nov 2013 08:14:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	899EC728019E; Sat, 16 Nov 2013 14:14:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Nh-Wx0T0i7pJ; Sat, 16 Nov 2013 14:14:12 +0100 (CET)
Received: from [192.168.178.35] (p54AD85D3.dip0.t-ipconnect.de
	[84.173.133.211])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8D6847280100; Sat, 16 Nov 2013 14:14:12 +0100 (CET)
Message-ID: <52876FA4.7020503@weilnetz.de>
Date: Sat, 16 Nov 2013 14:14:12 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH (1.7?)] configure: Use -B switch only for
 Python versions which support it
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
X-List-Received-Date: Sat, 16 Nov 2013 13:14:48 -0000

This patch is wrong!

Am 14.11.2013 19:07, schrieb Stefan Weil:
> Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
> unconditionally. This breaks Python versions before 2.6 which don't
> support that switch.
>
> Now configure adds -B only if it is accepted by the Python interpreter.
>
> This modification introduces a small incompatiblity because -B might now
> also be added when configure was called with --python=PYTHON_INTERPRETER.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> This is an optional patch. We need it for Python versions older than 5 years
> if we don't want to use the workaround --python=python.
>
> I don't think it is needed for 1.7, but maybe other people think different.
>
> Stefan
>
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

It should be

python="$python -B"

I'll send a v2.

Stefan


