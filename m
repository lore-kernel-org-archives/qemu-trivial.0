Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDAQZ-0003Yu-6M
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 13:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAQX-0003Vw-PI
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 13:50:37 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAQW-0002iu-2M
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 13:50:37 -0400
Received: by mail-pj1-x1041.google.com with SMTP id o16so997420pjr.2
 for <qemu-trivial@nongnu.org>; Tue, 01 Sep 2020 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EeXj38jjFxK6UZOgdL9WRahH9NASK0CKMsRKW0XxMvM=;
 b=ns2hSOe6mpTarOGS6L5Hy1Lfe6TvCPEZFOnvlrr4w9H9H+AsWLXD4Vhxa3ngbg/Qxw
 N3TemV+8lrjDoYekRTWEZ6s96TvDH3+sgDLwDLlWrbVLZevzY/pDemTrpvDxoXlI2+4E
 dMmez9xJ4QB8zrWKlOfhqvo8AL/cQvq7pwmy9W4piihFR4fFizG1crQm5QboYaFRGgVP
 X76tUhFMCai57A79Odx4yiXOoetis15JCC2YmjuvN8I0q3pZ5FOpe7UAikRxGYBMJOPd
 TmDqUk5NDPuJSfxTkRKHJpCfYMF7Cem2RkYgfPn7sUEQUt/GXY+8w0OvCur2+9+KuMLh
 M9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EeXj38jjFxK6UZOgdL9WRahH9NASK0CKMsRKW0XxMvM=;
 b=PXV1A1Bbmqx8vjXFQFzFFbXtximrwAM6MSMHme7eJlRFn2GuNeKzaqs26pS32w2Y1K
 BzoN7ThD3sasHulu7sz4zOCrqPSiQFxO4kuqTDPNhxSFs5DvHDARyNhLXDbuqTyrJfmX
 DJnhAz5T+WtcRhmw3SKjbmTCi4QwK1YmxjU7V2c1f3RysC/iNJtWy1VwKjbHcpO74cw2
 9nd7k5tE0HdOsUM2lO14iKmlscbPxnvXFtv1NE+4ek0VYfxKTtdZpQliH+nrCzBuaDB1
 smgzb0q802FkI7fgbIjJCnSB0iSFBF65z4wyeAJHoF6OTYaF59VN30HgpHD1F4wRAHsK
 nEsw==
X-Gm-Message-State: AOAM533s4EJXcXwLJNDR5GGMoX4gknpfUeRL7vA0p4cECAQHN+NKALVA
 9zr49iu94VMhClzWMG3Q9xT1PQ==
X-Google-Smtp-Source: ABdhPJzWKBLaLj/zX/mVPp2lYdZHofGyOFD6M51NLU3sEroBklZfnrxpWV7bvVnTh+NlRr2EkP7OFw==
X-Received: by 2002:a17:90a:2e0f:: with SMTP id
 q15mr2654601pjd.49.1598982634629; 
 Tue, 01 Sep 2020 10:50:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q190sm2602142pfc.176.2020.09.01.10.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 10:50:33 -0700 (PDT)
Subject: Re: [PATCH 4/5] hw/ppc/ppc4xx_pci: Replace pointless warning by
 assert()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a912b787-4011-72d8-0cec-b41cffcd1cbb@linaro.org>
Date: Tue, 1 Sep 2020 10:50:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901104043.91383-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
X-List-Received-Date: Tue, 01 Sep 2020 17:50:38 -0000

On 9/1/20 3:40 AM, Philippe Mathieu-Daudé wrote:
> We call pci_register_root_bus() to register 4 IRQs with the
> ppc4xx_pci_set_irq() handler. As it can only be called with
> values in the [0-4[ range, replace the pointless warning by
> an assert().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ppc/ppc4xx_pci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



