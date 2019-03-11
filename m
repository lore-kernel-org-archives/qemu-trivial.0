Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3IEW-0001WS-Cj
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 06:32:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3IEU-0001U0-2C
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 06:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3IET-0002k2-Cg
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 06:32:34 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h3IET-0002jL-4l
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 06:32:33 -0400
Received: by mail-wr1-f66.google.com with SMTP id n2so4440536wrw.8
	for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2019 03:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wjxc8P+Byblkpu8rCIoKJuxB5kefi8NDsss7mc76CgE=;
	b=W08g3987HqIGIXC77KGEEMcAUsYbrprfc8cRu1cFVad5Q5AkfVl2CQon0g+5xyksAI
	DH/CLhgPpmE7q6pSK/mPRMFck/mlKsr0/ftNf9YUGI/9/hDy/DmTiFpycntxmCgnYbD0
	Dr/EGaLqM9DGUSNqIU3i3HmMKloPyIPdDcS+BEpXNz+fXgGxVUeT+4grQNQQctSrGCY8
	zD57+DZd/5fitfkuuv5xFIUPWaK70x3uX2kn7H4nF1Izl0vxIrncSZgXKSMNeAbSdWSQ
	6Oc3adETHpB7im4xmWNztitrtYt6XyoYpTcFSPz6RPVky4eI2qTr8JyxT1mYxqSn29et
	i7NQ==
X-Gm-Message-State: APjAAAWhdiUEqLgbDgXNNHpCm+Ri9nC1Xwhvm66uzzNoRtaxIZ7q3JkF
	PC+buZ6g8A+JNhghck4R02GuqQ==
X-Google-Smtp-Source: APXvYqxia/byGDh9CM9E5dHIo85ze6iXYq/abS4Icgh+qr2CY1tbjTCtTN7bPTk9rg4iaWBJOykm6w==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr20091118wrn.276.1552300352038; 
	Mon, 11 Mar 2019 03:32:32 -0700 (PDT)
Received: from [192.168.43.238] (27.red-95-127-155.staticip.rima-tde.net.
	[95.127.155.27]) by smtp.gmail.com with ESMTPSA id
	f1sm11114703wmh.44.2019.03.11.03.32.30
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Mar 2019 03:32:31 -0700 (PDT)
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: Helge Deller <deller@gmx.de>, Aleksandar Rikalo <arikalo@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
References: <20190311102712.8572-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ccf4af1c-8435-8698-b584-456a7e4782dc@redhat.com>
Date: Mon, 11 Mar 2019 11:32:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190311102712.8572-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH] hw/net/pcnet: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
X-List-Received-Date: Mon, 11 Mar 2019 10:32:35 -0000

Oops 'fprintf' -> 'printf' in patch subject.

On 3/11/19 11:27 AM, Philippe Mathieu-Daudé wrote:
> Avoid to clutter stdout until explicitly requested
> (with -d guest_errors):
> 
>   $ qemu-system-mips -M malta -m 512 -kernel vmlinux-3.2.0-4-4kc-malta
>   Bad SWSTYLE=0x04
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Helge patch "pcnet: Avoid warning when switching back to 16bit mode"
> remembered me I had this one somewhere.
> ---
>  hw/net/pcnet.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
> index d9ba04bdfc..16683091c9 100644
> --- a/hw/net/pcnet.c
> +++ b/hw/net/pcnet.c
> @@ -36,6 +36,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/qdev.h"
>  #include "net/net.h"
>  #include "net/eth.h"
> @@ -1501,7 +1502,8 @@ static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val)
>              val |= 0x0300;
>              break;
>          default:
> -            printf("Bad SWSTYLE=0x%02x\n", val & 0xff);
> +            qemu_log_mask(LOG_GUEST_ERROR, "pcnet: Bad SWSTYLE=0x%02x\n",
> +                          val & 0xff);
>              val = 0x0200;
>              break;
>          }
> 

