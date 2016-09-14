Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4ZJ-0006d2-3y
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:25:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4ZF-0006Zw-2f
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4ZE-00027u-71
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:25:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4Z6-00020Z-1G; Wed, 14 Sep 2016 03:25:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 46CDB417FF;
	Wed, 14 Sep 2016 10:25:00 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id CA89DAAB;
	Wed, 14 Sep 2016 10:24:59 +0300 (MSK)
To: Md Haris Iqbal <haris.phnx@gmail.com>, qemu-devel@nongnu.org
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <0fb2f682-0307-46ea-521a-43e19e150aa4@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:24:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Changed malloc to g_malloc,
 free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Wed, 14 Sep 2016 07:25:16 -0000

23.03.2016 21:32, Md Haris Iqbal wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  linux-user/qemu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 26b0ba2..3c3fd15 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
>  #ifdef DEBUG_REMAP
>      {
>          void *addr;
> -        addr = malloc(len);
> +        addr = g_malloc(len);
>          if (copy)
>              memcpy(addr, g2h(guest_addr), len);
>          else
> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>          return;
>      if (len > 0)
>          memcpy(g2h(guest_addr), host_ptr, len);
> -    free(host_ptr);
> +    g_free(host_ptr);
>  #endif
>  }

This is a very old patch, somehow missed by me at that time.
Applied to -trivial now, thank you!

/mjt


