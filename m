Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQSgb-0003FI-Up
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2023 07:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSgY-0003Ee-6K
 for qemu-trivial@nongnu.org; Fri, 10 Feb 2023 07:39:28 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSgV-0003un-Vn
 for qemu-trivial@nongnu.org; Fri, 10 Feb 2023 07:39:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bk16so4920242wrb.11
 for <qemu-trivial@nongnu.org>; Fri, 10 Feb 2023 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aNsvsSAqwcg+4xbViCFC+/j3Ki0z4tY5GQRWMiE6ROI=;
 b=R7VLD82W8+phs23c/3pOt7HebcDyz+RAnfrRyQq+/IwpVordqzLpC6OMNIK3bIKu4V
 3dBdf3Na0D0Np2537n9KyAozG5qEKHhMe3+gcTEnjWIXIe2XclezffZQl/P3CW7BZ6DO
 bL9bfYf27Q9vqpjUXUlbr/sdKfz9MJNuL8bjuD3Y8UKGMHrqbfQ3h/NyzW13COQtyxdZ
 y9YSkACCk7cU85QS19LP5Aqqf+smJw8vVDGvxuaZQrmijIm5ERZfvu+vAQYfi5cFLaDP
 pDfTP2buKFkPu1U9tM9o0jTUvs2bnQeJQnJEk/IrKVAvyip/vl650A/IBrLW+LQ0iqTa
 sAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aNsvsSAqwcg+4xbViCFC+/j3Ki0z4tY5GQRWMiE6ROI=;
 b=avx6/NYLasnEtB7NeJJGKuOdrzQrqkrcVhOfxQs99hRw1HLZ5m0a1ba2YRBqD/ZlZU
 o3LJDHss4xUS5CfiPRfJnptVnSy59QaF6cQY0mrHUEoXTDlL6vnEWWptQ2DFyhbPSXZn
 oq2ET/7X3Wo8csd43xa/SJeAOjdMFgrHu9vw5GVUm13twq00enHytugoJbCH/Svi4szy
 jKAzVHMb+DL3L+vzd6D4gKRpDB28Es4rBINYZVhGXcueCL5MauRYO2C3PpsMDNDyZ+Zb
 5chlsmuwuZAuNCx7Fo5BvVtTmMnRoMe5oVSdFSV3ne4WJMTOGzkZaPvJuvFdzoM8VSwh
 Tjew==
X-Gm-Message-State: AO0yUKWcznMrydI0LGpnRVto6i1CDunBuo0bhc2Y9X5rB8m6TA57vu0i
 HOve5iReIykPkQsUoRXVqSHRXw==
X-Google-Smtp-Source: AK7set/oWm69VERfmHNj+gfJ47eo94tn/HuBH9/yrAlsYlU6MsTFu0zMznyFpMCL0PciPL+FYS9KAg==
X-Received: by 2002:adf:f350:0:b0:2c3:da3f:1def with SMTP id
 e16-20020adff350000000b002c3da3f1defmr15690303wrp.7.1676032762461; 
 Fri, 10 Feb 2023 04:39:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d15-20020a056000114f00b002c53e8d86basm2946009wrx.83.2023.02.10.04.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:39:22 -0800 (PST)
Message-ID: <a65c42ff-6e96-1051-558d-91c84432b5e8@linaro.org>
Date: Fri, 10 Feb 2023 13:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC PATCH] Do not include "qemu/error-report.h" in headers that
 do not need it
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230210111931.1115489-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210111931.1115489-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Feb 2023 12:39:28 -0000

On 10/2/23 12:19, Thomas Huth wrote:
> Include it in the .c files instead that use the error reporting
> functions.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   RFC since it's more lines of code - but I think it's still cleaner
>   this way.

This is less pressure on the various .c files including these .h,
so it is an improvement IMO.

>   include/hw/arm/allwinner-a10.h   | 1 -
>   include/qemu/vhost-user-server.h | 1 -
>   include/ui/console.h             | 1 -
>   hw/display/vhost-user-gpu.c      | 1 +
>   hw/display/virtio-gpu-virgl.c    | 1 +
>   hw/misc/applesmc.c               | 1 +
>   ui/console.c                     | 1 +
>   ui/egl-headless.c                | 1 +
>   ui/spice-app.c                   | 1 +
>   ui/spice-display.c               | 1 +
>   ui/udmabuf.c                     | 1 +
>   ui/vdagent.c                     | 1 +
>   util/vhost-user-server.c         | 1 +
>   13 files changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


