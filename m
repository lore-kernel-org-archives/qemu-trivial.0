Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6gfu-0005tS-6G
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2022 18:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gfn-0005pU-VC
 for qemu-trivial@nongnu.org; Sat, 17 Dec 2022 18:32:56 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gfl-0004O0-UG
 for qemu-trivial@nongnu.org; Sat, 17 Dec 2022 18:32:55 -0500
Received: by mail-ej1-x633.google.com with SMTP id bj12so13860668ejb.13
 for <qemu-trivial@nongnu.org>; Sat, 17 Dec 2022 15:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJBWpFPz9Gn0Zq0uuU3uOpARGDx+9nGXGOsTMP6eo/A=;
 b=fl1ATgwgCbjlFzO/pKFefr7ule/XFeg3CFxbvJOQwm8qJURhppwUpc8VbWmteqTdJb
 kkpk0dr3pXHZnIk1VAGi4GKlSauoZloo5G67A7mPK6bcVKDRE5ETHgrPLr0l9fRhLSUh
 8CZUre2Tg4LzY/W6LpF6zUZsT2iqKdaRSRB8o7Plbb+QHvu+HZZmrlgxuRZ8seMmX8uy
 c5zpvaw2zzQxUpQJhQrTSnrcw8gXAuF/v99+QgxHSOpnBWhRfAs8R8riklU1q+8nmJrr
 Y3XbtSPnjd93caZFFlDouCW27j8nGJfO0Gf5qzRXiWp9vSIyCZ/FDXq8x+2gJkgI/dRe
 IJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJBWpFPz9Gn0Zq0uuU3uOpARGDx+9nGXGOsTMP6eo/A=;
 b=m3VzRd2i6HgAFoj9z1P7E1nCN1Gu0ddIpL/rHr00UYEssjL7ArO/0cdm5sFwWQIJSm
 slvxIFfeFn7WI+XYf/bjihkJF4K50t3JwV/aOPY1DsCVl3XO9KRq6mI6A7LR1wU8oshd
 TX6SBKbOHGAMy2nw/E8Dl8oQr9IeaarMNTFdcrKeWCG0HB1RAomTQ08sFWWz8dZuQQaz
 fhXyRWjGwymixP1nv9KVYyp/raa+OrME5qIWTz1N5YCZR0NdEES2Ug8c/lpT0uP5AXex
 KvzDV/Kxkwxc3JHXrQmlFlnpV5exRYNAlMjzUk0fOYkoXXv8i3FmwIazhYReuQwhaQfJ
 THhg==
X-Gm-Message-State: ANoB5pmXFAer61pD6WUJzaQQh0SLGRFf9hvsnsChuMDmPvLo6Uxikm7N
 0yNBZuyJOqRT06g1ZuxzqRNf8Q==
X-Google-Smtp-Source: AA0mqf7kVLnOBhfj5csGFXR+MteHRgBrKxrlNrL3qfl7Sy7P+GUyJk040G4E4rLlKt/VBUe3v7ocoQ==
X-Received: by 2002:a17:907:d12:b0:7c1:54b9:c688 with SMTP id
 gn18-20020a1709070d1200b007c154b9c688mr37314773ejc.60.1671319972337; 
 Sat, 17 Dec 2022 15:32:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 et8-20020a170907294800b007ae10525550sm2478889ejc.47.2022.12.17.15.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 15:32:51 -0800 (PST)
Message-ID: <476e90c9-92c9-8721-1d3a-052778438d71@linaro.org>
Date: Sun, 18 Dec 2022 00:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/7] hw/isa/Kconfig: Add missing dependency to VT82C686
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216130355.41667-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 23:32:57 -0000

On 16/12/22 14:03, Bernhard Beschow wrote:
> The ACPIREGS are provided by TYPE_VIA_PM, so needs to select ACPI.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


