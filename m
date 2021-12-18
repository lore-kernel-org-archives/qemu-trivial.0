Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myPSL-0005vn-8G
	for mharc-qemu-trivial@gnu.org; Fri, 17 Dec 2021 21:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myPSJ-0005tk-Hx
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 21:28:15 -0500
Received: from [2607:f8b0:4864:20::630] (port=41893
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myPSH-0005oM-NF
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 21:28:14 -0500
Received: by mail-pl1-x630.google.com with SMTP id e17so3349177plh.8
 for <qemu-trivial@nongnu.org>; Fri, 17 Dec 2021 18:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N0QOipPP7DsYNeWn9pbEZ2skR01k5Yp1HkOfR7OV6cs=;
 b=b44xbkJibl9cXvB18hOWr4we+XTnj5ZsYmKikLQRR4l3/crmzLjWRz0oKrHhLQsWFw
 Hees2Xl4Y7+dOvrsDCGdWt7Z5fVmH05NU3oYbOW4kFDDwIAiRD1XjhRD7hDThTze5az/
 rcsAvK0u4Ib6kwTY3j04r2pAvHxnw0ASmhPZJbEieB+cVdNVUsnBDWTCY6ELf1RNXtWM
 1pqNQeBGO+He78TFSFiPtccsdHA1BKhNRBt5AGA6YCryGY5BrFb3JnCEq4leZt1bYveh
 vfglcruzuQ5p8dZITZxDUCwcVsMfRIgT19SqsQfJaCzhxP9ezyW+tma4noKI9tRkpdbS
 SKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0QOipPP7DsYNeWn9pbEZ2skR01k5Yp1HkOfR7OV6cs=;
 b=Thu8hReBiMti8zY4FZHXptoCY4AK8go/olMjDshilm73zTjApa6GKUmNoiRhSXRpbf
 DAMgN707EoWSYTlairfxV0AWN8aBU0iBCbG+kcwOj7DQNpaYG/bBLcMGLVZalw4Q8+qc
 LYpbF1N0znva9DEKjjOJ3ZcNAFfCy6Ryy8RDhqzPBi4JqHj+l6XOp1NYX2FkynawxRnA
 /R6onZItDZIWp+Y1PHRlYw5r9hsJFP+1FZYXyFRIvms0ZojnDGLKVK+KaRZ/4L8hJmDa
 WuRSRmsMc97yZ7SEKgNqcLgqwEAe/QA5K1xy3rpiNCD2zVEA79Ymu3mNOhFUwA7s5lAA
 Up5w==
X-Gm-Message-State: AOAM532P42t1SjjR3X1V7rbMUiEFk8MY3661xy2NsVEAUSPNZELKMrH3
 uPytJasbPvgWP+Z5GIGItbA3+Q==
X-Google-Smtp-Source: ABdhPJwoch+dDEL4KLakp2wlAEWD7FQYl2xT4lATGa+RRJ1MhJmhj8ChZXBIwDSFy35of5e1hgfRmw==
X-Received: by 2002:a17:90b:4b41:: with SMTP id
 mi1mr15267036pjb.2.1639794492239; 
 Fri, 17 Dec 2021 18:28:12 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s25sm1263270pfg.208.2021.12.17.18.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 18:28:11 -0800 (PST)
Subject: Re: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20211106105623.510868-1-f4bug@amsat.org>
 <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
Date: Fri, 17 Dec 2021 18:28:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 18 Dec 2021 02:28:15 -0000

On 12/17/21 3:37 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 11/6/21 11:56, Philippe Mathieu-Daudé wrote:
>> Add the vmstate for the ETRAX timers.
>> This is in theory a migration compatibility break
>> for the 'AXIS devboard 88' CRIS machine.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/timer/etraxfs_timer.c | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)


In that it matches another similar timer device:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


>> +static const VMStateDescription vmstate_etraxfs = {
>> +    .name = "etraxfs",
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_PTIMER(ptimer_t0, ETRAXTimerState),
>> +        VMSTATE_PTIMER(ptimer_t1, ETRAXTimerState),
>> +        VMSTATE_PTIMER(ptimer_wd, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(wd_hits, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_tmr0_div, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_tmr0_data, ETRAXTimerState),
>> +        VMSTATE_UINT32(rw_tmr0_ctrl, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_tmr1_div, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_tmr1_data, ETRAXTimerState),
>> +        VMSTATE_UINT32(rw_tmr1_ctrl, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_wd_ctrl, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_intr_mask, ETRAXTimerState),
>> +        VMSTATE_UINT32(rw_ack_intr, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_intr, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_masked_intr, ETRAXTimerState),
>> +
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};

What I don't understand is how these controls get applied to qemu_irq after vmload, here 
or in any other device.  It seems like we should have some post_load hook that calls 
timer_update_irq, etc.


r~

