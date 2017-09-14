Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsWsY-0000Mn-Gm
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 12:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dsWsW-0000Ke-0Z
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 12:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dsWsV-0003h7-0w
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 12:20:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1dsWsG-0003Rz-HK; Thu, 14 Sep 2017 12:20:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B789883C7;
	Thu, 14 Sep 2017 16:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5B789883C7
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lersek@redhat.com
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-80.rdu2.redhat.com
	[10.10.121.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDCE577D54;
	Thu, 14 Sep 2017 16:20:17 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org
References: <20170914134923.2479-1-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fba0ccfb-73ca-eb0a-d92a-70a85289fb33@redhat.com>
Date: Thu, 14 Sep 2017 18:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170914134923.2479-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Sep 2017 16:20:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] osdep: Fix ROUND_UP(64-bit, 32-bit)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 16:20:37 -0000

On 09/14/17 15:49, Eric Blake wrote:
> When using bit-wise operations that exploit the power-of-two
> nature of the second argument of ROUND_UP(), we still need to
> ensure that the mask is as wide as the first argument (done
> by using a ternary to force proper arithmetic promotion).
> Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512U) produces 0,
> instead of the intended 2TiB, because negation of an unsigned
> 32-bit quantity followed by widening to 64-bits does not
> sign-extend the mask.
> 
> Broken since its introduction in commit 292c8e50 (v1.5.0).
> Callers that passed the same width type to both macro parameters,
> or that had other code to ensure the first parameter's maximum
> runtime value did not exceed the second parameter's width, are
> unaffected, but I did not audit to see which (if any) existing
> clients of the macro could trigger incorrect behavior (I found
> the bug while adding a new use of the macro).
> 
> While preparing the patch, checkpatch complained about poor
> spacing, so I also fixed that here and in the nearby DIV_ROUND_UP.
> 
> CC: qemu-trivial@nongnu.org
> CC: qemu-stable@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> v2: use ternary instead of addition of 0 [Laszlo], improve commit message
> ---
>  include/qemu/osdep.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 6855b94bbf..f4ff372d41 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -189,13 +189,13 @@ extern int daemon(int, int);
> 
>  /* Round number up to multiple. Requires that d be a power of 2 (see
>   * QEMU_ALIGN_UP for a safer but slower version on arbitrary
> - * numbers) */
> + * numbers); works even if d is a smaller type than n.  */
>  #ifndef ROUND_UP
> -#define ROUND_UP(n,d) (((n) + (d) - 1) & -(d))
> +#define ROUND_UP(n, d) (((n) + (d) - 1) & -(0 ? (n) : (d)))
>  #endif
> 
>  #ifndef DIV_ROUND_UP
> -#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  #endif
> 
>  /*
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

