Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tPUnK-0002ak-CU
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2024 17:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tPUnH-0002aC-5C
 for qemu-trivial@nongnu.org; Sun, 22 Dec 2024 17:51:28 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tPUnC-0001Al-1R
 for qemu-trivial@nongnu.org; Sun, 22 Dec 2024 17:51:24 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7fd17f2312bso2570217a12.0
 for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2024 14:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734907879; x=1735512679; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9O5asO7pYq/pHHiRROp7oqru8ZWyu6V95BNoLY8F+aI=;
 b=UkQXKKfKGGRc66RZClX4a8y2hU1s/WGbQ/jL2NgFR/2d44VbMfBKTGsX5tc7V4AU0M
 2HOm9rasbfHbq4znZE3O5uOXCjrCsrBIys7XxlLsIXHk7C2l9CNEAou1jBnm4H5wbItJ
 p27pny1BgKINf5ooBzHFPNZCqPQNQ26n9DkQK3Z1llG6vuTiCuHnsnyw2nvvmnLIMxRk
 GT/Yb+ymQhJN/n5OywuT25xSCQDcCwoNiaWQ6tFx44HGJTKnu1Pxxg/RrlGsmtzavQgT
 yr2nYeoVhgr9Cc30snQ/YPgq0lcni6qz5+JKT5VO5RlzY9tUxCOezQwVI0VuvQAEgXnY
 Kw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734907879; x=1735512679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9O5asO7pYq/pHHiRROp7oqru8ZWyu6V95BNoLY8F+aI=;
 b=McYtoGzlTzkhq89NgaZoyqJVGyF+OuXwkeTTrYiftkGfxTRzf1XXfM14ImcGCLuRYK
 Ui6+nDBJ93RufxppjuD+DYEEoYaJ7wgT9T46oxHdRqVDhNC+n7BNHn9C17hhRLgZl4mr
 CcWH/SyP/BOs8ieVDfYIUzf5YEGrJx4qQGLoypcDhUUCcspb6X5c5zoUfLP8KYU//j0B
 b/SrqCSfM13rVotNcr4G2v83MXUOhIc9dU1siEivDKncRtP0pSn8Utiei0qTQiq8KoID
 djMalZTdHG7f/4poY+997dZ0+IuWU4vzBLYVaeogOiJIRTJlpQKIOsmXSm7Cz+cPSXVJ
 1qqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5R3dx7DNLatRpVnDc2/vxVMNhIc8vBGczzPndmAFQG+rPD+kDh8nXdjrDU7EuyQJkvVuANev5tXAGab0=@nongnu.org
X-Gm-Message-State: AOJu0YzQXO2gbd4sG7rWJKZYqNJVE54a+UgzBxbI3sW9BsvFj8QD1NBo
 kMKFstCSM0fROBe6bgMdjo/dBGRW86MAXlfTOeyFPoW/j44vTGWGz8mrW0Urtdk=
X-Gm-Gg: ASbGncsPu5FsKywGcxc+3oj4UwrwrHTDZrhdiYhs11RMNcHgw0wiadNt8jEvXkGm5LO
 po5cpFmiZyYjN6NW3dEq8T3u5DAHAzVrdXIpfwQU/jk7lOnmxgaxuXRR4ecnf0nbJB0xsy+pREo
 9sYOngt4jDwEv2ohxVIxAmV43Y1OOcXTQgM3x1X0bC4fXXLsYrGGcGi7iMqbXJT41ZFbfGC+5aq
 PAvfu13lmIi8bxXORoDPjvqn0wCHwYlCBjFUOYTdiUMU47NkwF5mGq1UFT4J4r/G1Qi4A==
X-Google-Smtp-Source: AGHT+IF6eO24UJw77C1AD54w7rcWghttUwpJzai3v1vqxSE6zf5Rr2e67jSZM3idN9hrI8bDUWI4zQ==
X-Received: by 2002:a17:90b:2d88:b0:2ea:7fd8:9dc1 with SMTP id
 98e67ed59e1d1-2f452e4c515mr15142434a91.18.1734907879206; 
 Sun, 22 Dec 2024 14:51:19 -0800 (PST)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d97casm61116385ad.138.2024.12.22.14.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Dec 2024 14:51:18 -0800 (PST)
Message-ID: <d0e08dc6-b4c1-4c14-9aff-5e726f04792a@linaro.org>
Date: Sun, 22 Dec 2024 14:51:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] contrib/plugins/bbv.c: Start bb index from 1
To: Michael Tokarev <mjt@tls.msk.ru>, ckf104 <1900011634@pku.edu.cn>,
 qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, QEMU-Devel <qemu-devel@nongnu.org>
References: <20241217142413.148978-1-1900011634@pku.edu.cn>
 <514c2c90-4c0f-486e-857d-fa0360c47d38@tls.msk.ru>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <514c2c90-4c0f-486e-857d-fa0360c47d38@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Sun, 22 Dec 2024 22:51:28 -0000

On 12/22/24 01:11, Michael Tokarev wrote:
> 17.12.2024 17:24, ckf104 wrote:
>> Standard simpoint tool reqeusts that index of basic block index starts from 1.
> 
> While this patch is a trivial one-liner, but the underlying issue requires at least
> a minimal understanding of what it is all about, what *is* bbv to begin with, what
> `simpoint' is.  I'm not sure it really is a trivial material?
>

This fix is alright.
This plugin generated data for a binary analysis tool (named Simpoint) 
that needs specific data named basic block vectors (bbv).

I didn't use it myself, I trust this change.

>> Signed-off-by: ckf104 <1900011634@pku.edu.cn>
> 
> Do we accept such SoBs these days?
> 
> Thanks,
> 
> /mjt


