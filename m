Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSg2I-0006L1-SR
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2023 10:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSg2H-0006KQ-E8
 for qemu-trivial@nongnu.org; Thu, 16 Feb 2023 10:19:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSg2F-00005z-7w
 for qemu-trivial@nongnu.org; Thu, 16 Feb 2023 10:19:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso1933452wms.4
 for <qemu-trivial@nongnu.org>; Thu, 16 Feb 2023 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kTCZz8nuCqk5jG9qBxwpjGtlyrE4l6Tf2rFzg2gL1Pw=;
 b=koc1GJrrfru7B+fwMrfGFt11Z9TExoQNmrFL+ytQ8pNd3RtRqvmqnMPfSub8IAaypI
 dEf3m9KOn3+tFFtacNhDHISXbYdkeN+wcPZrONqVRPPPQUWVoD8w9YJ+wD5YvQhnwIIb
 7ElPrrI8kYFReg8IWOf4RJHdekd+9WZuJ9+Wl25Seqv8azydbncd4TugY1tbnNn6iPuf
 FOlfjVXmmIuJCOqJtzaI3uoQJynBJbFVshNEGMFZbFNqXIuJikdlkl/+KXXKSS+i8e/Y
 hFtmdApazg6FiK0Ug4Gg1Hh4c7mRv3jpxUVFhN+UlRqz7KV1ykStBcTXBSe2SfB5qaSU
 ISxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kTCZz8nuCqk5jG9qBxwpjGtlyrE4l6Tf2rFzg2gL1Pw=;
 b=VCzISJyaHIhl4rADF6pdrYvyaQitKoUAEsXloovJWXLu4Be8Kmmf/WUNWIL1UUS7MX
 uyZtlPN15m5jbua7Ox5HJZBPtBWlNgCG+bdj5+QQpRMUIZxALzC8+eTIx0I4OOFt3XTC
 77AYdTrVu6M9X9p9niCouBuuEZPvj493adiNFBXdTnoh8BRP5w4WYUQzBOwzoDejXidA
 edcX7/JvBz30ZvLtW9h9TWPj/8lxu/ZmmKRntX99LXhYOl49xSHsdFrTp/yPrdgtcD11
 OAA6xLZ00/JwNbkMKco0b+S2dewY3RtSodjqqfEUJZSGu58trGWO9aVgx4R8yeVcINPs
 HCPQ==
X-Gm-Message-State: AO0yUKUA18gQ65E9ku8ZheS0e4fULtmzHvT82KLqL+toz7iXLJvc8kMt
 c9cim79gFzRFQP+eaLFODaDLKw==
X-Google-Smtp-Source: AK7set+f3VWtXOJcsbg1/pItqZvKkQXYzXNm+YwpYI9j/Rcea5EM+fPJbV4Pni3V7qXFQXVV6BJ6kw==
X-Received: by 2002:a05:600c:4b19:b0:3e1:feb9:5a33 with SMTP id
 i25-20020a05600c4b1900b003e1feb95a33mr4830363wmp.9.1676560736686; 
 Thu, 16 Feb 2023 07:18:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1ced13000000b003e1f6e18c95sm5664273wmh.21.2023.02.16.07.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:18:56 -0800 (PST)
Message-ID: <5104c10d-7d80-58fa-2352-d4fc4040ff0e@linaro.org>
Date: Thu, 16 Feb 2023 16:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] Do not include hw/hw.h if it is not necessary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230216142915.304481-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216142915.304481-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
X-List-Received-Date: Thu, 16 Feb 2023 15:19:01 -0000

On 16/2/23 15:29, Thomas Huth wrote:
> hw.h only contains the protoype of one function nowadays, hw_error(),
> so all files that do not use this function anymore also do not need
> to include this header anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2:
>   - Add .c files, too (thanks to Philippe for the hint)
>   - Changed the subject of the patch (was: "Do not include hw.h from headers")
> 
>   include/hw/ssi/ibex_spi_host.h          | 1 -
>   include/hw/tricore/tricore_testdevice.h | 1 -
>   hw/pci-host/mv64361.c                   | 1 -
>   hw/ppc/pegasos2.c                       | 1 -
>   hw/sensor/dps310.c                      | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


