Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UX4nG-0003gz-Mu
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2013 03:16:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UX4nD-0003ga-J7
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 03:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UX4n9-0007hf-MA
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 03:16:03 -0400
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236]:51742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UX4n9-0007h6-7p
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 03:15:59 -0400
Received: by mail-wg0-f54.google.com with SMTP id y10so151573wgg.33
	for <qemu-trivial@nongnu.org>; Tue, 30 Apr 2013 00:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=extKDGVWzIcIWJTQlvP/sMctsPQVscir2vDgYm7ArS4=;
	b=lu8z6USqtcReI9Ef6RRZh8ApNZIFeJgk15egKGjicTi4waRD0Sb2mqSlFCxZjbv4QW
	D99x0cgSmzD/Y5H6wqduFhEwE/nD9LkKWJuh0YMTEIzumRLdG7esoTaR0sfW2+9n6uYb
	1ujDc5rvnDPl2hrE4hTilXMPcPkQ9UWWfmts0/ZqE7TDnWSr1FxW46vdMu8Wx3zqmeVL
	TQZUZxuq+SF5tMYhXJmIKZZ3G4I8l5YyDXh4hbxIAnOE66/fUCPHaDCKC6FsVBclAkT8
	zW1PXbQxsKvkmufi0W7NyE93uOy5SzFxCSi6TUmgem9ccGqHbg12O405dNyqQPUCzg87
	lmkw==
X-Received: by 10.180.188.3 with SMTP id fw3mr22077600wic.33.1367306158126;
	Tue, 30 Apr 2013 00:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.5.232 with HTTP; Tue, 30 Apr 2013 00:15:37 -0700 (PDT)
In-Reply-To: <1367290790-19159-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1367290790-19159-1-git-send-email-lig.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2013 08:15:37 +0100
Message-ID: <CAFEAcA-n_gbU_Oj1=2O8Wr=fuT8BgDkT+_-RMZJ8tALLn8emyA@mail.gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlsSoCHJgsJPsbp4/Tk3+ZrEICp9m2VsB65lSgtK+POSvNKLb5UFhHJFE2QCJzDqmBmhps2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate: remove
	redundantly included qemu/timer.h
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
X-List-Received-Date: Tue, 30 Apr 2013 07:16:05 -0000

On 30 April 2013 03:59, liguang <lig.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  translate-all.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/translate-all.c b/translate-all.c
> index da93608..d04a116 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -55,7 +55,6 @@
>  #else
>  #include "exec/address-spaces.h"
>  #endif
> -#include "qemu/timer.h"

Nice catch -- this was a fix for a compile failure
when compiling with profiling enabled, which got fixed
once directly (commit 0aa09897) and once via a commit
through the PPC tree (commit c8ff5daa0). This change
fixes the double-include by effectively reverting the
latter commit.

thanks
-- PMM

