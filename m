Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDrm-0002Cr-9I
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDrj-00024B-Q7
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:03:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDqX-0005IE-54
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:02:26 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54693)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDqS-0005Ba-D7; Thu, 14 Feb 2019 05:02:16 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MfqGN-1hZrBH18Ib-00gJSZ; Thu, 14 Feb 2019 11:02:06 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20190212145322.30974-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3490f4fd-3e91-8494-8580-97a005174507@vivier.eu>
Date: Thu, 14 Feb 2019 11:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212145322.30974-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q8awcFdk5jGgnND5k8v6FNXIkdqWv6pa9SGCuVfmFFaJyLY4Cqc
	UiMJLxmiklaRjD6qU00eMfw0fwQS6s2i94T24Gb8Wm7OVkj7WkXKEgWO0UJs9PVTXMbhkOT
	SC74MfJEjamiQA8PpJp4GNT3W3lFc7PRhvAwCTUjUJuA2ygYd236/Awayvs1RPHUjeADgfe
	lBH4UGAeWwKuZBiXh2vFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qk2w/N13nj0=:+rBD7+WstqjStCHMwnvLQu
	5PpF4UpOfCt2kTOcqwjCoUHYnKBK7GW+IXLYfs2DsadTCTZf2QCP1IyElrXD8Ecgt//29zuTk
	pyCx/1R9RsTBUGjFSAVufDBAxBb9q2oMdKFCKGhJYxAWU0fy6DHRgc720nXFv0Zye9X7JDYgR
	FpSm68QXOVe5hNFxoDExGTf7RREUOyRkwQqQq9Gi7flpPflueX6JbKtVrm47RWOluTjr590vm
	NvD2FiisR4wAqHz+Rjs1sdTFHELIlqzQRoL2ObblxDAHoCA5H9k4s5EZafLlbaDib3tQk6GMH
	h74mxrPzlNFDNGnGc2ZnOYVstLsfcNJ+66/nyRRplF0dslU/bRCmjGF5HuTO0miFrlPBjtRQF
	2h5B+NL1DM/8xIhECe3yj/P7QpUPq7C+mhWcnfAHukFuzKdpgliA2MrufcE/hJeUfnOJBnrq6
	ghth2dhNwx7IxT+UNlb+J+vhOQDWkDJE7ewq9O2oVv3xSehFTKlJeNeyZkx6Kco8QlXHTy3bN
	m+PtnXtYx2apiWN0X0yO3mbqQegnM0hHt37yQrd3cBwd15vobXr5SNfgsjdjl+8epM+pxT6nG
	P16aJTcVUjpnIdYBIql9yzNp2XfbyHKb+hmbO6Y0SgBpV/alGRFVdb2zW/BS7wHrRYV1rbBBc
	Q7+U/3V3rB/qLTe72AfZCkresIk1JdPs8sb6UuPjNq3mjHYHdrqfvgIRTo+QbVj35cpAdTI+I
	QCbzYDfNIHBm4VGy67f7pIXSPq5ilRYmq8EEoRXY2A0dKTg2+iCo1vTjGok=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH] hw/dma/i8257: Use qemu_log_mask(UNIMP)
 instead of fprintf
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
X-List-Received-Date: Thu, 14 Feb 2019 10:03:36 -0000

On 12/02/2019 15:53, Philippe Mathieu-Daudé wrote:
> Avoid to clutter stdout until explicitly requested (with -d unimp):
> 
>   $ qemu-system-mips64el -M fulong2e -bios pmon_2e.bin
>   dma: command df not supported
>   dma: command df not supported
>   dma: command df not supported
>   dma: command df not supported
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/dma/i8257.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
> index 52675e97c9..3e1f13a4aa 100644
> --- a/hw/dma/i8257.c
> +++ b/hw/dma/i8257.c
> @@ -26,6 +26,7 @@
>  #include "hw/isa/isa.h"
>  #include "hw/dma/i8257.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/log.h"
>  #include "trace.h"
>  
>  #define I8257(obj) \
> @@ -185,7 +186,8 @@ static void i8257_write_cont(void *opaque, hwaddr nport, uint64_t data,
>      switch (iport) {
>      case 0x00:                  /* command */
>          if ((data != 0) && (data & CMD_NOT_SUPPORTED)) {
> -            dolog("command %"PRIx64" not supported\n", data);
> +            qemu_log_mask(LOG_UNIMP, "%s: cmd 0x%02"PRIx64" not supported\n",
> +                          __func__, data);
>              return;
>          }
>          d->command = data;
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

