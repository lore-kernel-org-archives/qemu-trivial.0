Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glfTF-0001am-HM
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2019 14:42:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1glfTD-0001Za-12
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 14:42:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1glfTC-0006CL-8i
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 14:42:54 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:39493)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1glfT7-00068q-Qb; Mon, 21 Jan 2019 14:42:50 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MXoxG-1giQso32Ee-00YCkV; Mon, 21 Jan 2019 20:42:42 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
	Wei Xu <wexu@redhat.com>
References: <20190121181335.3326-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <1ccb74f8-12f2-e2d1-aef0-30eb93ea5f60@vivier.eu>
Date: Mon, 21 Jan 2019 20:42:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190121181335.3326-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P6EC0cS2U1VJVWNk7i6yHXeAPPfMQH0rUP1TjNLYHwhWMPk5poj
	Rj1HwvY7FxA5KTUt9u2VuDNJayDb2nmmfSFlsrzfYfQlz+nGYjyN6yMeT8Rnlyxjck9DymF
	hDy2P2795E6IiJOWgRwYeS+odgsgLY+XGaKuvwyjsvF964aWBLxJSQHWK1dQ2c7ZBcJDV5s
	RODtLMP+Vvr/xWakFOCNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9z8ysBIndVw=:o4TlBfgx4rjZK+YCCbmWy+
	YgtbuiDqmutUsIEUcWXWnGGA4hUyIbP6cNvLQolHOBn/6pQ23eMJiJd8gMgd+tgO0oBh5c3ty
	dPcqzGuc6vyQrjdTMw/Jvm22oJx7q4a8tLBuMl87LDo2kbzHWSf6eYymFY4atGWrrvoOpiI4u
	w20U6Nbb//vaLlH2Fs5QfdmMspqW9LUjkGkr7YVHyTGPmqPDktE0X1dj1BoTDttgdbm0D7jNY
	hF4cFpE8lNk8HloeLFml4JB9pC/PSNtreay8L6fJChFedn4b1f74MFOhdB4vWhj/IVXZTHV9j
	A6VVrQO9pM63/CNl6VnLVtauQqreFwAtas4XzsuvRHI+PKAB/0xMvHPNKfAYoRCevClPThYtX
	ZbzcfYXVrRP08J9a6d8o5BXdJXMQwzEdXcPTpjOtfJDYkeRCyqhKdXhWayYH5dYKpUlRv40Hh
	cWxgb+GXDNcD97BFpE5mwoUUn8X5Yepwngiu3Icvls+yUD+MuXs/sdadhA48ZxBCBxdH6RrK/
	T2gd8RWStXAbprOmcWDXA2zuUKc8NeDoNDzLSWtA/b5gIdnpuGjgNaloJTCNT79fONlZoiLN6
	HL2OnwEgIOQ93ee12w+OWeLtiEhAbjFUWeLBHJ+E3XWS4RQnTFAwdsYhx/KK85HCVzTOZEO+U
	v5FJuFzSFgHbbkMyqxNqzKaqgv13rolJ3W72/HsDTuuphIqJXfzN1i/6H8eiue2An4GIq6Rdk
	qpxMziniKbci441rm9p1fq3Gsd8rv/kbBGrIpuYKX/r3Yz2/7Ikl19qhiyA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] virtio-net: Fix a typo
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
X-List-Received-Date: Mon, 21 Jan 2019 19:42:56 -0000

On 21/01/2019 19:13, Philippe Mathieu-Daudé wrote:
> Fixes: 2974e916df8
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/virtio/virtio-net.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index c7ec1a755f..756eee8af0 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -94,7 +94,7 @@ typedef struct VirtioNetRscUnit {
>      uint16_t payload;       /* pure payload without virtio/eth/ip/tcp */
>  } VirtioNetRscUnit;
>  
> -/* Coalesced segmant */
> +/* Coalesced segment */
>  typedef struct VirtioNetRscSeg {
>      QTAILQ_ENTRY(VirtioNetRscSeg) next;
>      void *buf;
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

