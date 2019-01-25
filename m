Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn4Vi-0003Dp-7p
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 11:39:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4Vg-0003CA-31
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4Vb-0003m0-3K
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:39:14 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:42433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn4Va-0003ki-EM
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:39:10 -0500
Received: by mail-wr1-f46.google.com with SMTP id q18so10966420wrx.9
	for <qemu-trivial@nongnu.org>; Fri, 25 Jan 2019 08:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xnQ8Mhp4Tlel3cXNx5LdEzr+uJHYm3KaTuodp3RT4Ko=;
	b=nN3EIPxO2erZ/W4ztajxjGw5js+QgVmg7adD5M+kn7QgQQ3i07IKZF5nugwLq7T52w
	ZcL6GQqZpVjasKxJ33Kf7+eDp1i6BWfQbq9bWQ70DIvR2aX4BCLxe2S4cg5CV85PNufi
	nUkTKn8ud2xiszN/RU4w1Xknn0SxW7rhE1s49LFTp/pDsrJAFp3N4O50k9yaUFMj796/
	a327T0Vm6XJ1IRv81ksDMcrUuEQ/aSmfDQ9EK2aL1JV5+oEBXrxqA8+U5tEnCTEmqxDO
	c2dUg2oGgm/FnmwPaObD2bXCgikvv78+JGAgTJPbwr3PD+el/sPa21qh+LtFXyIB+Blh
	y2yw==
X-Gm-Message-State: AJcUukftExvFCj8Hh8vyMOHxm/jmzH0ulrTURMLoKZvv+TxwulX+RIzT
	0GfsN0AhnP30Wa745BnpKx/BjA==
X-Google-Smtp-Source: ALg8bN44icOHTl5LjFagoXSv6Y5Vd3bptjFVhHOSgM6fajTeG03GwhNu7k2KgHXRAWVruKWzq8+UCg==
X-Received: by 2002:adf:91c3:: with SMTP id 61mr11781511wri.324.1548434348142; 
	Fri, 25 Jan 2019 08:39:08 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	200sm67201008wmw.31.2019.01.25.08.39.07
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 08:39:07 -0800 (PST)
To: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au,
	qemu-devel@nongnu.org
References: <20190125155630.17430-1-sourav.jb1988@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <634199bb-6444-a5de-2234-1895b02b5615@redhat.com>
Date: Fri, 25 Jan 2019 17:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125155630.17430-1-sourav.jb1988@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.46
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/nrf51_soc: set
 object owner in memory_region_init_ram
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
X-List-Received-Date: Fri, 25 Jan 2019 16:39:17 -0000

On 1/25/19 4:56 PM, kumar sourav wrote:
> set object owner in memory_region_init_ram() instead
> of NULL.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/nrf51_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 1630c27594..3a1c7e200c 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -89,7 +89,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
>  
> -    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
> +    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
> +                           &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
> 

