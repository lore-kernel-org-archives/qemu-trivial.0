Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jmhUw-0007jn-Mw
	for mharc-qemu-trivial@gnu.org; Sat, 20 Jun 2020 13:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmhUv-0007jg-Qu
 for qemu-trivial@nongnu.org; Sat, 20 Jun 2020 13:41:45 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmhUu-0006ft-6W
 for qemu-trivial@nongnu.org; Sat, 20 Jun 2020 13:41:45 -0400
Received: by mail-pf1-x442.google.com with SMTP id b5so6112280pfp.9
 for <qemu-trivial@nongnu.org>; Sat, 20 Jun 2020 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6wXKkdIPwitC7Ac3XbMWhpghghhITlklPMIrHwCSjEg=;
 b=oPjrwBjX8EH5Qo9fBaaD4SOpb6M6vBbgsXm5OD0PaIgFv/fBO08MW1DwhMQHKBl0IS
 OErZEvlrC4gZxEXf/0rz21ayr/1QffEf5NdaMftaJYZEst9T40aK3zH4n9geuMZnbL9j
 suwNgVDSLj3WI/id2O2UVbNfkbnJoxB3lGAbghINe2cgn2Ldabi1vjAygD8tkpYND6oO
 +Cqs16hvJWtHUiZfHwmiE4ylz9K1rpVqc8YC38dAbGyCAUgtpzHT26Elyjs3Zok1DUVl
 W0TsMJHQ7IEaXA1hyW1c14c/f/QQbKP5z7YHpcbShLhVuzFGMr0u8SETeiUG7X5tISFH
 ewMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6wXKkdIPwitC7Ac3XbMWhpghghhITlklPMIrHwCSjEg=;
 b=prxw9SnNKQSpFUptFnRf15/QCXtAgtDCOtRZhTUg9rwCnpE5wT6PLjane4MKZSOrUv
 G0UMWDtRBT+akgVoohTPSsw2eOX9xCwzhKNI/c16aHdszHOVGN33Nc+Ap3262KlYt4Vr
 wEhAQQFPFAYUi7gZ7WohsCbwWHnGX5zo1v3eYN9a1WVOvOPcLFCOVpAacbPGZf9IN6xf
 n0JGHEmQCShQ5+pOA8gmQ3HcKCwUbV8JEJjWU93MV2JPb6VnDBG9sTDgJ4VdRnu6F5tL
 ye+LmkWQSjcsOTT/4RXoxZVI+VTEVI5kq5rV12YIaWYtQ63ya8y9OuB27B+1idLazdzT
 YvNQ==
X-Gm-Message-State: AOAM533UiBNc2+VM38M6EpZqwBUhkH0Uu5lSwzak2Qzh2KSZruPuvRTR
 rjKdAGmUUHnkg9GqtdnjwTpkyQ==
X-Google-Smtp-Source: ABdhPJy4+drdtiKYXX6CQkQ9bD4/XhkTyNYTeRiRF88JbgVysqSKatIqt8fTMeMGw9K7+kw323DODA==
X-Received: by 2002:a63:9247:: with SMTP id s7mr7377074pgn.355.1592674902597; 
 Sat, 20 Jun 2020 10:41:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a7sm8738009pjd.2.2020.06.20.10.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 10:41:41 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] MAINTAINERS: Add an entry for common Renesas
 peripherals
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200611114317.13044-1-f4bug@amsat.org>
 <20200611114317.13044-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac279de2-56b8-5e39-ef3f-3f26f1e0029d@linaro.org>
Date: Sat, 20 Jun 2020 10:41:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611114317.13044-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Sat, 20 Jun 2020 17:41:46 -0000

On 6/11/20 4:43 AM, Philippe Mathieu-Daudé wrote:
> Renesas peripherals are common to SH4/RX based MCUs. Their
> datasheets share common sections. It makes sense to maintain
> them altogether.
> Add the uncovered UART SCI peripheral.
> The current names are misleading (see the 'sh_' prefix).
> In another series we will remove these peripherals with
> the 'renesas_' prefix. Out of the scope of this change in
> MAINTAINERS.
> 
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

