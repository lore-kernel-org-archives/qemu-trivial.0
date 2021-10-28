Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg9jB-0008Bj-7d
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 14:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9j9-0008AP-JX
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 14:02:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9j2-0004yU-Qk
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 14:02:11 -0400
Received: by mail-pl1-x635.google.com with SMTP id r5so5023800pls.1
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KxBB6s+ApjnEywU03krTn/aRpNLuUV1/UczZhD7fAmw=;
 b=yf/ZIlgVC15hedHzvMvB8KQIhArEH0My0WDFeiKC3hG5yTTB3vGPpZ06LnLpPATFtp
 7FOJgnwoaYKkuWHoJJodK+iUB/JKunWvhgCGvdPwHqLRlgQb5defENUDXLdY5+Ynjctw
 lA5bM+V4BblCfrrRCuf8vvpFhnSpfA63+TEguMYbAwZesxJgP88LRBgMTkcOqV6iCm8y
 NO/jbV/sBrsnXB79m3OV8NzWn4/rWuz2XAUSKk0umcVGvllr+Jwabn7mkS17vVuN9Z4x
 e1Xhh989x+MeyJ4TCiN2gAtni6Ht2Ahaa4piB3r0HSWcCaopom5jDBXjxvo9US2DOYnS
 qSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KxBB6s+ApjnEywU03krTn/aRpNLuUV1/UczZhD7fAmw=;
 b=jituO1yYrFVS3wyTBuwlZbAHoDvxBgms+MXRTItJ5Qte/8vIwNO/Hq6t7P1iVNJcww
 T+sVu71WMGp+S/7TUbMZmksKIe5IkAdhaBGHsgkNke5pk3kF0cB8WBLuZZNMZk3P4t1f
 R0TsHg0I9v7W2fAB2B4GKLnU96aI6MUAFWFRxlC+ZTlhfQlyB9U6fOP26RxY0wRmqjDg
 C9jGNyAQdC1K7/rjhmQrXiKZEAAXaKymKeW97fA3+sPHmbqxIK1rRCw0OpUOZcHC1yED
 jONBtjIkLasOjBf2vlKtQz26+czkVvs3bNnFs/93xjF86lXYB9G0SsCeDMweEwD2K9Wh
 A+uA==
X-Gm-Message-State: AOAM532pUgxs/RMfNQE/vh5ZTI6Z536BqUm6370zb6atJ5g6RQN+lxyE
 e/w0xy02WeY7SyZGDsyMFTJZfg==
X-Google-Smtp-Source: ABdhPJwb4657WQ7WXTdNhfEz4AA5nYjrXwoa0bjKq0mEyrtBhDN0Ei0Dcb/iDyIUSeIl3UvosLI4qQ==
X-Received: by 2002:a17:903:22c5:b0:140:298b:9e27 with SMTP id
 y5-20020a17090322c500b00140298b9e27mr5396801plg.23.1635444123477; 
 Thu, 28 Oct 2021 11:02:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv5sm3725572pjb.10.2021.10.28.11.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 11:02:02 -0700 (PDT)
Subject: Re: [PATCH 24/24] bsd-user: add arm target build
To: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-25-imp@bsdimp.com>
 <CACNAnaGiY2NSgCfrx7eTzhOsfXMK4ZZoMzM=GtMt5nFuj5-jGA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8da2f237-4470-cc76-afd7-a3ca1a060f3f@linaro.org>
Date: Thu, 28 Oct 2021 11:02:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACNAnaGiY2NSgCfrx7eTzhOsfXMK4ZZoMzM=GtMt5nFuj5-jGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
X-List-Received-Date: Thu, 28 Oct 2021 18:02:11 -0000

On 10/25/21 11:21 PM, Kyle Evans wrote:
> On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> ---
>>   configs/targets/arm-bsd-user.mak | 2 ++
>>   1 file changed, 2 insertions(+)
>>   create mode 100644 configs/targets/arm-bsd-user.mak
>>
>> diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
>> new file mode 100644
>> index 0000000000..deea21aaf5
>> --- /dev/null
>> +++ b/configs/targets/arm-bsd-user.mak
>> @@ -0,0 +1,2 @@
>> +TARGET_ARCH=arm
>> +TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
>> --
>> 2.32.0
>>
> 
> I'm not really qualified to review this one, but it looks basically
> sane. I note that there's a gdb-xml/arm-vfp-sysregs.xml in the current
> master that should probably be added to TARGET_XML_FILES.
> Cross-referencing arm-linux-user and i386-bsd-user, this seems sane
> and correct and I'm not aware of any other options that we would need
> to consider setting, so let's call it:
> 
> Acked-by: Kyle Evans <kevans@FreeBSD.org>

Yeah, add sysregs.xml and give it
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


