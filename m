Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBMvI-0001BV-03
	for mharc-qemu-trivial@gnu.org; Thu, 18 May 2017 11:01:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dBMvF-00019k-GZ
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 11:01:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dBMvE-0006uP-Oy
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 11:01:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dBMvA-0006tE-La; Thu, 18 May 2017 11:00:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C2ABC05FFC8;
	Thu, 18 May 2017 15:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C2ABC05FFC8
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7C2ABC05FFC8
Received: from [10.36.116.195] (ovpn-116-195.ams2.redhat.com [10.36.116.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A1DE5C316;
	Thu, 18 May 2017 15:00:50 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20170518103334.8808-1-pbonzini@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b502c8a2-56b5-a526-aa82-0f64ba1d7981@redhat.com>
Date: Thu, 18 May 2017 17:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170518103334.8808-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 May 2017 15:00:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] altera_timer: fix incorrect memset
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
X-List-Received-Date: Thu, 18 May 2017 15:01:02 -0000

On 18/05/2017 12:33, Paolo Bonzini wrote:
> Use sizeof instead of ARRAY_SIZE, fixing -Wmemset-elt-size with recent
> GCC versions.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/timer/altera_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
> index 6d4862661d..c9a0fc5dca 100644
> --- a/hw/timer/altera_timer.c
> +++ b/hw/timer/altera_timer.c
> @@ -204,7 +204,7 @@ static void altera_timer_reset(DeviceState *dev)
>  
>      ptimer_stop(t->ptimer);
>      ptimer_set_limit(t->ptimer, 0xffffffff, 1);
> -    memset(t->regs, 0, ARRAY_SIZE(t->regs));
> +    memset(t->regs, 0, sizeof(t->regs));
>  }
>  
>  static Property altera_timer_properties[] = {
> 
Reviewed-by: Laurent Vivier <lvivier@redhat.com>


