Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q90Un-0005dj-4i
	for mharc-qemu-trivial@gnu.org; Tue, 13 Jun 2023 05:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q90Ul-0005dB-4i
 for qemu-trivial@nongnu.org; Tue, 13 Jun 2023 05:39:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q90Ud-0005cN-Qk
 for qemu-trivial@nongnu.org; Tue, 13 Jun 2023 05:39:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso956707366b.1
 for <qemu-trivial@nongnu.org>; Tue, 13 Jun 2023 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686649153; x=1689241153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NnrkfrminigaNKM7E3gR4tjgM3utFGWexpe+tZUxR6k=;
 b=pLOENij/HzNMCoxO1Kg9bARaNlGRJmK+xTDOrvMinW+BIa8mTT9zt8wpeS2gXaoqiI
 kl2I9+htktWuoqfOVSHot7sQUA4gVgxlDB/suRawP6JGaayanVL+rLoMnHMVfd38rbbV
 pUaV5rLFBL96pFmqLQJLJgCOCv+NMOANp3uAYlbGp4CmaRpB0AbnEW58/C7d7oanmbSb
 Sp6TpjHOpxGZqTy5JSD/8GaepjLQ2YIYbzfJ2+AF0csElPKKwRqH3Ud5jlPCajlJ5TMM
 2M0dTGn4EVzIWnX5jsa6Njdj4c/hZcSDJVHR8qYoUPWwuOd/esTfDmQeDZxYl+9+rW0F
 X2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686649153; x=1689241153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NnrkfrminigaNKM7E3gR4tjgM3utFGWexpe+tZUxR6k=;
 b=UVMS0orY7jx88lIZo51+N3aYZgSenkMpNd0+jSBaaF1M04fpitnWBq/pMfeYhwjMQy
 qJgdyQHRInolF+Aavi64MOeCJJ6+tpVL9PrOYzv/qWTT5GstunBYpWNVC0zAEL7pwl5D
 nCsxXdgTBuBfiD5UnGHX7ewbzr0kiEDnGXZ2KvvFa0J67Ih8x+KMsQseab9R+eDpaa3+
 PZZNx02dl4hkfSKydQARR/wQjtS07pzB6tuWHk9jot4GL36u5/rzYsyjzk/lj4Dc92JK
 iCJhVHgZQmHVx0/z7vpNYA6Uxddfmod2LAcWxfqNeuc2OA1vYb0CCunx9ivLiDknwNxW
 Vr2A==
X-Gm-Message-State: AC+VfDwQun0IngJYcH6+QyLqF77sa7z1vbtvg1PTTMKi70ecEthfoKRv
 Q7RBfRA2SBDmdo/W4oL8Vs48sfoY9aQpSfwM/fRJ9A==
X-Google-Smtp-Source: ACHHUZ4Pn0TOoTixQm4NDaBtehAH1yNGnXXHgm24Pd1daXRnjlD3qGNqXsqiUKZ7n/ezdraNcol7rA==
X-Received: by 2002:a2e:a165:0:b0:2ae:e214:482f with SMTP id
 u5-20020a2ea165000000b002aee214482fmr4235888ljl.52.1686648727615; 
 Tue, 13 Jun 2023 02:32:07 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a50fc0d000000b0050bc6d0e880sm6115842edr.61.2023.06.13.02.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 02:32:07 -0700 (PDT)
Message-ID: <c664a85d-393c-0190-9a57-8ee9bb81cf35@linaro.org>
Date: Tue, 13 Jun 2023 11:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 0/2] Export struct ISAParallelState
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-trivial@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230612081238.1742-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230612081238.1742-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Jun 2023 09:39:23 -0000

On 12/6/23 10:12, Bernhard Beschow wrote:
> This series incorporates rebased versions of the ISAParallelState patches of
> [1] as requested by Mark.

> Bernhard Beschow (2):
>    hw/char/parallel: Export struct ParallelState
>    hw/char/parallel-isa: Export struct ISAParallelState

Thanks, queued (updating MAINTAINERS in patch 2).


