Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dv0HX-0002rr-J1
	for mharc-qemu-trivial@gnu.org; Thu, 21 Sep 2017 08:08:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dv0HS-0002mj-C7
	for qemu-trivial@nongnu.org; Thu, 21 Sep 2017 08:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dv0HR-0003N2-Bm
	for qemu-trivial@nongnu.org; Thu, 21 Sep 2017 08:08:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dv0HM-00036j-FT; Thu, 21 Sep 2017 08:08:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91A49883D7;
	Thu, 21 Sep 2017 12:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 91A49883D7
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.52] (ovpn-117-52.ams2.redhat.com [10.36.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43A0760241;
	Thu, 21 Sep 2017 12:08:26 +0000 (UTC)
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1505988260-8483-1-git-send-email-frederic.konrad@adacore.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a95c1d0-908b-121b-aaf7-df0f859b30b5@redhat.com>
Date: Thu, 21 Sep 2017 14:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505988260-8483-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 21 Sep 2017 12:08:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] memory: avoid a name clash with access
 macro
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
X-List-Received-Date: Thu, 21 Sep 2017 12:08:38 -0000

On 21/09/2017 12:04, KONRAD Frederic wrote:
> This avoids a name clash with the access macro on windows 64:
> 
> make
> 	CHK version_gen.h
>   CC      aarch64-softmmu/memory.o
> /home/konrad/qemu/memory.c: In function 'access_with_adjusted_size':
> /home/konrad/qemu/memory.c:591:73: error: macro "access" passed 7 arguments, \
>                          but takes just 2
>                          (size - access_size - i) * 8, access_mask, attrs);
>                                                                          ^
> 
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>  memory.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/memory.c b/memory.c
> index b9920a6..2b90117 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -560,13 +560,14 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                                        unsigned size,
>                                        unsigned access_size_min,
>                                        unsigned access_size_max,
> -                                      MemTxResult (*access)(MemoryRegion *mr,
> -                                                            hwaddr addr,
> -                                                            uint64_t *value,
> -                                                            unsigned size,
> -                                                            unsigned shift,
> -                                                            uint64_t mask,
> -                                                            MemTxAttrs attrs),
> +                                      MemTxResult (*access_fn)
> +                                                  (MemoryRegion *mr,
> +                                                   hwaddr addr,
> +                                                   uint64_t *value,
> +                                                   unsigned size,
> +                                                   unsigned shift,
> +                                                   uint64_t mask,
> +                                                   MemTxAttrs attrs),
>                                        MemoryRegion *mr,
>                                        MemTxAttrs attrs)
>  {
> @@ -587,12 +588,12 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      access_mask = -1ULL >> (64 - access_size * 8);
>      if (memory_region_big_endian(mr)) {
>          for (i = 0; i < size; i += access_size) {
> -            r |= access(mr, addr + i, value, access_size,
> +            r |= access_fn(mr, addr + i, value, access_size,
>                          (size - access_size - i) * 8, access_mask, attrs);
>          }
>      } else {
>          for (i = 0; i < size; i += access_size) {
> -            r |= access(mr, addr + i, value, access_size, i * 8,
> +            r |= access_fn(mr, addr + i, value, access_size, i * 8,
>                          access_mask, attrs);
>          }
>      }
> 

Queued, thanks.

Paolo

