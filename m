Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sZ7fK-0003tv-T4
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2024 07:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ7fB-0003pu-AO
 for qemu-trivial@nongnu.org; Wed, 31 Jul 2024 07:38:37 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ7f8-0002Go-8f
 for qemu-trivial@nongnu.org; Wed, 31 Jul 2024 07:38:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34722so1596858a12.0
 for <qemu-trivial@nongnu.org>; Wed, 31 Jul 2024 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722425911; x=1723030711; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oK9aom/3jHdVS7ezZ8ZFE4bSdGSaDuLYvsraI038mHc=;
 b=K4IHAwSNVllve9YZvr85I7Y8n7vlzs25uV7jG4a6a3y1PyeAASOdhfZXPnd+DcLCfS
 xiGXh71fRlfGIYJIrzUs5tZtTwNtBc37fDxtU9V6a9W0Q0ELaIjWo82I7YJhRvY9pHyR
 jeOLKMJLSOQ0AwMsweEnZhfHseuE3S8B7IlfFRvMF1ipFKJHJsfjs3SG/2dGeAEXKOJE
 ZtmCrYQ72xmswKh0HlBg5BKPhq67VlNFGGvIuY7Sbx7veC9O6AFIlSxTKSVrnEbT8aPo
 cg33MdzRNrKrKYbg9rolQCpywK5yo3gHDxB1TdsN7DiMQGRqSL+NKQ2p8agMhrneMHOB
 yuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722425911; x=1723030711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oK9aom/3jHdVS7ezZ8ZFE4bSdGSaDuLYvsraI038mHc=;
 b=Bn59I4pFj1yzZbIB4VddgPtlj0wmim7JdStRb+9LLKb4FMQDE2x8g6c/mFQnm8JXri
 X8JonIdsC65ObNxhw3GGRXzGpQlD8gMpopzAIqzATb/jMpCO6fpCVcESfPExUHfqYivh
 8S/uqOrRN7DJLR3dnAjGC+7l15yPHVXzcuJoHmbyGKw3nzQMvqxSOFWdoNw/gmyTX1px
 sBriLVIwmOx0WU55/7UGUwJVp4l4rpwnFqsFWeDd+vGwgtI7+iMK8PePZQf/gkwzuBoN
 8s/r4HKdFoH354A6vOpT4WmfCpUqnTy8riGR1Pj8xCkLkaBUkT7otwbpHrEgxhJsOV86
 iS/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpqlnbbhjCXs6ozWDWnV5geQFmF4HzIzoL2+21Jqh4IGkuBtecYNh8t08r4wOQfb6hFW+YbZ1x1qYzZenRiUkPMv1MfK9jhw==
X-Gm-Message-State: AOJu0YydQuEEcxWnihcuJnLM/cuI30cUkgdnvRaRFCGBiehdi0VrIu4B
 iBZYmMIegQLGTlkKdJEjmE7YG0VA8E6owzZbIhzSf/vPYUGGAHeVnzQc1BUx5lhUJCb406Y8NdC
 /J1H6Fvzu43dlxARBIx5sqwLyKRBek4mLdBTG/g==
X-Google-Smtp-Source: AGHT+IH1ipf9xIs7/esfyJh+sWaz1jpk9H3soDgxyJGfz2eZeDdI08ZL6+4al2uk0AZ7i6r5UjPR130ABlr73RikdvM=
X-Received: by 2002:a50:d657:0:b0:58c:10fd:5082 with SMTP id
 4fb4d7f45d1cf-5b46bf6f88emr5013371a12.10.1722425910581; Wed, 31 Jul 2024
 04:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240730073123.72992-1-marco@palumbi.it>
In-Reply-To: <20240730073123.72992-1-marco@palumbi.it>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 12:38:18 +0100
Message-ID: <CAFEAcA_7QDUuQ-zs53Xp2zcO83rDzj0Smga49GZ8J9gg26VBdw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/mps2-tz.c: fix RX/TX interrupts order
To: marco@palumbi.it
Cc: qemu-devel@nongnu.org, Marco Palumbi <Marco.Palumbi@tii.ae>,
 qemu-arm@nongnu.org, qemu-stable@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Wed, 31 Jul 2024 11:38:37 -0000

On Tue, 30 Jul 2024 at 08:32, <marco@palumbi.it> wrote:
>
> From: Marco Palumbi <Marco.Palumbi@tii.ae>
>
> The order of the RX and TX interrupts are swapped.
> This commit fixes the order as per the following documents:
>  * https://developer.arm.com/documentation/dai0505/latest/
>  * https://developer.arm.com/documentation/dai0521/latest/
>  * https://developer.arm.com/documentation/dai0524/latest/
>  * https://developer.arm.com/documentation/dai0547/latest/
>
> Signed-off-by: Marco Palumbi <Marco.Palumbi@tii.ae>

Thanks for this patch, I've applied it to my target-arm.next
queue.

I checked the other boards that use the cmsdk UART, and they
all get the tx/rx interrupt order right, so this is the
only place that needed fixing. I suspect that the guest
images I tested didn't care about the separate tx/rx
interrupts and only used the combined irq.

thanks
-- PMM

