Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDAQx-00048I-Kp
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 13:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAQv-000469-NU
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 13:51:01 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAQq-0002ku-UP
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 13:51:00 -0400
Received: by mail-pl1-x643.google.com with SMTP id h2so918960plr.0
 for <qemu-trivial@nongnu.org>; Tue, 01 Sep 2020 10:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Ko1jM+38f+VOxHuq8IymQYkeWmQIek8QusLvh9d0fg=;
 b=C24GLxl8ZOktYzKsSfJDaZ2LgxElgIfkMv/dklBM28gU+/56MZNyumhTuFMVEyUqkj
 b3Cg2641DEEyQgw7x882Yog1vFHogE6W6IjEw9hPplApxb41dyMDP+WKl0BNsJoqLf+w
 fPBZ/8xUK01IMx9gVwDIQOd0WI6qxYgV4V88sJJYa7341whgab61id/2AvhOwjul3jzp
 oD33ZT7cXBUaDuyCL0qtWW7jgbxdaOFSiLflnTauHCDeU1WYKe/DnD+HSXyLeuY5Nsp/
 ai4tUud8gx3pmfuP3Q6kA7i3GPPWQy2nmU1c9RWyC/0+NeACkIehZcF3C8QPweDsXIem
 pB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Ko1jM+38f+VOxHuq8IymQYkeWmQIek8QusLvh9d0fg=;
 b=ffsl0ERv9DyYQ/NMTmrOMOgdwPY7GQO9+7y8C1PrcMw6+a8DXp9+IehikEDgQbdMxh
 rsAa0qvxW3S1eO/p7nodIyTIBV6jxoXHdwx73BxKdQaqcxdZt1AogEpjbjmZ/tofe1+e
 dINtgwpBnwsT2QXXCUZ28zGa6/tabT+px3FW+70DCFh9s/sSl9RxnNXksrABMwlOtJxW
 Ouy2K1deZSGdQLw6AIIzi6nXWs0V+nTOtefLC94EByDk6e0y1cMXGcdAEfBQxOg6gCcp
 YDDuf0Ycg/5IgCdWKh7XVForJFxbGibWfydfIC7bvgi3xjLouOiw4Ed5zq0T1JtAOIUx
 g+CQ==
X-Gm-Message-State: AOAM53044lJf08Jo7+1c6X3ivg3/dpe+2F7E4Xxuuf2lA9PBmMrUbkUL
 tEFkEcNY4bc/ILvVQiKm20ji0A==
X-Google-Smtp-Source: ABdhPJyw5j64baONFL3+S6Y4M6yGHvx3pgWDaHilByaCumrtvLv2JVgfnLGW31vmGzM8iSOKBP6Rcg==
X-Received: by 2002:a17:902:10f:: with SMTP id
 15mr2306925plb.232.1598982655459; 
 Tue, 01 Sep 2020 10:50:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y65sm2521484pfb.155.2020.09.01.10.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 10:50:54 -0700 (PDT)
Subject: Re: [PATCH 5/5] hw/isa/isa-bus: Replace hw_error() by assert()
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
 <20200901104043.91383-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79238190-0c1d-f6c1-bf2b-e9094241689a@linaro.org>
Date: Tue, 1 Sep 2020 10:50:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901104043.91383-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
X-List-Received-Date: Tue, 01 Sep 2020 17:51:02 -0000

On 9/1/20 3:40 AM, Philippe Mathieu-Daudé wrote:
> As we can never have more than ISA_NUM_IRQS (16) ISA IRQs,
> replace the not very interesting hw_error() call by an
> assert() which is more useful to debug condition that can
> not happen.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/isa/isa-bus.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



