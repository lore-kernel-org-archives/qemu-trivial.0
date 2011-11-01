Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLIvm-0002Q1-4G
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 14:19:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RLIhd-0005Y8-MB
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 14:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RLIhZ-0002kE-Ox
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 14:04:49 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:53366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RLIhT-0002jD-AR; Tue, 01 Nov 2011 14:04:39 -0400
Received: by qyk30 with SMTP id 30so1029167qyk.4
	for <multiple recipients>; Tue, 01 Nov 2011 11:04:38 -0700 (PDT)
Received: by 10.229.52.148 with SMTP id i20mr123665qcg.81.1320170678008;
	Tue, 01 Nov 2011 11:04:38 -0700 (PDT)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id fz9sm34902573qab.13.2011.11.01.11.04.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 11:04:37 -0700 (PDT)
Message-ID: <4EB034B3.2060108@codemonkey.ws>
Date: Tue, 01 Nov 2011 13:04:35 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Eric Sunshine <sunshine@sunshineco.com>
References: <1320140389-22079-1-git-send-email-sunshine@sunshineco.com>
In-Reply-To: <1320140389-22079-1-git-send-email-sunshine@sunshineco.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-barrier: Fix build
 failure on PowerPC Mac OS X
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
X-List-Received-Date: Tue, 01 Nov 2011 18:19:24 -0000

On 11/01/2011 04:39 AM, Eric Sunshine wrote:
> qemu-barrier.h tests if macro __powerpc__ is defined, however, the
> preprocessor on PowerPC Mac OS X defines only __POWERPC__, not
> __powerpc__.  Resolve by testing instead for qemu-provided _ARCH_PPC.
>
> Signed-off-by: Eric Sunshine<sunshine@sunshineco.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>
> The anomalous __powerpc__ test appears only in qemu-barrier.h.
> No other source files reference this name.
>
> Cc: David Gibson<david@gibson.dropbear.id.au>

>
>   qemu-barrier.h |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qemu-barrier.h b/qemu-barrier.h
> index 735eea6..c11bb2b 100644
> --- a/qemu-barrier.h
> +++ b/qemu-barrier.h
> @@ -14,7 +14,7 @@
>    */
>   #define smp_wmb()   barrier()
>
> -#elif defined(__powerpc__)
> +#elif defined(_ARCH_PPC)
>
>   /*
>    * We use an eieio() for a wmb() on powerpc.  This assumes we don't


