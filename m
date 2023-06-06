Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6XXV-0005iF-1t
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2023 10:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q6XXU-0005ht-00
 for qemu-trivial@nongnu.org; Tue, 06 Jun 2023 10:20:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q6XXS-00076u-KS
 for qemu-trivial@nongnu.org; Tue, 06 Jun 2023 10:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686061198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLk2DYumS/fBSJ0k9e3ySyuc3BsI6QIzXl05sEIrU3k=;
 b=g/U0a6tADEu9Nnt4z7oqXuuIxceJiyLljx6yNWRdXlvBjO2StE9RKG8pxgB40yumAzO+SW
 mDIsHNLfHC8Zz+U/7l2t20cZdinHZb/viwjjHHcBBK2f15NUGjyp5DS0WFRwwoeerSmrly
 aZoaSbRX1Ap8O21E+j6htDdrEIddRa0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-pWNQYT2qPluB2llO-7Qqhw-1; Tue, 06 Jun 2023 10:19:53 -0400
X-MC-Unique: pWNQYT2qPluB2llO-7Qqhw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f603fed174so34496355e9.2
 for <qemu-trivial@nongnu.org>; Tue, 06 Jun 2023 07:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686061191; x=1688653191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GLk2DYumS/fBSJ0k9e3ySyuc3BsI6QIzXl05sEIrU3k=;
 b=PDTTiAWOqjJ/9JTNb22qPB1QafMKP8wac6Un3e+pi656Z0GR9wY3GaEw7oK+r0jn+h
 noRKfI2yjH3cCFtTiPneHPGMb0bz+kzUyNJeie2ksk4h++uJ7L2ZtsX6KXTI5U8+H0Ee
 c9+c/Imk2F9fRaTRXgueIxGAI6vYpEqNhySaYGBIbVeJ2U6/CZWa3c8WjlGLjQ9k6B6W
 1i12rPYMOiABD83NaM/VhKI2zq92SLIXK2l6l0X/B4GaeEUmeK86ArCJhpe8z/S/js2s
 nuGaDTYmDv+LL6aQ5j1CkqbDYmU6WpmA7JsQp05kUMobvc8Z9wwfe6kM3EHJjaHu9YxE
 Yc8A==
X-Gm-Message-State: AC+VfDzngY66B51cTEiurr2vOukUXCOCZmP7KSTDb9umrvXOoLEYnoCa
 bWrwwdH5DLJilqL58GJaEvXbUYolxFYiJZz4ikdI/n0i9X7Bm9q2kgHMD/mCCKiSQo/AUt4/kUQ
 27MRkZm2qKzL66GvixA==
X-Received: by 2002:adf:f74e:0:b0:30a:e92c:25fa with SMTP id
 z14-20020adff74e000000b0030ae92c25famr1965957wrp.60.1686061190906; 
 Tue, 06 Jun 2023 07:19:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xt2HY226Iy0cb/gBSyOTyICtzgHB5q/+TaPI+PNJv3p2lveI2ozN+1sqg/jUSbnweRkuBwg==
X-Received: by 2002:adf:f74e:0:b0:30a:e92c:25fa with SMTP id
 z14-20020adff74e000000b0030ae92c25famr1965940wrp.60.1686061190642; 
 Tue, 06 Jun 2023 07:19:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-114-92.web.vodafone.de.
 [109.42.114.92]) by smtp.gmail.com with ESMTPSA id
 h7-20020adff4c7000000b002f28de9f73bsm12688981wrp.55.2023.06.06.07.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:19:50 -0700 (PDT)
Message-ID: <b08eedaf-120a-8c05-c946-b65abe4741c9@redhat.com>
Date: Tue, 6 Jun 2023 16:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/remote/proxy: Remove dubious 'event_notifier-posix.c'
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230606134913.93724-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230606134913.93724-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 06 Jun 2023 14:20:00 -0000

On 06/06/2023 15.49, Philippe Mathieu-Daudé wrote:
> event_notifier-posix.c is registered in meson's util_ss[] source
> set, which is built as libqemuutil.a.p library. Both tools and
> system emulation binaries are linked with qemuutil, so there is
> no point in including this source file.
> 
> Introduced in commit bd36adb8df ("multi-process: create IOHUB
> object to handle irq").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Note, --enable-multiprocess doesn't seem to be covered in CI.
> ---
>   hw/remote/proxy.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 1c7786b52c..2052d721e5 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -22,7 +22,6 @@
>   #include "qom/object.h"
>   #include "qemu/event_notifier.h"
>   #include "sysemu/kvm.h"
> -#include "util/event_notifier-posix.c"
>   
>   static void probe_pci_info(PCIDevice *dev, Error **errp);
>   static void proxy_device_reset(DeviceState *dev);

Reviewed-by: Thomas Huth <thuth@redhat.com>


