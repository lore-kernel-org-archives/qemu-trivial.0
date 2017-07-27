Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dacSl-0004dk-3U
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 02:39:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dacSg-0004aY-Tr
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 02:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dacSd-0000u1-PN
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 02:39:54 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50695)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dacSd-0000sD-FG; Thu, 27 Jul 2017 02:39:51 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MPc3R-1dVxlJ3Df7-004k0y; Thu, 27 Jul 2017 08:39:36 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-13-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d95e5790-09c5-1075-0cd9-4f33daedd566@vivier.eu>
Date: Thu, 27 Jul 2017 08:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:GZEfrkyvxFQhmFPaEdJByC2mEO6XAzlQbP1Tr5hvjcU+JPf0eOL
	LlwXXCvOUrPUo4M5PpyR5h5U3YNdg7cG7JGZ8Xeq2ti48SyaxDADqmaqPAvAZnyatROaxad
	giT+an9t+RebuAFzMpFiJ1QVHAS1LESW71Z+uiKudFyhBfEe4Bu9AMExuicxT8OUxes9mQs
	MBKB5ddlqVlHgPWbqd9sw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:poBiRroupCI=:NxMDBoDwWVZrTWDp3+ZHx9
	G2NkdGbhMzpVZVUC3/Lt3HLpvQtGlMaXtYEV9ZW9Xuw95j7GY7ms1RjLQxFxyqLQVK7wHhKxU
	sMgt1YvKdRIdbNX8EFfa5aJMu+cki7wLtZrEOa6u9qwEpdboXpbVWwnPApSB7jUytd/JEyh5L
	wP3f9aGEmAgJ7QyC95ciUDW9SXoFzGgGaJG3bM9A+9r36NN0nvRi8ebAQSrWKpIsh2yieCpSi
	Osoa9pNgvzS++zx9K4/8qRn7XeEVF7Ws9o6orq7llPM/V31VSvXXMDGF4HxzRIJDlzeBN8kGj
	wGLGOnF/Coy589aHDtxoviaAPIJafObcjSP7YmO1oc2A235uFWBP3oS14yqtX5++bqJer08ZL
	gHoe9zhD9fvIAzF2mw+XwsPtsid23Z++fhizbtZA1c0Kii5PKsE3s2ieDx/XpHkCURFlsS/od
	Y2tVUUQSgqvfHpsdjslB837io1aojwdCqDJzqYtwuCyG7SpvmFtBotxDSXTAtgu5Ij2jufAds
	vibkuCzqyxCw8np+Eyy92NUFbGclpJHt07w2xUAoUxMiSLKqZSwGc8Elg7XbL7jcyQgV/H2PR
	bLFoeoLwp/J5WpcUPjB5e4HvHyjmuXojG+bTCzHW9M9NGYHTsM3IYsK590VnjgFcU4C0ALGLT
	eOaW/TpEf9pt/gohrtfHoIAH72TPaKZicsIMod4ipobAcno1D/4qPrTTQeQT8PkUztlM4XDb3
	yE/a0HEXGVp9bb0pa7cYJL/AzyRCnA7eYb0d4DZ01kTBi/2eznEMbQ3pWmQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 12/20] syscall: fix
 dereference of undefined pointer
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
X-List-Received-Date: Thu, 27 Jul 2017 06:39:58 -0000

Le 27/07/2017 à 04:42, Philippe Mathieu-Daudé a écrit :
> linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer value
>     if (*host_rt_dev_ptr != 0) {
>         ^~~~~~~~~~~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Suggested-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
>  linux-user/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 003943b736..71d45a9963 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5573,6 +5573,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>                                      field_types, THUNK_HOST);
>      }
>      unlock_user(argptr, arg, 0);
> +    assert(host_rt_dev_ptr);
>  
>      ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
>      if (*host_rt_dev_ptr != 0) {
> 


