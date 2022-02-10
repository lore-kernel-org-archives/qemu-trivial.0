Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nI4mc-0001vB-Cn
	for mharc-qemu-trivial@gnu.org; Thu, 10 Feb 2022 03:26:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4mY-0001q6-Pr
 for qemu-trivial@nongnu.org; Thu, 10 Feb 2022 03:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nI4mV-0006p8-Hk
 for qemu-trivial@nongnu.org; Thu, 10 Feb 2022 03:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644481582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hseZq7a2lxPYo8hUFen1q3BMsz5xUpfzza9DtD2LoHM=;
 b=OUMOqfF1Oe3aGz67WnGU1NFzii0G0Y0Yx0Yu6ABUueKM9hUlbK0dIJ8/gQsXWhJO47EJa4
 /vz1sMTiB4ypV83nWIEtrVI4uTyUx27/NojGvlcXb2zQXH1cge9cULnVKDNANSbq7/tDrU
 8yPCa1szdqk8pfH4hHkmqG53n7DOp6w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-rDvZ9ygrNNedUFPBwlmDsw-1; Thu, 10 Feb 2022 03:26:21 -0500
X-MC-Unique: rDvZ9ygrNNedUFPBwlmDsw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so2161330wrb.4
 for <qemu-trivial@nongnu.org>; Thu, 10 Feb 2022 00:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hseZq7a2lxPYo8hUFen1q3BMsz5xUpfzza9DtD2LoHM=;
 b=lt0Yp8KoZjt9VwxgGNT8j4nMa89GgsDa81gPpgtH3EzLfkMZCVlog3q3P1VQ81DF+U
 iQx5djDrjCOcPDFE1JuIVm01vkVeMvNPYg+AZzgQ3aa85dcKfcgirkoJlLnSdjU9huEK
 3/+fMp/hihtWEEEVbaPI/0GREcjxNDufcY/l4CfTgQMAK5lQlDsNjLzyRC/C83UAX1Or
 onsiosGz7pnYaIsZoc1DNv+SokRj4fRxDHQqJqEHB0fl1P9HI4FaD+fVdAQO7M5gTQBg
 c7bHhkVN/4Df5fZhoddzZMiNW4ihdJmB+rDwLGMuScB15q4madniQMSmiwKaAR0b5NNQ
 BMaA==
X-Gm-Message-State: AOAM530OYaMHDH4SHdu/7e688tXpHKZN+U0sq3TyP3I7y65YQzmfnUGQ
 XSuVpymhABc/ZYlahk69f/pLYGBjGJywlpAgluwI818599PdEukntUPNW/2vRg92HpUpfdJitbZ
 1TQW60vbdKDJ3AHbk6g==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr5569459wrr.530.1644481578237; 
 Thu, 10 Feb 2022 00:26:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTKGYjCKh4Mi7TJY2FgElvQ5l8lN+K0hTqmqZjpjUKHh7+9BMlbLMJ2jOTRru2Y686GxVi3A==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr5569444wrr.530.1644481577984; 
 Thu, 10 Feb 2022 00:26:17 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id p27sm1431324wms.1.2022.02.10.00.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 00:26:17 -0800 (PST)
Message-ID: <10c05761-6422-48c8-4c53-9e9378b98a4c@redhat.com>
Date: Thu, 10 Feb 2022 09:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/15] hw/tricore: Remove unused and incorrect header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220209215446.58402-4-f4bug@amsat.org>
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
 SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 10 Feb 2022 08:26:27 -0000

On 09/02/2022 22.54, Philippe Mathieu-Daudé wrote:
> TriCore boards certainly don't need the ARM loader API :)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/tricore/triboard.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
> index f3844be447..094c8bd563 100644
> --- a/include/hw/tricore/triboard.h
> +++ b/include/hw/tricore/triboard.h
> @@ -21,7 +21,6 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "hw/boards.h"
> -#include "hw/arm/boot.h"
>   #include "sysemu/sysemu.h"
>   #include "exec/address-spaces.h"
>   #include "qom/object.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>


