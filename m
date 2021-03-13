Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lL80F-0007qy-IM
	for mharc-qemu-trivial@gnu.org; Sat, 13 Mar 2021 12:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL808-0007pg-Tl
 for qemu-trivial@nongnu.org; Sat, 13 Mar 2021 12:24:34 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL801-000559-3z
 for qemu-trivial@nongnu.org; Sat, 13 Mar 2021 12:24:31 -0500
Received: by mail-qk1-x731.google.com with SMTP id a9so27661441qkn.13
 for <qemu-trivial@nongnu.org>; Sat, 13 Mar 2021 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hszrK5X1zKFPcgVtNADuTzMFuaYAiaXIMIPUe65dQ1c=;
 b=kWRtJU1CfgOxtF/8mlp79trUJpUnhoRP19Dy6OCrCVg8O+s8QWGaa9cF5yeO582JuF
 6XlURCtOVuTBJ4xS/lrXQAb0rWgg/fDrJ7eJO+bvGnwtjpdHqBVt74l92O39w+eTLnoL
 TOkWylwkR+K7f0m8yzbd9qTMQBYm3oR/rZysKg9n0I9125VtB5bY++6+CulldPR/p9XE
 pB+AVvBc01VTOYeSSVxx/JDKXIEiRG6rVOfyW4Vt/tyZ/v/d9+S+ToTfo029kFZXrrP3
 y8eLaHIcM2GaltzDSs9yq8J6Z1n0Gd5/oyYTaTHGSg2uuTjd3AoVOy40gQFRiXfvBLam
 mAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hszrK5X1zKFPcgVtNADuTzMFuaYAiaXIMIPUe65dQ1c=;
 b=p1uyFcH1CyeHWt/n6KoLosPJhFsKYthG459cDbVY5TXy/qmak/I6pdX+ojKmAqMmxO
 fRmT806kG5n9DpNFvNyi/JP0cLjBe0nR8ZJv9/AEx6/hryJ3soRLTey80jNeBiuavOEv
 H0uzNryR/ofDjrOc+PE4ywEgSoy9qG4ef606dbIByaI0jCCbj3hQrJJjp1UjBqwT3VAM
 pZyO9FdVWw3vBwNIRmCxa2ZkhXCBb5L0YM+bJmNdOEwW6K/kGzIrA0OF9krs1l14i9th
 denLdava3Ip88CLEmbSAPUq3vVzH9nDzy983zBnp2p3ui338ETLuOdP3+r4zHqDvn+0R
 4ZpQ==
X-Gm-Message-State: AOAM530rypN6kqs3lmrKfTCXwGHgmScJnzt37kMyD+UzI7DKVbFZwOW5
 91bzKoNFUgUeBOl1OeW6VEbIag==
X-Google-Smtp-Source: ABdhPJwF0prQSbFnVEdq5Ijn3i9w9GNTmEZnEwszivkErHQDmTCTmXKl0kbfsaFR0YGqmIwbsMfQbQ==
X-Received: by 2002:a05:620a:2216:: with SMTP id
 m22mr18650156qkh.73.1615656262314; 
 Sat, 13 Mar 2021 09:24:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j24sm7013084qka.67.2021.03.13.09.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:24:21 -0800 (PST)
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210313171150.2122409-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8ae61ec-6b2b-c28c-3aa8-943121503322@linaro.org>
Date: Sat, 13 Mar 2021 11:24:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Mar 2021 17:24:34 -0000

On 3/13/21 11:11 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/arm: Constify VMStateDescription
>    hw/display/qxl: Constify VMStateDescription
>    hw/usb: Constify VMStateDescription

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

