Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYln-0005Na-FY
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 09:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtYll-0005LZ-6g
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:10:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtYlc-0002OL-53
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:10:35 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:44034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtYlb-0002Fl-Sr
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:10:32 -0500
Received: by mail-wr1-f52.google.com with SMTP id v16so2796966wrn.11
	for <qemu-trivial@nongnu.org>; Tue, 12 Feb 2019 06:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8hoVHKJvjbmxWga1aflzbTGBgksE08WHcUPqPULxNUM=;
	b=PhpZbknef5ZBFRQHCYialcc6cqYNQKRIDfZsrb14relPl3Y9D4AQYBH+CtnwP+wzfZ
	aXawu4sFPekKCVOGf7/HBLBXSeLgWx0pOKfxoXA40Qr+FVA8yylkV4DuM24dHTUb9Zk4
	HDkh+B3bpbbNoako9Kk8SKUmhXKfd8kanxR/MBjGU4M6XLHDipmiDG7cXQiC/+zGpK5v
	0HeH3Jh0zDqdFk0SsRCOKQwxv2xdQJjzeBM6AruduFEipcx0CVZ7s3Xg2KxzCEGqYoHW
	8fI/TJkHmASVdH5F9NGprWtsbrW+B5eNcXIdP6afjdjOPq7K5BOURsKZDQj7KJdbHEQy
	W3wA==
X-Gm-Message-State: AHQUAuaj/oD7sU8n58bicqDTKkJfgtYIZH/TxxZxa8LGNsPcR2RGDdj8
	2f5smLS+u9jhYwUf6zAR4EdRlug9SGk=
X-Google-Smtp-Source: AHgI3IYX05wagfBhCpHKiQfqFIek9l4tdnN3Ru5taMzB7rtQE/QnFLpzP8nhqypZSU+EJ7Mx4NHDXA==
X-Received: by 2002:adf:ecc6:: with SMTP id s6mr3075492wro.144.1549980627318; 
	Tue, 12 Feb 2019 06:10:27 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	y20sm28768235wra.51.2019.02.12.06.10.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 06:10:26 -0800 (PST)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-2-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <87e9683c-1363-3777-f92a-af73e1ed3748@redhat.com>
Date: Tue, 12 Feb 2019 15:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190212134758.10514-2-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.52
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] pckbd: Convert
 DPRINTF->trace
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
X-List-Received-Date: Tue, 12 Feb 2019 14:10:42 -0000

On 2/12/19 2:47 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Per https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03186.html
this one already has:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

> ---
>  hw/input/pckbd.c      | 19 ++++++-------------
>  hw/input/trace-events |  7 +++++++
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 72e7d5f6cc..47a606f5e3 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -30,14 +30,7 @@
>  #include "hw/input/i8042.h"
>  #include "sysemu/sysemu.h"
>  
> -/* debug PC keyboard */
> -//#define DEBUG_KBD
> -#ifdef DEBUG_KBD
> -#define DPRINTF(fmt, ...)                                       \
> -    do { printf("KBD: " fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...)
> -#endif
> +#include "trace.h"
>  
>  /*	Keyboard Controller Commands */
>  #define KBD_CCMD_READ_MODE	0x20	/* Read mode bits */
> @@ -210,7 +203,7 @@ static uint64_t kbd_read_status(void *opaque, hwaddr addr,
>      KBDState *s = opaque;
>      int val;
>      val = s->status;
> -    DPRINTF("kbd: read status=0x%02x\n", val);
> +    trace_pckbd_kbd_read_status(val);
>      return val;
>  }
>  
> @@ -224,7 +217,7 @@ static void kbd_queue(KBDState *s, int b, int aux)
>  
>  static void outport_write(KBDState *s, uint32_t val)
>  {
> -    DPRINTF("kbd: write outport=0x%02x\n", val);
> +    trace_pckbd_outport_write(val);
>      s->outport = val;
>      qemu_set_irq(s->a20_out, (val >> 1) & 1);
>      if (!(val & 1)) {
> @@ -237,7 +230,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
>  {
>      KBDState *s = opaque;
>  
> -    DPRINTF("kbd: write cmd=0x%02" PRIx64 "\n", val);
> +    trace_pckbd_kbd_write_command(val);
>  
>      /* Bits 3-0 of the output port P2 of the keyboard controller may be pulsed
>       * low for approximately 6 micro seconds. Bits 3-0 of the KBD_CCMD_PULSE
> @@ -326,7 +319,7 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
>      else
>          val = ps2_read_data(s->kbd);
>  
> -    DPRINTF("kbd: read data=0x%02x\n", val);
> +    trace_pckbd_kbd_read_data(val);
>      return val;
>  }
>  
> @@ -335,7 +328,7 @@ static void kbd_write_data(void *opaque, hwaddr addr,
>  {
>      KBDState *s = opaque;
>  
> -    DPRINTF("kbd: write data=0x%02" PRIx64 "\n", val);
> +    trace_pckbd_kbd_write_data(val);
>  
>      switch(s->write_cmd) {
>      case 0:
> diff --git a/hw/input/trace-events b/hw/input/trace-events
> index 3965a842ae..8e53ae5bbf 100644
> --- a/hw/input/trace-events
> +++ b/hw/input/trace-events
> @@ -14,6 +14,13 @@ adb_mouse_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%2.2x o
>  adb_mouse_request_change_addr(int devaddr) "change addr to 0x%x"
>  adb_mouse_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
>  
> +# hw/input/pckbd.c
> +pckbd_kbd_read_data(uint32_t val) "0x%02x"
> +pckbd_kbd_read_status(int status) "0x%02x"
> +pckbd_outport_write(uint32_t val) "0x%02x"
> +pckbd_kbd_write_command(uint64_t val) "0x%02"PRIx64
> +pckbd_kbd_write_data(uint64_t val) "0x%02"PRIx64
> +
>  # hw/input/ps2.c
>  ps2_put_keycode(void *opaque, int keycode) "%p keycode 0x%02x"
>  ps2_keyboard_event(void *opaque, int qcode, int down, unsigned int modifier, unsigned int modifiers) "%p qcode %d down %d modifier 0x%x modifiers 0x%x"
> 

