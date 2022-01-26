Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCcx9-0000Bf-Ou
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jan 2022 02:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcx5-0000A5-Nn
 for qemu-trivial@nongnu.org; Wed, 26 Jan 2022 02:42:48 -0500
Received: from mail.ilande.co.uk ([46.43.2.167]:39238
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcx4-0002bN-Au
 for qemu-trivial@nongnu.org; Wed, 26 Jan 2022 02:42:47 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcwW-0008pH-LN; Wed, 26 Jan 2022 07:42:16 +0000
Message-ID: <b080e533-92e1-90bd-9f42-1134a45c47e8@ilande.co.uk>
Date: Wed, 26 Jan 2022 07:42:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20220124231355.48210-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220124231355.48210-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/misc/macio/cuda: Simplify using the ldst API
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=46.43.2.167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jan 2022 07:42:48 -0000

On 24/01/2022 23:13, Philippe Mathieu-Daudé via wrote:

> This code is easier to review using the load/store API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/misc/macio/cuda.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index e917a6a095..f1186671bf 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -36,6 +36,7 @@
>   #include "sysemu/runstate.h"
>   #include "qapi/error.h"
>   #include "qemu/cutils.h"
> +#include "qemu/bswap.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "trace.h"
> @@ -345,10 +346,7 @@ static bool cuda_cmd_get_time(CUDAState *s,
>   
>       ti = s->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
>                              / NANOSECONDS_PER_SECOND);
> -    out_data[0] = ti >> 24;
> -    out_data[1] = ti >> 16;
> -    out_data[2] = ti >> 8;
> -    out_data[3] = ti;
> +    stl_be_p(out_data, ti);
>       *out_len = 4;
>       return true;
>   }
> @@ -363,8 +361,7 @@ static bool cuda_cmd_set_time(CUDAState *s,
>           return false;
>       }
>   
> -    ti = (((uint32_t)in_data[0]) << 24) + (((uint32_t)in_data[1]) << 16)
> -         + (((uint32_t)in_data[2]) << 8) + in_data[3];
> +    ti = ldl_be_p(in_data);
>       s->tick_offset = ti - (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
>                              / NANOSECONDS_PER_SECOND);
>       return true;

Looks fine to me.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

