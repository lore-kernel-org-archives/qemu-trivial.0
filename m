Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLPpX-0001QK-PI
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2019 06:17:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLPpW-0001PR-D1
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 06:17:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLPn4-0000ov-PP
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 06:15:11 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLPn4-0000nq-JQ
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 06:15:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id b67so1976537wmg.1
	for <qemu-trivial@nongnu.org>; Tue, 30 Apr 2019 03:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vvtW2+DlGMzRrVAEZmue76zD40mUirIvX8ZgKXUJnjY=;
	b=G82w7YuiJ5oyBEbud8rPWkK/4j4LOUPsYGPZ58E7ekcnOYGFlw7QkewWxBR736/kBM
	uRc08kSrI1GymjeFeXRNi43PFUJn5QNhkt2sJwve2l7rty6wX3yZ9HDBPbCUorD0sOox
	f6PYGUyaOFdLFnWIyLxY5UmfC5p1n1G8kePXdfy9RoiJqvBgEyZfV4zSDoL8Jpovnp64
	ddpjsNO4qTOSQVw5ufp+8faYzSAytcNZViqJNIKQDgveqxjKt1zK7TwJrdc5mdqeHcAN
	qLQS+XsaVe593c6OcIuzme6qxhx13QAMU6FkmEW80Q9UmkHfZCU6taYWVpbHLs5KlaO7
	2tRg==
X-Gm-Message-State: APjAAAU5va1l7a1R/r5CXTGka8p5YnByeFP8ZM/Czhbcd1ZXoP6riIT5
	iS/5lyP2lsuclohn+KUrBt5xDTCt6Gk=
X-Google-Smtp-Source: APXvYqyVXyLI5X4Up6tt0be8rWJoQWfL04KeZ8N7cjzGmc0ycehfrgO+ztDaYBFCNW7a9GTavYlrvQ==
X-Received: by 2002:a1c:2087:: with SMTP id g129mr2716664wmg.114.1556619309294;
	Tue, 30 Apr 2019 03:15:09 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	g28sm9300670wrb.50.2019.04.30.03.15.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 03:15:08 -0700 (PDT)
To: Boxuan Li <liboxuan@connect.hku.hk>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190428110258.86681-1-liboxuan@connect.hku.hk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a683a29f-ea7b-aaf9-258f-68f4ffcd9b96@redhat.com>
Date: Tue, 30 Apr 2019 12:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190428110258.86681-1-liboxuan@connect.hku.hk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-mmio: Always compile
 debug prints
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
X-List-Received-Date: Tue, 30 Apr 2019 10:17:43 -0000

Hi Li,

On 4/28/19 1:02 PM, Boxuan Li wrote:
> Wrap printf calls inside debug macros (DPRINTF) in `if` statement, and
> change output to stderr as well. This will ensure that printf function
> will always compile and prevent bitrot of the format strings.

There is an effort in QEMU to replace the obsolete DPRINTF() macros by
trace events (which prevent format strings bitroting).

You can read more about tracing in docs/devel/tracing.txt,

and I recomment you to look at the following recent convertions in the
repository history:

commit 8d83cbf1015f547cd9336881e6b62ae2ca293849
Author: Greg Kurz <groug@kaod.org>
Date:   Fri Apr 5 10:05:24 2019 +0200

    target/ppc/kvm: Convert DPRINTF to traces

commit dd849ef2c9d57a329c6001c58dbdf49de712349c
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Feb 21 18:17:46 2019 +0000

    hw/timer/pl031: Convert to using trace events

    Convert the debug printing in the PL031 device to use trace events,

Regards,

Phil.

> Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
> ---
>  hw/virtio/virtio-mmio.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 5807aa87fe..693b3c9eb4 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -28,15 +28,14 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "qemu/error-report.h"
>  
> -/* #define DEBUG_VIRTIO_MMIO */
> -
> -#ifdef DEBUG_VIRTIO_MMIO
> -
> -#define DPRINTF(fmt, ...) \
> -do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) do {} while (0)
> -#endif
> +#define DEBUG_VIRTIO_MMIO 0
> +
> +#define DPRINTF(fmt, ...)                                            \
> +    do {                                                             \
> +        if (DEBUG_VIRTIO_MMIO) {                                     \
> +            fprintf(stderr, "virtio_mmio: " fmt , ## __VA_ARGS__);   \
> +        }                                                            \
> +    } while (0)
>  
>  /* QOM macros */
>  /* virtio-mmio-bus */
> 

