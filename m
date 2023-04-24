Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqvvR-0008CA-7x
	for mharc-qemu-trivial@gnu.org; Mon, 24 Apr 2023 09:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvvP-0008AE-I7
 for qemu-trivial@nongnu.org; Mon, 24 Apr 2023 09:08:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvvM-0005lw-F7
 for qemu-trivial@nongnu.org; Mon, 24 Apr 2023 09:08:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fa36231b1cso2624094f8f.2
 for <qemu-trivial@nongnu.org>; Mon, 24 Apr 2023 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682341687; x=1684933687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1CpZTvZBBQDuO/SrCiFdk/6qoymklgNiLocTatpOEts=;
 b=etGrKcEemrbb4H0KDpAQ5iGxY5d/OoqC27UxPxeCq9+pBqV7XzRfzuIAGthc+VQwIo
 6z9CXYyZHcsc4GwXYu3XRDB+AoYqNqwZDfB1WjxagjpaXDMEXzam9H9hdo45JY6K6dBy
 l5Gv6bjbkWD+5ltJmQOVsX+qy1nu+VHZqkLJjoPpxGtZ12hNJTEyQooGBY3mYqOORv0m
 BAYi1f1rwYj0OfJEc2E81Fd2b68Xj+y8cLDiCBRk52nlq9vjqcpQmHTeZgSdfYhCczyJ
 BxEHe/NbVdqngaouCUE5AOXsvcGxfCSNOc36UuIGMOW5uBKmIWLSnOV6ZLdW0hhPX/f0
 4TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682341687; x=1684933687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CpZTvZBBQDuO/SrCiFdk/6qoymklgNiLocTatpOEts=;
 b=hycwofU5rOjst9N9PMjIoNriIMEN0v8+RlT721xf2G7WrJOe6OMVN9SNs0lMNmuw6i
 G8jX8kgxfJZ3DYW2DJQ7uhAdM80bUq6rWKceb84HDNJgULgKMec8hjPonAKWlhoc/Kqm
 IPDAdwsT8bivALK1YpRWnlCgHLcFMNoKh1QwEro8ia2qRZeVFdc7gFe9EJSkfJWsBDTV
 S9Re9OHIju5lB6dJiTWnlLRB6rmkms9Rv1InOfcYDPePCCfcjvunIx/7PFH1yxO8llBE
 ZjSffJiPwfYM5cG9P4CusXJ0TwGLepq12hvox5P6zwK5XOISgq/SrKep1/QeIRRmldLQ
 9dag==
X-Gm-Message-State: AAQBX9dNIUaA6XWh7bOoLFCOZ7S9bzykjQY/y1rGtyYdn30gH3Gz398c
 jm+XuHjTrZOdpcnNP7MiR2tLPC7krASxgtenDG7RVA==
X-Google-Smtp-Source: AKy350a2qILzcunYcnLygvro2J7XS6R9XeuinJZT7v4hHYWCqlSX7xpTWIE7KSz0zmW1RUt7PkT2QQ==
X-Received: by 2002:adf:f185:0:b0:2f4:cfb4:57f7 with SMTP id
 h5-20020adff185000000b002f4cfb457f7mr9007435wro.61.1682341686701; 
 Mon, 24 Apr 2023 06:08:06 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4f01000000b002fc0de07930sm10751395wru.13.2023.04.24.06.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 06:08:06 -0700 (PDT)
Message-ID: <c5c31daa-57f7-208c-6e05-c580490f1f32@linaro.org>
Date: Mon, 24 Apr 2023 14:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user/main: Use list_cpus() instead of cpu_list()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org
References: <20230424122126.236586-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424122126.236586-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 13:08:11 -0000

On 4/24/23 13:21, Thomas Huth wrote:
> This way we can get rid of the if'deffery and the XXX comment
> here (it's repeated in the list_cpus() function anyway).
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   linux-user/main.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

