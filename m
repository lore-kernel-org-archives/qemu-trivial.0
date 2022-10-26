Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oniK2-00050f-Dw
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2022 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oniK0-00050N-6I
 for qemu-trivial@nongnu.org; Wed, 26 Oct 2022 11:28:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oniJy-00054u-9z
 for qemu-trivial@nongnu.org; Wed, 26 Oct 2022 11:27:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id y16so16501831wrt.12
 for <qemu-trivial@nongnu.org>; Wed, 26 Oct 2022 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=llJSft3OmNHzZnv4t1YE9SRm/1h70y6NT8GRvYoGJow=;
 b=DXXw3Tp0gdtcsGD7j5KEqYQjrQMl9XU/szxqcDxj/mJCsRJlR63Dp6XvAF58xG0b25
 LEegnWV/QYmk0enwb7B3tJXm3fvRHg7xZLf2sRSzp2Y6D2Flwedp1wkzsT1uRK82AmAg
 0MLYV7/8WR19sYpAHA4+dqHKxWSucWz0MWgSk7b9+Y0XrXKNYqOAyIPz5TPiq8s/QZgf
 j3yIBd/Zuv8bbCCJ9+SmXwJnuVXBJxKi6RhAQ7ZuL9z3LPDn31dx+wihGaOl+h0z6uam
 YzvwLWo/SL8Kw3r4i9dWcO9+XYLwi+wuZRfThv0kznbkKWpq7PtyTeTuwnm/Es8jNXaF
 4nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=llJSft3OmNHzZnv4t1YE9SRm/1h70y6NT8GRvYoGJow=;
 b=eAh3Cejn2Rgggcu+N/Qx1zTn5S980ZrDPRbzH9TBElLQZ1IgK318Vv0ZBCki8hMNQ1
 f/TLRySSeb7LHXyZErCWT+LC5rk8ISyqjER8kVi6NG1gm6UwSBmA0qAwF2DxFmlcsUyN
 VcMN7SuN/XqIxt+p9FOeEVJ1jufukLDIESEfg3n7ZFi4xqNozaT9hJSKyuuSZChR6eil
 UWWb5jHydsRskbWbdrQZuq2qfYTKk+7bQwncU2WBLlx4+ZnYyqoKv9cCj7XdRXjrlINR
 qmAACCPR7IeaPF2O7qrzDVQ5BQhFipDnent+9z0wZfX9f1tnRHw4wHYe28wLnM9ty/Aj
 YTAA==
X-Gm-Message-State: ACrzQf2QyjlzTlOIbFS9e+EcxPhlzAh8a1YMLu4kPSwMUFvk5nNHI8Zn
 XKpVsA+pDrO32wgm6FHIYRtDYw==
X-Google-Smtp-Source: AMsMyM7Qnne7//uGT5L0X0uFGlQIdroIa0Ppb4INT7skrgxwWlSxGvnfXqLqL4cToYCKdYZ+rKalcg==
X-Received: by 2002:adf:fd87:0:b0:236:7ad7:d3c4 with SMTP id
 d7-20020adffd87000000b002367ad7d3c4mr8145028wrr.687.1666798076082; 
 Wed, 26 Oct 2022 08:27:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b00236576c8eddsm5413010wru.12.2022.10.26.08.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 08:27:55 -0700 (PDT)
Message-ID: <4dcf7da8-e1f2-6e44-db80-ab2f17341469@linaro.org>
Date: Wed, 26 Oct 2022 17:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] hw/i386/acpi-build: Remove unused struct
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221026133110.91828-1-shentey@gmail.com>
 <20221026133110.91828-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026133110.91828-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Wed, 26 Oct 2022 15:28:00 -0000

On 26/10/22 15:31, Bernhard Beschow wrote:
> Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
> simplify PCI bus tree generation'.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


