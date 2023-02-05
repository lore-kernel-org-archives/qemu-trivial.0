Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOd1g-0003eR-Cy
	for mharc-qemu-trivial@gnu.org; Sun, 05 Feb 2023 06:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOd0z-0003at-2H
 for qemu-trivial@nongnu.org; Sun, 05 Feb 2023 06:17:26 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOd0w-0000H6-RP
 for qemu-trivial@nongnu.org; Sun, 05 Feb 2023 06:16:56 -0500
Received: by mail-ed1-x530.google.com with SMTP id m8so9040065edd.10
 for <qemu-trivial@nongnu.org>; Sun, 05 Feb 2023 03:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LbUJRzKVzG9jIEGko/QYf3ZEh7EyE8+2AKE+759r7xI=;
 b=Xth4IUM4lpPV52SEgUvb5nPOeT0thMbbRs/7tjhQncaaj/Ox4ZzE7hjiBUiB3T/B15
 bWT3VIEnz5Iuvlrv9g4VEKLkUHbiUMd91z4C3GMXRLJ6eddZ4rBD3XN4sNa9LBRGKeWM
 3lsTMu/YbjAcnfNyOiTsQ/peB96RtjMSAxvoEPBwSw8UIqLTHB5fZ6QNUI23SsNDefFL
 4jHcMOlNX6ICC5NSqp+fbK9o+PhBb5Lz+qYXx5ESLV3V6ZWeDEspavfek0vm7dXkZ0vV
 t8K/Q7b84xO0b94Qr5RW9J7jWiLVDBenN9LVRYcaiNiBgbcEm3e1O+6YEIIG4+FEcQlB
 wdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LbUJRzKVzG9jIEGko/QYf3ZEh7EyE8+2AKE+759r7xI=;
 b=UgUqeoMKQlH7uCU2+yLIRezCsZZhhtMJlSSnkPnI02VoPajtYU1lECv6bIH3mQiWpq
 YTcmRyAvmCd549GeuAvnuMXi0mpJq7gVi2mSMQ8iOgnT3qFog1Yu78jEZvr89KjdEKO+
 vtjqc7QmzS6LMbDjR8RaRRuI4Ib2FZRUo315GSvP2tMGE4TR54k+5owOJLpKO5Y3MJLW
 yrxpcmqqmYEtr4nj/m0hmTIK4ii3coPjwlbSAI051TgAGYo8+I3wtS/udNAUtFrs8uaG
 pNktDRA3StTpeMs0VoJ2ri7TnvZCwTM+FvSOjLpsTVTbAqKPkE0N4SVlB9o4/2XEUfqH
 lZrA==
X-Gm-Message-State: AO0yUKVKrMlicCuRJD+bSXhSEdqWAamdVQQ9aDjWbsGiaOiD0fRrXEuj
 6PpU3BDJ6/S14oFaw8M4VeBp6g==
X-Google-Smtp-Source: AK7set+5sxNO1G/Se/7+Aqz7/k0dZER9PNsfuUjAd5fmbLcUjEBg7kFbtEJwhxEgDXUgXry/Pviyfg==
X-Received: by 2002:a05:6402:3488:b0:494:fae3:c0df with SMTP id
 v8-20020a056402348800b00494fae3c0dfmr19465452edc.12.1675595813014; 
 Sun, 05 Feb 2023 03:16:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 er18-20020a056402449200b0046892e493dcsm3635375edb.26.2023.02.05.03.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:16:52 -0800 (PST)
Message-ID: <c92da8dd-6225-fd24-2ee9-935d779428b6@linaro.org>
Date: Sun, 5 Feb 2023 12:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 7/9] hw/pci-host/pam: Make init_pam() usage more
 readable
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
 <20230204151027.39007-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Sun, 05 Feb 2023 11:17:27 -0000

On 4/2/23 16:10, Bernhard Beschow wrote:
> Unlike pam_update() which takes the subject -- PAMMemoryRegion -- as
> first argument, init_pam() takes it as fifth (!) argument. This makes it
> quite hard to figure out what an init_pam() invocation actually
> initializes. By moving the subject to the front this should become
> clearer.
> 
> While at it, lower the DeviceState parameter to Object, also
> communicating more clearly that this parameter is just the owner rather
> than some (heavy?) dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/pci-host/pam.h |  5 +++--
>   hw/pci-host/i440fx.c      | 10 +++++-----
>   hw/pci-host/pam.c         | 12 ++++++------
>   hw/pci-host/q35.c         |  8 ++++----
>   4 files changed, 18 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


