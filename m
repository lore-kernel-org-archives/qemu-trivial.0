Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1satD1-0005EF-0d
	for mharc-qemu-trivial@gnu.org; Mon, 05 Aug 2024 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1satCv-0005C7-Ah
 for qemu-trivial@nongnu.org; Mon, 05 Aug 2024 04:36:45 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1satCs-0003kh-Oz
 for qemu-trivial@nongnu.org; Mon, 05 Aug 2024 04:36:44 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso65536965e9.0
 for <qemu-trivial@nongnu.org>; Mon, 05 Aug 2024 01:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722847000; x=1723451800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pKBiIltAVoXZZg0LL7Muk/bomt5G37qqc5x4duMKkRI=;
 b=P7iOzvnAnt444Ti/PtvoJjSJiXvPYFcyJFGDNQA/Zx7ox0Q5FPO9UlrHpHo8OwgN/t
 mboJlo+tS3rzCuhg/gpys6IL4/4SmWSrwQI6rCXYA1BrnYUuNtnNixO54ABbvxPEeHez
 fkMod+avM0mycCs3MIMwcE0eQpv1EgO2N/nM0OywLqJotA7ljlk8WR1rqGTQciTEvCZI
 2uV+VH3NfKNV29zQNBWP7RRTROzMWUpDmNyXBd/pKY2pSrLYYHCjlKLt/og40Nt1xIvC
 LWpDNot7WYakWuOoeRe4Gf6tnQ3CLX0HtB/rzqWs/7Q2DlJzFc52QGy+07wwIZraoNXj
 PW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722847000; x=1723451800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKBiIltAVoXZZg0LL7Muk/bomt5G37qqc5x4duMKkRI=;
 b=qF6geyfJl0zL904zPeRT3+limQsoGc4gGYAqNPTMLuQKO8WeJpLEx0Z4uY/rS2KhNh
 atAwlADe0iEICRbnWSPe3tznaL+f7jGdtnUSIm0Fp+eJTNM0qjceSQWOWNlVEEmg5sEF
 itfcFGUPY4i8T5CeEZd+HMsXkv0bqYBZcV7kfQebcdJNmjN3O3/zvlhVK4VUAr7UGR5W
 Mbt480VUAjPs6ASgNwXV80H8AahkkAqIG4g+2oFbGosklzOb1zBJHVDl2ismuS4xKKzh
 wmdXXXAJNbCxuIjN8WJG8+ZOZtMBIJOuIFiAQSoXWilzuvpMJDqNtJKAGPIDEE1MMOlR
 NGFQ==
X-Gm-Message-State: AOJu0Yw81zreo4qhVLXBdBLNXZ7aDp8MLbLXe53qXJhQTh9faniCOL+X
 ht4PxzMcZEJKD+xIka81VxPUI5Eg6en4O0KPCGKUPdl8PxqCU8rkhYDWjK05JdA=
X-Google-Smtp-Source: AGHT+IFoJAeNS1BHCpnYK6EybdfIAlD8BhWtpEEkU+ivX0W0RcXn1imU8aVkIR/SUmXWrWxyQkbghg==
X-Received: by 2002:a05:600c:1552:b0:426:6822:861 with SMTP id
 5b1f17b1804b1-428e6b925c7mr71984905e9.36.1722847000027; 
 Mon, 05 Aug 2024 01:36:40 -0700 (PDT)
Received: from [192.168.1.102] (cor91-h02-176-184-30-132.dsl.sta.abo.bbox.fr.
 [176.184.30.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e9cd4esm127446015e9.44.2024.08.05.01.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 01:36:39 -0700 (PDT)
Message-ID: <f4f5b4a0-536e-4eb4-aa50-8c694d9ed9e7@linaro.org>
Date: Mon, 5 Aug 2024 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ppc: fix incorrect spelling of PowerMac
To: Tejas Vipin <tejasvipin76@gmail.com>, mark.cave-ayland@ilande.co.uk
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240805070150.369824-1-tejasvipin76@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240805070150.369824-1-tejasvipin76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Aug 2024 08:36:45 -0000

Hi Tejas,

On 5/8/24 09:01, Tejas Vipin wrote:
> PowerMac is spelled as PowerMAC (Media Access Control) in some places.
> This is misleading.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2297
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   docs/system/ppc/powermac.rst | 4 ++--
>   hw/ppc/mac_newworld.c        | 2 +-
>   hw/ppc/mac_oldworld.c        | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
> index 04334ba210..3eac81c491 100644
> --- a/docs/system/ppc/powermac.rst
> +++ b/docs/system/ppc/powermac.rst
> @@ -4,8 +4,8 @@ PowerMac family boards (``g3beige``, ``mac99``)
>   Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
>   PowerPC system.
>   
> -- ``g3beige``              Heathrow based PowerMAC
> -- ``mac99``                Mac99 based PowerMAC
> +- ``g3beige``              Heathrow based PowerMac
> +- ``mac99``                Mac99 based PowerMac
>   
>   Supported devices
>   -----------------
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index ff9e490c4e..9d249a506c 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -571,7 +571,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
>       MachineClass *mc = MACHINE_CLASS(oc);
>       FWPathProviderClass *fwc = FW_PATH_PROVIDER_CLASS(oc);
>   
> -    mc->desc = "Mac99 based PowerMAC";
> +    mc->desc = "Mac99 based PowerMac";
>       mc->init = ppc_core99_init;
>       mc->block_default_type = IF_IDE;
>       /* SMP is not supported currently */
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 1981d3d8f6..eef3261002 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -411,7 +411,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
>       MachineClass *mc = MACHINE_CLASS(oc);
>       FWPathProviderClass *fwc = FW_PATH_PROVIDER_CLASS(oc);
>   
> -    mc->desc = "Heathrow based PowerMAC";
> +    mc->desc = "Heathrow based PowerMac";

It seems it is even spelt with a space as "Power Mac".
Anyhow this is still better than MAC, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


