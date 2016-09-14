Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4hd-0000sp-3p
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:33:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4hb-0000qz-7A
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4hZ-0003kR-6m
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:33:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4hS-0003hm-TD; Wed, 14 Sep 2016 03:33:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1F724416E3;
	Wed, 14 Sep 2016 10:33:39 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A2D4BAAB;
	Wed, 14 Sep 2016 10:33:38 +0300 (MSK)
To: Wei Yang <richard.weiyang@gmail.com>, corentincj@iksaif.net
References: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b31417a0-f1ff-32ce-1893-bb7576333469@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:33:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] bitmap: refine and move
 BITMAP_{FIRST/LAST}_WORD_MASK
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
X-List-Received-Date: Wed, 14 Sep 2016 07:33:52 -0000

Is this (quite old) patch still relevant?

Thanks,

/mjt

05.03.2016 16:47, Wei Yang wrote:
> According to linux kernel commit <89c1e79eb30> ("linux/bitmap.h: improve
> BITMAP_{LAST,FIRST}_WORD_MASK"), these two macro could be improved.
>
> This patch takes this change and also move them all in header file.
>
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> ---
>  include/qemu/bitmap.h | 7 ++-----
>  util/bitmap.c         | 2 --
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
> index 0e33fa5..864982d 100644
> --- a/include/qemu/bitmap.h
> +++ b/include/qemu/bitmap.h
> @@ -58,11 +58,8 @@
>   * find_next_bit(addr, nbits, bit)	Position next set bit in *addr >= bit
>   */
>
> -#define BITMAP_LAST_WORD_MASK(nbits)                                    \
> -    (                                                                   \
> -        ((nbits) % BITS_PER_LONG) ?                                     \
> -        (1UL<<((nbits) % BITS_PER_LONG))-1 : ~0UL                       \
> -        )
> +#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
> +#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
>
>  #define DECLARE_BITMAP(name,bits)                  \
>          unsigned long name[BITS_TO_LONGS(bits)]
> diff --git a/util/bitmap.c b/util/bitmap.c
> index 40aadfb..43ed011 100644
> --- a/util/bitmap.c
> +++ b/util/bitmap.c
> @@ -157,8 +157,6 @@ int slow_bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
>      return result != 0;
>  }
>
> -#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) % BITS_PER_LONG))
> -
>  void bitmap_set(unsigned long *map, long start, long nr)
>  {
>      unsigned long *p = map + BIT_WORD(start);
>


