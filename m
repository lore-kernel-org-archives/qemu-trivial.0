Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fcIrl-0002FX-UG
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jul 2018 19:13:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fcIrj-0002FK-DR
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2018 19:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fcIrg-0003Tg-92
	for qemu-trivial@nongnu.org; Sun, 08 Jul 2018 19:13:15 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:60198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fcIrf-0003Rj-VW; Sun, 08 Jul 2018 19:13:12 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LiKeS-1gEewy0kzE-00cgME; Mon, 09 Jul 2018 01:12:52 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <20180706155127.7483-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <091df2fb-b3a0-ef4f-f401-ec5a4e58fab8@vivier.eu>
Date: Mon, 9 Jul 2018 01:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180706155127.7483-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FWs69sOCGule1r02l37zt0sqUmfOkzkfgsaNgQsg+o4wSDiQhlx
	w/Y6oLQCVTge2ce031H9TBADfGTeOiHmzq8wSoE523FDUnQSCKc8oJDfAwvta5hKa1GRZqo
	Ahe1ozOapYcf4W3o9oio4K/2FkLsIxRkN4FXc6IyTpT2+AGLC5pmDpcTXXFc7mJnOqO2Eb7
	pXWQISG4G8HODmSwKSM3g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:juU3S6UpN9Q=:BmzBJl9uDUDEvj1xiS4Z7Z
	bonsyMwl8EY+l9TyoieifwFfpOrv7sxBZDMeFt7ff+qii2Lrp07JWJS8PNt4BgwePQPW/76yG
	+8fCbOe6Sqi2d2GoMFbtz7OSUs5SZYuEYIDl1VNNPQ81hovdPsleGkOQv5kejydN5Xz0V2LUM
	MYMUPqnj6REoHle6FWIVAdofGaqpohywQww7eucYbESCXdZziOmayXHXCwRGxUNrtsxX9P4Hp
	rQJMx7vrqaxQK5kCVHGcCiIuC4fyFOXX/Rh6rYwssZr1ZrZdCY0+vv71dZ5p+IZBqktPe2Zx2
	9hQuXOGSrU5VQOe4uZJG3m6pwIHquZSLGWxsy5RaB/o2ExLWcOodEltclEclVt1YG2LA5sIF9
	+NBOJKIs3b/0l2aEidzmhSonxHXtA7s7f0IN3IEry1SISbI4wqLKucEkUvUo7Fv93JWGZ/qgA
	2V1kaIjOA7xTexU47AYmj+wkLp3ZSST9HCZfVv0zFpnRYn9SGzfVKHxJozaYy69LNUIwe+fW9
	gMx/WOwFdZrra5zk8rikKBnS/Pv3Oq2DxG6qb3iw7/E1NdE6kTbxgDJHunqGp5LsJiSXmmNV6
	0a4ysWfbjBfsmvvBx1D3TLgK6em5mANbUQlfST0F+3aDtXws1CUSXaI+zr7W37PZt30fx4dIB
	I3sWB2OIxmflHP8Yx8W3/01GhPjQNRjvcqpVF6eSmj5ku3wJkryWj2Z+kfDbiVBRqCsOFvprq
	W+eMSZDXcwZLxi8n
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH for-3.0 0/3] Sanitize linux-user stdout
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
X-List-Received-Date: Sun, 08 Jul 2018 23:13:16 -0000

Le 06/07/2018 à 17:51, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> Here 3 trivial patches, the first one resolves this launchpad issue:
> https://bugs.launchpad.net/qemu/+bug/1777226, then the following two
> sanitize a bit further.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (3):
>   linux-user: Do not report "Unsupported syscall" by default
>   linux-user: Do not report "syscall not implemented" by default
>   linux-user: Report error message on stderr, rather than stdout
> 
>  linux-user/alpha/cpu_loop.c      | 2 +-
>  linux-user/cris/cpu_loop.c       | 2 +-
>  linux-user/cris/signal.c         | 4 ++--
>  linux-user/microblaze/cpu_loop.c | 6 +++---
>  linux-user/microblaze/signal.c   | 4 ++--
>  linux-user/nios2/signal.c        | 2 +-
>  linux-user/sh4/cpu_loop.c        | 2 +-
>  linux-user/sparc/cpu_loop.c      | 2 +-
>  linux-user/sparc/signal.c        | 4 ++--
>  linux-user/syscall.c             | 2 +-
>  10 files changed, 15 insertions(+), 15 deletions(-)
> 

I have queued the series for the next pull request.

I think you can also replace the gemu_log("Unknown QEMU_IFLA..."),
qemu_log("Unknown host ..") and qemu_log("Unknown target ...") from the
netlink part in syscall.c with qemu_log_mask(LOG_UNIMP, ...).

Thanks,
Laurent

