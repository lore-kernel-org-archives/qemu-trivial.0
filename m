Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6GR3-00079A-5l
	for mharc-qemu-trivial@gnu.org; Thu, 13 Aug 2020 12:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GR1-00077m-As
 for qemu-trivial@nongnu.org; Thu, 13 Aug 2020 12:50:35 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GQz-0003uJ-QY
 for qemu-trivial@nongnu.org; Thu, 13 Aug 2020 12:50:35 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ep8so3026062pjb.3
 for <qemu-trivial@nongnu.org>; Thu, 13 Aug 2020 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i2K9mt7dh4D4JxgREuxwiNIjee65y3eOlv8InxgRacI=;
 b=Zw6A/g+hk+rGEB8wJyWDcUnbj7qL/iCYLcjXJaWb6q8RaZ5tfF2Y3yZXBUJ9P0ZNE2
 yF4AxCdi661GMnmWrCA1JsYUtMPLh9pqO46rDTCNA9r5EOpLZj39LuwjsiRVP6JilYN7
 9QiC5OsJbjIs5rAmNV1WyLIlyNtGUI/JWaFPG5xTOshHvqrlAIhLhkgniPMlT3lOBXon
 PuMCe+LKREsV4H4mGyBmvxe6/mU7ibpz3Jokd7fvn0N6VFg/+3DW290x2rujTC7kEFNK
 FlnPRMf7X5zCfzy1sO7AeyD47yazBEwhfq2mvrNYWRt+RD9LbGfrbElpbh/H+Ac4CpjW
 rvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i2K9mt7dh4D4JxgREuxwiNIjee65y3eOlv8InxgRacI=;
 b=QvbAdvJf0ZQj16sOikCkjAEGpruZYhHpgCyxzWIiz60hpAiyBetaC0bqZPBmSc656y
 P44I/iH2Kxfe5ykweZ6nYoHVEOgXJ/eINBiLn0b0HDJYVBWXsZ/k4HsXhBkdkGg7BJCu
 sNxpqBMQ23hPt/TirhRc1cIWnBcUCkrQsZe/e0tVxh0/BJefMK+8881YwHCaHBDpRs2b
 DN/7UXef93pMBADvtxkE/OKPqJuSUqSEVdQdQLVWKA4ruAL4oujmy1mZyjduxUdjRPYG
 izkhbwjsAXruWR2g3c158H1/KAD2O2MYqFHqx6umfOLOyzYC+wZ67owXzMG1B/wK1HGL
 KHPg==
X-Gm-Message-State: AOAM532QVsqDdB6XYUFqs95BOkPM41RqaEYENC7IT/1ePshXau4iCG5O
 YsH6vaKh+7Zkwd/KLSdiZYitCOanhFE=
X-Google-Smtp-Source: ABdhPJz9KUbe/kV7tB1WIBpESqDFMFddlwmNG5KmnWrsReQ3Zu6uWyBUWtg9uhtGwtKytkCeJPHbcA==
X-Received: by 2002:a17:90a:2525:: with SMTP id
 j34mr6567940pje.208.1597337432285; 
 Thu, 13 Aug 2020 09:50:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x8sm6823304pfp.101.2020.08.13.09.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 09:50:31 -0700 (PDT)
Subject: Re: [PATCH] docs/system/target-avr: Improve the AVR docs and add to
 MAINTAINERS
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>
References: <20200812155304.18016-1-huth@tuxfamily.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ae16b1c-50a2-3cd8-dfda-e3dd76f5cd7a@linaro.org>
Date: Thu, 13 Aug 2020 09:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812155304.18016-1-huth@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Aug 2020 16:50:35 -0000

On 8/12/20 8:53 AM, Thomas Huth wrote:
> The examples look nicer when using "::" code blocks.
> Also mention that "-d in_asm" only outputs instructions that have not
> been translated by the JIT layer yet.
> And while we're at it, also add the AVR doc file to the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  MAINTAINERS                |  1 +
>  docs/system/target-avr.rst | 47 +++++++++++++++++++++++---------------
>  2 files changed, 30 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

