Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1ru1-0003ia-RT
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jul 2021 10:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ru0-0003fe-S1
 for qemu-trivial@nongnu.org; Fri, 09 Jul 2021 10:54:52 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1rtw-0007XD-Qq
 for qemu-trivial@nongnu.org; Fri, 09 Jul 2021 10:54:52 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 62so10235244pgf.1
 for <qemu-trivial@nongnu.org>; Fri, 09 Jul 2021 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6DLXXNgKWNvo3Ca1rHwRL3HqH1j0ZLdvm4mhFcWFB84=;
 b=PbAczMW6IB5kQcGGfIKJts86rsclSXebIKlNTl4zIiKrR2efPtpXT/8Wr5nisx1O0f
 5P1yUr4zLV+CYjExlbXsTIHMQFWjQdGz6uJu2jy0gQAaMaRKPh7ZKYB9Uqwb1roX/nnh
 GRBXZuf8bPNaHVkO6VOAE1/ztXQJauP8gTH3hYUScg8/vBbqMMAhQInSpXK+Q57MsrD5
 rtI8y13zd49fG/PAUczS1j2JonlJEF569ACKiG2RKQAibugyURsMvwRpcerGbM3P5FQq
 b2iiHLMrdABgZ4UteJXqSHq1laDkb5BQsi+3SXuYvGXxar+TD7NfUq8WQ8kv1y57b3JI
 MFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6DLXXNgKWNvo3Ca1rHwRL3HqH1j0ZLdvm4mhFcWFB84=;
 b=YoqrAyL7QEcc8L0Sb0Pdxkomj5yQlP8UV7PXzwt1c6hvnw0XmwAPnHPHf8/qJR6Muo
 iuV2AT+oNx6StlQyt30UcjZSdYvjjR1ZHl6u/8jVuOf7+I3Dz0FHLXZZuzv4odGshSs4
 quktIxThYCeHmBd8fu9Qbe5VXJfduCUUnli3J9AVKS62E6og3lFEUx05tpEd5K1QbwCe
 ma7jh4jRm41bm41AStFUwJ2J6S93Nw98UgxFhGy1mORdIlIT/k0l7+HfhdfmzLJuHg18
 /23ptuST3eEcgN2P7WBL76qFrABbKSa3T6GNManoI9AH2ODak5nWw8c1rcvFnGr50gH+
 jLUA==
X-Gm-Message-State: AOAM530j7X93Gv6PasoMC7jPkE8FEu55M8subYCxDb+sCTa311rdRAme
 36FI5bs5aemhCrZgOYtyPK/P1TSqVi9s5A==
X-Google-Smtp-Source: ABdhPJzVq3hz8iqrrNDKPdzWOGK2coKGNQ2qDRVz8vbhN6LWuHvTdt1oORFx9+hd5oWPqm4SHSGrxA==
X-Received: by 2002:a62:148a:0:b029:30f:be14:3b35 with SMTP id
 132-20020a62148a0000b029030fbe143b35mr37949320pfu.23.1625842486710; 
 Fri, 09 Jul 2021 07:54:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o72sm5234139pfg.44.2021.07.09.07.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 07:54:46 -0700 (PDT)
Subject: Re: [PATCH] util/guest-random: Fix size arg to tail memcpy
To: Mark Nelson <mdnelson8@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210709120600.11080-1-mdnelson8@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37b87b8e-bd7a-6814-897f-bb8fca77aa61@linaro.org>
Date: Fri, 9 Jul 2021 07:54:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120600.11080-1-mdnelson8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 14:54:53 -0000

On 7/9/21 5:06 AM, Mark Nelson wrote:
> We know that in the body of this if statement i is less than len, so
> we really should be copying len - i bytes not i - len bytes.
> 
> Fix this typo.
> 
> Signed-off-by: Mark Nelson<mdnelson8@gmail.com>
> ---
>   util/guest-random.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

