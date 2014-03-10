Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN8CC-0002U5-HU
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 17:57:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8C5-0002KQ-MD
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8C0-0005a4-U6
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:57:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WN8Br-0005Yu-2W; Mon, 10 Mar 2014 17:56:55 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ALuqtG026252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 17:56:52 -0400
Received: from redhat.com (vpn1-5-84.ams2.redhat.com [10.36.5.84])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s2ALuowP016878; Mon, 10 Mar 2014 17:56:50 -0400
Date: Mon, 10 Mar 2014 23:56:54 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140310215654.GB7104@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394478649-9453-3-git-send-email-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 02/12] hw/intc/apic.c: Use uint32_t for
 mask word in foreach_apic
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
X-List-Received-Date: Mon, 10 Mar 2014 21:57:14 -0000

On Mon, Mar 10, 2014 at 07:10:38PM +0000, Peter Maydell wrote:
> Use unsigned arithmetic for operations on the mask word
> in the foreach_apic() macro, to avoid relying on undefined
> behaviour when shifting into the sign bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/intc/apic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 361ae90..e137882 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -201,12 +201,13 @@ static void apic_external_nmi(APICCommonState *s)
>  
>  #define foreach_apic(apic, deliver_bitmask, code) \
>  {\
> -    int __i, __j, __mask;\
> +    int __i, __j;\
> +    uint32_t __mask;\
>      for(__i = 0; __i < MAX_APIC_WORDS; __i++) {\
>          __mask = deliver_bitmask[__i];\
>          if (__mask) {\
>              for(__j = 0; __j < 32; __j++) {\
> -                if (__mask & (1 << __j)) {\
> +                if (__mask & (1U << __j)) {\
>                      apic = local_apics[__i * 32 + __j];\
>                      if (apic) {\
>                          code;\
> -- 
> 1.9.0
> 

