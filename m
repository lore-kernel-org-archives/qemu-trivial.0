Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOcy9-0002CK-Us
	for mharc-qemu-trivial@gnu.org; Sun, 05 Feb 2023 06:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcy9-0002C4-55
 for qemu-trivial@nongnu.org; Sun, 05 Feb 2023 06:14:01 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcy7-00082F-4D
 for qemu-trivial@nongnu.org; Sun, 05 Feb 2023 06:14:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id hx15so26751395ejc.11
 for <qemu-trivial@nongnu.org>; Sun, 05 Feb 2023 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k60XqSjdD4hzSE+JIcYGghl2/ztRY94BciHCglF4W2Q=;
 b=GYVlNnHzLs4Inn/znZTP6jHbB6SjqbIGNEv6rj+uU5tMkPbnUKt5WMedeX3FoQlytx
 uEA/hKPBeqqvbdyPF8Jj4LD81WHR85iuw6M4vslUMxEKo9ARorDhlsOr72oV2Wy6hTkA
 3qZ1dIa3e2D/1ZsxT4uamRArrZNgc+9uuLtEIKchydvUtTobBJKnSYCqP416Jsnn+DmS
 LIza2bdn9rsx8cTDpXWAL9PCikDUvOgfgyM2uzX7ZpU5RUGIa1nw62Qb3CXNHTlUgtjg
 3huMkH9NJrTaxtLJ+0EivsGIRduKGd0jXKqylx77FJcvqjVwo5QO3SiFwH5duGxV5d3k
 tjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k60XqSjdD4hzSE+JIcYGghl2/ztRY94BciHCglF4W2Q=;
 b=xe1QMSBgFGH1TVsMBEJ2Y38Gh6mAZtjWaxANfuNtTNBrMHs+BbP/0VNR2J9zNVdwgv
 sQ0X8EeYerPP4d/HL8i/g38MAONKw/Ts1Vx3KAxawvu3hOHm/yVUlB4pMhHWEBx8fMai
 SwH5K7NWLSxEXk8ioc6DOkr3Gvd1F0YTsuxUY2ym5jE1WvNktMFjFbhsu/2QIsNjcsjv
 4BOUY63tq+ROPiZnmg7gkN4XKdCYIutGCZVlK6iocQwTtCRCCs8luHZkaLaJzMK2mJEB
 lEJRU2YPCcRpgHVSWqhhDCL1jZoi41cpGRFchLkbkGwnO9DFF1l7jS4yHKncOxQAkEZC
 Kg/Q==
X-Gm-Message-State: AO0yUKUVKX+WZ4AKpDyv+ukH1dVo8q+YXdDi+3i55asaTgLiD3SfzcC4
 1joFcDDloG8D7CxRPvntR9w9aA==
X-Google-Smtp-Source: AK7set/vC4Wz3fMiQlJ90qd6OMmSxeutjqQD3aSw+HCp6BwNoF8xm31oWoDi9b1+BweChOSPvM0oRw==
X-Received: by 2002:a17:907:cc04:b0:84d:4394:e8e with SMTP id
 uo4-20020a170907cc0400b0084d43940e8emr13542205ejc.41.1675595636737; 
 Sun, 05 Feb 2023 03:13:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a50d595000000b004aaa09d50adsm1850088edi.94.2023.02.05.03.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:13:56 -0800 (PST)
Message-ID: <f0dac191-f8d7-635d-9431-14c1b4e1207a@linaro.org>
Date: Sun, 5 Feb 2023 12:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/9] hw/i386/pc_{q35, piix}: Minimize usage of
 get_system_memory()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Sun, 05 Feb 2023 11:14:01 -0000

On 4/2/23 16:10, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


