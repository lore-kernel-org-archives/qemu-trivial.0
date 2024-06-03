Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sE74b-0004vQ-2e
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2024 08:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sE74Y-0004uS-Hi
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 08:45:59 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sE74V-00007l-9L
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 08:45:57 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52b83225088so3990560e87.3
 for <qemu-trivial@nongnu.org>; Mon, 03 Jun 2024 05:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717418753; x=1718023553; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y9/kdvEy1zFeE8qYjhl8QzY0Lg7rForBZ7KDGI6Dbo8=;
 b=kQHl/tjfhoJPSN8A5IzijoAVH217vz85sbm7vBDCNcdJQI5n2BaDhncf7YJckGOr9B
 bekbTgn+BklVg1M6bN4kgHTordJvLWUab/+S+s+WCjIWdrKR+yKdydd9RH+bxcdgfbE1
 9vBBXVPWzrWVMHk2X9EJTpyWa5yVc1WjYTjETI2nh9jMOJ/xPt/FdbbZLgseM392ak8s
 a7+sjBOMNBw0mmhGXxq7wqiCfYUQlPK+Vq8DB7b3AZDZJwteKdJHt6UEw4IcSAUWfZv4
 aN6UNejpOo7n52q7/2+M9ixZb/qcBTQ36xR496uMKVbni/hs7CIoTHjRxkkhZ7I8QGRP
 romg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717418753; x=1718023553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y9/kdvEy1zFeE8qYjhl8QzY0Lg7rForBZ7KDGI6Dbo8=;
 b=ffD9cT9Rg+LPEn4P/Uapt/WACmlt3fp4MdBznVoFQva6MoeA6aB5i+ud6jEvsSH35d
 2tgq9HW5SfRPiN9RZ+S9RYccbnRcIfBUPPkVV/fKhHr9gAFPe7HjB+DUPl6aBDKzboDg
 8D68aSr0B+jKt+pA8dfSywN2AU8Y8royIH0cAw9MkshOz/CzaVJj+RG1JotJ3OIlDcqc
 XqEuAVcZN+/xf/7eFB9W06FNIb3xtxbkSrppRRhZOAvyjyc+eMs3i+hErsUgezAR1opx
 S9CF1+yB8986Ll3gkzsTsGqoocXWtIZuwiaAZPZG3CCC9sqG+KODvqom9Hgbrp+0D5bT
 9LkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Icapih6sjsyxUS37jFyQjW4VtwX/ohVVZdFQa5TS9k3/CDLJbU2NBHt2WBedk7oRvRCZulI9UXmr9igBZ07Dl7Mrl2d/rA==
X-Gm-Message-State: AOJu0YxdcpjruZGmoMwYxw5jcITdpCUc2mIk4Va4egydgnFwuenJ4opN
 w2aXZ7+qgL+estroDyneQHI4mQ4jajpeJxngPAeuQe7qpNGFacP4Za5HTh14r6Y=
X-Google-Smtp-Source: AGHT+IG+b+abFigqP3HVVy+bYOonRXbsW1B8x30UABQS3BrjhWLXfiyKWQtLN8kepCqgYOL3palQxQ==
X-Received: by 2002:a05:6512:33cf:b0:52b:9064:2e6c with SMTP id
 2adb3069b0e04-52b9064316fmr5451574e87.3.1717418753330; 
 Mon, 03 Jun 2024 05:45:53 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.241])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68f25610a2sm240519866b.193.2024.06.03.05.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 05:45:52 -0700 (PDT)
Message-ID: <044212d1-d267-41eb-96c8-e2e6ab3bd558@linaro.org>
Date: Mon, 3 Jun 2024 14:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/kvm: Fix two lines with hard-coded tabs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <20240531170952.505323-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240531170952.505323-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 03 Jun 2024 12:46:00 -0000

On 31/5/24 19:09, Peter Maydell wrote:
> In kvm-all.c, two lines have been accidentally indented with
> hard-coded tabs rather than spaces. Normalise to match the rest
> of the file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   accel/kvm/kvm-all.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, patch queued.


