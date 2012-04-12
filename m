Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIMzs-0004MC-Nk
	for mharc-qemu-trivial@gnu.org; Thu, 12 Apr 2012 12:35:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SIMzk-0003uR-Gs
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 12:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SIMzc-0004HK-UR
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 12:35:40 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SIMzY-0004G3-Rg; Thu, 12 Apr 2012 12:35:28 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	348CF72800B4; Thu, 12 Apr 2012 18:35:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id boKNbuZoPtVT; Thu, 12 Apr 2012 18:35:26 +0200 (CEST)
Received: from [192.168.178.20] (p54ADAB0B.dip.t-dialin.net [84.173.171.11])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	51117728009B; Thu, 12 Apr 2012 18:35:26 +0200 (CEST)
Message-ID: <4F87044E.3000000@weilnetz.de>
Date: Thu, 12 Apr 2012 18:35:26 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1334231021-25886-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1334231021-25886-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	=?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Brad Smith <brad@comstyle.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] bsd-user: fix compile
	failure
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
X-List-Received-Date: Thu, 12 Apr 2012 16:35:47 -0000

Am 12.04.2012 13:43, schrieb Peter Maydell:
> bsd-user doesn't actually support reserving a memory area for the
> guest address space, but we need to at least define the reserved_va
> global so that cpu-all.h's RESERVED_VA macro will work correctly.
>
> This fixes a compilation error introduced in commit 39879bb
> which added a use of RESERVED_VA to h2g_valid().
>
> Reported-by: Brad Smith<brad@comstyle.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2 changes: added commit hash accidentally omitted from message
> added reported-by line. no code change.
>
>   bsd-user/main.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 48cb715..0689e38 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -41,6 +41,7 @@ int singlestep;
>   unsigned long mmap_min_addr;
>   unsigned long guest_base;
>   int have_guest_base;
> +unsigned long reserved_va;
>   #endif
>
>   static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;

Reviewed-by: Stefan Weil <sw@weilnetz.de>

I'll send a patch which changes the data type to uintptr_t later
with my w64 patches.


