Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsPl2-00005u-RK
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 04:44:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dsPl0-0008Vg-Gi
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 04:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dsPkz-0001Ju-Cz
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 04:44:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1dsPks-0001An-BB; Thu, 14 Sep 2017 04:44:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A47DC04B946;
	Thu, 14 Sep 2017 08:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7A47DC04B946
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lersek@redhat.com
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-83.rdu2.redhat.com
	[10.10.120.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 274A517B6A;
	Thu, 14 Sep 2017 08:44:10 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org
References: <20170913210343.19078-1-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d40b4b1a-76ca-f438-e1d9-e079dc08724c@redhat.com>
Date: Thu, 14 Sep 2017 10:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170913210343.19078-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 14 Sep 2017 08:44:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] osdep: Fix ROUND_UP(64-bit, 32-bit)
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
X-List-Received-Date: Thu, 14 Sep 2017 08:44:23 -0000

On 09/13/17 23:03, Eric Blake wrote:
> When using bit-wise operations that exploit the power-of-two
> nature of the second argument of ROUND_UP(), we still need to
> ensure that the mask is as wide as the first argument (done
> by using addition of 0 to force proper arithmetic promotion).
> Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512) produces 0,
> instead of the intended 2TiB.
> 
> Broken since its introduction in commit 292c8e50 (v1.5.0).
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> I did not audit to see how many potential users of ROUND_UP
> are actually passing in different sized types where the first
> argument can be larger than UINT32_MAX; I stumbled across the
> problem when iotests 190 started failing on a patch where I
> added a new use.  We can either be conservative and put this
> on qemu-stable no matter what, or go through the effort of an
> audit to see what might be broken (many callers in the block
> layer, but not just there).
> ---
>  include/qemu/osdep.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 6855b94bbf..7a3000efc5 100644
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
> +#define ROUND_UP(n, d) (((n) + (d) - 1) & -((n) - (n) + (d)))
>  #endif

Another way to widen the mask as necessary would be:

  (((n) + (d) - 1) & -(0 ? (n) : (d)))

From the C standard,

6.5.15 Conditional operator
5 If both the second and third operands have arithmetic type, the result
  type that would be determined by the usual arithmetic conversions,
  were they applied to those two operands, is the type of the result.
  [...]

Using the conditional operator is *perhaps* better than addition and
subtraction, because it would keep the previous trait of ROUND_UP that
"n" is evaluated only once:

6.5.15 Conditional operator
4 The first operand is evaluated; there is a sequence point after its
  evaluation. The second operand is evaluated only if the first compares
  unequal to 0; the third operand is evaluated only if the first
  compares equal to 0; the result is the value of the second or third
  operand (whichever is evaluated), converted to the type described
  below. [...]

Although, I admit that invoking ROUND_UP with any side effects in the
arguments would be crazy to begin with...

> 
>  #ifndef DIV_ROUND_UP
> -#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  #endif

This looks like an independent whitespace fix; should it be in this patch?

Thanks
Laszlo

