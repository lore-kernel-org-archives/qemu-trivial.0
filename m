Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llgy6-0006Pb-TC
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 20:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgy5-0006PT-PW
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 20:00:13 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgy4-00012e-0f
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 20:00:13 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ml1-20020a17090b3601b029015f9b1ebce0so4891333pjb.5
 for <qemu-trivial@nongnu.org>; Tue, 25 May 2021 17:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lVudDLAXdAZrOOsNaLJ0JzXaZV4JquBy8xBoufTYbO0=;
 b=Aextghinh2T1vwbAcktpRp33DeFE5MlQER5Zrp8d1Q36aLnjOugxuFJ1+Iwoj1yAGk
 h4PHSNhpX3r/SMLrUWANx/0eIthnIVlP6w6ywq3UzdIz9R2fiPkHpnTykPbm3Jqg9tQ2
 DzOykKbfuvTlhJPC48CCRKAcOLKpx/GAQ4y8VLJMFuLThTnuwES27yC91eQE/bSYZo6Y
 1FEXEURVY6znlmeAa/mz2mS8l1wEU7JE5Y17CLSXIPOZTLXc4ElXh4sPfdRhYmzLKftq
 D9Vbem/WhQseF1ip/wSRGwiUlebe3uZKnpPcylP17sTmAwx7BlPSx2qM35ZEkGRdaGqO
 kGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lVudDLAXdAZrOOsNaLJ0JzXaZV4JquBy8xBoufTYbO0=;
 b=Ad8yc3syi0cjA9ZLRwsgmRVQR8NISsmRP6caYFN+ay6anPAMRD3FmlKOvHlthV3h3j
 Fq6IkpS3cdO3t3xZ+XSl1IIdD5pIY+UR6LOK6S1J+57jAhNFPOlfALuKUPfWHDLQg63J
 mDeit9XNQem+SyMPh/w22jT7b/nSnWnL6+qFASERAmUPnJN9xbAtF1TF7CzFKzkWlDU+
 LquUkr3IDa47xfokx/kaTOKX2CYy94VA50lZPG6F/z8kW2sHSx6sa8UyaQ5sb7gGpWlX
 2aRXJA9+1JuWkq3qpYmV0P83RytvTy4RaY8qLWJhKgYoaYCMzOr6ljW7O/6zSy2XIoTQ
 bD8Q==
X-Gm-Message-State: AOAM530fkMhq5QjfAglFf0dUGKdAmHVsrgIaRZHvVIlDhlDGNI9OnZ0d
 6UfqoE7tSJV2Nz+OQYTVE2gNmA==
X-Google-Smtp-Source: ABdhPJwOFQokfpsfP6u68Cc1ll4jxVdQEftcOSnNiqUr/XhDPaKS32tFhtq/4ztGzSr1jMXiogaL6w==
X-Received: by 2002:a17:902:7e06:b029:f2:14b5:aa08 with SMTP id
 b6-20020a1709027e06b02900f214b5aa08mr32854595plm.79.1621987210178; 
 Tue, 25 May 2021 17:00:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y190sm15493993pgd.24.2021.05.25.17.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 17:00:09 -0700 (PDT)
Subject: Re: [PATCH] tcg/aarch64/tcg-target.c.inc: correction of rotate bit
 number
To: Yasuo Kuwahara <kwhr00@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>
References: <CAHfJ0vSXnmnTLmT0kR=a8ACRdw_UsLYOhStzUzgVEHoH8U-7sA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <216dd18c-ebf9-e97c-5950-3acf44121e18@linaro.org>
Date: Tue, 25 May 2021 17:00:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHfJ0vSXnmnTLmT0kR=a8ACRdw_UsLYOhStzUzgVEHoH8U-7sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 26 May 2021 00:00:14 -0000

On 5/25/21 2:46 AM, Yasuo Kuwahara wrote:
> The last argument of tcg_out_extr() must be in the range 0-31 if ext==0.
> 
> Before the fix, when m==0 it becomes 32 and it crashes with an Illegal 
> instruction in Apple Silicon.
> 
> After the fix, it will be 0. If m is in the range 1-31, it is the same as before.
> 
> 
> Signed-off-by: Yasuo Kuwahara <kwhr00@gmail.com <mailto:kwhr00@gmail.com>>
> 
> ---
> 
> tcg/aarch64/tcg-target.c.inc | 5 ++---
> 
> 1 file changed, 2 insertions(+), 3 deletions(-)

(1) All patches go to qemu-devel, as per
     https://wiki.qemu.org/Contribute/SubmitAPatch
     Many maintainers including myself don't monitor qemu-trivial.

(2) Something is wrong with your mailer and it is adding extra
     newlines, which means the patch does not apply.  However,
     because the patch is so simple, I have applied it by hand.

Queued to tcg-next, thanks.


r~

> 
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> 
> index f07ba98aa4..5bd366f2d4 100644
> 
> --- a/tcg/aarch64/tcg-target.c.inc
> 
> +++ b/tcg/aarch64/tcg-target.c.inc
> 
> @@ -1291,9 +1291,8 @@ static inline void tcg_out_rotr(TCGContext *s, TCGType ext,
> 
> static inline void tcg_out_rotl(TCGContext *s, TCGType ext,
> 
> TCGReg rd, TCGReg rn, unsigned int m)
> 
> {
> 
> -int bits = ext ? 64 : 32;
> 
> -int max = bits - 1;
> 
> -tcg_out_extr(s, ext, rd, rn, rn, bits - (m & max));
> 
> +int max = ext ? 63 : 31;
> 
> +tcg_out_extr(s, ext, rd, rn, rn, -m & max);
> 
> }
> 
> static inline void tcg_out_dep(TCGContext *s, TCGType ext, TCGReg rd,
> 
> --
> 
> 2.24.3
> 
> 


