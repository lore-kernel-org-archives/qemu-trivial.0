Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtm4a-0003gQ-4q
	for mharc-qemu-trivial@gnu.org; Fri, 20 Oct 2023 05:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtm4Y-0003eA-Sy
 for qemu-trivial@nongnu.org; Fri, 20 Oct 2023 05:45:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtm4X-00007t-ED
 for qemu-trivial@nongnu.org; Fri, 20 Oct 2023 05:45:38 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53fc7c67a41so1125180a12.0
 for <qemu-trivial@nongnu.org>; Fri, 20 Oct 2023 02:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697795135; x=1698399935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FN7dGY6HgiAH2LqoeC8361ZBfcEd795oSnfhDBnnO1E=;
 b=hZ22rHu6oVnf40W4flbC2agASSCzPDe0zbngY/Vc1dge8sBFe0MaE0bkg1iylXo/aK
 SbfwCXFuQA/5xHjv8l+I/FdWj8yFHNWH6DND0ZnXgcawZTxGYbFsu23au/WeYuyo5/fl
 jviGOBKu/metqE/f5b8H4kZ0KbeleTLNogaANstcamaICTGpgljHMsih5Q2zRFa5boel
 kVA1e+oaK8Iw3VX7gfS8EyMAIma4b+mhKiSvLlvy/X8rWv8afH9QPYIaYS0G1nIij3Fd
 uzuTIl0nW7aWZr2XqaHbLVnjQFxYG/Z6UXU3xyEGCwxEUNY2C5xkqoAnRMRs6DdRu6Vd
 2J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697795135; x=1698399935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FN7dGY6HgiAH2LqoeC8361ZBfcEd795oSnfhDBnnO1E=;
 b=Z8gKzJSh815sngmGl9LV8jTyRRqulACojeUK8ybEtecITYs3Ng6UJ4sb3FelEL6fYi
 sL4jFO/hUQ8m5rwhAS7f0jqKs24oYR65gsri6nVmuFgiV6qbH3yGIk3fwdOk+yl1FYrv
 JoTrFXO7+HPQ92KTrRlmgd1WRr06SGVgMSJGcNRp1SrwGvmbbr+XkrQiuUkjLkOfnq68
 K+JZyO04tyizmolMCF/FUsVwfesnEMuOwO8nIakqkb2cAmDREVvA7SwpRxLRkU5MByf+
 maqweAKmm0CcdI0M6CFhrozkLX8wvB5v6WVtUvWqjNKXYVX/pOY9rjyfz49nRXA/pgwB
 QFOg==
X-Gm-Message-State: AOJu0YzMfGf2JknnMKOrLm8y2OVJEELpSmJ0tObtunHz93FTH8bhsgF4
 ag5/jU72+Lz1c1lAeUZuwQJtJg==
X-Google-Smtp-Source: AGHT+IEm2MFTIdFLZXOy5WWL7uvpc0CE/hG1RGbUXSuTqLLRgnsVRnSJzMIV1yPZOcGB17CZstUj1w==
X-Received: by 2002:a17:906:d552:b0:9ae:705a:8451 with SMTP id
 cr18-20020a170906d55200b009ae705a8451mr4321346ejc.25.1697795135476; 
 Fri, 20 Oct 2023 02:45:35 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906011a00b009ae69c303aasm1129548eje.137.2023.10.20.02.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 02:45:35 -0700 (PDT)
Message-ID: <5bd9b5d7-69e9-4d5f-81a1-c52452616eb7@linaro.org>
Date: Fri, 20 Oct 2023 11:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Extend entry to cover
 util/qemu-timer-common.c, too
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20231020062142.525405-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231020062142.525405-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Fri, 20 Oct 2023 09:45:39 -0000

On 20/10/23 08:21, Thomas Huth wrote:
> We already cover util/qemu-timer.c in MAINTAINERS - change this entry
> to util/qemu-timer*.c so that it covers util/qemu-timer-common.c, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



