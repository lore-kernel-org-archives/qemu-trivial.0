Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLMM-0007Hr-0v
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLMK-0007Ga-GB
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:52:36 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLMJ-0002qo-6H
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:52:36 -0400
Received: by mail-pl1-x641.google.com with SMTP id b9so7055015plx.6
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uzqNYC8yCkHcda0vOTzyDPkKP1e9rdP24oC6OtiqKzY=;
 b=JHVbyzFmz8y8B1odjR1lKwZkFzmrXI5fOKdBvOn7F6OIEgS24zlpZeUHVctTr/nF+M
 JU2fVtTc67jId45aqHcv+3J83jk9b7yxA28cPxEpJ3qHWnUZ/aSeM4ii335khmydexGq
 X9tpDQ1z+ZgsEC2m9QHPNMhgxSrvdTgecMcO/AaCfNVUIQCK8Dm2p6p+1L4S7KjkLHUt
 OwmYLllpjZzI/Y59p5Eewx27gmqZbf9PBZfuRFYhsmiN+eNUNlBYAA0DhC56AOPMphgt
 pU4abe6F36iT8A0QN18yCLt4VKRfF0IFcIlEXvf+k1b6G1OdEyueuSdDBcebNy1YReBb
 VBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uzqNYC8yCkHcda0vOTzyDPkKP1e9rdP24oC6OtiqKzY=;
 b=YExfm+M6m7CC41Qh4nmjOGGVVR/1jNpODqyrp+pDyhLkh7A927MBVQ1xlsq5M7ogQI
 LO5z3FOGNrbFJdy9zx5c18oT2N49cnrolHhZYp93OuR0cAGP8h9KF5a70xhMDNkJcf7Y
 g7fsfkYXCZ2ZYkSUe+BdDUNXQU5Eia4KdB7QPTfHo/kjgkgNFvQQvpfUoWWx8XKRN9uZ
 +EFV6NzgUJARF+lfrZ7vCsh2yMI9MM8wPC0bclazg4T6nOwuhowoceCCVwTbue7kxLn7
 s9LBmvRiro55t1bxKJ1yNOkhv3EvLGgXZjpJ2jnmCybTOuGHTqVamVGLfrCo20MMg3o1
 tL3A==
X-Gm-Message-State: AOAM532lO8QLfqGhLyOrRteZad2lN5ijx6kMcE2G2cEMrzsR/29wn2F6
 FRcpDSZ0jHNt177XofnIcAL0wAnJ4x8=
X-Google-Smtp-Source: ABdhPJy7B2MR8wMvT+7P/8kezXbajLaZeSDTcqi8Uw8VeN8T3hoZxQ8zgu1zuyFOuNWp/G1XGfsWGg==
X-Received: by 2002:a17:90a:c915:: with SMTP id
 v21mr4792889pjt.48.1594734753627; 
 Tue, 14 Jul 2020 06:52:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m17sm18156236pfo.182.2020.07.14.06.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:52:32 -0700 (PDT)
Subject: Re: [PATCH] target/sh4: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600452-23383-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3718ca42-47aa-3383-d34a-490195dc003c@linaro.org>
Date: Tue, 14 Jul 2020 06:52:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600452-23383-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 14 Jul 2020 13:52:36 -0000

On 7/12/20 5:34 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  target/sh4/translate.c | 3 ---
>  1 file changed, 3 deletions(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

