Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pedUz-0008MW-V5
	for mharc-qemu-trivial@gnu.org; Tue, 21 Mar 2023 11:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pedUy-0008Lw-Rq
 for qemu-trivial@nongnu.org; Tue, 21 Mar 2023 11:02:04 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pedUx-0006Zm-7F
 for qemu-trivial@nongnu.org; Tue, 21 Mar 2023 11:02:04 -0400
Received: by mail-pg1-x52c.google.com with SMTP id h14so8525316pgj.7
 for <qemu-trivial@nongnu.org>; Tue, 21 Mar 2023 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679410921;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2y9ah178Sy2OwC76k56DxfXR+VkGAdOoPaEomNhdYw=;
 b=VoxCWiJn2omI69KOVicUlv1SFKgyqIQwi8eH5CpRNC/biS6apDKErKWdMr+JftT5DW
 BeHs7a9L0plCUsHBK6Oti4L1F8LX76LamsRcsKshYPeCCNQ2NtjNWT8ZH5XpXxq/YvKP
 sca7SB6+G/t8ELXkOkLKdXIK7OFbStxy3SzPVbLm7GgfCNYAGcUhEtLq/KSlGIeN6dKv
 ntUKV0jLLJhanHCBu+Lk1cc1cn0WVYOcfteMLHyqwQtfcWcjZ/bpMp+TnlGtreHv22tG
 lVNiTCmMmdgTqKisECvG9r3AjVdNB3e+VzC4mkY6cJrmTbQDlQIzJS4QE5qQSBlx+34q
 JHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679410921;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2y9ah178Sy2OwC76k56DxfXR+VkGAdOoPaEomNhdYw=;
 b=BPnff3GaoakbYpFd+QtZ6cfDjeYpHmMux8spvcXclezAgKO3Vl686FAtCxxir5OIp1
 iWXntpbvApMx1NVmt44aLBDKuULWX4yfWI+tf6tme77yx/+pBpb6Qz7TRhdG1A6lP9cZ
 DQ9QBv8Axs3vHIwmu/QIzLrHxo6EBrsUr+0Q4Nk5Lvmz/WkX7BOr5nhpRrDAP6fOgGtx
 dn/VESQT7hQuKZZ65zi5G8JvijwavkTQUXtjxn/KKgxVsd7qLFK1ej3iCm5TcuxW8/wC
 FO1kkLa7Rx9uJuTsK7lZDdHi5dB3gfEYSmkxYi3Yk4H3cJ7xjL9z+KWEOXwL6mA5ttwH
 T8qw==
X-Gm-Message-State: AO0yUKVysdFb4eZt3uo326kAP+iZcEJ4Dpk1y05FdRD3AM+Vj5qbZr8/
 f1vPCyGQnaV5qeQESAPG6WO55Q==
X-Google-Smtp-Source: AK7set+fKG8sU1QVNqmh7dwvuaRkPgB7CBY+EzdagGh3a4OtkvjW5e71OO0QnBdhcSi2M8yCc9jc7g==
X-Received: by 2002:a62:2581:0:b0:627:e69c:8488 with SMTP id
 l123-20020a622581000000b00627e69c8488mr106067pfl.14.1679410921469; 
 Tue, 21 Mar 2023 08:02:01 -0700 (PDT)
Received: from [192.168.149.130] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 132-20020a63038a000000b004f27761a9e7sm8136018pgd.12.2023.03.21.08.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:02:00 -0700 (PDT)
Message-ID: <0fbbb95b-218c-df49-9cfc-347341214b13@linaro.org>
Date: Tue, 21 Mar 2023 08:01:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.1] target/m68k/fpu_helper: Use FloatRelation enum to
 hold comparison result
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230321094950.43902-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321094950.43902-1-philmd@linaro.org>
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
X-List-Received-Date: Tue, 21 Mar 2023 15:02:05 -0000

On 3/21/23 02:49, Philippe Mathieu-Daudé wrote:
> Use the FloatRelation enum to hold the comparison result (missed
> in commit 71bfd65c5f "softfloat: Name compare relation enum").
> 
> Inspired-by: Cédric Le Goater<clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/m68k/fpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

