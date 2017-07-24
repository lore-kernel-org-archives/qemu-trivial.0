Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZj6u-0000fp-RU
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZj6s-0000eS-Ks
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZj6r-0003Uw-NO
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:33:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54607)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZj6n-0003TU-86; Mon, 24 Jul 2017 15:33:37 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue102 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M9oRE-1dT9XU3eEy-00B6Sd; Mon, 24 Jul 2017 21:33:21 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-28-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9ed15cf4-3b4b-2d67-7278-feb5503bd9f6@vivier.eu>
Date: Mon, 24 Jul 2017 21:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-28-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:Y53w8YIqYQbuFzMKS5McNFskBfrXoPr7MuRevVkK0vs4MklnLty
	06isbmEQ8RpMtAPhgxRTa5Pkn7khi6iLXC6g4uvS0zhfYTuhcKYhUnB9uxy4K8VxTDz6Lxa
	6CKDn93hNh5EMn1buqA+n+8KtV2rrTdOC6UdiCx5S6Tfombe4tAKC52ODBERRm2S8azpWrj
	KaAGItvQephiTCVhoaH3g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:da6TkT1mPrk=:GYOMTGCo6tsTa+4fc6vD6k
	GQsGuormNALqbQqzD0D0K2pzNesVUYjQ39OdYdfrFt37HOyezVZyWwozqOqOb8egGOP7ixBVu
	G9Uwu2xev0hcQOZ4CYkw7C2Kg9Fy0rwEwc7SSQlH2a7Ga3xYVVH4H24OXEJeJzUpXipoXAZ9N
	gFiWMXymA+395v3AL/5kKO4329zHmK8dfwF20ErltoE+2ptP96bpRxyz0cBLrTIgatEQO5RA3
	uJ4JYqR8p8yzGWljk7qMosb6Qu8gM9WFyMtdDQSBmLqbDDzUZg0u1eKpH6HMDXemoo5GCWzLS
	TRWciUGYCVdpuJ1PoVhJNwAWhYW6H201YsUQaOpLrQIwnpdOTCH2wS5rj3j3tsBWJ3DWil+1q
	PIwZP65jsVF0nTSqlBTs52wdqa3tzUh5n4LxU+EXBgqHmc4DVUeIekSmtGYJ3Yuc5SVa+StYR
	cOXrdTx3R4g4eZBYfRjwwLYMJuVsIAGUCLB0SWMXGAy8vUlycqcRo1a4BTaiArN6gke9MesRV
	0hM/vNUijFmoZw7IOcp68jrMvLmfE+xnwx8TVjCgddz3NYLBdM0bCyH9og2tA5oKXMDcZu+td
	/7tEkQqQXmFWOxUefwBRHIT/AdRk0+imB/5DnlLjxgrbk/Q6ZXc4XboY6xZejTkbetQw6l1nF
	TuC4UPXUf9szUcqUHViGmZNrz8zBAlvpc45ZukQITaCl8sLBkdyHUio8ZNbvTkyeYjFKaz83y
	1QLxOmJDH5+iGLL2khU7udee509nooyEd2DwULjko3+C3W+QefdC6Eddtkw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH for 2.10 27/35] syscall: fix dereference
 of undefined pointer
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
X-List-Received-Date: Mon, 24 Jul 2017 19:33:43 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> Clang's scan-build-5.0 reports:
> 
> linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer value
>     if (*host_rt_dev_ptr != 0) {
>         ^~~~~~~~~~~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Suggested-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index fcd20fa276..e79b5baec4 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5524,7 +5524,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>      int target_size;
>      void *argptr;
>      abi_ulong *target_rt_dev_ptr;
> -    unsigned long *host_rt_dev_ptr;
> +    unsigned long *host_rt_dev_ptr = NULL;
>      abi_long ret;
>      int i;
>  
> @@ -5570,6 +5570,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>      unlock_user(argptr, arg, 0);
>  
>      ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
> +    assert(host_rt_dev_ptr);
>      if (*host_rt_dev_ptr != 0) {
>          unlock_user((void *)*host_rt_dev_ptr,
>                      *target_rt_dev_ptr, 0);
> 

I think if you add the assert you should not have to add the "= NULL".
Could you check?

Thanks,
Laurent

