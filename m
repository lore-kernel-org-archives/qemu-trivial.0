Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t02S0-0007u1-FG
	for mharc-qemu-trivial@gnu.org; Sun, 13 Oct 2024 13:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t02Rz-0007tT-4I
 for qemu-trivial@nongnu.org; Sun, 13 Oct 2024 13:32:15 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t02Rx-0003Uk-Hu
 for qemu-trivial@nongnu.org; Sun, 13 Oct 2024 13:32:14 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7ea12e0dc7aso2191591a12.3
 for <qemu-trivial@nongnu.org>; Sun, 13 Oct 2024 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728840731; x=1729445531; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZP0WMWfQsWND2hXfrlLLDuWYr+jxyVrzNmuLdqQXwOo=;
 b=dDi3UkNNs7Ysu/MhGGB7N4jF4jCK+HVgnvjW9vjWxG0sNIcfi63tnGLWFihOBOV3BL
 +lhWXtMg0H58LFZa0X8rKtqMv2lva9/JqQBxfQLsHk4G/8X/N0uPQ07NWTSeFLsbiHHQ
 yxH9wEJ1QW3Xnn7gJ8D/ZeRL14ZI6Occ9DEMYUHSahcZg62U05xPXqAomYyKN1aGcpYA
 XLrbtcpJfH7hgZA/h1+kriye3zmGphgbcQuWEM5mE+e7M48KAxidmh9xJBrId+94ovi8
 aUCK3odWCENVgktmyEU/rBBUnuoqc4B0IxgNOB2wkvhgD0xaO3gLWWP5Wn+gLUjlO3Nh
 E9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728840731; x=1729445531;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZP0WMWfQsWND2hXfrlLLDuWYr+jxyVrzNmuLdqQXwOo=;
 b=Db1n5ZnoKxqDaAoQ2nBp9/DalcWdUB7N16Y5jIw87nC8+vLCXsFWjsGNG822CIcCfH
 YV57Y/ouc/jF+ERnqsF9Z8U2qbWdR+Nb5on6uDzkrmzJ7Su+zg7tIXv8Xv7lQgNiUXBk
 rLmIX7VCB6xdCold8G3M1NKJ9N7Zu4GDKgaSyq6klpWQknXPIPiaOVJYOQlOebib0Vjb
 vhMOWi3cYXycQmR87IigGCupEu/SOKdj7H1q/ISrRD4B30XyC5goc1xv4Xs+QKb8V+1J
 cQvWTdzNhcMxMh8PubGE6vQf4doyvN1OUjJPpNaJoqPS/lBoEAVCDfiL6cdIoXS1Mcb4
 b3Mw==
X-Gm-Message-State: AOJu0YzFq8MbMPLXg/pGfu806ys8Qa6T+3YvCzcFozfmmzGWVHhZaMJC
 TWMsg1Gb2Jtqb3W1yGzedFngekgGKrg1nwwSyL2ytWzSU7gG93Y2x67o/t8dvZg=
X-Google-Smtp-Source: AGHT+IG/khCY2oUQiQzBUIi8BAD9cJHx2bRzxMq0kb6mBoLUjV+q0htrxkfrT34FRhDp1e15beXUsw==
X-Received: by 2002:a05:6a20:c797:b0:1d3:5208:1ea6 with SMTP id
 adf61e73a8af0-1d8c96ba5femr8821399637.45.1728840731187; 
 Sun, 13 Oct 2024 10:32:11 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e6164e825sm1022356b3a.61.2024.10.13.10.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Oct 2024 10:32:10 -0700 (PDT)
Message-ID: <7ee485ed-dcab-48cf-8c1f-bd985e1609f4@linaro.org>
Date: Sun, 13 Oct 2024 10:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-user/vm86: Fix compilation with Clang
To: Thomas Huth <thuth@redhat.com>, dave@treblig.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org
References: <20241011161845.417342-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241011161845.417342-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Sun, 13 Oct 2024 17:32:15 -0000

On 10/11/24 09:18, Thomas Huth wrote:
> Since commit 95b9c27c81 ("linux-user: Remove unused handle_vm86_fault")
> a bunch of other "static inline" function are now unused, too. Clang
> warns about such unused "static inline" functions in .c files, so the
> build currently breaks when compiling with "--enable-werror". Remove
> the unused functions to get it going again.
> 
> Fixes: 95b9c27c81 ("linux-user: Remove unused handle_vm86_fault")
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   linux-user/vm86.c | 65 -----------------------------------------------
>   1 file changed, 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

And queued.


r~

