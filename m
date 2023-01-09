Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEuec-0007u8-W9
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2023 11:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEueb-0007qv-2Y
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:05:41 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEueY-0007xp-Ls
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:05:40 -0500
Received: by mail-pg1-x531.google.com with SMTP id e10so6167069pgc.9
 for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2023 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
 b=LN+PGwuwBQmwQ3Ub4Ru/HlrWZDcFFrTgBKuWgdKsEXudsSp9Tgbkc2MtxGnCyh2sDe
 JFq9utN+BmwHjCKOaZ1U//0J9BWjAdggMFv7JW7rw48XMWXRofnstNr7HiocWNt/Esas
 XgjyhOIFEZ0fJkz3GTC/n9q/SjgSGPZWLWo6lNv8MIPgAFgBj2H0cH3ieqwVAf7dZmU0
 7svnR5U0i93wI7UAxSvAVv2cj3bvtk9kNOwgdArKJkjULUCiqEESQME0AiUdV6QSzSiX
 CUvPYyPAU8FQ0WvnymPeRnmUjsru08agw1XJurU9+46eLCeaES8Hk4s3PBgz1v6oLO/F
 C1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
 b=KmuFN4WzacAjVJ6nMlUQa+hxS0+ONhTJzd0ozT0PXjFhWnD0kfu8ebIT4HIuMd2z6p
 J2o22LpJMFxiL1rHfgbq/cefIgW1eV9vW4+khy6YxxSNlhVAxfb9PDThB6nF0GNJV+K4
 lBWFdrQgpY04kWmo9faoTwkDSDDfzeGRU3ld2zg4ZVMlOt46vDCvz65oPm1YbtxYRcY6
 aJ0i55yKgsFn5pRLzydsoo8cgPsE1hNID2Ld/IzkxcMxaBFKjdruHOAwIjJELNvWEJ3N
 DzTkZTzQxbOBbGQjEJ+X1tM0KAZicKWOGlaqk8YXh5Yw326XRfeEubqQoGF2HVJHA1an
 HFrA==
X-Gm-Message-State: AFqh2krFYKcWDUsVDZo/59m0N/s7qI0vANLXchnX+utCUSOl23QB8H7G
 Lh5mFp0qBGlMIM7pQcando6tTQ==
X-Google-Smtp-Source: AMrXdXtnEhK55vv4F4PzqLzzNcE2/Vy7TQeVCKhbJnYmajLU7tFe917IJh3jIbrma1wPdB9oXs5hvw==
X-Received: by 2002:a05:6a00:21ce:b0:581:26c2:aa0a with SMTP id
 t14-20020a056a0021ce00b0058126c2aa0amr66671593pfj.30.1673280336229; 
 Mon, 09 Jan 2023 08:05:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b00583698ba91dsm6264799pfu.40.2023.01.09.08.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:05:35 -0800 (PST)
Message-ID: <5072666e-928c-1aae-3dde-7c4f3a440b23@linaro.org>
Date: Mon, 9 Jan 2023 08:05:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 16:05:41 -0000

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

