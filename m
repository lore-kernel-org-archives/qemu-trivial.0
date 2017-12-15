Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgoX-000826-5W
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:37:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgoV-0007vH-8O
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:37:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgoU-0005yl-6p
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:37:31 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:39198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgoR-0005t6-S3; Thu, 14 Dec 2017 22:37:27 -0500
Received: by mail-it0-x242.google.com with SMTP id 68so15914473ite.4;
	Thu, 14 Dec 2017 19:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SvvvDtMSVmv45XfKMl1Wo2I/k0frRieH6XrrFbBdkcg=;
	b=Tyvj2gLiw7Sy2TMUQb+iH3tsDTL7U5JWTSJQtrFWpZfEan/W75MiefqpxZr7DWDlre
	TbT5a44y75FnodxooUBf0E3eh19gpL/s2sOyQh3yGk3VFtTkPU6+2QLXEtShjcg9u6Gm
	UUVbYgdPLqo9+hNqOs1AyOP/XTZ0znqhaW3HDLEFLb10kMFSJvE+zxS707npoQiaemtM
	xkugpwdt+utqdk42D45rw5J7vGoyJ1vtXkyuu96OwkTtSF38QeiQe/XhQ7BO7CyCFLKZ
	oyXgr8nqEd0O6YiJHM5UaSAQj1pf2v5T5UnVYmrzaBVxhrkNH8KRl7Jo8qYf83js7MuM
	VUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=SvvvDtMSVmv45XfKMl1Wo2I/k0frRieH6XrrFbBdkcg=;
	b=eVQbhVZ3hrroi9hTuKiq5362VIWXkl4LnwsUJIl443H7mvLXxK85X+x7WUuNDnIwoT
	GAss++8yguIihm0J+tU8VX2Gkdk/LWpDeHb3fcQYAG+i+8WyRTuxG3z4U9T8RDNctpfE
	DvZw+VpNL8NzVptp04MtcJbHeXv3xbq5q9inzrUT/SF6JVN6JDNRpLRjZRzVihBIU9E3
	6eqbkHbxc0a7ndQn48Sx9lVxrv/7jVo9S3jCzcEHsfhFsCmCwUXbsHuJjF0obK9x/cZq
	UavXQ7DDioyJaaVGfmSwCDqsMWDfCkxQsHUZlnd+uO43PPFHWsqqp6jnA1TUBDdSbeHC
	Adig==
X-Gm-Message-State: AKGB3mJhcIiFgmtJ21cD48MCfw74Ze/cyxCWp839qAiqFA9cHEEt/0tW
	kt6rZaaha8AO0EUE1oigb+mTVbvjNBEbO+T7Myk=
X-Google-Smtp-Source: ACJfBoseiAJ49TTqqRL7T9JaBpJwek90Rl2oWkB1Ic7DRNg88/Ik8K8nTYR5DXeMvJ0V6HNLbYkWxmYWL1pLpboRovw=
X-Received: by 10.107.174.222 with SMTP id n91mr9772052ioo.43.1513309047106;
	Thu, 14 Dec 2017 19:37:27 -0800 (PST)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 19:37:26 -0800 (PST)
In-Reply-To: <20171215033015.738-43-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
	<20171215033015.738-43-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 15 Dec 2017 00:37:26 -0300
X-Google-Sender-Auth: hAt2Ztmtho-z0j3vcgkeKT11kz0
Message-ID: <CAAdtpL4tJ3Q4iyTV9=ezb=VjisF9SAV9+uJXRU4cqGSMz2_sZQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-trivial] [PATCH v4 42/43] hw/i386/vmport: replace
 fprintf() by trace events
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
X-List-Received-Date: Fri, 15 Dec 2017 03:37:32 -0000

Oops I sent the wrong file :(

On Fri, Dec 15, 2017 at 12:30 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/vmport.c     | 8 +++-----
>  hw/i386/trace-events | 4 ++++
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
> index eb880c6def..b5585a009a 100644
> --- a/hw/i386/vmport.c
> +++ b/hw/i386/vmport.c
> @@ -27,8 +27,7 @@
>  #include "hw/i386/pc.h"
>  #include "sysemu/hw_accel.h"
>  #include "hw/qdev.h"
> -
> -/* #define VMPORT_DEBUG */
> +#include "trace.h"
>
>  #define VMPORT_CMD_GETVERSION 0x0a
>  #define VMPORT_CMD_GETRAMSIZE 0x14
> @@ -54,6 +53,7 @@ void vmport_register(unsigned char command, VMPortReadF=
unc *func, void *opaque)
>          return;
>      }
>
> +    trace_vmport_register(command, func, opaque);
>      port_state->func[command] =3D func;
>      port_state->opaque[command] =3D opaque;
>  }
> @@ -80,9 +80,7 @@ static uint64_t vmport_ioport_read(void *opaque, hwaddr=
 addr,
>          return eax;
>      }
>      if (!s->func[command]) {
> -#ifdef VMPORT_DEBUG
> -        fprintf(stderr, "vmport: unknown command %x\n", command);
> -#endif
> +        trace_vmport_ioport_read_unknown_command(command, addr);
>          return eax;
>      }
>
> diff --git a/hw/i386/trace-events b/hw/i386/trace-events
> index d43b4b6cd3..f0522ea5e5 100644
> --- a/hw/i386/trace-events
> +++ b/hw/i386/trace-events
> @@ -113,3 +113,7 @@ amdvi_mode_invalid(uint8_t level, uint64_t addr)"erro=
r: translation level 0x%"PR
>  amdvi_page_fault(uint64_t addr) "error: page fault accessing guest physi=
cal address 0x%"PRIx64
>  amdvi_iotlb_hit(uint8_t bus, uint8_t slot, uint8_t func, uint64_t addr, =
uint64_t txaddr) "hit iotlb devid %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx=
64
>  amdvi_translation_result(uint8_t bus, uint8_t slot, uint8_t func, uint64=
_t addr, uint64_t txaddr) "devid: %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx=
64
> +
> +# hw/i386/vmport.c
> +vmport_register(unsigned char command, void *func, void *opaque) "comman=
d: 0x%02x func: %p opaque: %p"
> +vmport_ioport_read_unknown_command(unsigned char command, hwaddr addr) "=
unknown command: 0x%02x addr: 0x" HWADDR_PRIx

a '%' is missing here: 0x%" HWADDR_PRIx

-vmport_ioport_read_unknown_command(unsigned char command, hwaddr
addr) "unknown command: 0x%02x addr: 0x" HWADDR_PRIx
+vmport_ioport_read_unknown_command(unsigned char command, hwaddr
addr) "unknown command: 0x%02x addr: 0x%" HWADDR_PRIx

> --
> 2.15.1
>

