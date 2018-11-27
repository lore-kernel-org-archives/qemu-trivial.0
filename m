Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRbjt-0006Kx-Tq
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 06:41:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbjs-0006JR-13
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:41:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbjn-0007Ja-4K
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:41:12 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:46759)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbjm-0007J1-QU; Tue, 27 Nov 2018 06:41:07 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M6VNX-1gKjyu3G81-006vjj; Tue, 27 Nov 2018 12:41:01 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-13-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <2d915b44-99a1-df2b-2531-b793cdde95c6@vivier.eu>
Date: Tue, 27 Nov 2018 12:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e8INgQMdq2u1kbfey1tv9g0AAfefbTANIL18eHFOhMP3Wt5qJIb
	NatXLWwvKLsO8r7H/97E5ZlS1z6YTTcJIdCzTn5Z8dLXhSMrgCzS7w3QEYOPridD/z17KXm
	7KBHJAHRRoST4Z40ZiBtShGDUD9aUdsZb1NAR0EyC+MY+M+fx/NIssE6aF6nubv14Ly6+2A
	gvh24P+nID4HXn9MsCQyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MnuZzz+TR2Q=:EAwvLK36v3G/T+oCmv5Moj
	Puny6Hg057fk/I6smnt7j6cnFmPxXsRAihdRcAgBy0xSFtfODxyJU/Lf0xJQx6iqe+tdLzkHb
	ap9H3CKD0UWTNvhFWkyzSPQ21Tz5kJJyMxVUVelDuoia8AL++7Pj3pmDO8lCkJoloYwRmjrL1
	COt/xiRGeiK7JawofoR65guxacB5BhzMlyooGk0Y9F+Ef8oSr7AWMvNr3VGHIckSKuPvZfgLM
	Bsr1jFdME8XRWGLmZy7Or2FpiqPvTFnHY+nUMBL+034JxFKBxuqg7ZtGAlun6Ja4K4ST9VVly
	6D6Odjo38O6BD7wGchQxzRQI0fdtbQy9yg9ko6Etx3G4F4tyTMX1qvU1P1UP30qctq86Vh6QA
	+fRLaeM9zx/bZdGUB53C+NhnjOhNmM/IVBCmbvDwMXMtV+0TNW1P0htgl7hMOJeQ1iczDmtHE
	gTabHAR3CkL4VI7W8EaQF5PcVCytgoGx3TOpEiXYYwyIMEpye9l7sJ6fXuss+jlz0GKEOvj6x
	DAGgIdXsDb+5NTKAY7+S9c3mkv6WqFjo8Po5O8UWzAVXV51BdZgWI7IG9Lm+Pmtg2bJKYhg+P
	V7BXte85ZeuBuuEUfBldTtMFDXnVM8mk8f0YqilIFeD5sk3O57A+TVfhXFYsH1XeRb0/yFiaO
	SWl27tPu7ySaoQpTYNp+oSSVNNCpccMhxZzGjaYWF3NnuZRSn0utsAWwbdHG58U3oS98Zh0tS
	2esYCvZIgIyJ0sYC0M26WGzcJP0zNKnkELqbC0EK0Uy36lEsKhpLtRseLBidxbqvYFo7cdNib
	lisUBkV2JHfPi1AIBXg4JVpKEJwlw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH for-3.1 12/25] MAINTAINERS: Add missing
 entries to the PC Chipset section
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
X-List-Received-Date: Tue, 27 Nov 2018 11:41:13 -0000

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f89e37a1e..bfe71f2555 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1126,11 +1126,13 @@ F: hw/timer/hpet*
>  F: hw/timer/i8254*
>  F: hw/timer/mc146818rtc*
>  F: hw/watchdog/wdt_ib700.c
> +F: hw/watchdog/wdt_i6300esb.c
>  F: include/hw/display/vga.h
>  F: include/hw/char/parallel.h
>  F: include/hw/dma/i8257.h
>  F: include/hw/i2c/pm_smbus.h
>  F: include/hw/input/i8042.h
> +F: include/hw/isa/i8259_internal.h
>  F: include/hw/isa/superio.h
>  F: include/hw/timer/hpet.h
>  F: include/hw/timer/i8254*
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

