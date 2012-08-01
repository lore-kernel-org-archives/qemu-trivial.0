Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwWNz-0006a6-5x
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 06:42:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwWNs-0006Hc-Aw
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 06:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwWNm-0000gw-N4
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 06:42:32 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:37302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SwWNb-0000ep-8e; Wed, 01 Aug 2012 06:42:15 -0400
Received: by wibhm2 with SMTP id hm2so2962623wib.10
	for <multiple recipients>; Wed, 01 Aug 2012 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iM7nRFB/x3Y6284U2V8kYDtO5oO5npQeDdRAptWTLTg=;
	b=jdePrptj9W/6Gjpsfaou25cF1FUH9woXVmuNvfd3wuwYruYeMKCZFeoMR1+MLI3lls
	fEvF19fq2+CijcA0wJ9wkjhbooykqSATWV31Wza+pmKdXSGksHJizZF0FC9af9jbejPL
	SPc3+3pgbMJ2P7sdDbxWS/e8WSktMwzGs38nCKio9NimcCQfA4WSbtxLJBHtJDhm5nYN
	3yJn5brinurydrrr2by2xWgmAcLh6pcFQ9cLvp9Gy34n8W4tklGkQdBubWM2eVHrL1cn
	U8zGElOfrAsLDPaI2I+rEbJ3om4k8BboS+03nfkCcdGJCx4RQisYn7nG10XYtIvXAfNm
	0qkA==
Received: by 10.216.116.73 with SMTP id f51mr8658398weh.50.1343817734229;
	Wed, 01 Aug 2012 03:42:14 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fu8sm27281926wib.5.2012.08.01.03.42.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 03:42:13 -0700 (PDT)
Date: Wed, 1 Aug 2012 11:42:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Tyler Hall <tylerwhall@gmail.com>
Message-ID: <20120801104212.GB17816@stefanha-thinkpad.localdomain>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] exec.c: Fix off-by-one error in
 register_subpage
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
X-List-Received-Date: Wed, 01 Aug 2012 10:42:38 -0000

On Wed, Jul 25, 2012 at 06:45:03PM -0400, Tyler Hall wrote:
> subpage_register() expects "end" to be the last byte in the mapping.
> Registering a non-page-aligned memory region that extends up to or
> beyond a page boundary causes subpage_register() to silently fail
> through the (end >= PAGE_SIZE) check.
> 
> This bug does not cause noticeable problems for mappings that do not
> extend to a page boundary, though they do register an extra byte.
> 
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> ---
>  exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/exec.c b/exec.c
> index feb4795..27b100c 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2271,7 +2271,7 @@ static void register_subpage(MemoryRegionSection *section)
>          subpage = container_of(existing->mr, subpage_t, iomem);
>      }
>      start = section->offset_within_address_space & ~TARGET_PAGE_MASK;
> -    end = start + section->size;
> +    end = start + section->size - 1;
>      subpage_register(subpage, start, end, phys_section_add(section));
>  }

I would really like to see an Acked-by: or Signed-off-by: from Avi or
someone else who is familiar with the memory regions code.  Especially
for Patch 2/2.

Stefan

