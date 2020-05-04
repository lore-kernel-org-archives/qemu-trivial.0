Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVene-00071V-Dj
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 13:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVenc-0006z4-Bp
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:22:36 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVenX-0004Ny-MI
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:22:36 -0400
Received: by mail-pl1-x643.google.com with SMTP id w3so5333plz.5
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WeZ1aCjfwHCKDvWu06jXxZszAC2JaQ1CtXTjM1KYrAU=;
 b=FYNDB6xc3TKPrXLk2AAmzZH6Ga7kULLiSQ1m3O5Rq3hmyMx9c+4uXJ86ENMZ8qOJEf
 8rkk3AXmztKXxaB2mW/4FOrtWwTxkWDg+qk/1orSlKEbSRZLvB58imVmzal3FB6nT7+y
 qggsqxAV/T248OXaOxTgU2Wymw+m9xG1QIOFEC0Qs6tCef6VkWTw1qr0r72n7x1dTJKd
 KmDOjh4M8pGAL1BY1mGDN4EnqS0Epaxr5iSTaccei3Py30SotTpdq+we3FXk1HT18NqA
 I7YDFOcfyh0fQiWfkH5h2nKhgkDhuzEWoxRfylaXVpMzrvESfd4/16ebWop51pC6nk6z
 aFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WeZ1aCjfwHCKDvWu06jXxZszAC2JaQ1CtXTjM1KYrAU=;
 b=UhxqJmtU0l+NF5FJxcX3oHLdFAFglT9GE1dEZDB/I6pwwMg4mPct8xOWWFsGII+HwR
 prL/O9ZsUI53MZ0hrDFAZkg7erJRgm1DDb7WaNmXhi3/Qq4c+US0EYuKStqxZ6U8mx0b
 azZhWWGPfso38jq5tbHalo3LKJCFQwyOUikdE69fEu595ygMoE4HADXu/4o43RZYfBjy
 l9JsWnYHQZBqx6cs3LtP5Q8685jAcFWeYP6yBYYIQ0vxX4G1Vq0B3zY/mKb3vDLhMZj7
 o1Nr+c9ZMs4VSVK87ZSiC1OxmZ/w3axTpIkPO55je/kM6Z6ILpy4qibDacerd+ba7E2r
 hjjA==
X-Gm-Message-State: AGi0Pub1Y9Tp37iyCcJTCYuIpVgBNmN3jqOxxDyppjBKQ2hMB8iJXgE5
 CS67C1XrPd1DF4P4VvZ9SVkpdw==
X-Google-Smtp-Source: APiQypLSbMfxUCaj63NATnz/UvVUISOwautoO5Nd9jyqQ4jFoGt6ZJYsU5clzdW/8OolReUVH2mWPg==
X-Received: by 2002:a17:902:7444:: with SMTP id
 e4mr282402plt.130.1588612950244; 
 Mon, 04 May 2020 10:22:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c1sm9223776pfc.94.2020.05.04.10.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:22:29 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/timer/sh_timer: Remove unused 'qemu/timer.h'
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Magnus Damm <magnus.damm@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200504081653.14841-1-f4bug@amsat.org>
 <20200504081653.14841-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17e36520-b9d8-caa1-5695-ad361d58b5ba@linaro.org>
Date: Mon, 4 May 2020 10:22:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504081653.14841-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 17:22:36 -0000

On 5/4/20 1:16 AM, Philippe Mathieu-Daudé wrote:
> Remove unused "qemu/timer.h" include.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/timer/sh_timer.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


