Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itwbQ-0001L7-1U
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 11:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itwbL-0001ED-01
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 11:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itwbG-0003yS-Bv
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 11:42:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39809
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itwbG-0003xL-8g
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 11:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579624917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZQr3GJu4EloNbDA2o3rszEPhn62VWD7FbqVrGUQdLc=;
 b=IMOgbK0xw6eE+38JxY3TSAvxTolemdMEekD73oEr6k8N/HGKJh8vLpQ7oKA+WjUhnBiaY2
 9Rjzhsq2RE5NTfh/j4lr7hv7ZSQusBvbs0Z/axymyg0TpdLlqJbIGmdL25Q5vk4RdpL/FF
 b1wWgNj6g3h+KgtnIGgN1ZH6E5D5Z5k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-uYv2q8G9OeKvgdfOOHKu-Q-1; Tue, 21 Jan 2020 11:41:55 -0500
Received: by mail-wm1-f69.google.com with SMTP id m133so586567wmf.2
 for <qemu-trivial@nongnu.org>; Tue, 21 Jan 2020 08:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=50Z4SvxBYXC9Ur5iEhPZHFt5fxBKiuXYxOly19jt+08=;
 b=NKsA748KJQqj4i7sEbUMZsUo5Jji+/lCV8aIGvQZ4XGcNAtIIn9v0sCcbEHYBLri9x
 HTjUTskJo2IKPoBnwyBUSLQIz4IjEGrHhIx7NeLu1KNW3WkAe5hdHcjS8I6MmkUQAtlG
 HMBmxvBWbTM1xbReRl+DY/f5D/nExSuNQitpgcAb/OW9ssyEgkwtKLL0hHRC5vB+p4v4
 FUqQH7gJA9Nh3qK5H/3/FffamTxSMY/SwUm203D44Q5alCSy1+3j0rbeCf7Q2Sfaw+vf
 w1VrOpqmmWDDPLuZyGiR1S+syqGIB8gzgd64RumIiVQk8hDQKHTfwY3k5+hu22P1cYlA
 kkuw==
X-Gm-Message-State: APjAAAWFuEQ4TRr0L9wARKF+H7hmNdMMu9HC4rU5id51WLYafHKRVgJ8
 xJe7tgn+XzNRNvULtlXU6CwlBztTo1Kly1x/YXu7UoKAWl8UhBqDMw0ElRasYHeKWcqOXLAdXiE
 ur4wrWS7xdbMQBSvBtw==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr5265092wml.110.1579624914096; 
 Tue, 21 Jan 2020 08:41:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfF6tXDyMLPEMBHkhw2xOprNxB5uRcWPNI62+6B4YfZ4FR0hQHYnaHFyHAGh5pRvoDRHMpug==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr5265070wml.110.1579624913800; 
 Tue, 21 Jan 2020 08:41:53 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id w8sm493719wmd.2.2020.01.21.08.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:41:53 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH] trivial: Remove xenfb_enabled from sysemu.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org
References: <20200121161747.10569-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cf8a8ee3-0c95-20f3-3225-31bb8413344e@redhat.com>
Date: Tue, 21 Jan 2020 17:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121161747.10569-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: uYv2q8G9OeKvgdfOOHKu-Q-1
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
X-List-Received-Date: Tue, 21 Jan 2020 16:42:06 -0000

On 1/21/20 5:17 PM, Thomas Huth wrote:
> The define is only used in one other place. Move the code there
> instead of keeping this xen-specific define in sysemu.h.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   hw/xenpv/xen_machine_pv.c | 2 +-
>   include/sysemu/sysemu.h   | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> index 3a8af1a1e0..8df575a457 100644
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -60,7 +60,7 @@ static void xen_init_pv(MachineState *machine)
>       xen_be_register("qnic", &xen_netdev_ops);
>  =20
>       /* configure framebuffer */
> -    if (xenfb_enabled) {
> +    if (vga_interface_type =3D=3D VGA_XENFB) {
>           xen_config_dev_vfb(0, "vnc");
>           xen_config_dev_vkbd(0);
>       }
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 80c57fdc4e..2ccf216158 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -32,7 +32,6 @@ typedef enum {
>   } VGAInterfaceType;
>  =20
>   extern int vga_interface_type;
> -#define xenfb_enabled (vga_interface_type =3D=3D VGA_XENFB)
>  =20
>   extern int graphic_width;
>   extern int graphic_height;
>=20


