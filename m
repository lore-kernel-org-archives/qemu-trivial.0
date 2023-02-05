Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOcxQ-00018j-Q6
	for mharc-qemu-trivial@gnu.org; Sun, 05 Feb 2023 06:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcxP-00016R-OK
 for qemu-trivial@nongnu.org; Sun, 05 Feb 2023 06:13:15 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcxN-0007ut-8B
 for qemu-trivial@nongnu.org; Sun, 05 Feb 2023 06:13:15 -0500
Received: by mail-ej1-x636.google.com with SMTP id ud5so26860332ejc.4
 for <qemu-trivial@nongnu.org>; Sun, 05 Feb 2023 03:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+oRyhgExI/KbxqxtrqXfZJHRQv7Vd6I2KJfLz7/LbIM=;
 b=U8GgHb04OAdp4GnRPbUvUOQnswIhp2NTmrcF7+xa0ZjD9lxPzJefJZhnjM6EYgsEbc
 qe4UGjfVZiIVxnkhAsHKCfXEP+uZ/AJY0GNyYuU9qFGx1U29qUfMKxVl1VX6uTkQRVed
 tdTFGFp4NZsV7HRZ+iM7TTyCl2E75zqxRqPKagr2x89CcxtsI6ygNcDB9dHdywSWZ0vp
 /YpYHsAejP/9moloyMpvp4N3chRdjTkAtGEjR1JfU5s3hY9mKh7am8EZatl8GLrOmYXO
 En9s7C1jN4fxHqHBqSsVKYlHFxG3J4exJya7v5Gmi5drzIAN+KNY5d2s+60BnS8j7pEs
 qJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oRyhgExI/KbxqxtrqXfZJHRQv7Vd6I2KJfLz7/LbIM=;
 b=w8FgfUG7NpiJiJvILBVBFNcZpOZBIdizHO49+K+EJmNjXgFnZxjEiOmbQnL2zLmBL3
 VnaS0hQAmJam2l/RkbgeyNNG97bzIESasIIAJ362OdGexXlqDKwHA5tRD0bT7w1UdJte
 zOvCCAmJW5jTXZTdbHqviR0B1bWj3WDxp43uAqLlKPfshWmglwf/aItd8x387r6wfjDA
 HdlFsKRp0xK29kj6MMOvSe1DimaO+WMBiVS1BVaEYjvGx0VY3J4IomMwiBavWGA9AH9n
 1SjZHtwJqLoBq9aprWIjWLn4czzk96wFAaBVCgfexgwGt1hfaOSusZq8nYMrUG0mQsIU
 q9gA==
X-Gm-Message-State: AO0yUKVYWZlWv4H6eoF0IVkq52wpa5AlXDL91P8ZU0rTFlbP6DZiGA2w
 /Fa/68eP6lMD7/YLD3KdLV2ulg==
X-Google-Smtp-Source: AK7set/uozg32OTr0laNc61gEG0Uic1ct2ZoA7NqmoLGArIh1ja+D17aBMXGn16lTHojiREH4m5GLQ==
X-Received: by 2002:a17:906:579a:b0:86f:fbcf:f30a with SMTP id
 k26-20020a170906579a00b0086ffbcff30amr19520615ejq.58.1675595590678; 
 Sun, 05 Feb 2023 03:13:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a170906148c00b0088cd8f7255fsm3984119ejc.48.2023.02.05.03.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:13:07 -0800 (PST)
Message-ID: <64288103-4d6a-4fd9-d832-e55622f767d7@linaro.org>
Date: Sun, 5 Feb 2023 12:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/9] hw/i386/pc_q35: Reuse machine parameter
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
 <20230204151027.39007-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Sun, 05 Feb 2023 11:13:16 -0000

On 4/2/23 16:10, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/i386/pc_q35.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


