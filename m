Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1lJj-00048F-2W
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2020 01:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1lJg-00046T-Mc
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 01:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1lJf-0000fQ-Gl
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 01:16:08 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50441
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1lJf-0000eC-Cc
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 01:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581488167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwy4C9U6DaV2vcMps8DhSCryfmgcAxIXNAFnnjj2qo4=;
 b=e2srtWds8zOg09nTHhC5STy4QaMpPPsHJucsVmJ62sdF7vo0My+vMGGs6ZnkceCC+ZZZaq
 p3YH8fQ7X237CEBTPaAlOEuMKhHMOZY9HMziHtf0WI78aXXXYcAtDtgYKdGADsl6YEWIdc
 +cOykXn3Szog0MUrt8dpHjIMyhsWwtA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-YYsQlcowNMSuakAMEC4rMQ-1; Wed, 12 Feb 2020 01:16:05 -0500
Received: by mail-wr1-f71.google.com with SMTP id d15so398902wru.1
 for <qemu-trivial@nongnu.org>; Tue, 11 Feb 2020 22:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xwy4C9U6DaV2vcMps8DhSCryfmgcAxIXNAFnnjj2qo4=;
 b=HTWq0cIhCRTHm3dj7d5QYoFrtZD08u4TUij44Q/PMXkGp+3r1xYAJmMP7hzD5EML7N
 l7vhDApxusjYSdxVKO1nJwnaTTQEoxbqUzD+pbG8DZkXAQMAG5uApyx5bY1gBN+FgbVG
 hfYTaOZG1YLRsbtHhpAy1pD6D6KuPaROaeMBgYljBES9sgnyObc0AkSk9V7i7bvyRILI
 C89qzMuURe8vIUYr92I3vvadHWscV5poGSHkrS6x4CGYV3lh6GMFl6c03jJpLAo5v334
 5Lw8ciQntyfQ5xcPDkT1QyVcIagNsBHIJYxlFG0qxCnfzjpHG17RrZIGVAyWrlrhoEon
 I3Og==
X-Gm-Message-State: APjAAAWlsmuXhzbTfLRJmF6hhGoRlrhB6C5hBoCgN/CNI1M4lg021OUx
 l5pDB95h+N7QGrAhsTmXggXI+BNbHbx4eXS4B8BYUJ0RyFkXHKSeztkIbOClKdPTLxWqntwfiir
 7+dOO2LuUTAeUiNt9zw==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr10290020wmj.41.1581488164455; 
 Tue, 11 Feb 2020 22:16:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqy+HpsIe6+Z1q6ciB9lGFCueNILb7cqM3KM/G8wzRDXdG2O2tTf3a++nrpDUyzE1PlQTp/euw==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr10290006wmj.41.1581488164276; 
 Tue, 11 Feb 2020 22:16:04 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id y8sm6683917wma.10.2020.02.11.22.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:16:03 -0800 (PST)
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix memleaks in
 exynos4210_uart_init
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, i.mitsyanko@gmail.com,
 peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com
References: <20200212033641.249560-1-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce5d39c0-d532-4b54-a39c-01c9c97cbb59@redhat.com>
Date: Wed, 12 Feb 2020 07:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212033641.249560-1-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-MC-Unique: YYsQlcowNMSuakAMEC4rMQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 12 Feb 2020 06:16:10 -0000

On 2/12/20 4:36 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> It's easy to reproduce as follow:
> virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-properties",
> "arguments":{"typename":"exynos4210.uart"}}'
> 
> ASAN shows memory leak stack:
>    #1 0xfffd896d71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
>    #2 0xaaad270beee3 in timer_new_full /qemu/include/qemu/timer.h:530
>    #3 0xaaad270beee3 in timer_new /qemu/include/qemu/timer.h:551
>    #4 0xaaad270beee3 in timer_new_ns /qemu/include/qemu/timer.h:569
>    #5 0xaaad270beee3 in exynos4210_uart_init /qemu/hw/char/exynos4210_uart.c:677
>    #6 0xaaad275c8f4f in object_initialize_with_type /qemu/qom/object.c:516
>    #7 0xaaad275c91bb in object_new_with_type /qemu/qom/object.c:684
>    #8 0xaaad2755df2f in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:152
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>   hw/char/exynos4210_uart.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index 25d6588e41..5048db5410 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -674,10 +674,6 @@ static void exynos4210_uart_init(Object *obj)
>       SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>       Exynos4210UartState *s = EXYNOS4210_UART(dev);
>   
> -    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                         exynos4210_uart_timeout_int, s);
> -    s->wordtime = NANOSECONDS_PER_SECOND * 10 / 9600;

Why are you moving s->wordtime from init() to realize()?

> -
>       /* memory mapping */
>       memory_region_init_io(&s->iomem, obj, &exynos4210_uart_ops, s,
>                             "exynos4210.uart", EXYNOS4210_UART_REGS_MEM_SIZE);
> @@ -691,6 +687,10 @@ static void exynos4210_uart_realize(DeviceState *dev, Error **errp)
>   {
>       Exynos4210UartState *s = EXYNOS4210_UART(dev);
>   
> +    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                         exynos4210_uart_timeout_int, s);
> +    s->wordtime = NANOSECONDS_PER_SECOND * 10 / 9600;
> +
>       qemu_chr_fe_set_handlers(&s->chr, exynos4210_uart_can_receive,
>                                exynos4210_uart_receive, exynos4210_uart_event,
>                                NULL, s, NULL, true);
> 


