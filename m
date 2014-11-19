Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xr0Um-00022Q-LP
	for mharc-qemu-trivial@gnu.org; Wed, 19 Nov 2014 03:20:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xr0UH-0001vs-14
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 03:20:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xr0Tv-0005ih-DT
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 03:19:40 -0500
Received: from mail-la0-f53.google.com ([209.85.215.53]:35066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xr0Tv-0005i0-6s
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 03:19:19 -0500
Received: by mail-la0-f53.google.com with SMTP id pn19so76484lab.12
	for <qemu-trivial@nongnu.org>; Wed, 19 Nov 2014 00:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ghFTKkmh/dq5ZaL53Jk1sPeDvq0CHxLio3OsNoEs6Ck=;
	b=YF0xwioWKtGGsxvxeI6DoADtEEZ+KT6XIe9/V6BBk4t/PVqDCuJGFxiXfRwB0ZBxPN
	sM8MSLN0BAXhP3jCMLniblOCJrV4tz95kPGysql+NLJirYwSz8QTSuzpUxWUmx/v4gxz
	2vnZh2rVfXxehwmKjrInyT5yQVh3HDH7CmS/cg/1BjluuVcPYwwGyopS+b9JiraFn0gm
	vF4vga77lHtBLQcJBOxQb6gcJM82lwPbgIStnowKuebHlxh/wxRaRIc3mgshkGRK0bBD
	O98VNZ0O6Elhj94sPDmV2KkQh3YUKISGQuDX61Ncn0WTozBqHdKYZUfTMHMm3+CYiKHN
	j5AA==
X-Gm-Message-State: ALoCoQkuxvRUHyHHJUvz8bhkpW9Ryijp05l6aCZWC1ooVLtHX0erLtZOFlyz76lBRbSTaEww9FKj
X-Received: by 10.152.120.73 with SMTP id la9mr40829451lab.23.1416385158348;
	Wed, 19 Nov 2014 00:19:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.150.135 with HTTP; Wed, 19 Nov 2014 00:18:58 -0800 (PST)
In-Reply-To: <1416381197-12191-1-git-send-email-famz@redhat.com>
References: <1416381197-12191-1-git-send-email-famz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Nov 2014 08:18:58 +0000
Message-ID: <CAFEAcA99PmxgB9bD5KSprFACwSKWAbCW4ec1m1ohah_dxOhvNQ@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Replace which(1)
	with "command -v"
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
X-List-Received-Date: Wed, 19 Nov 2014 08:20:12 -0000

On 19 November 2014 07:13, Fam Zheng <famz@redhat.com> wrote:
> Because which(1) is not always installed, whereas "command -v" is
> the more native way to check for a command.
>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 47048f0..986a13d 100755
> --- a/configure
> +++ b/configure
> @@ -2727,7 +2727,7 @@ fi
>  if test "$modules" = yes; then
>      shacmd_probe="sha1sum sha1 shasum"
>      for c in $shacmd_probe; do
> -        if which $c >/dev/null 2>&1; then
> +        if command -v $c >/dev/null 2>&1; then
>              shacmd="$c"
>              break
>          fi

Configure already provides the shell function "has"
for checking for existence of a command -- can we just
use that?

thanks
-- PMM

