Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qApdD-0002Rs-RS
	for mharc-qemu-trivial@gnu.org; Sun, 18 Jun 2023 06:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qApd5-0002LY-L0
 for qemu-trivial@nongnu.org; Sun, 18 Jun 2023 06:27:32 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qApd3-0002Xb-31
 for qemu-trivial@nongnu.org; Sun, 18 Jun 2023 06:27:31 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-988a2715b8cso3738266b.0
 for <qemu-trivial@nongnu.org>; Sun, 18 Jun 2023 03:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687084047; x=1689676047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7VfXhzk0ZVhtU4tQtcFHxFoxaWut3gHqGCduTsP5158=;
 b=pXs3iZE80Ttjr3xlMu62FQPhy3bfFuXV7j5vIFdxYyD2VEAr04NMZcI/JbEDmQa2hF
 FBTgjLpNfbT8iwk7PVd95dBQgoOAB1BgL7uAgP1YqWc4SnC1IdNJHE7BoN25ZlWygnZK
 gfbWu8cMEqMcJIAGyN1X+E4n06HEXCk9Z9jb7755ZqZpCmhHE7DIhPQgWdHRXaJFTJpX
 0hTYdN5OZo8RceVMP5J+oCrh/0zOWjPfsLdlDM0JkPwryAQMvMVzCHsNWzycA/3MaIne
 PJy7y6VxfXoRvqVFiFHetV1/h8iAYqJTv584IUtxxwiV26km1HurodXvU1u4tGt9DNnE
 uPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687084047; x=1689676047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7VfXhzk0ZVhtU4tQtcFHxFoxaWut3gHqGCduTsP5158=;
 b=PPDH0yoP9EddC7qxiLfYzISol1/ax9cqIrL5n0ihh2IPHJa3i0DdwXUqzvgNSLUYJs
 ZSqiRxiN7GEyMP1E7QVytFskP+nVpNQV5SCe2pppCGugylGsgMV5o77dIcU5unLsACOq
 CAHhdN4iKSexC9ij3megha79xv6ff7limhzj0FlC4Lb7Dye/K0YBOSREwjiXjaKRMODf
 Kl+c/hXFPZUySI+VNg191li2jMAJzFagg8x8VG/rgl/RfVt852b8MTfWIMACj69II19O
 Q5P4yLCyKb7NWFlMpAhy5LzDLA4m8nX3wm7LiBkmfM7AFNsvesbPGTANIt/WmWMrF9zN
 ijJg==
X-Gm-Message-State: AC+VfDz81eARvFwcQ2hBdWiGYuoWOfxpqVRyY6lBpda6ItNmz+eF06E0
 /Ppb+cQwsKNR0SbkRfskqXQVKw==
X-Google-Smtp-Source: ACHHUZ4LFfKzHHGJov2dqvQamWbLgoD02aU9C/jarRPLsYLBbfE8llSv37wO+awvC++SRCwYBxWVNw==
X-Received: by 2002:a17:907:3d93:b0:988:6f63:e7c1 with SMTP id
 he19-20020a1709073d9300b009886f63e7c1mr1143482ejc.22.1687084047530; 
 Sun, 18 Jun 2023 03:27:27 -0700 (PDT)
Received: from [192.168.69.115] (mon75-h03-176-184-51-101.dsl.sta.abo.bbox.fr.
 [176.184.51.101]) by smtp.gmail.com with ESMTPSA id
 kf12-20020a17090776cc00b009888eda6b0asm342881ejc.170.2023.06.18.03.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 03:27:27 -0700 (PDT)
Message-ID: <45815e53-2e60-74a7-6399-a4334628193b@linaro.org>
Date: Sun, 18 Jun 2023 12:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] Fix handling of AVR interrupts above 33.
To: Michael Tokarev <mjt@tls.msk.ru>, Lucas Dietrich <ld.adecy@gmail.com>
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, qemu-trivial@nongnu.org
References: <20230614140748.3584-1-ld.adecy@gmail.com>
 <41fa564a-6164-23c6-58e4-3d5d4854e5ce@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <41fa564a-6164-23c6-58e4-3d5d4854e5ce@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 18 Jun 2023 10:27:33 -0000

On 18/6/23 08:56, Michael Tokarev wrote:
> Applied to the trivial tree, thank you!

Thanks. Do you mind updating the patch subject to:
"target/avr: Fix handling of interrupts above 33"?

