Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN8Cu-0003Vo-Bz
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 17:58:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8Co-0003L2-AH
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8Cj-0005fc-CX
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:57:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WN8CZ-0005ep-HK; Mon, 10 Mar 2014 17:57:39 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ALvbHv024943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 17:57:37 -0400
Received: from redhat.com (vpn1-5-84.ams2.redhat.com [10.36.5.84])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s2ALvYLW018147; Mon, 10 Mar 2014 17:57:35 -0400
Date: Mon, 10 Mar 2014 23:57:38 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140310215738.GC7104@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394478649-9453-2-git-send-email-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 01/12] target-i386: Avoid shifting left
	into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 21:57:59 -0000

On Mon, Mar 10, 2014 at 07:10:37PM +0000, Peter Maydell wrote:
> Add 'U' suffixes where necessary to avoid (1 << 31) which
> shifts left into the sign bit, which is undefined behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

While not required for correctness,
I think it would be cleaner to change them all to 1U, for consistency.


> ---
>  target-i386/cpu.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target-i386/cpu.h b/target-i386/cpu.h
> index 0014acc..064f987 100644
> --- a/target-i386/cpu.h
> +++ b/target-i386/cpu.h
> @@ -202,7 +202,7 @@
>  #define CR0_NE_MASK  (1 << 5)
>  #define CR0_WP_MASK  (1 << 16)
>  #define CR0_AM_MASK  (1 << 18)
> -#define CR0_PG_MASK  (1 << 31)
> +#define CR0_PG_MASK  (1U << 31)
>  
>  #define CR4_VME_MASK  (1 << 0)
>  #define CR4_PVI_MASK  (1 << 1)
> @@ -436,7 +436,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_HT (1 << 28)
>  #define CPUID_TM (1 << 29)
>  #define CPUID_IA64 (1 << 30)
> -#define CPUID_PBE (1 << 31)
> +#define CPUID_PBE (1U << 31)
>  
>  #define CPUID_EXT_SSE3     (1 << 0)
>  #define CPUID_EXT_PCLMULQDQ (1 << 1)
> @@ -467,7 +467,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_EXT_AVX      (1 << 28)
>  #define CPUID_EXT_F16C     (1 << 29)
>  #define CPUID_EXT_RDRAND   (1 << 30)
> -#define CPUID_EXT_HYPERVISOR  (1 << 31)
> +#define CPUID_EXT_HYPERVISOR  (1U << 31)
>  
>  #define CPUID_EXT2_FPU     (1 << 0)
>  #define CPUID_EXT2_VME     (1 << 1)
> @@ -496,7 +496,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_EXT2_RDTSCP  (1 << 27)
>  #define CPUID_EXT2_LM      (1 << 29)
>  #define CPUID_EXT2_3DNOWEXT (1 << 30)
> -#define CPUID_EXT2_3DNOW   (1 << 31)
> +#define CPUID_EXT2_3DNOW   (1U << 31)
>  
>  /* CPUID[8000_0001].EDX bits that are aliase of CPUID[1].EDX bits on AMD CPUs */
>  #define CPUID_EXT2_AMD_ALIASES (CPUID_EXT2_FPU | CPUID_EXT2_VME | \
> -- 
> 1.9.0
> 

