Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2BRG-0007Yf-0V
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2020 05:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j2BRD-0007YX-B2
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 05:09:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j2BRB-0007L0-Tq
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 05:09:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37330
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j2BRB-0007Kd-Ny
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 05:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581588576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdXyG/D58nGTTZ4Q/Z+Ja2Drs+ebjXgkqHdk3W/qv8g=;
 b=OH6qB/HSxZpxTnOjH+ZWqB5v0uXf6/R4GpU5xN4oCgcUymNvHr1LhhYAs17zAZn/FP4thK
 0/vJqDoC3PRZ8Id3/gFdP89FraUTuAhV4w1wEzIq35ZCViTXo0Letqt46D3mUPxq0B9u7+
 Mn0ynkJuRHdFs664Zy0xhobpISIV9xA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-xKdUjBy0ONa-10GHpax_pQ-1; Thu, 13 Feb 2020 05:09:34 -0500
Received: by mail-wm1-f72.google.com with SMTP id n17so1824954wmk.1
 for <qemu-trivial@nongnu.org>; Thu, 13 Feb 2020 02:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKlZaHBXk4EoDOO4VtPDWv8WiC25pil10IQwb52+r24=;
 b=hEMw0i8XIailSh77ylcGksQ4O44py1uo7Fk2YwUhCFtD2grkN69CZAyyKfO+RNXB5h
 HM2d0rsLGSeN8BAXsFPthVDO2pvowgxIvZ2Y1d/REzLu249aH4t87av2JFo+zklyNmhD
 irY9xWb0yGaJRh41soVDqiXUybqqBu3kASo8Ud0/CAgAFZvjZU1wM4F8N7CA3cuYGNj1
 nTWxm3uk2aRU6Vmp39d7lMFB7sKnTIIMl8YTo/IxO95zKXeLdtmbnFyTwXat36KOc2cf
 ZTPY7qftwA7+y+1zDuDlTXWgRAtldQpoXV9lXJF6bRXsRtAMjZETJqeKVnwThPuedGtb
 9VeQ==
X-Gm-Message-State: APjAAAWgJA7RCpbjM03u3Fww8blJI2vxepHRIBtbQY8LxD95rMH4IKQD
 UYuIrNolMgOo8jGugcvRr1Lk1zcaCrRwiBujVNfnHLhkdM/BZOlAziDB91C/3PT+lx/yv7kZK2b
 /P1eS61drzp7pktnpIA==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr22104287wrm.219.1581588573687; 
 Thu, 13 Feb 2020 02:09:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwErsgehsjoKxsQ8/N+7lmSsqQ3Y36vGPZdcUZ0YeTsPM4+dyzfEZ3nefZQfO6ZRvYSYDArdg==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr22104260wrm.219.1581588573435; 
 Thu, 13 Feb 2020 02:09:33 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id w8sm2455892wmm.0.2020.02.13.02.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 02:09:32 -0800 (PST)
Subject: Re: [PATCH v2] hw/char/exynos4210_uart: Fix memleaks in
 exynos4210_uart_init
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, i.mitsyanko@gmail.com,
 peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com,
 zhang.zhanghailiang@huawei.com, armbru@redhat.com
References: <20200213025603.149432-1-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <17ae20f0-fcf6-f9a0-b8e3-808255994dfb@redhat.com>
Date: Thu, 13 Feb 2020 11:09:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213025603.149432-1-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-MC-Unique: xKdUjBy0ONa-10GHpax_pQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 13 Feb 2020 10:09:40 -0000

On 2/13/20 3:56 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> It's easy to reproduce as follow:
> virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-propert=
ies",
> "arguments":{"typename":"exynos4210.uart"}}'
>=20
> ASAN shows memory leak stack:
>    #1 0xfffd896d71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
>    #2 0xaaad270beee3 in timer_new_full /qemu/include/qemu/timer.h:530
>    #3 0xaaad270beee3 in timer_new /qemu/include/qemu/timer.h:551
>    #4 0xaaad270beee3 in timer_new_ns /qemu/include/qemu/timer.h:569
>    #5 0xaaad270beee3 in exynos4210_uart_init /qemu/hw/char/exynos4210_uar=
t.c:677
>    #6 0xaaad275c8f4f in object_initialize_with_type /qemu/qom/object.c:51=
6
>    #7 0xaaad275c91bb in object_new_with_type /qemu/qom/object.c:684
>    #8 0xaaad2755df2f in qmp_device_list_properties /qemu/qom/qom-qmp-cmds=
.c:152
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Changes V2 to V1:
> -Keep s->wordtime in exynos4210_uart_init (Base on Eduardo and Philippe's=
 comments).

Thanks.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   hw/char/exynos4210_uart.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index 25d6588e41..96d5180e3e 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -674,8 +674,6 @@ static void exynos4210_uart_init(Object *obj)
>       SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
>       Exynos4210UartState *s =3D EXYNOS4210_UART(dev);
>  =20
> -    s->fifo_timeout_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                         exynos4210_uart_timeout_int, s)=
;
>       s->wordtime =3D NANOSECONDS_PER_SECOND * 10 / 9600;
>  =20
>       /* memory mapping */
> @@ -691,6 +689,9 @@ static void exynos4210_uart_realize(DeviceState *dev,=
 Error **errp)
>   {
>       Exynos4210UartState *s =3D EXYNOS4210_UART(dev);
>  =20
> +    s->fifo_timeout_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                         exynos4210_uart_timeout_int, s)=
;
> +
>       qemu_chr_fe_set_handlers(&s->chr, exynos4210_uart_can_receive,
>                                exynos4210_uart_receive, exynos4210_uart_e=
vent,
>                                NULL, s, NULL, true);
>=20


