Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi7Gk-0002KV-7j
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Gh-0002FM-2S
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:48:55 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Gf-0005Ny-LC
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:48:54 -0400
Received: by mail-qk1-x733.google.com with SMTP id p17so2541qkj.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wF1bXfRFfzUCWuqtL9DYiOyUnlIRq7aWtTJB7jzV8K4=;
 b=c5BnCLUcXplB1XxueW7hXy4H72jbb/g6rGLNHe+1xVlq4jAT+zSxuOvu4z58VoKlaL
 7X08El9WJrAE2touuZu/Hse2fWy+HO4YE7xLiB+fDriicoRoxPdBn3hufkyQFf4wzR/g
 96c8tZk240cpZibJzEDNMl5bgURHdjPERosWaG/fH0WiPPhNr1z7TKkRei9YkA7rrRs6
 2x4kynmDI1ZRG/bhXhLov+rxewRwqBhaR/IRMTgZyJ6xVHw+qlOduFL2Fc/nWgo6+5XM
 2Hs4zBSQ69PSP+FR4Es0ErjxLx0SHTy895f9119V2ZmTeQa6gQAtwSqjdJsoPEoXawoD
 y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wF1bXfRFfzUCWuqtL9DYiOyUnlIRq7aWtTJB7jzV8K4=;
 b=SN5wscaITIQZ7+4jARTWpdt4OGcIpVPDKhi53cyp4aHbaz7yhDPpv1pgtLsJf6Wxj9
 Qo1ceTN7qiG6TwvpY2tYT1HpEqQQRJZMX2y1CpomFqWGNV6bfzKF0cxF9nSfKoiSRKXM
 jLWERZjZprFSIZktXZKDeFIR3ljhMwZfd0jNzVpbEspaJDKs3d/H9hJs2chr87wp/BoS
 oaL4SVduFNFi1GiSD5QyC8dPFj1qEU/ssDtnUIg0KN4CHmWN9yVZLbrNuB4tM2kIG0Nu
 hSwuRjECtO3CD32Ip3NyjWGhAlz/NDO59OYodwGH9pbc9c8B1u+0DyOS5EDdIXBEnk9o
 nYqg==
X-Gm-Message-State: AOAM531lQdcN8XsH0x6J9/vz7pTJ7rUiBfo0pjrCJxmQ11z/mvS7rLgk
 8U6mMZEBg1i5jqj2OoWEkyWhaA==
X-Google-Smtp-Source: ABdhPJwsHV1sPur4zDVaryvH6ErbDzrTtvy0An6CiwWsJED/SV/PVFfcqkV48pekC9YDsJUFDyJS4w==
X-Received: by 2002:a05:620a:424b:: with SMTP id
 w11mr32117241qko.179.1635911332851; 
 Tue, 02 Nov 2021 20:48:52 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id s10sm746562qkp.132.2021.11.02.20.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:48:52 -0700 (PDT)
Subject: Re: [PATCH v2 29/30] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b97a0b54-7716-31c8-af37-852697434dac@linaro.org>
Date: Tue, 2 Nov 2021 23:48:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-30-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:48:57 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_signal.h | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

