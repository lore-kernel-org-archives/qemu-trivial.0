Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbFmf-0000En-6U
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2011 13:11:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RbFmc-00004r-Sg
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 13:11:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RbFmb-0007GP-NI
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 13:11:54 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:32892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RbFmY-0007EH-V0; Thu, 15 Dec 2011 13:11:51 -0500
Received: by mail-iy0-f173.google.com with SMTP id j37so3556647iag.4
	for <multiple recipients>; Thu, 15 Dec 2011 10:11:50 -0800 (PST)
Received: by 10.42.73.138 with SMTP id s10mr3002138icj.38.1323972710476;
	Thu, 15 Dec 2011 10:11:50 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id x18sm23586096ibi.2.2011.12.15.10.11.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 10:11:49 -0800 (PST)
Message-ID: <4EEA3862.3030407@redhat.com>
Date: Thu, 15 Dec 2011 12:11:46 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1323956034-21468-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1323956034-21468-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] HACKING: clarify
	allocation/free recommendations
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
X-List-Received-Date: Thu, 15 Dec 2011 18:11:56 -0000

On 12/15/2011 07:33 AM, Peter Maydell wrote:
> Clarify the allocation/free recommendations; this is mostly
> just tidying up following the global-search-and-replace done
> with the conversion to the GLib g_malloc and friends.
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   HACKING |   10 ++++++----
>   1 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/HACKING b/HACKING
> index 733eab2..471cf1d 100644
> --- a/HACKING
> +++ b/HACKING
> @@ -77,11 +77,13 @@ avoided.
>
>   Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign
>   APIs is not allowed in the QEMU codebase. Instead of these routines,
> -use the replacement g_malloc/g_malloc0/g_realloc/g_free or
> -qemu_vmalloc/qemu_memalign/qemu_vfree APIs.
> +use the GLib memory allocation routines g_malloc/g_malloc0/g_new/
> +g_new0/g_realloc/g_free or QEMU's qemu_vmalloc/qemu_memalign/qemu_vfree
> +APIs.
>
> -Please note that NULL check for the g_malloc result is redundant and
> -that g_malloc() call with zero size is not allowed.
> +Please note that g_malloc will exit on allocation failure, so there
> +is no need to test for failure (as you would have to with malloc).
> +Calling g_malloc with a zero size is valid and will return NULL.
>
>   Memory allocated by qemu_vmalloc or qemu_memalign must be freed with
>   qemu_vfree, since breaking this will cause problems on Win32 and user


