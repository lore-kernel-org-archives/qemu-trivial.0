Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZioR-0003gT-PI
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:14:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZioP-0003fM-QN
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZioP-00047L-0J
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:14:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50469)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZioK-00046I-Ah; Mon, 24 Jul 2017 15:14:32 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M1GfI-1dtbAe3uOm-00tGUk; Mon, 24 Jul 2017 21:14:17 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-26-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a573b90a-def5-b3fb-d995-09a0c82ae7e3@vivier.eu>
Date: Mon, 24 Jul 2017 21:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:x6phSe7bF73pw0AfZgT8lXNmed8yo4kTikPmhmG+pK9pSOAxSvI
	LNsMF/9jDkfqs/8CTif9xxoqW6x4tnF4UhvPJziFsMx3kKs3kJT3BjkWcVihbYzfAC+oo2r
	4nxgByKiE4U/z0iE7hjH13OxewuPv2GrONNU1EwoA39ti/ngho/auphwCrT84ZXJ1giDPEU
	8MrnK87gpLi4esk7RIrqA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ZMBf0Tu533I=:wJ0fjZ9AaU/odwF0m4cyt8
	oSmqgcKgYvbASEjgtTjisP41X11ilLpHbK00DEFvsXt8h5bHppZuNp87wppfHOJl2ZtJcjgQO
	hsqKlh2WiMmuYuwjKbkhUnqUyN+6XPxh+HVnwjL8e7dxTpBVByohaYvNmxwXDFF8G6l4Qvy/5
	t71S/gK+SNyqUhNM9fg97rfffgJqjCWdw//clNCLPuZc2mdrPc2674p+7KQcLPpbOpOjOJjxa
	oXrrfbrWhJIz9W1M73XwqBWrpkgG658RYlaY6LOun5ymgy9NOfFs8jNOOuGqwdaQvMUGsb9yX
	KXz3wunn/dTHoE3eeRK3YnERYAeC7Br3zNk5ZrIQ+sEJRyjCU9kyH59BOF5SJzPM8+08je8VE
	6/5yLzWib8OYWijTf9wHeenWAyX/JkTQhS/fGQIkXKA8tGkgKwpFJe64LfIijCNHfskZr1FnQ
	+pQJs/7+Y9CyMENq7Q5cIGKMlEHvdUKAR/UXStiuT09kovQL7cpRdP4Jp3EU5zZdtHr+RuB7r
	nmLfkYtrSriweyZCoWIn5ee4fyG/X0020b+1R3UMWWMBwvBJp5krBwpjHRTmOAkLZszkYbnYs
	FhmVf1OR3djflDeQZ4jQtFdThu9SbE45/QRAZUW4I7J02iLmer8VWn7ZHSByKNzg98Rs+ZXbv
	Gh3F82U6/OsN9EXutxC/NwyKlp7LBKcmDxsGJgtT3YY6X1EdFIJXMYdqGnAEgGSNXPC5bSWVT
	+7OfbojOn8+zlKRKmw4TnspjCnJcFoPefb024PDKDerXOsbmd5vwPqBiLB0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH for 2.10 25/35] linux-user: extract
 is_error() out of syscall.c
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
X-List-Received-Date: Mon, 24 Jul 2017 19:14:38 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/qemu.h    | 5 +++++
>  linux-user/syscall.c | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 4edd7d0c08..97b7cfdb63 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -614,6 +614,11 @@ static inline void *lock_user_string(abi_ulong guest_addr)
>  
>  #include <pthread.h>
>  
> +static inline int is_error(abi_long ret)
> +{
> +    return (abi_ulong)ret >= (abi_ulong)(-4096);
> +}
> +
>  /* Include target-specific struct and function definitions;
>   * they may need access to the target-independent structures
>   * above, so include them last.
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 003943b736..fcd20fa276 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -837,11 +837,6 @@ static inline abi_long get_errno(abi_long ret)
>          return ret;
>  }
>  
> -static inline int is_error(abi_long ret)
> -{
> -    return (abi_ulong)ret >= (abi_ulong)(-4096);
> -}
> -
>  const char *target_strerror(int err)
>  {
>      if (err == TARGET_ERESTARTSYS) {
> 
I think you should fold this one into the following one.

Laurent

