Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kH1cH-0007dp-VU
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 05:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kH1cF-0007dL-6j
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 05:14:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48149
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kH1cC-0006yz-SI
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 05:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599902075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YI7QEt+hoSZ6ChF6py/IttEMpfIYlFGmr9zeFrnMaW8=;
 b=Wivvvsf/sv8L1P16jyNy9iNy9Eru6AEpUsPVOBPkFbaGNnQ21R1JHNUbrySwFCQ8HHrgnW
 WUidRRxDozYkeGb15XYbSlYEqD59jbBXXaIqyqsoarl0Wk6M6eGy23GcVE8wgQq1wba0vw
 gxP1OCMNPjyOmjAzrQme3H1tM6KrdgA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-3clopgbBPUepOiVgMm8cyw-1; Sat, 12 Sep 2020 05:14:33 -0400
X-MC-Unique: 3clopgbBPUepOiVgMm8cyw-1
Received: by mail-ed1-f71.google.com with SMTP id r19so6411777edq.12
 for <qemu-trivial@nongnu.org>; Sat, 12 Sep 2020 02:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YI7QEt+hoSZ6ChF6py/IttEMpfIYlFGmr9zeFrnMaW8=;
 b=mplHRgu/xVyDNHJdc/pDEIJOdi1ap1WhCrXRWO0kHrQ3NvqRt9jeWfmruH6li/sTBd
 Qg00f+tH8SOcYUz9KJj4JUlWYCi+jQroPHyDWUk1C0/3KmuR2WOEg3iA2Z3CKe+Foewk
 8T01ro2JA9vXEYMTyZyGdPhwsAreOlHfitj9+DocXeA7b5+QP4UaCHRoP2aQLBTvI/gt
 KLR190oK3eIXoBUyhz0LzwG8QFoiM1XJDPQ079N9tejLn1rciIqWvX6zVRLqDEzyUiXQ
 NFRyT5gevVyV0fX4k+RuOUYn4mSfJ2/Rcz17/1oBQv6PWNkZElnZqHW6c6aolEnlIXIf
 Ivxg==
X-Gm-Message-State: AOAM531WTtoQS7Jm0Ntuv//TmRHnX+Ea/ZY7Gm7ZeE9aAc/ww19sS6P1
 TZ/4EorJ76E4zrs24Mnb4x6RIAml3qTE1ClY6ugwZbn9Vgz2R/Dcw0idzbtrkc1vVVYgydzo4Dv
 eGhPwiIZNWfOwn33uuA==
X-Received: by 2002:aa7:d747:: with SMTP id a7mr6997135eds.304.1599902072640; 
 Sat, 12 Sep 2020 02:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpspjWytzLB7quIHwx0dvUnUvQlO4ivUMTRgDSOCw5H8QCpnS87/0YJI/yE/YCamlGg/VUJA==
X-Received: by 2002:aa7:d747:: with SMTP id a7mr6997118eds.304.1599902072451; 
 Sat, 12 Sep 2020 02:14:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:8825:3b3:6c1e:a82d?
 ([2001:b07:6468:f312:8825:3b3:6c1e:a82d])
 by smtp.gmail.com with ESMTPSA id g25sm4079472edu.53.2020.09.12.02.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 02:14:31 -0700 (PDT)
Subject: Re: [PATCH 7/7] hw/char/serial: Let SerialState have an 'id' field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200907015535.827885-1-f4bug@amsat.org>
 <20200907015535.827885-8-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6dceab9-d20d-290e-93c5-170a99499da2@redhat.com>
Date: Sat, 12 Sep 2020 11:14:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907015535.827885-8-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 05:14:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.469, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Sep 2020 09:14:39 -0000

On 07/09/20 03:55, Philippe Mathieu-Daudé wrote:
> When a SoC has multiple UARTs (some configured differently),
> it is hard to associate events to their UART.
> 
> To be able to distinct trace events between various instances,
> add an 'id' field. Update the trace format accordingly.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/char/serial.h | 1 +
>  hw/char/serial.c         | 7 ++++---
>  hw/char/trace-events     | 6 +++---
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 3d2a5b27e87..3ee2d096a85 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -75,6 +75,7 @@ typedef struct SerialState {
>      uint64_t char_transmit_time;    /* time to transmit a char in ticks */
>      int poll_msl;
>  
> +    uint8_t id;
>      QEMUTimer *modem_status_poll;
>      MemoryRegion io;
>  } SerialState;
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index ade89fadb44..e5a6b939f13 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -177,7 +177,7 @@ static void serial_update_parameters(SerialState *s)
>      ssp.stop_bits = stop_bits;
>      s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
>      qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
> -    trace_serial_update_parameters(speed, parity, data_bits, stop_bits);
> +    trace_serial_update_parameters(s->id, speed, parity, data_bits, stop_bits);
>  }
>  
>  static void serial_update_msl(SerialState *s)
> @@ -333,7 +333,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>      SerialState *s = opaque;
>  
>      assert(size == 1 && addr < 8);
> -    trace_serial_write(addr, val);
> +    trace_serial_write(s->id, addr, val);
>      switch(addr) {
>      default:
>      case 0:
> @@ -550,7 +550,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
>          ret = s->scr;
>          break;
>      }
> -    trace_serial_read(addr, ret);
> +    trace_serial_read(s->id, addr, ret);
>      return ret;
>  }
>  
> @@ -1013,6 +1013,7 @@ static const TypeInfo serial_io_info = {
>  };
>  
>  static Property serial_properties[] = {
> +    DEFINE_PROP_UINT8("id", SerialState, id, 0),
>      DEFINE_PROP_CHR("chardev", SerialState, chr),
>      DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
>      DEFINE_PROP_BOOL("wakeup", SerialState, wakeup, false),
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index cd36b63f39d..40800c9334c 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -5,9 +5,9 @@ parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s]
>  parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s] addr 0x%02x val 0x%02x"
>  
>  # serial.c
> -serial_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
> -serial_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
> -serial_update_parameters(uint64_t baudrate, char parity, int data_bits, int stop_bits) "baudrate=%"PRIu64" parity='%c' data=%d stop=%d"
> +serial_read(uint8_t id, uint8_t addr, uint8_t value) "id#%u read addr 0x%x val 0x%02x"
> +serial_write(uint8_t id, uint8_t addr, uint8_t value) "id#%u write addr 0x%x val 0x%02x"
> +serial_update_parameters(uint8_t id, uint64_t baudrate, char parity, int data_bits, int stop_bits) "id#%u baudrate=%"PRIu64" parity=%c data=%d stop=%d"
>  
>  # virtio-serial-bus.c
>  virtio_serial_send_control_event(unsigned int port, uint16_t event, uint16_t value) "port %u, event %u, value %u"
> 

I'm not sure about making this one a one-off for serial.c.  You could
add the SerialState* too, for example.  I have queued the other six though.

Paolo


