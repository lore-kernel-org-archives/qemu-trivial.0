Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qZeUY-0007fw-Vy
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2023 17:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qZeUX-0007fZ-7K
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 17:37:17 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qZeUS-0005XS-4E
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 17:37:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c0d0bf18d6so11844175ad.0
 for <qemu-trivial@nongnu.org>; Fri, 25 Aug 2023 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692999430; x=1693604230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eg4IN/Tm8P9aY2VZWhQPl+5fULwqejcAwG5HOa9DVdg=;
 b=jnNarRhHe62F4q56hb6+2cc7nj26TP8Tsl81AsDdIxQ0hspSGewMHiLIijSqTsVG4w
 sKLabYADA2XiG6xVkonlaNXdceGlDpLJ8xeX+cuEQqwWh5mk1iPMLG7UMaB0tO9B3EtR
 iFbOMrSyc/mEkuCG2tkSdeJTaBqnr6bnnriYVw0weW06m1AFvE/saU6/aOFEFMlVdSPr
 0dcZitb1skkHPPhWt6nWBtYmsGl+dPOumnjIv25fEapQxjf7yn3806Fazg00npaN/SK1
 DTpmb92DHruuuJ4+KlS3ckF7lSUp84x+szWs7FtTSSSvzFYAKrmdsCMCNGJn1+OerKTu
 r3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692999430; x=1693604230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eg4IN/Tm8P9aY2VZWhQPl+5fULwqejcAwG5HOa9DVdg=;
 b=GSOmxJby2qoQGvguTv2ytPx88AWcV0Ju9vN7oS3DCH3L+lzPlhcvKRdi6tnZt6eoSZ
 Y7/C8tJLv5k/5FkoeD3g2TBIXd2ZsX8Qyxc/cac8b6Ag+phaKO2WS/ws5euMGnsWa/l2
 tyKUGLa6YbduV1DD/oeFQybTX3YBvqYcWlZKu8DFYk+Y1GJmAmghNDMjfZaj5wwdVZh/
 ys+2b/DM5FOBFqq/9Uk4sCwiS5woqCWsdDBUojJXNAAtbLlp/An0AxNwirqfCQgUQ9Z4
 LZz8vTfvHQMbi/r11mgKD3cd0xvnyz6hro5z0A+BxabXCzdjiKkfZySQ0WC8FtXpcEkF
 Gz/w==
X-Gm-Message-State: AOJu0Yy+A0Wz0ANukoTIrQ+VqYlIEI5yDU9+FvDhUf6i7QwL/aVbmBd0
 +J6A5FHHTnJD5YfJyw1af2rv0w==
X-Google-Smtp-Source: AGHT+IGVF/BRLrdK10Zd3MGF3OleXILwtHm2aZZgiB1c3lhBluht50z852B2Zp3JQ6X9Ir2yhTLHaA==
X-Received: by 2002:a17:903:1208:b0:1b6:6625:d3a8 with SMTP id
 l8-20020a170903120800b001b66625d3a8mr22420841plh.16.1692999429721; 
 Fri, 25 Aug 2023 14:37:09 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b001bf10059251sm2207775plg.239.2023.08.25.14.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 14:37:08 -0700 (PDT)
Message-ID: <f1f6327c-366a-5b7e-42ab-cfa90a3c7256@linaro.org>
Date: Fri, 25 Aug 2023 14:37:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] hw/mips/jazz: Remove the big_endian variable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org
References: <20230825175123.624114-1-thuth@redhat.com>
 <20230825175123.624114-2-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230825175123.624114-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.57,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 25 Aug 2023 21:37:17 -0000

On 8/25/23 10:51, Thomas Huth wrote:
> There is an easier way to get a value that can be used to decide
> whether the target is big endian or not: Simply use the
> target_words_bigendian() function instead.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   hw/mips/jazz.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

