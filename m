Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsFDd-0001aR-7v
	for mharc-qemu-trivial@gnu.org; Wed, 13 Sep 2017 17:29:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dsFDb-0001Z1-Bc
	for qemu-trivial@nongnu.org; Wed, 13 Sep 2017 17:29:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dsFDY-0001Yd-7C
	for qemu-trivial@nongnu.org; Wed, 13 Sep 2017 17:29:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dsFDP-0001TF-0j; Wed, 13 Sep 2017 17:28:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF8FD81DF3;
	Wed, 13 Sep 2017 21:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF8FD81DF3
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AFE65C545;
	Wed, 13 Sep 2017 21:28:56 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: lersek@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	qemu-stable <qemu-stable@nongnu.org>
References: <20170913210343.19078-1-eblake@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <15df0ccc-1745-6e2b-35f5-b473aaec1b7b@redhat.com>
Date: Wed, 13 Sep 2017 23:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170913210343.19078-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 13 Sep 2017 21:28:57 +0000 (UTC)
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
X-List-Received-Date: Wed, 13 Sep 2017 21:29:12 -0000

On 13/09/2017 23:03, Eric Blake wrote:
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
> 
>  #ifndef DIV_ROUND_UP
> -#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  #endif
> 
>  /*
> 


Cc: qemu-stable@nongnu.org

Paolo

