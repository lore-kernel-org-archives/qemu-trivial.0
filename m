Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2yoN-0000Kb-Ss
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jul 2021 12:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yoL-0000IO-M1
 for qemu-trivial@nongnu.org; Mon, 12 Jul 2021 12:29:38 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yoJ-0003sB-87
 for qemu-trivial@nongnu.org; Mon, 12 Jul 2021 12:29:37 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x16so8609153plg.3
 for <qemu-trivial@nongnu.org>; Mon, 12 Jul 2021 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XtmWpkq01X97gueXkOGca0rUJj7jLFPy9fArTJSIkGA=;
 b=ALScJZfpSz939LnT30Tm5r7dq7tNdRA8RauQl+vogrF+C5TABvAEjO5+VjZ15n/fwi
 sineEp/zYAGPPr4kuDDCyYkiV8fF8ZPHnqqUJ3Z6+okE1C/tTFq2CeH8WT1ds08XMZLE
 pvxLBP/oIMFNEkYzpYczYi5VckJMAK+Oq+f6lApbba8my/TWUp62KRE4sXFfY0jGzL/T
 mk7x+zRQetZtePspOXEnP829hvxpjwqJZfM0oi2GobTge9H+wWhU9KrslNiExHNeQ+Xq
 VSkli1GBuOqup7xHzPcXF+kj1D3ejujdqfoDRAHqMdnjX30cOYfqdkRhzqZvl092E4uD
 SjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XtmWpkq01X97gueXkOGca0rUJj7jLFPy9fArTJSIkGA=;
 b=pFE34nrekgSdpV0biIN/BQ5tqb9ue+q0yUxSMMGtHjIFA/E3mUFn8+oPvfgvDlwvAJ
 ZxwwmfOEVS2V5s7FDWizxnABLHSAtyM0GIv1sw8KPrhCKXrDZ/l6krJPESZQVBwQ22gE
 kRghHd2HhJOCo1sxQqOhvqDgKKvw/9wT1awBuNHjrDnaPCpc5PDS1EFsz8xOtdM0M1Xy
 iqFvo357ds/vxY5y8WKMaCTBmxSmwZSAFv9UVfQ+olWOABGQhBAsmBDe1UiHQzccmOL2
 wW88Is75KifwxI2VMq1WwTOW5qQl9t6U34jtcOTO7d/u5XLAHHncOA07waHcEm8lpUoN
 EjzA==
X-Gm-Message-State: AOAM533PX2KMZxRmpkqg6RE2kiR/F63OI7qlAp4Ifo9t+mZhYXo5Gm1L
 a8DuqvLS3XjFtHMvfs1cWvg/QPmt8iQaXw==
X-Google-Smtp-Source: ABdhPJyhp2pFQlKoF167q88eUP3wwDyrnAMI/1MGpPpZVoKGYGtGq6c92VeR73QETC1mJIRrf69mEw==
X-Received: by 2002:a17:90b:4b82:: with SMTP id
 lr2mr46178111pjb.111.1626107372459; 
 Mon, 12 Jul 2021 09:29:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w9sm12859994pfu.112.2021.07.12.09.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 09:29:32 -0700 (PDT)
Subject: Re: [PATCH] target/i386/tcg/sysemu/bpt_helper.c: typo since
 cpu_breakpoint and cpu_watchpoint are in a union, the code should access only
 one of them
To: Dmitry Voronetskiy <davoronetskiy@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210613180838.21349-1-davoronetskiy@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17761933-8df7-6edd-9c35-121e9b990398@linaro.org>
Date: Mon, 12 Jul 2021 09:29:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210613180838.21349-1-davoronetskiy@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
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
X-List-Received-Date: Mon, 12 Jul 2021 16:29:39 -0000

On 6/13/21 11:08 AM, Dmitry Voronetskiy wrote:
> Signed-off-by: Dmitry Voronetskiy<davoronetskiy@gmail.com>
> ---
>   target/i386/tcg/sysemu/bpt_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I've got a small queue of other i386 tcg stuff, so I'll include this.


r~

