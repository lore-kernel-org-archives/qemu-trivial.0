Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1T7B-0002oA-1Z
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:45:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1T78-0002ni-Sr
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:45:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1T78-0004oI-52
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:45:26 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:39317)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1T77-0004nm-R4; Wed, 06 Mar 2019 04:45:26 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MQgtC-1gdriY1lm2-00Nges; Wed, 06 Mar 2019 10:45:20 +0100
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
References: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <c341d677-7749-5158-df45-b529b58ba45f@vivier.eu>
Date: Wed, 6 Mar 2019 10:45:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FZPP+jml+wxOwEwc8F7h4oUw0Ul5z8H0BuUJDL4vQwMfNfJx1wb
	EF+OjM2INlLi/9sTNZuscMxqfR4V8Ti8x8jP/eLdfhRazpN2wklNYGS35ZLUGAZ72OZMcpA
	dfeQjSLE4f0k3qvMQYG42koII/oJD/qBPGj857rGE26tFBxe9Yt4Xo6ZmIGJZAlGSG+w1Yg
	KIlaTn0euT6tNTLtHpa7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f3fCDlM3sPs=:MfpB3iq6SoufKXWCiYmlgZ
	PjBiqNn5+tioLbBpRfH/Hdu5jYLlK7T7UjIYrQHRM3cY4Yqfp9AEYI1+ssGOd9fHO/qt3CFY4
	iY7Qi1k2BhFrQ3v7Y3em8V4ZjYjUlAUTaAeWDAgRDkduHtPM2VeZxvNRywUChaYL00ouWDENv
	cUMBy8HVJHpgTLl1aImKvdE7Z5R2ouUe3uyry9ronfN3K/7T3dhFMzY9xkH9D26dxjM38fzCm
	V1uBe7/9FOpN9e6vNk28FVo6S1qDwgHuhyRUeoPEULAGbnxExEIE9M3Ir2rHTmGEPdfLkIwgv
	/P+o4CH/nfOhKJrhM1MQklzdRTXYO9lBgdxKmg+fXAYRLJnTl4OPU1AWrPp4zROTcl+kxa86E
	pSnPb0I8jIh3N9TPSz7F1BaGiG5efT+uE/1ohXPZr6qZLMjNLNVkWClLfx/X0JrbIwyNPXabw
	rPIRrY7LB2umkH7yh1O3hg5Z1luet5Kfd/yGdju02A5Wgiqt6QZGH6ntI4iwQU0nJvflvcrZw
	qgfoUfvBSn7/yNZR/p92nne2vMF972t/p55wD3vhK9B78kfYzpSi8F+E3d/PsrzhmMyLR4sAs
	KK01e9+bpI76zJEyNzm65fA9ehZe5ju2VjB0QK3n/bFDdiwoxWG1sA7LkWvClxPA8TwYKiNfv
	FVGO18bS/Gd3Wi2wziFg9cd/q5fN5KEaL9n4Qylimy4emsiRRyEfJQCVGbXqWfDdNRu1Mrpg0
	4Ucd865o8P144JeCI9V9tH0K1/euY8C6qSmhKstbzIFguOnAsWk4gxiGCyc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] bswap: Fix accessors syntax in comment
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
X-List-Received-Date: Wed, 06 Mar 2019 09:45:27 -0000

On 26/02/2019 15:21, Greg Kurz wrote:
> All accessors that have an endian infix DO have an underscore between
> {size} and {endian}.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/qemu/bswap.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index a684c1a7a298..5a70f78c0ba4 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -255,9 +255,9 @@ typedef union {
>  /*
>   * the generic syntax is:
>   *
> - * load: ld{type}{sign}{size}{endian}_p(ptr)
> + * load: ld{type}{sign}{size}_{endian}_p(ptr)
>   *
> - * store: st{type}{size}{endian}_p(ptr, val)
> + * store: st{type}{size}_{endian}_p(ptr, val)
>   *
>   * Note there are small differences with the softmmu access API!
>   *
> @@ -293,10 +293,10 @@ typedef union {
>   *
>   * For cases where the size to be used is not fixed at compile time,
>   * there are
> - *  stn{endian}_p(ptr, sz, val)
> + *  stn_{endian}_p(ptr, sz, val)
>   * which stores @val to @ptr as an @endian-order number @sz bytes in size
>   * and
> - *  ldn{endian}_p(ptr, sz)
> + *  ldn_{endian}_p(ptr, sz)
>   * which loads @sz bytes from @ptr as an unsigned @endian-order number
>   * and returns it in a uint64_t.
>   */
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

