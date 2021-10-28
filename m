Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg76t-0003IO-B6
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg76r-0003Cb-1R
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:14:29 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg76p-0000US-KV
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:14:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so6293675pff.3
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZQYyLeWudbC5GHf4C0rzUPQ0AR31S5lwIQiBizCUhRg=;
 b=kZmtwyOcuEDJj5yO6EbqRnJC/fPwxQA8M2nDbL3V5DYGPBuTA4kzFVBDxyXKnKUzNf
 FO08Rp9QvGbt7RcD62VqRMqaJ0wHFLpssTLIW1ZCs8WHs52B5kUn5Gsq64HQhRYtIX8p
 1gQxNsGaWEFcbki4V4Cyu7fuj37zMjmprjbPHQ4o7dpyt6WcZ3i5ldgCMDGsvf6wuveJ
 AWNfdLBeo93+H4K+eutT+FkNSWBf0ZTayp5VWCvzPK9hCGN4JQiVf7PsfXHQnDZHMi9h
 BqNaYtyk3I+Jfqt+UpEqVE0F4zNq8FYyZqCfYKAvhw+A6adlTXSIDVbqo9swgDmTmtsE
 rSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQYyLeWudbC5GHf4C0rzUPQ0AR31S5lwIQiBizCUhRg=;
 b=apsSVuR8zVNN4cy5OZhgfD+flC1MFmOV7iLt6ucGC65+CGHiZ9JqEImXSs3fZljZdc
 3zDfPJpsTYBRtH+XNpC9KFL94CT1bIpJnzqYHjWb29q9M64XrH55sGIK1PdmjHCa6hcc
 EUMyo/TSxd4Qob/4Tuu9daMEPS1UlHbD/qudhVA9q9ZXmPkkHxdTobCRxfByFadx9ooo
 QjBmmDFuxNl+0HslA+fklzpyWRdoZceGybyH+a7fWnNT6LeoT2qeN+uDt2PYO4WpJm9A
 Jex095dBlK4q+759M0Zyz0mDJ71PKyRNu5w/OxbpJ7lXsiqEdcUMbjB89CuM3icQkpOX
 JLRQ==
X-Gm-Message-State: AOAM531YU3n3fVlJ69rqPNcuO0Thpw9/2ZdKDHckKK9scJ17Ovi1GQjG
 261pTobAMkK3iv18USVqyTk2Jw==
X-Google-Smtp-Source: ABdhPJw/QNl0YUJmresHGgWGQsdMOl0RzUjHPtkkI7Ja+PKxx3rWh+eIUrumEU6T+whpKfEMjsgI3w==
X-Received: by 2002:aa7:83cc:0:b0:455:c394:caba with SMTP id
 j12-20020aa783cc000000b00455c394cabamr5116019pfn.28.1635434066206; 
 Thu, 28 Oct 2021 08:14:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id kk3sm3722181pjb.57.2021.10.28.08.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:14:25 -0700 (PDT)
Subject: Re: [PATCH 04/24] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <426f6425-ad4f-41c3-a034-90cec903b0a1@linaro.org>
Date: Thu, 28 Oct 2021 08:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
X-List-Received-Date: Thu, 28 Oct 2021 15:14:29 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteRaw);

This looks a bit suspicious.
Over in linux-user we use

     cpsr_write(env, regs->uregs[16], CPSR_USER | CPSR_EXEC,
                CPSRWriteByInstr);

Are you setting something special in pt_regs that would warrant writing supervisor bits of 
CPSR?  In addition, CPSRWriteRaw won't rebuild hflags, which means that changes to Thumb 
state won't be recognized properly.


r~

