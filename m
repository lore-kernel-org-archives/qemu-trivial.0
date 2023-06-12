Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q8h3U-0000tw-9y
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jun 2023 08:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8h3R-0000tc-If
 for qemu-trivial@nongnu.org; Mon, 12 Jun 2023 08:53:53 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8h3P-0005Ql-RA
 for qemu-trivial@nongnu.org; Mon, 12 Jun 2023 08:53:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f7ff69824dso27465845e9.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Jun 2023 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686574430; x=1689166430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hL13j2KdI0fqpjpp00fiRTsYjCvqT1bo9Gl6NsUyLTY=;
 b=VNcPyIu2iWoXWUnh6edXQ5VBOdbLankVWoGMXCajN03a1x4XHcpyWMXUQq1EHNxiTT
 gaBZf4lt/BFRPvbxTQs6gseY8smZ2zoZDF4rmNVFILBMxT7xwLFwn9PrAQImy1zSRVRD
 AsJfyoC2Mizyl10yxEJotBH0MAkzYRsdf3EQKIVltKPPGTy9hB/2pk5AeFrz6MAfbw/T
 AdBW1utJkB147I0sGhIeXiCqXbQj/NXdBvABQuh3La/geDyMozgwe8pllYkopaWx5Idl
 +lOJZfigYQAGI01baS6kVUSx7+Jq+7O9l8UtvJk3z43poSV1Qf0nYzpn9JRhXdgeY86T
 OD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686574430; x=1689166430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hL13j2KdI0fqpjpp00fiRTsYjCvqT1bo9Gl6NsUyLTY=;
 b=c/oNfNeJux432zasx8hgPyd7SVlZ1o4yuVFMJHwhOvwPi1QZVSKshuqxY1eK6lA4j1
 29kLlxjwDk5d44YaByWuowubW9LPlMb1hu/PseOV9zDie3s7myFyRg+m1FFtyHRmYjpS
 NGXxviYZvJE912Bazkv6+LCFgVSsl4ckrZ2Bq9ZVh93930U4tBaTZTdahX5dbjQfwsHZ
 p/hG3qg87nzbG3HGJw2+n/YcyokvOqtDDkP6ZPEQF9kBqSqHlGp8dDHMXotND/n11wp/
 NtO+h0b3zJWUBcrqXeo94g1uDs3bvJMGoPPoi9z3urLQXvWImB6iIrNEYZzO7dxbk+Bz
 owgw==
X-Gm-Message-State: AC+VfDykMYypyGtWKpPOXsW76YMCsvzuai3bsIja8egDfZ6bp9Txt9/C
 CtOh42Bv/HH5wt913h+9jd1WRQ==
X-Google-Smtp-Source: ACHHUZ5aiQfbLWRhs78wXQmnRQ8b79D9B2nVbmho3BAcPMmxusghK1/qrMk/XLdu7E/hhnOHCdhzBw==
X-Received: by 2002:a5d:5592:0:b0:30f:ba3a:85c5 with SMTP id
 i18-20020a5d5592000000b0030fba3a85c5mr3776337wrv.25.1686574430124; 
 Mon, 12 Jun 2023 05:53:50 -0700 (PDT)
Received: from [192.168.112.175] (176.red-88-28-1.dynamicip.rima-tde.net.
 [88.28.1.176]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d48c4000000b0030903d44dbcsm12367471wrs.33.2023.06.12.05.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 05:53:49 -0700 (PDT)
Message-ID: <268c1ca3-409f-bc43-0e88-c32f1eae71f9@linaro.org>
Date: Mon, 12 Jun 2023 14:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: Fwd: QEMU AVR Patch - Correct handling of AVR interrupts
Content-Language: en-US
To: Adecy <ld.adecy@gmail.com>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, qemu-trivial@nongnu.org
References: <CAB295yB5cFSZpGE74EW5hDMSNGnZfw06UC5ydepUL0sdT96WGg@mail.gmail.com>
 <CAB295yAzhzPpKC7KtpKk6t6x4Dn7Bpam=Nwfx8z0wAkZRP-JSg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAB295yAzhzPpKC7KtpKk6t6x4Dn7Bpam=Nwfx8z0wAkZRP-JSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Jun 2023 12:53:53 -0000

Hi Lucas,

On 8/6/23 23:03, Adecy wrote:
> ---------- Forwarded message ---------
> De : *Adecy* <ld.adecy@gmail.com <mailto:ld.adecy@gmail.com>>
> Date: jeu. 1 juin 2023 à 21:34
> Subject: QEMU AVR Patch - Correct handling of AVR interrupts
> To: <qemu-trivial@nongnu.org <mailto:qemu-trivial@nongnu.org>>
> 
> 
> Hello,
> 
> I would like to submit the attached patch.

Unfortunately your patch doesn't apply cleanly:

Applying: Fix handling of AVR interrupts above 33 by switching ctz32 to 
ctz64
error: patch failed: target/avr/helper.c:45
error: target/avr/helper.c: patch does not apply
Patch failed at 0001 Fix handling of AVR interrupts above 33 by 
switching ctz32 to ctz64
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

You can find help on how to send your patch here:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches

Thanks,

Phil.


