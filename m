Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr3uL-00077Q-OS
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 14:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3uK-00075G-8i
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:26:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3uI-0000f6-Iq
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:25:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id t6so13879169pgq.1
 for <qemu-trivial@nongnu.org>; Thu, 02 Jul 2020 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R0F9AzACDlRgCm8azIawNDqSqrmfBUY9IiDl4PreWso=;
 b=p/ZHrJg3xaIdbA/KTUDwERlXl7Tm12BI6V1es92RYUY7dV+uV7uObyYVeUUAATqIbc
 BOYDyPuQiCDDtmGwQd9MmWxQKAzAfp7GpGkWxV5O4ewYAOFg4k07b0DjIW1kSrtN8CMq
 s1nJAuxv730sKHpMX3MtTbPcVF765B8vmscc0+LJpaka3C/HX+fcipqlxEQ9/zCTqD/o
 5i0dxK3ALYDYY42AEe0Kv2LyiYUDg35fvvA78BZ0didRqmkqqOLZRTTRb6UAQLb61E4F
 Ql0RDfAvnqhDfqorG46PNqmmytwE8Zvq9JvHBa7qlIiHClPFmL+imBC/Xkd4VbTWa+sm
 AOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0F9AzACDlRgCm8azIawNDqSqrmfBUY9IiDl4PreWso=;
 b=PZhp2laIkGFGCPBMbJFXppDQoNb6B2rJoFgx5cmjKYSx1rF/sUwxeU8u1wCDpOcyDF
 y9eP/3Jg7zan0JSpywcu+2uUbqxO+7BMXXzaYMlb+lt79znYXsZ8fRZvHOBZDt15AEG2
 pmT/zET1sqEMu1dx8yDaWEPT9FE80s1TLUlfBiNZU+Fy5SELD0Fk4tYymc4y2CsU8gWn
 wn1FN8L9ee/SK0Jxci2fQEkz9VEhAKCvZv/HTMW2SleDiuEaHWKeVelbGX+u5MIr4F2i
 UCp8HLU5EgIUxGxliPn1S/Z+de3ksI9nHmlRS+URHcoU0bFmuVb0zzOgTCJAcKhQ8ZyH
 H/IA==
X-Gm-Message-State: AOAM5318OsoNdvQt372494OT1QZv6+beak89EQBQP6brCdTOnHl6NTh8
 LJI85a9IXJy5UVUj4lMWHl8HXQ==
X-Google-Smtp-Source: ABdhPJyfRbm1F5+eKPzCF0Uhf8kDo6gAjkAeqhA1YMcwg33Te+Tt7cLBWTAOiIEbx1W9DVophkT2Hw==
X-Received: by 2002:aa7:90c8:: with SMTP id k8mr12460491pfk.5.1593714356902;
 Thu, 02 Jul 2020 11:25:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b24sm9470229pgn.8.2020.07.02.11.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 11:25:56 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/nios2: in line the semantics of DISAS_UPDATE
 with other targets
From: Richard Henderson <richard.henderson@linaro.org>
To: Wentong Wu <wentong.wu@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marex@denx.de, crwulff@gmail.com,
 peter.maydell@linaro.org
References: <20200629160535.3910-1-wentong.wu@intel.com>
 <20200629160535.3910-2-wentong.wu@intel.com>
 <5fbd61be-a4bc-a6e3-7b6b-1d542751650d@linaro.org>
Message-ID: <5c828158-86f4-971c-1193-e7f89942338c@linaro.org>
Date: Thu, 2 Jul 2020 11:25:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5fbd61be-a4bc-a6e3-7b6b-1d542751650d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 02 Jul 2020 18:26:00 -0000

On 7/2/20 11:14 AM, Richard Henderson wrote:
> On 6/29/20 9:05 AM, Wentong Wu wrote:
>> In line the semantics of DISAS_UPDATE on nios2 target with other targets
>> which is to explicitly write the PC back into the cpu state before doing
>> a tcg_gen_exit_tb().
>>
>> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
>> ---
>>  target/nios2/translate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Or simply remove it as unused, now that you've replaced the existing users with
> DISAS_NORETURN.

Nevermind, you're using it in the next patch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

