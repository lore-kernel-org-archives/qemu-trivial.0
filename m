Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6d2K-0004Or-70
	for mharc-qemu-trivial@gnu.org; Fri, 14 Aug 2020 12:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d2I-0004Nv-Rm
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 12:58:34 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d2G-0004eD-7c
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 12:58:34 -0400
Received: by mail-pf1-x441.google.com with SMTP id a79so4829736pfa.8
 for <qemu-trivial@nongnu.org>; Fri, 14 Aug 2020 09:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cmFP6hNCn9mUKVqqW0srBpswncbnGOgdB4gEI3EcDDA=;
 b=P7zx4TrANJCUKxf/fBfqa1Y+K/me/cvU8DEVbUXUx1q6gWyMNu+cNRh/kI2vXGXcek
 5IpW/seDVA+u6gRU1mTEje99lO2VLmBDRKrIGyFewAh8o2GzQ3vApcqvx6mtVz5SJPon
 8z2kILkaxnHn0Lwz1ftgm8w+arZ/JqFOVUWmlLhvhUxqY4MlNk/bPKynwYNLKAJqDWQV
 noNDgljOAiOqU7qZ61rvQlP2/4ReQrdDscM3l/jPzXtOxs15H78Rm5pBCBZ9r+aYwPLw
 sc/eHEBGBcQjmYlYHOPB7RTMIF1+paDNZ+3UI3WLDut8S7aH3LvCtOqVvY3hCCRP58z0
 v/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cmFP6hNCn9mUKVqqW0srBpswncbnGOgdB4gEI3EcDDA=;
 b=tHlFmHg4jizbZ62woY1sq6WbigS3n8HPrZOPYHCbNvGo78CbDgEhVpLKg6AwUjuVag
 ksbxtJ+n+zXAcs01Nid9smYRctLvCJYaupjDFwdddrTJlAaaqtm6vAMWqArrwx3WrBml
 v45+gNuQ2pRRmoh55+0WR6ftwz4zcexz8hN66uVv8I52SI8UneIw9RTEGjaxgeD0ETky
 SbjPQpvQXERa6e6t/NOvzN3yfb6KXp+9f8bsL26IrMnYUlmu25rjIxAN1NJ0XXxPHE5v
 jYWUvZ0roiqlwb0u09DyXfVEiw5ZHoZ6tjRnYLDwbz/AC5en3pt9Uc4RbW6HNaVr2lzj
 TM5Q==
X-Gm-Message-State: AOAM533iaZmcQfbYFaCmhkhPstSA419R+HKyyS7uHumRfG/9BAMO+uyy
 4Xg0//YRK5PeuBm5JBB2ReR+JQ==
X-Google-Smtp-Source: ABdhPJzhsJpU+eL4pPH7R8RKBJGSnv3gr3B/JL1ROsD6bkuVKcrbbtbH9mWt/ykc/HBhpdXdUuemGg==
X-Received: by 2002:a63:e118:: with SMTP id z24mr2281766pgh.230.1597424310550; 
 Fri, 14 Aug 2020 09:58:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x15sm10037705pfr.208.2020.08.14.09.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:58:29 -0700 (PDT)
Subject: Re: [PATCH 1/7] block/null: Make more explicit the driver default
 size is 1GiB
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d12e9c0-dc03-ad99-be33-427a001282f1@linaro.org>
Date: Fri, 14 Aug 2020 09:58:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Fri, 14 Aug 2020 16:58:35 -0000

On 8/14/20 1:28 AM, Philippe Mathieu-Daudé wrote:
> As it is not obvious the default size for the null block driver
> is 1 GiB, replace the obfuscated '1 << 30' magic value by a
> definition using IEC binary prefixes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  block/null.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

