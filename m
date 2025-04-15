Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u4hLV-000550-02
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2025 10:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u4hLF-000524-64
 for qemu-trivial@nongnu.org; Tue, 15 Apr 2025 10:32:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u4hLD-00077i-8k
 for qemu-trivial@nongnu.org; Tue, 15 Apr 2025 10:32:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22403cbb47fso60360795ad.0
 for <qemu-trivial@nongnu.org>; Tue, 15 Apr 2025 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744727565; x=1745332365; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Fyj57vGaBc0roMh6YMQRRh+zQ5VOzli8l2LQL3dC2c=;
 b=SUc9tLNCO+7f60PBqtcBGxrxoFIKM8il6pUGdV9ZPJoE5pcpfhMXP+fLX4nx8ZrwF6
 KJdSF5TZyphdHzuMxiAf6BKsYMTIshwJ3eii5kFgKA0bWlmBEKLMhgruTTPkuIn0Mh4F
 BXAp4vBpz/jfDKIoEbro69GVJuNCkU5TDzmxLK1Y4sUr+GA53ZTzKW8dDrntUCc7BFjc
 3sddarUgt5WJIj4y3DP2y+X5rceKCvInCTuNNLmzVCYIqJzgqWNGz51Oc6ZRzgrziLwb
 2TCAaP3wzWSOGbv6TW6T9cJxr7gENlJzg+yGITWiY2n+ImhgkJ4KdZPF/G73J3VttGRZ
 ajEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744727565; x=1745332365;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Fyj57vGaBc0roMh6YMQRRh+zQ5VOzli8l2LQL3dC2c=;
 b=DyYFxiCMWSWHA2Eo+HZr8InVzpAll1cpUy+3EWTiEi8KeSziIOxnD8xUPZGm3G8JKL
 Tvkj9g+WHXA6myUsAzi4LwfWyPR9aw9dmOCirubA5qACJWX+8T03TOCwPfYxRxghrXn7
 9n7R267PFh/Xetp4s7XAFdTRDk13ao+/NzWoRAueYn2tevAsk8WoLiV5RhF/9uullRm0
 ihAmWh+JdZdLEka+PcMW2B3n+ggxWl83Ou4ckr4Ry5CAMCWarOajwShxgAS2KE/KDBz2
 3zaW023YWk5pbQUyASPRPCckALSL3S8ELGsbQ9oz5pNgZXOt54mVrRicafaDVCWGJkJ1
 ncvQ==
X-Gm-Message-State: AOJu0YwNwTlIUWF1VaPfP9/2DFvKdQkIB16fdSblcetBCDSEBunrGtQ8
 1gr+D4pzNU4CS2V4j6b6q/ENH6AbLUE0hNzFND5w/pAU07IY6Z7kJzvkzmFUd0g=
X-Gm-Gg: ASbGncuv9y/Jz/D2FseolddhcDJbJyiZSDI13zWJ2cZqTiVXz9HIqvTf5rESH2t5vI5
 vnVZ2DHF8lxzcPxld7LDL8cp9fQDmIEGtxVPn5c3UoXvsiki59EH/LaVeDV/WBY0qAA3I469pAd
 Ar/jVAHzqNxDG9cD4fcLZUewJP6tBF6a2iDSdGd/Ge4JGp9VC1TL+dHTFJR0b+YBKOEN9gKHi//
 idM1lSLYe5W+zchyhVazaQF9ROeV47Fx1DX4/5ClB3AU09RHd/wpXYX8iNLK0uFkr+BKI2Yrd54
 mRiFiKJQYbnCUipCZFtF1rsmx8EyS3M7Q7QIQgC7lEaitv5Plno6D4o5+qOp/HmGZ+qKCbTmDeE
 cE7FV3ZM=
X-Google-Smtp-Source: AGHT+IE/T0ATNx9AQ45DOWA46yhQAzAv5Rm50r2Eus84buuBj0enEWnWQgB6F4aK2N9cn8Klm6jejg==
X-Received: by 2002:a17:902:eb8d:b0:223:5e54:c521 with SMTP id
 d9443c01a7336-22bea3f1542mr237904995ad.0.1744727564445; 
 Tue, 15 Apr 2025 07:32:44 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c971bfsm118249105ad.123.2025.04.15.07.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:32:44 -0700 (PDT)
Message-ID: <de4fba03-c9dd-4ff9-8f4d-8feaff52703b@linaro.org>
Date: Tue, 15 Apr 2025 07:32:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] target/riscv: fix endless translation loop on big
 endian systems
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250415080254.3667878-1-ziqiaokong@gmail.com>
 <20250415080254.3667878-2-ziqiaokong@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250415080254.3667878-2-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 15 Apr 2025 14:32:54 -0000

On 4/15/25 01:02, Ziqiao Kong wrote:
> On big endian systems, pte and updated_pte hold big endian host data
> while pte_pa points to little endian target data. This means the branch
> at cpu_helper.c:1669 will be always satisfied and restart translation,
> causing an endless translation loop.
> 
> The correctness of this patch can be deduced by:
> 
> old_pte will hold value either from cpu_to_le32/64(pte) or
> cpu_to_le32/64(updated_pte), both of wich is litte endian. After that,
> an in-place conversion by le32/64_to_cpu(old_pte) ensures that old_pte
> now is in native endian, same with pte. Therefore, the endianness of the
> both side of if (old_pte != pte) is correct.
> 
> Signed-off-by: Ziqiao Kong<ziqiaokong@gmail.com>
> ---
>   target/riscv/cpu_helper.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

