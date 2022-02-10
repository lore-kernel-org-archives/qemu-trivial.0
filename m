Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nI4uJ-0006BD-6l
	for mharc-qemu-trivial@gnu.org; Thu, 10 Feb 2022 03:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4uG-00068e-UK
 for qemu-trivial@nongnu.org; Thu, 10 Feb 2022 03:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4uD-0008GN-7m
 for qemu-trivial@nongnu.org; Thu, 10 Feb 2022 03:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644482060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8Z4/u73WcTAbRBQAt6lJZa00PxzNAbHl3tAc4layOA=;
 b=dF1zhQ4YEfTPGju+qBGQhHLk6W1ESsiD8n/VxqHICOaJTVhjTmV0Nkdeq6llNVZtiDMWun
 SY17YOV5jIPxhs7iAoMj7ru39ayI71vUg++5RovH7Ih1dZOSk4WYlfRGIrvgPcgFNXrD90
 To64lAwmLnNPXka4UCu9+dz+YPPohwI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-gDC-SlX_P-6LT4rnPdoOjg-1; Thu, 10 Feb 2022 03:34:19 -0500
X-MC-Unique: gDC-SlX_P-6LT4rnPdoOjg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so2163736wra.16
 for <qemu-trivial@nongnu.org>; Thu, 10 Feb 2022 00:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E8Z4/u73WcTAbRBQAt6lJZa00PxzNAbHl3tAc4layOA=;
 b=Sy8l/PvH+dgvc+sR1EnYEvvQVijf5cKl/6guykNMtDupnEKN/PLqbgR3+r4uWdJgU5
 adhdl/EHRlCMbvW8Hqf74Jte0dVv1GkNMxYrjGgpOeiroh+61wshoaXDMqZ1q5MFxQcm
 fkxsRHpj8fkG2l+n+wRHmE+h/SLpue6eJgm0sftCypIEqeJ0AJuZQ/7bH7grSv+A7OW+
 ICtuIUscJRpdz5jz1Rn5Q7Gh9f2pcLY6WOnPDipy93uWSzm1JNlMgec08qrjZYg93BiA
 KgoOTKwR+u0RjAiSo3ACZFrX4zqP0sbu4AGsD8dUjYGQB9jNBgtacdPKkr9orhkbLmN0
 af0g==
X-Gm-Message-State: AOAM532OwPUehPqBUIntQaJihWQbhAZ7i0PcuRopAq0p2+49HYPqir4/
 aawbNosLrjMkZps8j4U3om6PGuUUjThsiCZNJ2zIVlOp9B8l7RIQ2QKqkm4ROfirw7Ybc9sGk21
 /esfYdlIXWTgpsHeYzA==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr1487036wri.193.1644482058339; 
 Thu, 10 Feb 2022 00:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1A98GhlTzYjKjcAoFmocTOEF3tdCkWO+1GT16fi8ZrsI55mXkFGzNQfrUIRpMxoShSrc/6w==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr1487019wri.193.1644482058112; 
 Thu, 10 Feb 2022 00:34:18 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id f2sm19431178wri.49.2022.02.10.00.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 00:34:17 -0800 (PST)
Message-ID: <3d648897-99cc-4078-0016-0b4a0856dff1@redhat.com>
Date: Thu, 10 Feb 2022 09:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/15] hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220209215446.58402-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Feb 2022 08:34:26 -0000

On 09/02/2022 22.54, Philippe Mathieu-Daudé wrote:
> hwaddr type is defined in "exec/hwaddr.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/m68k/mcf.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
> index decf17ce42..8cbd587bbf 100644
> --- a/include/hw/m68k/mcf.h
> +++ b/include/hw/m68k/mcf.h
> @@ -2,6 +2,7 @@
>   #define HW_MCF_H
>   /* Motorola ColdFire device prototypes.  */
>   
> +#include "exec/hwaddr.h"
>   #include "target/m68k/cpu-qom.h"
>   
>   /* mcf_uart.c */

Reviewed-by: Thomas Huth <thuth@redhat.com>


