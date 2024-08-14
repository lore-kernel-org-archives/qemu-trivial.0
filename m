Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1seEa3-00020D-VP
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2024 10:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seEa1-0001yd-4d
 for qemu-trivial@nongnu.org; Wed, 14 Aug 2024 10:02:25 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seEZz-0007tF-C4
 for qemu-trivial@nongnu.org; Wed, 14 Aug 2024 10:02:24 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso9108473e87.2
 for <qemu-trivial@nongnu.org>; Wed, 14 Aug 2024 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723644141; x=1724248941; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CyH8NtOH3FXOYJVzoV/ZtzwA2EgCNDtmlD5S30K7HSQ=;
 b=FCAEsJC0IeaWPr+cHSx967mIbLVlqaywuC5+mGC98ybDTUo/76VPPYzTv2SfMtStVz
 YOH92HjRKBJz2FCRtjof799yfiEVHfg99RAtmqwDB2EouL6Tv9PE0yS4PlKrOu05KEMK
 rMkEvxLBtWy2GtmGtQJQFucWzlTQeOwdQKN3ib2K2yjnkNM/FD0Ft6wuvftWL1w7XGAx
 /hxpNdGTX8KlREyufAg60FQguVdWkejpDmvgSHvGGsqJBRfbMP7ySax3zjHZkGImTrcS
 9dof/cSnTLucUdqgdQ4byrx74vX5AMybwB8/jbb1tY4PqwhVcFVhTTgvSrPudpuM4yIo
 wtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723644141; x=1724248941;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CyH8NtOH3FXOYJVzoV/ZtzwA2EgCNDtmlD5S30K7HSQ=;
 b=ak1PT9FqinWY/DSGqS4JipOwSJEOGeKVx+uYPMe+ulbs+WeGqnOIPKzIUUl9ExU+Qu
 zT8FcCHhPvqqdAtiQIfIgh7RMfqawE62+1v6XHx12UaRGFZ7rUQk8/G3sFklZuSf6QNo
 A70pAS+PwAPX310ge0y6E5yiCqPXu5XBhxskFnaDHBoxyeR9UgTa/fgScPggDN0uKc1c
 T6tcRo3vtYiKbb6vYy27TS83Fq15sFQS20Bv5TTe8jCuUZR7Y8MZRADGg2PqT+U85pto
 Mu9hUtjNAMSkN60SCNAlDdF59DEFxvCWwJf8Tlp2MIxnYsrGnL1WUUFKPWcL+Cn4PDOR
 XOzQ==
X-Gm-Message-State: AOJu0Yy4uHW+rXZESMv1+5mzOWQhsUNhImg1WduFxJ4bS8T791sEx0qq
 uG0fD17c/JX6fVWEWoQlaJ79CiVGL3B/oQLTN4RVzTCu4J7+T1S2M2FEbqjEtk8=
X-Google-Smtp-Source: AGHT+IGBoznFZPhUr/3x/1OFDpGNGFj+aGEAqaXT1znmwLS91aWlEpNlVdiTBaxZyPg3/86mj0YNSw==
X-Received: by 2002:a05:6512:3052:b0:52c:e393:6634 with SMTP id
 2adb3069b0e04-532eda83bbdmr1921410e87.33.1723644140938; 
 Wed, 14 Aug 2024 07:02:20 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.57])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm55826815e9.1.2024.08.14.07.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 07:02:20 -0700 (PDT)
Message-ID: <e7c17260-41d7-4749-aca9-da344517c772@linaro.org>
Date: Wed, 14 Aug 2024 16:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1] hw/i386/pc: Warn about unsatisfied vmport deps
To: =?UTF-8?Q?Kamil_Szcz=C4=99k?= <kamil@szczek.dev>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Joelle van Dyne <j@getutm.app>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <vsm1ly2eX009LRKgURcMp6qTYHWw1bZd3zg2GUbd4M90T91QvJRdKxiRS3rPl8PR96y2r890Am3Ajf4kQrwihn7-7hKBU9VicRPPtIRv_GI=@szczek.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <vsm1ly2eX009LRKgURcMp6qTYHWw1bZd3zg2GUbd4M90T91QvJRdKxiRS3rPl8PR96y2r890Am3Ajf4kQrwihn7-7hKBU9VicRPPtIRv_GI=@szczek.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 14 Aug 2024 14:02:25 -0000

Hi Kamil,

On 14/8/24 13:10, Kamil Szczęk wrote:
> Since commit 4ccd5fe22feb95137d325f422016a6473541fe9f ('pc: add option
> to disable PS/2 mouse/keyboard'), the vmport will not be created unless
> the i8042 PS/2 controller is enabled. To not confuse users, let's add a
> warning if vmport was explicitly requested, but the i8042 controller is
> disabled. This also changes the behavior of vmport=auto to take i8042
> controller availability into account.
> 
> Signed-off-by: Kamil Szczęk <kamil@szczek.dev>
> ---
>   hw/i386/pc.c      | 4 ++++
>   hw/i386/pc_piix.c | 3 ++-
>   hw/i386/pc_q35.c  | 2 +-
>   qemu-options.hx   | 4 ++--
>   4 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c74931d577..5bd8dd0350 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1100,6 +1100,10 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>       }
>   
>       if (!create_i8042) {
> +        if (!no_vmport) {
> +            warn_report("vmport requires the i8042 controller to be enabled");

Should we fail instead?

> +        }
> +
>           return;
>       }
>   
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index d9e69243b4..cf2e2e3e30 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -312,7 +312,8 @@ static void pc_init1(MachineState *machine, const char *pci_type)
>   
>       assert(pcms->vmport != ON_OFF_AUTO__MAX);
>       if (pcms->vmport == ON_OFF_AUTO_AUTO) {
> -        pcms->vmport = xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
> +        pcms->vmport = (xen_enabled() || !pcms->i8042_enabled)
> +            ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
>       }
>   
>       /* init basic PC hardware */
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 9d108b194e..6c112d804d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -278,7 +278,7 @@ static void pc_q35_init(MachineState *machine)
>   
>       assert(pcms->vmport != ON_OFF_AUTO__MAX);
>       if (pcms->vmport == ON_OFF_AUTO_AUTO) {
> -        pcms->vmport = ON_OFF_AUTO_ON;
> +        pcms->vmport = pcms->i8042_enabled ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>       }
>   
>       /* init basic PC hardware */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index cee0da2014..0bc780a669 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -68,8 +68,8 @@ SRST
>   
>       ``vmport=on|off|auto``
>           Enables emulation of VMWare IO port, for vmmouse etc. auto says
> -        to select the value based on accel. For accel=xen the default is
> -        off otherwise the default is on.
> +        to select the value based on accel and i8042. For accel=xen
> +        and/or i8042=off the default is off otherwise the default is on.
>   
>       ``dump-guest-core=on|off``
>           Include guest memory in a core dump. The default is on.


