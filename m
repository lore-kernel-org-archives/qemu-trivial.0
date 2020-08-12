Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5uqu-0005w8-K7
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 13:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5uqt-0005uD-4B
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 13:47:51 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5uqq-0004Zt-HS
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 13:47:50 -0400
Received: by mail-pg1-x52a.google.com with SMTP id d19so1411534pgl.10
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6jyCXEH3KtStyC/TRsaVzmnk+vwxZUBaQN/5RDvT1yw=;
 b=THUqzpLTMAAbl8EcfhkdTlevdFFLVAG+eU9OEaAW+mVD/3ZPKPLSbP0HAWWO7jfdW6
 gYihvQjOQdyXl3YXjqEysQnZDL16ZNehC6T3PiSQH6fCtdoF/Kz67vBuiiqXOckXXD/p
 haiVR6Fomnxa+KarzWIO0JJk0gCowE0Q6N3NqfiFxc82/yMaGNnef0e6oZCB11xaKW+p
 QIIb/3A5GJjJQSqQ3oGTDEHLqHiAYG4QC0te065tpLAvzUZfpMjL0gTUQJXEJFJrhXri
 qFmvcWYINe0E5qdPCYvX9NITnbahvLtS3RPjZie9J9PzdCLgM/p/RFHwuLWvYAiERA8f
 5Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6jyCXEH3KtStyC/TRsaVzmnk+vwxZUBaQN/5RDvT1yw=;
 b=hInLleKXZRPChRjiBUSf3pTgSVYVZSxH5l6KJeUGuie2vT5uR/UWdKMLTgsmp4DwTn
 b9aA2Bv2sQ/H7mSQNDXpyryvY0CrqYW2qjvqxa8EzWakEa3mXpt0KRBmpAM/yTHFYhIU
 M3IpNzZaE4kSOoLDZkvEfdUygVi4dYnJySqKRPixEg1pB83PKwk9vvkXHNVNrrgwHoR4
 fwqUi3OCGyqAp6O3S5wg4ivOzIgnq58sSQcRS/FH3jXv2tYVXhk4jBwfLy5g1Bk3vMJc
 Jtns7GqP91HKZ96dMaR9NmmoSLVQUK6qTGWZcHMlIyPtNNr/J9fff0o/bYphCMgt4goF
 2nTA==
X-Gm-Message-State: AOAM532GEIzvePScgabLJ+cH9K4onihRHGxFX5J6nVV8IGKGLB76mZyf
 PbRaYpLB5ccIcccpfQXx3gJw8g==
X-Google-Smtp-Source: ABdhPJyQlRXRQ0wJ7Fl5g9RzH54qYBK+npDR1PnkbljaWMMqMSkOYDItt1SFwsi+yRpS1mISF3n+aw==
X-Received: by 2002:a62:cfc1:: with SMTP id b184mr592065pfg.262.1597254467134; 
 Wed, 12 Aug 2020 10:47:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 27sm2766771pgk.89.2020.08.12.10.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 10:47:46 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 1/2] hw/core/sysbus: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200806130945.21629-1-f4bug@amsat.org>
 <20200806130945.21629-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce7d3f88-6ddd-f100-a021-75dce942b0b6@linaro.org>
Date: Wed, 12 Aug 2020 10:47:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806130945.21629-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Wed, 12 Aug 2020 17:47:51 -0000

On 8/6/20 6:09 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/core/sysbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

