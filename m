Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLGqQ-00028X-Q6
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:51:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGqO-00026z-Or
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGqN-00075S-Py
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:51:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLGqE-00070u-W3; Tue, 10 Feb 2015 14:51:27 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 97F7E419BA;
	Tue, 10 Feb 2015 22:51:25 +0300 (MSK)
Message-ID: <54DA613D.3080407@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 22:51:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1423406458-31957-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1423406458-31957-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Remove type casts to union
	type
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
X-List-Received-Date: Tue, 10 Feb 2015 19:51:37 -0000

08.02.2015 17:40, Stefan Weil wrote:
> Casting to a union type is a gcc (and clang) extension. Other compilers
> might not support it. This is not a problem today, but the type casts
> can be removed easily. Smatch now no longer complains like before:
> 
> linux-user/syscall.c:3190:18: warning: cast to non-scalar
> linux-user/syscall.c:7348:44: warning: cast to non-scalar
> 
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  linux-user/syscall.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 852308e..ec137db 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2663,8 +2663,9 @@ static inline abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
>  }
>  
>  static inline abi_long do_semctl(int semid, int semnum, int cmd,
> -                                 union target_semun target_su)
> +                                 abi_ulong target_arg)
>  {
> +    union target_semun target_su;
>      union semun arg;
>      struct semid_ds dsarg;
>      unsigned short *array = NULL;
> @@ -2673,6 +2674,8 @@ static inline abi_long do_semctl(int semid, int semnum, int cmd,
>      abi_long err;
>      cmd &= 0xff;
>  
> +    target_su.buf = target_arg;


Can we use c99 initializers at declaration, something like

   union target_semun target_su = { .buf = target_arg }

?  Or is it also some gcc/clang extension? :)

But I'd like to hear from Riku at least...

Thanks,

/mjt

