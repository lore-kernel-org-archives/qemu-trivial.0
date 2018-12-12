Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX2qf-0000fE-Tg
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 06:38:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gX2qe-0000eo-4F
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 06:38:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gX2qV-0002cA-Qf
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 06:38:36 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gX2qS-0002WI-Ch
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 06:38:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id p4so17340262wrt.7
	for <qemu-trivial@nongnu.org>; Wed, 12 Dec 2018 03:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BKAzr1I/R2bRX0ky4bIVQkTaF7pDXm56wV2nnxHzG88=;
	b=BOz6UwR9YtVFSIwmbzLbqBV7mC/Ygc1Mq9gdmjGxkrDaC9t0G1mtRKCxHDW8XRX5wn
	f4ND49R6IlvtqyWJfCFOYUCtK4V618JsM3eZH4MBj4l2NKS8XMs+AqHJgoqdXSLxQ207
	Sm7OcEeCdTyE4v1cRsA+MwiRDMSGA/sGy1W8TZ/w4MpHUx/s6397OjGtVF3y9eSqqGUy
	tPcyZ56JxUuRX9h053jwjTbN++NE+qe7VU+KCoOI9cn/q06KUL395YqyP53vcbx6bLFf
	lxNMu/E07iR7quH56jO1C/Spcw/0LxCzbq91qIQQg0oVjDKqNlpdClFezwRNEwSwuVHR
	JcNw==
X-Gm-Message-State: AA+aEWZYanb5aiekf6h3QOm6+fZJVKcOpOofQldFAlSc/0Vn5iCosY93
	HBY5glbPzB4BGvIskzA45B4rZA==
X-Google-Smtp-Source: AFSGD/WBqCC3kqaCSSS+4gg+bGxHUQw9rlQQ3PTbgoqFk9GNisWf7k+uCWdydCxIRgjk6uwpS5AwvQ==
X-Received: by 2002:adf:f649:: with SMTP id x9mr16733958wrp.247.1544614706073; 
	Wed, 12 Dec 2018 03:38:26 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	v6sm16841326wro.57.2018.12.12.03.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 03:38:25 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
References: <20181212003147.29604-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ca246525-69ab-abf8-7352-d5b1d73b1925@redhat.com>
Date: Wed, 12 Dec 2018 12:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181212003147.29604-1-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virt: Fix broken indentation
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
X-List-Received-Date: Wed, 12 Dec 2018 11:38:41 -0000

On 12/12/18 1:31 AM, Eduardo Habkost wrote:
> I introduced indentation using tabs instead of spaces in another
> commit.  Peter reported the problem, and I failed to fix that
> before sending my pull request.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 951597607696 ("virt: Eliminate separate instance_init functions")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 17f1b49d11..5b678237b7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info = {
>      .instance_size = sizeof(VirtMachineState),
>      .class_size    = sizeof(VirtMachineClass),
>      .class_init    = virt_machine_class_init,
> -	.instance_init = virt_instance_init,
> +    .instance_init = virt_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>           { TYPE_HOTPLUG_HANDLER },
>           { }
> 

