Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gom2I-0004Bs-3x
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gom2F-00049U-Gw
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:19:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gom2E-00072I-FO
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:19:55 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50529)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gom2C-00070L-Jn; Wed, 30 Jan 2019 04:19:52 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MLAZe-1gXet71xgo-00ICNt; Wed, 30 Jan 2019 10:19:47 +0100
To: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
	mst@redhat.com
References: <20190125151440.13794-1-sourav.jb1988@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9a14a8b4-b0c5-c5bd-9563-c8e6f73e9c03@vivier.eu>
Date: Wed, 30 Jan 2019 10:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190125151440.13794-1-sourav.jb1988@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Z36UE8URXLrLqhuxTgWR6Q1UG2tosBS3T9Uy4e8r31uTTLilkh9
	Q92IQq2Q2Xgjhsp2xj0LkpAyccQ+LL4s/ZpQwFIVuS4I8mn9qnUB0YR5iEnG+Y9OmHVASsf
	pOHfIfcLO/lC+So3FgKyi7OtMWZJa4ksYexpbs3QuX2eWC6yuLDkWe/2p0XPPSjAEYkh6fl
	IXvI47ekyHV0u/3FvmcNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:heGzdy/iRII=:3v9twpljGeG7pwiuginSFt
	E3GROr5Ue5fwRZEIqiTdrO+QsNHPgUPKnDVA+i3JLxDXWVSMky8dZAnoC3gK6TjgQshcNe9qJ
	GmYrC8xLFkk3mj6oxlI015eLh92RtcZ42UjHZ1Y9xtLHI9tRg0VDw7NHc+F/jNbkuw7R0TJtF
	CA4/DloTV/mgB/ksaNQ3stx3uflIlc9Y3q32EQPgfO48K+5Vq79erJ0yi4RXmAIf9faVe/1dA
	61E0C0KAJMY/RTMQ9LjkuFqDeELIrELg3iwtt4A9gprnGq1w80WEcm1+0O/VpSHZziWk7tCi3
	vM9xnNhGgG+pHjcjKmdBy9SuosQq0AjtXqxZNuAFYu5/v2sU7sWQ1yApO7JMW19IwlqjaQfKk
	cu7snL0pX1jCWCJ0d5A77pM6yPnPGV7AyJQCY2TjSZgGA08/G7wnH46xNQ76jHlOBTclYmNQ/
	8kminRfLgxa7tFGhe3AmRMqpsTbS3rhIlKvUjxjlSGCxG9MBQdh7WBI3qDI9MoPUN91VrjqwR
	vLxC6uOgVe5igHLBKeF+nYE4bF400l6sRsTbu8B1kW6I7lhEpTeMz4FVrqLInA5mmkCgfEqEw
	B2xZDLxXMrQ4DDaUHFrDbx8eoOTDap+N4UiRZuJD+m2d0vi7MZeoXwF+O82VNTw0XQwSquXlQ
	nak29iavm6mdlmEN8Nfi4EEEevM9wWjGmI06CDOj+K9mOyrRXyy1N6lvJcQ+Kzh8RkTMNQxFn
	bRmAOFByb9syCzVH0YTMk/fdp6xWwVbi9TY/Grd5ZiVbBrUqRUkkLUiJGHc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH] hw: input: set category of the i8042
 device
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
X-List-Received-Date: Wed, 30 Jan 2019 09:19:56 -0000

On 25/01/2019 16:14, kumar sourav wrote:
> Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> ---
>  hw/input/pckbd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 3e66713b47..72e7d5f6cc 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
>  
>      dc->realize = i8042_realizefn;
>      dc->vmsd = &vmstate_kbd_isa;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>  
>  static const TypeInfo i8042_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

