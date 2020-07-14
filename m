Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLGy-0001jx-7z
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLGw-0001jl-Gs
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:47:02 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLGu-0001zR-KB
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:47:02 -0400
Received: by mail-pl1-x641.google.com with SMTP id b9so7048990plx.6
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VO4EsOLQ9zXwlMNSKCL8OMCJ7tgsj7zp6bxn6FBaSJ8=;
 b=CKSmPAvi0g/DKbCED6JAcwjRzRpliE1P8IGZVUI+iyKa2N2+BczuUxj0Qy0D4AdQ0S
 xLsJqw7ub/v4aR7bkNKU8fptx+rYa0AnuNcou4dG6PH2HFdWWat6pn645CODwQZSHH/E
 HEw7jMOcpG7HCl6SoVd/9wYzs5tIQMuTy/z2mH/8bgubNuh3dEu1ZG/EvtNXQtqeK+D0
 PEngEKZuAYgNLNtApP6qhVrtbPeR6gF9Ti3AihpRnRcR2FoC2ZMQTug5F9/eC5RkEABr
 d0UYRy4ld+Ew60uQmeX7JEdWoQSWkCbNznZmlCLofrktKMapq+dwFfOZkNOD+afCW3H7
 HKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VO4EsOLQ9zXwlMNSKCL8OMCJ7tgsj7zp6bxn6FBaSJ8=;
 b=cwVWh/ePBgwQvmrV4cBJVOtZuSt9yKFKALAbNQO7smgU6oyr1RkkjhzgRm6cAMZKJ4
 5ghW0t4NunYCXWwcfdBY4Cgp+UJwxdDlfLHekLzPQ8JWk31E7XPzwXRG0XkNj4NLCu9p
 6AKTUrejCp8lJVldcRkxaAAegeRG6JPxaCOQwMuEN732pcxjZR41qBE1IvgpTrBsqXTi
 W2uQlCctTD4MuJVjbBSTNTke8hze0fzbT4abwTJk69lXcipdH9CK7Lveh2olnVGNm8Sc
 Ygv43q8pLuqelxmoSBGRnvRZHDVVISibtm67vAPM8+sgBzixYefVDIyd/4ZRzSkhd4EO
 wa3w==
X-Gm-Message-State: AOAM531rR5Q5gsUr8Fxu4ZWd88wxPqmhVdu474x9F+hb03bJd5QhUdPQ
 I3wut4aXNLs/DJtkZdMZwbW1D9Pk7iw=
X-Google-Smtp-Source: ABdhPJwWui9Zfff+kqd4a61K/bOX4twsvsp/Rr3mRcQm5N2gTiii204WVgZxww2JEM8b708V9O5umw==
X-Received: by 2002:a17:90b:19d4:: with SMTP id
 nm20mr5073548pjb.206.1594734419081; 
 Tue, 14 Jul 2020 06:46:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id az13sm2622039pjb.34.2020.07.14.06.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:46:57 -0700 (PDT)
Subject: Re: [PATCH] migration/migration.c: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600433-23107-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <191131ec-cc26-3db6-bb97-a17c687ba2b8@linaro.org>
Date: Tue, 14 Jul 2020 06:46:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600433-23107-1-git-send-email-wang.yi59@zte.com.cn>
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
X-List-Received-Date: Tue, 14 Jul 2020 13:47:02 -0000

On 7/12/20 5:33 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  migration/migration.c | 2 --
>  1 file changed, 2 deletions(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

