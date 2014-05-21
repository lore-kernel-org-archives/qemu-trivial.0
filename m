Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wmxax-0004hb-5f
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 23:53:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Wmxap-0004cM-Ni
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 23:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Wmxaf-0001qB-R1
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 23:53:27 -0400
Received: from mail-pa0-f49.google.com ([209.85.220.49]:64772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Wmxaf-0001pe-LH
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 23:53:17 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so963230pab.22
	for <qemu-trivial@nongnu.org>; Tue, 20 May 2014 20:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=9u9PNO8g3Fyfpm0O99lbRGUvFED7a2S8jnRiugjVCfo=;
	b=AslxIAHvjNQePX5sBgf8uZyhUARaFUm9VmHLXB3I2oIBsS7R2X0nPIjdGj+DSKIS5v
	+0TC0rwisFk5Fh6Tyw1qnGrGW3Vpx9O/txfEX/Yuks8F1P9TP/h6sOfevNX3eb4tR3d0
	8tGNAgAeqXco48DPCEiCq4DvCbNq3cWI5N2oUEH+42bMLo6tWbQ1648rkFZiHyoQsjOg
	vs9Xu0JRCHfKOW1+frU2fOz6O/P367FV1MzYBM2YVC3pzgkilFBe2/fIzEnqtxv9MxcO
	YDOoXtG7H5uBBTZmFCxBoYbCkhaW2fiEeYYWDa5Bx39Ou78AhaSG/2ABZ9w8mrHDMw0f
	9IKg==
X-Gm-Message-State: ALoCoQkbGNp0f0UT+o3CtoLy2BfK3j8wdEFBh8yqOE9kHTL7CdWXQQx2u/KIp6aFD/j+jvArm25y
X-Received: by 10.66.230.193 with SMTP id ta1mr56507155pac.29.1400644396741;
	Tue, 20 May 2014 20:53:16 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	rc3sm1421006pbc.5.2014.05.20.20.53.12 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 May 2014 20:53:14 -0700 (PDT)
Message-ID: <537C2326.5040003@ozlabs.ru>
Date: Wed, 21 May 2014 13:53:10 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1400644197-6179-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1400644197-6179-1-git-send-email-aik@ozlabs.ru>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.49
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Lieven <pl@kamp.de>
Subject: Re: [Qemu-trivial] [PATCH] iscsi: Fix compile error
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
X-List-Received-Date: Wed, 21 May 2014 03:53:34 -0000

On 05/21/2014 01:49 PM, Alexey Kardashevskiy wrote:
> This fixes compile error when LIBISCSI_FEATURE_IOVECTOR is not defined:
> 
> block/iscsi.c|384 col 13| error: 'iscsi_allocationmap_is_allocated' defined but not used [-Werror=unused-f    unction]

Oops, never mind. Fix is already on its way.


> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  block/iscsi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index d649424..5b3f459 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -380,6 +380,7 @@ retry:
>      return 0;
>  }
>  
> +#if defined(LIBISCSI_FEATURE_IOVECTOR)
>  
>  static bool iscsi_allocationmap_is_allocated(IscsiLun *iscsilun,
>                                               int64_t sector_num, int nb_sectors)
> @@ -393,9 +394,6 @@ static bool iscsi_allocationmap_is_allocated(IscsiLun *iscsilun,
>                             sector_num / iscsilun->cluster_sectors) == size);
>  }
>  
> -
> -#if defined(LIBISCSI_FEATURE_IOVECTOR)
> -
>  static int64_t coroutine_fn iscsi_co_get_block_status(BlockDriverState *bs,
>                                                    int64_t sector_num,
>                                                    int nb_sectors, int *pnum)
> 


-- 
Alexey

