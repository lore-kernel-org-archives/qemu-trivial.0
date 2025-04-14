Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u4HGH-0008Hn-He
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2025 06:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4HG9-0008Gu-0E
 for qemu-trivial@nongnu.org; Mon, 14 Apr 2025 06:41:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4HG6-0006pb-W1
 for qemu-trivial@nongnu.org; Mon, 14 Apr 2025 06:41:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso45179485e9.3
 for <qemu-trivial@nongnu.org>; Mon, 14 Apr 2025 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744627305; x=1745232105; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WJmSUqu4/wyH3LbStDr4VqeqU0bzGwgTmENUKvepGMU=;
 b=pP2XckdsVWkR583xiNlQucqnjhM6gg/bq46RqqkfhkwSLQPPXBkqyj6uZaF36T2/rt
 vblThNdWcFluDyaoDY9f1Aigu3kTh9likWhxfMIqQTBrxCz/o3d61NqNi86MSGXVZrS4
 G2RwPTI2QQ3lT87cEFqMmPEswY2WU6OAlmYNq+2lu55li//9OMKc4pNiNCTJRCkjxQBS
 lbg9bomgCMlpkltiY2F4cRdQwQaiPkrxrHnGQoCokH2XwpK6aOjmSr4MEoX+gC0Bh+PS
 l0Fb0u4UZYT38EDhIMlSdsQlwxOfcSxushk370tYL/qsqyaWc8nPZxhbcPUT7boq5MUl
 XhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744627305; x=1745232105;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WJmSUqu4/wyH3LbStDr4VqeqU0bzGwgTmENUKvepGMU=;
 b=Y83W96uE84ZmuW+W5jsxWh+GXyNYQdqZN8/99nyuBLuxWxrEcywowUZKASYfGRj5hs
 IC7RZeLxF4REjDOZPneRdOhNdaNcBSOaNWNCoIebmNax/65PdQlCtRt7p6s2YUe6GEN/
 f6VE3U9wdG0648xn26zzNiS9KavZFEIjMpxLvmDQ3xoc6SKoe85y7wF5dW3R5qMSwbuK
 ufu7Q4IL/a8WfvyDy6ye6E4tHWLsrL+1eezp6SZqj8g7y5+cBHISAmgQuEdmS2hFMXtD
 IMenR9pYzWhyKbeoQoI9hKvdj0dQlLr5dqom3rWdlF2A3gNxqUBfaYSX8d4aCsKA7IfL
 jc4A==
X-Gm-Message-State: AOJu0YwEyP7IXTOXkeavSxnq2K8JXo1nr2o5ZA8ps8SfkDSgPritV1f5
 xkWzP/KpPyU7gtOqwW1XC48vwSmpdDRfbV8ZqVqsL48wf8+TA5+c1hB5SMWzsfY=
X-Gm-Gg: ASbGncuDtNQ/0ryfvwgnFIvNMa4b1vYcGNIT2OENNx54fhKLggoqPZM4ZUfU9TUlj13
 HoJ9m+GdmrA8bx2ND1230zLSXxgh8ITjlx2ADSGCGQ9Shcj3lnBYdxRrFT+UP8d8UR4bEvjVaQs
 4MJgSBX3uGLOtUf0KCbT4XswTwn9mcpXE5dx65vsXnXh6+sHojre2LYCSSjC7/QJvn5qV7ANOY9
 8v94lh5gRIvI94uJF40rlq5xVC1cN4kxOxcuH+QN1deKPvAx7jnhzYb9rTZZ6GollBpiAlgyV6B
 FPOYBS4947QD/ia/1UnFFtyh8cKuo8jwktGQy8asI3cgQiMVsAmgWFuqd+LtjdPN+i+vFDgAE5F
 fqKzGSknY
X-Google-Smtp-Source: AGHT+IFcW0DuYx1j0nJvQntYExNNkbpAiUyP8M98Yv8H6/mbVhKtShRj9vz6Q3zYmQFY9ueIByGSlQ==
X-Received: by 2002:a05:600c:3d86:b0:43c:f87c:24d3 with SMTP id
 5b1f17b1804b1-43f569710bdmr16207805e9.20.1744627304777; 
 Mon, 14 Apr 2025 03:41:44 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2066d109sm177501265e9.20.2025.04.14.03.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:41:44 -0700 (PDT)
Message-ID: <3c9e1adc-eb4e-49f4-be32-b273a5a161b8@linaro.org>
Date: Mon, 14 Apr 2025 12:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] target/riscv: fix endless translation loop on big
 endian systems
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org
References: <20250414034626.3491489-1-ziqiaokong@gmail.com>
 <20250414034626.3491489-2-ziqiaokong@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250414034626.3491489-2-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 14 Apr 2025 10:41:56 -0000

Hi,

On 14/4/25 05:46, Ziqiao Kong wrote:
> On big endian systems, pte and updated_pte hold big endian host data
> while pte_pa points to little endian target data. This means the branch
> at cpu_helper.c:1669 will be always satisfied and restart translation,
> causing an endless translation loop.
> 

Cc: qemu-stable@nongnu.org
Fixes: 0c3e702aca7 ("RISC-V CPU Helpers")

> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> ---
>   target/riscv/cpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 6c4391d96b..bc146771c8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1662,9 +1662,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>               target_ulong *pte_pa = qemu_map_ram_ptr(mr->ram_block, addr1);
>               target_ulong old_pte;
>               if (riscv_cpu_sxl(env) == MXL_RV32) {
> -                old_pte = qatomic_cmpxchg((uint32_t *)pte_pa, pte, updated_pte);
> +                old_pte = qatomic_cmpxchg((uint32_t *)pte_pa, cpu_to_le32(pte), cpu_to_le32(updated_pte));
>               } else {
> -                old_pte = qatomic_cmpxchg(pte_pa, pte, updated_pte);
> +                old_pte = qatomic_cmpxchg(pte_pa, cpu_to_le64(pte), cpu_to_le64(updated_pte));
>               }
>               if (old_pte != pte) {
>                   goto restart;

If PTEs are always stored in LE order, maybe what we want is earlier:

-- >8 --
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 619c76cc001..b6ac2800240 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1464,5 +1464,5 @@ static int get_physical_address(CPURISCVState 
*env, hwaddr *physical,
          if (riscv_cpu_mxl(env) == MXL_RV32) {
-            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+            pte = address_space_ldl_le(cs->as, pte_addr, attrs, &res);
          } else {
-            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+            pte = address_space_ldq_le(cs->as, pte_addr, attrs, &res);
          }
---

