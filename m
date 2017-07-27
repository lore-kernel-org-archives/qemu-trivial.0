Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daoPQ-0001XP-Nc
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 15:25:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1daoPO-0001Vd-0P
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 15:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1daoPN-0005t8-9L
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 15:25:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1daoPJ-0005ov-6T; Thu, 27 Jul 2017 15:25:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B161F1D8F;
	Thu, 27 Jul 2017 19:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7B161F1D8F
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.10.124.230] (ovpn-124-230.rdu2.redhat.com [10.10.124.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6AF707A1;
	Thu, 27 Jul 2017 19:25:07 +0000 (UTC)
To: Jiang Biao <jiang.biao2@zte.com.cn>, qemu-devel@nongnu.org
Cc: shi.zhongbing@zte.com.cn, jiang.yong5@zte.com.cn, rth@twiddle.net,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1501122983-20801-1-git-send-email-jiang.biao2@zte.com.cn>
From: John Snow <jsnow@redhat.com>
Message-ID: <22cd68ee-bebd-3de0-24b4-59373b37390b@redhat.com>
Date: Thu, 27 Jul 2017 15:25:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501122983-20801-1-git-send-email-jiang.biao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 27 Jul 2017 19:25:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg/README: fix a
 description error.
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
X-List-Received-Date: Thu, 27 Jul 2017 19:25:18 -0000



On 07/26/2017 10:36 PM, Jiang Biao wrote:
> The atomics.txt is not in the docs directory but in docs/devel/
> instead.
> 
> Signed-off-by: Jiang Biao <jiang.biao2@zte.com.cn>
> ---
>   tcg/README | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/README b/tcg/README
> index bf49e82..03bfb6a 100644
> --- a/tcg/README
> +++ b/tcg/README
> @@ -446,7 +446,7 @@ when MTTCG is enabled.
>   The guest translators should generate this opcode for all guest instructions
>   which have ordering side effects.
>   
> -Please see docs/atomics.txt for more information on memory barriers.
> +Please see docs/devel/atomics.txt for more information on memory barriers.
>   
>   ********* 64-bit guest on 32-bit host support
>   
> 

Reviewed-by: John Snow <jsnow@redhat.com>

CC qemu-trivial

