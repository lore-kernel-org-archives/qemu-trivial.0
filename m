Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryDYN-0002X3-Os
	for mharc-qemu-trivial@gnu.org; Sat, 20 Apr 2024 12:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryDYK-0002VT-Uy
 for qemu-trivial@nongnu.org; Sat, 20 Apr 2024 12:27:00 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryDYI-0002Y0-BU
 for qemu-trivial@nongnu.org; Sat, 20 Apr 2024 12:27:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1e5c7d087e1so26161695ad.0
 for <qemu-trivial@nongnu.org>; Sat, 20 Apr 2024 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713630415; x=1714235215; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EVi/ltbTByuAJWQrsYjkR9v6uxtGhW8cPtv5rMnf9/4=;
 b=AzkXf+0/wBewU9ypJtL8fyiz+0sj9xMloWodT75v5bhPTf3zo7YOZUFBel3cBCJ+jp
 uqmzOdfsn0GGSMgXea6SVJ0wTPPaRVGqpMCypDgOaItbCLbeC50WUuhX5386VWjfJdio
 K8T+TR0Aq/Nx5JB/SnmOO3JW54f9l5xhOQT7hUl7l+E9PUBVNH0GG4oHos/yW6N+WdJ/
 pQHr+lm0wDSKWr+UhJBzZFJ16/lNOux25RIVKJrz1hjVYOJOs43lzVl1odGec2w9S/a8
 7fzbwbQ2puj6dLF+dslO4QMzgZQ2g9Q6hg97HDNHZCJq+MXWrWYZY2ddyRf6hQm/SOJi
 mAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713630415; x=1714235215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EVi/ltbTByuAJWQrsYjkR9v6uxtGhW8cPtv5rMnf9/4=;
 b=Next2+154FrE7uPJcmVE3Hxg2UuI2+FJrW3HOKXGgNoUkwznnYahYLWTSQm/btw/iQ
 NZl/bbRq8fguGAz6/P7ptZnfsALCx/d9yAjAl51F9GrtSg7Pna0a2n6R/mM85+5gUZJb
 zrtme+7/BepPixhLikZJXeuj/kn2N29KBFKcx4SLLDYd0Xs3sgyTRgHiw5Njc1HS6Jea
 IA2qTOQ71XXNofIKndw0olc54z8ocwchwPQi/wmIu9j+mZhx8sMaWR6Yyd3CzJ7BTaV/
 tHmyWQopjJxxpIz68txJYX32pLVpSlUhjHVYgMezxTUF8wZFL6pJemVgIMjx/6jYivoL
 T6vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXpbNtceAhBA+232+AQzTm+fXBI4nQyiq3Zf9/lqSrDYCRGXsTJqE7gh4SPTWxNrWoQpCmiMjosMzyVE4LQT+RwRiug20ekQ==
X-Gm-Message-State: AOJu0YxvAvmKHVpjHles/riK55h7G4NYhGR4t1hGRFGaXcL+wHmH6lJo
 YlSQM4qrzcbnks49dzWwrRB25tm2qB6ME2IkztCiCoTt1zSswJgnHz1N/P6D15I=
X-Google-Smtp-Source: AGHT+IHW0BqT5Us8+nu0ykOG3l6uhkSYOtoTNjPLWkSFAxzfea/JIYKheJ9Cm5h83zQ7Qy1OZXwO8Q==
X-Received: by 2002:a17:902:8210:b0:1e5:c0ee:a7f5 with SMTP id
 x16-20020a170902821000b001e5c0eea7f5mr5104451pln.24.1713630415398; 
 Sat, 20 Apr 2024 09:26:55 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001db66f3748fsm5235821plh.182.2024.04.20.09.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 09:26:54 -0700 (PDT)
Message-ID: <1b4a11e8-3752-4bfb-b8c2-8c273f13bc6b@linaro.org>
Date: Sat, 20 Apr 2024 09:26:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Remove useless architecture prefix from the CPU list
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org
References: <20240420054606.13353-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240420054606.13353-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 20 Apr 2024 16:27:01 -0000

On 4/19/24 22:46, Thomas Huth wrote:
> Thomas Huth (3):
>    target/i386/cpu: Remove "x86" prefix from the CPU list
>    target/s390x/cpu_models: Rework the output of "-cpu help"
>    target/ppc/cpu_init: Remove "PowerPC" prefix from the CPU list

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

