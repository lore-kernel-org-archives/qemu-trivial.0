Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEugf-0001jo-VC
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2023 11:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEugc-0001h7-8A
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:07:46 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEuga-0008TQ-LE
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:07:45 -0500
Received: by mail-pg1-x52c.google.com with SMTP id g68so5092513pgc.11
 for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2023 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QeD/Au+WkZZMoQ8NlNZ071A9bzA8RKkT+9L1j+ry3uU=;
 b=H/gitLPZgZ81jHnI8O8W67up7+tLDCBWiDiMEIk4qNpNTa7fkNY+J/Szj9JeDGUOob
 d92yC4ZPrT4E+Hrnj9QpaudPoZ2XK8cIUUfsH8pyZVHX4uJyw5SJEx4I3POjWPWpURKq
 QXHHPbvJnwcs5WFVN/G2G/poQVJgyoP4ifMUoy7U7L+U2vFxDRABy+wMGaxoMZWB9HUA
 5NCd4bgyBPN9bAyjVLE65s4CRk7ADA8JC+OS8Mkz4jfK6+wwwzkW2e8floVfJ9pgqt18
 9vwbu6ewd50alpXUdEp34DulURcprs2Z4PuwCz0hnZklKgCnvxIC3soLjy22ROiAoc9H
 eOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QeD/Au+WkZZMoQ8NlNZ071A9bzA8RKkT+9L1j+ry3uU=;
 b=YpeSpgeEeXX3NI66+g2JDMMEJi0svl1lJf2Rerdaj54OPmjG5aPN8whHClv2E0lbd1
 z1FY2tgeHc+z1LXWeTAHpskR3JPPslGTpcYPAecckoNecnAt3jcq9tcxYHJSr5PBT0tX
 CbC6GwHcmGU4KKwPOERpyoQmn/rNONGr6OK9d1wPvOfN2aCbiZ8hxcGTyAJKQn4jQ+D6
 sdoThKPb4bnFTJQenXG4bXOhxwr75KDXSWJH3tYKuJt0WEQxIVjvceR9RJiqpMsYUCWh
 GdSPYtGHEmtLccBagoT2ujp4HeWArZJapU8TxaOIar41za4cdq1ZktTj6puTP1BDa2wt
 A3tQ==
X-Gm-Message-State: AFqh2kqLMRdtgMdx8FPKo2ytGyM5U92N7VkY4x9eYJUO2z52DxsvH+F2
 /je8tld/toXJO+vVsaoCt6TEaA==
X-Google-Smtp-Source: AMrXdXtD4/s48LYpeVicYukuVqgkG3hFd3+MluipmNZ5pdH4G/fJF344XRK07SPpT9nQ/iBGuy9Etw==
X-Received: by 2002:aa7:9d0b:0:b0:587:e40c:59e with SMTP id
 k11-20020aa79d0b000000b00587e40c059emr5376792pfp.18.1673280463342; 
 Mon, 09 Jan 2023 08:07:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 z4-20020aa79f84000000b00573a9d13e9esm6275616pfr.36.2023.01.09.08.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:07:42 -0800 (PST)
Message-ID: <9a70edc0-9168-6d2b-bae3-a9e4432e7b7c@linaro.org>
Date: Mon, 9 Jan 2023 08:07:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 16:07:46 -0000

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

