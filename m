Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr3jn-0000lv-Pa
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 14:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3jl-0000jj-F4
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:15:05 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3jj-0006ki-72
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:15:05 -0400
Received: by mail-pl1-x643.google.com with SMTP id 72so1040425ple.0
 for <qemu-trivial@nongnu.org>; Thu, 02 Jul 2020 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V5/9y/Mf3uH8PSixJpL8KlaxaNHC27kDSwx3p67PBoo=;
 b=V9G/Garelc5XGyFa06TFEmD05Kl4YLmpAsqu+lBtlyXQfID0EfpPSfRrwMXPvZq0Cd
 84LPlFi22/pooVKWz/AowaRMCysnra/sQYH1Ka0NW7A//evCIXfayXN2TNdps/a3kZpy
 5D6IVyf2gdeXHrGmcx3R9JiYSPxcNwUuVL4tIn3gKsf+EIiLHHD0RQ62LmXQo+y0gY3q
 DuAv1T10oLKItNSS1OKmlZh6Dn4WgSYbRhreJcGssGLrMBpDeBIH+2kjtGyD1n5OZNBQ
 3YhtE7actsuxCihjRw3bNZDEycviF1gPBqw2YFhw2TKSvT/NWIPFbrG0BMgERdpXShj/
 3SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V5/9y/Mf3uH8PSixJpL8KlaxaNHC27kDSwx3p67PBoo=;
 b=jZj4vPzX7pceUYC1dLAiMa9a7bhG3/BvKIAPX1PEPGp5vfS/vpXfyJ7VRABM+H1atg
 Sc8pBUMEmq+Lq9SxhKRrESYc8atjh+BLPxmtNrKDM4kSXcqLD8luyZ9Pg7ca27S3mmNQ
 7RedpfuNZmexx+adne9H7VvSefVc34ZSaLyRmFF3oIfwUgujspdQfOtxxn9DlqxLM3MS
 w2nWlP7cxApsLwOzLuylmzEkiKu8RWZfpjHS649U8zSEai6hrQNY2dGQMjJHpl1hXzEf
 HlEm3Ke2zpyyE3lWj5/PtzUCjBrA3CzE1VuI4DbnoVkA9J5bNYgoHUFNctJMcj01H249
 h8QQ==
X-Gm-Message-State: AOAM530W+T9+sfxKqJL1g+ioZ4HkwQ9KiG0KjAdky/aUJqNGHeytWZZw
 jMAt3YqiNWURqhgZkdZK16X0kA==
X-Google-Smtp-Source: ABdhPJxNj3/52tht6iW+rmH6amX4QcizgMa2MvOer4t6xJP/UlMChpcTs0CVb/PTjq6dBa4/k66fEw==
X-Received: by 2002:a17:90b:f16:: with SMTP id
 br22mr18966074pjb.170.1593713701306; 
 Thu, 02 Jul 2020 11:15:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f6sm10446130pfe.174.2020.07.02.11.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 11:15:00 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/nios2: in line the semantics of DISAS_UPDATE
 with other targets
To: Wentong Wu <wentong.wu@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marex@denx.de, crwulff@gmail.com,
 peter.maydell@linaro.org
References: <20200629160535.3910-1-wentong.wu@intel.com>
 <20200629160535.3910-2-wentong.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fbd61be-a4bc-a6e3-7b6b-1d542751650d@linaro.org>
Date: Thu, 2 Jul 2020 11:14:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629160535.3910-2-wentong.wu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
X-List-Received-Date: Thu, 02 Jul 2020 18:15:05 -0000

On 6/29/20 9:05 AM, Wentong Wu wrote:
> In line the semantics of DISAS_UPDATE on nios2 target with other targets
> which is to explicitly write the PC back into the cpu state before doing
> a tcg_gen_exit_tb().
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  target/nios2/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Or simply remove it as unused, now that you've replaced the existing users with
DISAS_NORETURN.


r~

