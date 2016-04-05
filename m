Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anUXV-0004C6-Vy
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 13:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anUXT-0004Ab-S4
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 13:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anUXT-0002V0-1j
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 13:13:15 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anUXS-0002UY-TE
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 13:13:14 -0400
Received: by mail-vk0-x236.google.com with SMTP id e185so26337586vkb.1
	for <qemu-trivial@nongnu.org>; Tue, 05 Apr 2016 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OEXli2GHTZvmgoIXFwn4yv934kcclTu1B2gvSXICWAQ=;
	b=UWp9nkxrseUEXcCxtxeiytQZFLe/vgf9DuEq6GAdhvpjEpLsnarw6NeIbATrWvX4Rg
	ibv9uLvI+aft7Pnb6G1khPvyp5RYWDgU6Bi62NVbfrDOCOr9e+vt3STMd99s8s0ngAI0
	TKssTK9xeRflNZoc1heFQcBZZjjV7kBl+6jjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OEXli2GHTZvmgoIXFwn4yv934kcclTu1B2gvSXICWAQ=;
	b=FQkRw5ZaOBxX49PAKIo4IHxI5LbeFU3zNlzTf8OEyzLjCBH0Dc7Y2SFCe40a90DqGA
	vo3SsfFTGZIVAiGU1XK3DItNADAFM2Cf3uRqKgNjTOy2a5lcskQdksZypjYCYPO40Qjz
	l7vD2llIKIuSGGNNFTykZJ8CZ8ZpM5Zqy2uSZ1CGZx0V7uzH72K/cHhkn/TCHbNilR7C
	wbK1MBAHvKa4YTDtAMvDuywusUD4hGPBDIW7Ab2izo6bvfH02SvBbPrZgq297/tNGaHi
	acRHCBmM3eEd4dMdGXIdQVWBNB3nxsqnNdEkn+0fhR2/ByLOCQ1jpaNgBAC11OANepQ2
	+QxQ==
X-Gm-Message-State: AD7BkJLqwd4ScTn+l9uWHK/iiNuRtoaiyRI+8u5buRVDU89WG//95ZiqbXaDOaMXXyPyK7Hw77qzJAgp9vkxOL0c
X-Received: by 10.159.38.13 with SMTP id 13mr8643822uag.17.1459876393395; Tue,
	05 Apr 2016 10:13:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 5 Apr 2016 10:12:54 -0700 (PDT)
In-Reply-To: <1459864881-71319-1-git-send-email-emaste@freebsd.org>
References: <1459864881-71319-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2016 18:12:54 +0100
Message-ID: <CAFEAcA90ag-4SfAtnzd=TS8VHfjBWEMrN=a-V2GmweA5LD=JsQ@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: add qemu/cutils.h
	include after f348b6d
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
X-List-Received-Date: Tue, 05 Apr 2016 17:13:16 -0000

On 5 April 2016 at 15:01, Ed Maste <emaste@freebsd.org> wrote:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/uaccess.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
> index 7cb6d17..b7b3a06 100644
> --- a/bsd-user/uaccess.c
> +++ b/bsd-user/uaccess.c
> @@ -1,5 +1,6 @@
>  /* User memory access */
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>
>  #include "qemu.h"

Applied to master, thanks.

-- PMM

