Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj27i-0008Um-8y
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 12:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj27e-0008SY-G6
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:31:22 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj27c-0002IK-WE
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:31:22 -0400
Received: by mail-qv1-xf29.google.com with SMTP id v2so7653048qve.11
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8CoqERSKzunmWaUsUoIedJVpbx12YKHOSh0DYQKVSxE=;
 b=VRYn7L81oIZi1DV8mrHit/Gq1WTylF4W3afc+i07ARnWZU+wOc9KiBogGoFz33FoRB
 CQ9/rFDHJtbMizYobNn3bzEgA1n8ygE+SSYFYCycc0fcZrn3LwzYSwsQfOwFT6xqM7aL
 hT1TiVsHRnU7vL0rQ997fTYZigYI6JPxB8H+PBAom8tNuiukw5j4QflfjKPdfruz0cqZ
 Vo8gbe/XF8i/jNf2qlXYD+/XEe+bVo4Dzq+813uUFKWQcQTfChJptg+twd0McDYhY1ip
 MZPoCDqF4ca6QA2rn9fLr/kt00Q6SOZCbYc96z52kE78omzt7EYngHDalnaMkWOfa+xn
 yGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8CoqERSKzunmWaUsUoIedJVpbx12YKHOSh0DYQKVSxE=;
 b=k7OE91ZXXKNJEu87/YfU0sRLD3sOpH9H67tceSxhEWmR3Lis6eTHFqhjgCEmovyVd7
 1SGBj4WZ/lQi9wLhLG+nkXhS50r+dfN52mjk2rvMKuMTkvdkSA+E82wEOo27sRPSOYnT
 ts0twantqp75EopFI9JEmWQsvVrp5tzO5EbomYUnrc+kbAP/v/5JAOAGgjjKToTkb/wx
 qiY5TOqw2p/47Wt8NaYRytKdTkiBmQchSsQCGzkHFVuC1lmsFS4HP1Uf4+vilwrimiRK
 V0WnNGXRTkBt6YiSCHzAl3HZ8i8bjXospY0C8rsumdrsTsA96qkVb8mmrpJeVH6aijlp
 6d5Q==
X-Gm-Message-State: AOAM532VEYcVAoB8YFFAZvaKHnW2tta4QdWqnMyzOowr34Li6jbPcBtW
 syISBfzxhDWWogIzeGRFSueVfw==
X-Google-Smtp-Source: ABdhPJy6v9z48eOGHDhaWuZDCSlA3M3Fym41/9b1RtibAdFwQ0T6TocdXcFs1SoOZMTVjiIrWXNmgw==
X-Received: by 2002:a05:6214:2428:: with SMTP id
 gy8mr234026qvb.18.1636129878914; 
 Fri, 05 Nov 2021 09:31:18 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id u185sm5564071qkd.48.2021.11.05.09.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:31:18 -0700 (PDT)
Subject: Re: [PATCH v4 29/36] bsd-user/arm/target_arch_signal.h: arm machine
 context and trapframe for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3438e62e-9ef3-f3fd-a979-e889c05459c9@linaro.org>
Date: Fri, 5 Nov 2021 12:31:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-30-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
X-List-Received-Date: Fri, 05 Nov 2021 16:31:22 -0000

On 11/4/21 11:19 PM, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

