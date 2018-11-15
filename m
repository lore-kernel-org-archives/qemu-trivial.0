Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNEZ5-00023O-9v
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 05:07:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNEZ3-00021h-E3
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 05:07:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNEZ0-0003KX-2U
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 05:07:57 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33115)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gNEYz-00034P-P3
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 05:07:53 -0500
Received: by mail-wm1-f68.google.com with SMTP id f19-v6so15498486wmb.0
	for <qemu-trivial@nongnu.org>; Thu, 15 Nov 2018 02:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pK12zq1qNRsq7Tp0gBYsfyVXjXbJj/ohOzYHOMaFOfU=;
	b=Gpquw3bKqwhypOqb9zIe4L2TRHoDIlpJyc//5pXP60sZ+pqHUWFzRsX70EZsqpdgwF
	b+S//uqbB7WyJQ8P0NSe5LoOAleAMaqhKyCpjF2dSGkldyUIt3fc5fDScwrW7BehPdiC
	d/NhHr2C5rXMOImH+/OR9GZM/BZN7QAx/O6j9yhPQNA0gqzJAqIMD3G+ukSUWTXM3AbR
	PG6jDqRMQTkdP0g3Lxp1nrBc6KlXd698ypY9qctJa/k3/zYKcF3hKK62yDWvCYl146aC
	/aaHBqLm7gjPTsYh6EcbfPPRhajZgjQsrLnBd+sxtYPMNofqX9eg7d3tPgU1P/QF4r/7
	Cx7g==
X-Gm-Message-State: AGRZ1gJ1cUGM/8XRGIKPmEQLq7KEcYft7PZs9L/RACuTA50StWeucwIA
	dYY4/vvR2qUhvHyoZXbj5rK84g==
X-Google-Smtp-Source: AJdET5ej1EpXTMgEVZYlxOOTy8KlNfjfzTV1vqehwFcCRUdKJvkyMki/jSxfJZ/nCpbH59PmmzBvnQ==
X-Received: by 2002:a7b:c245:: with SMTP id b5mr4589162wmj.42.1542276447200;
	Thu, 15 Nov 2018 02:07:27 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	j19sm3603211wmj.44.2018.11.15.02.07.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 02:07:26 -0800 (PST)
To: Li Qiang <liq3ea@gmail.com>, pbonzini@redhat.com, rth@twiddle.net,
	ehabkost@redhat.com, laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1542261954-4060-1-git-send-email-liq3ea@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a71c8807-6a4d-2dca-6f82-c9a93721d1fb@redhat.com>
Date: Thu, 15 Nov 2018 11:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542261954-4060-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: replace
 g_malloc with g_malloc0
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
X-List-Received-Date: Thu, 15 Nov 2018 10:07:58 -0000

On 15/11/18 7:05, Li Qiang wrote:
> And also the g_malloc doesn't need check return value,
> remove it.
> 
> Cc: qemu-trivial@nongnu.org
> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>   target/i386/hax-all.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index d2e512856b..a460c605af 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
>           return 0;
>       }
>   
> -    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
> -    if (!vcpu) {
> -        fprintf(stderr, "Failed to alloc vcpu state\n");
> -        return -ENOMEM;
> -    }
> -
> -    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
> +    vcpu = g_malloc0(sizeof(struct hax_vcpu_state));

Can you use the g_new form?

        vcpu = g_new0(struct hax_vcpu_state, 1);

>   
>       ret = hax_host_create_vcpu(hax_global.vm->fd, id);
>       if (ret) {
> @@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
>           return hax->vm;
>       }
>   
> -    vm = g_malloc(sizeof(struct hax_vm));
> -    if (!vm) {
> -        return NULL;
> -    }
> -    memset(vm, 0, sizeof(struct hax_vm));
> +    vm = g_malloc0(sizeof(struct hax_vm));

Ditto.

> +
>       ret = hax_host_create_vm(hax, &vm_id);
>       if (ret) {
>           fprintf(stderr, "Failed to create vm %x\n", ret);
> 

This patch as it or using g_new0:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

