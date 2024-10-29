Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t5lgb-0008D2-7o
	for mharc-qemu-trivial@gnu.org; Tue, 29 Oct 2024 08:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5lgZ-0008CQ-8b
 for qemu-trivial@nongnu.org; Tue, 29 Oct 2024 08:50:59 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5lgX-0003ML-OA
 for qemu-trivial@nongnu.org; Tue, 29 Oct 2024 08:50:58 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1e63so6409269a12.0
 for <qemu-trivial@nongnu.org>; Tue, 29 Oct 2024 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730206256; x=1730811056; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eByJrhKtItG7keppJweYgMWQqbkdmTSBHwqykj5SR2I=;
 b=JonVhGJIpNS/xSJbk7pc0fTDvNNOVsxTHKFT1VG+RYac6bVBwmeeXs8dy60muhu52X
 eNBoS45U2laQZneU3iSaW6sTFP1GwX7Yi7cPdBdFw3vsvfzH4b8Nby6lwNnY3z0dcwJ9
 ATx8RDjw74mq51JLfOcMI5zZzl71EATF26tNg52vqFJzgA3J83yARFLKKbKWdZCJh9rh
 Bb56dEBSw5hssxA51EL0v/Vcwqmmq/IqonHdmvyN0TVEfPjzXEM95mpmj/4A3g4/8XmP
 OSFHsXtbtRJIxf5EbwE+jXI4UQOCm8zqknrJwgvN71v+LNrQGMx9rLWWlzEHia2j1bem
 RxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730206256; x=1730811056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eByJrhKtItG7keppJweYgMWQqbkdmTSBHwqykj5SR2I=;
 b=EGNBpw8gHKMpVQdNYcj7rH6f+W/il3DO6hBgHy11zB1QhzM6jiiPTOW7vs6rkkS4/w
 MEpb3y8ekewzkhowfZPu//b2SkXWczYMFY5M99bWRVSiPfk0EJ6Qp5m/clKT7kfVIDQC
 MfNwjoIyioUUIITimvD9wqMfWvl4j0dObBW1C7CS3uTdkV8SciL7M8hQq1xiBarSOfpq
 oGF+HgwScdN4FYshLUcZFqExMJ2lP77MqfMJW++LILIVlm1OG8Y0Sd0rm3/RHwS4/uBJ
 dAwaL7GsT4zyYtRtYlZPpgTYtYAcANbMc4Ht9lfSQiKlfI8fmNdzqTZAp4IM6J3nqDBJ
 QTWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnbcynvLKB6SKZpchydrTqMcxGTlICh97etdYIA9CSwuR99HE0Pxhvjph6OCc1HM5a/9gruJdGomW3/34=@nongnu.org
X-Gm-Message-State: AOJu0Yz2vP5sumNE60oaRIZxoSGaC7I5hDP/GU9kB3rWvPctH7YyeNAk
 Q/UTsOm0YEf+2OlsvgGhC7CMCe4SCsjZLiQmC4We5ahlEe0x402UCVJC9s4+BR5YuYCQvkFECaz
 rKr+Z68hXN8C3yOJGI0YHodAnXG7jBwcfrxLzQQ==
X-Google-Smtp-Source: AGHT+IGO0os279f19K5wmBPSxG1OxQ/oEY0OANP1A9FVAW+o1qFyjmKDfBHkOF7/4/PtmMnH30sOUCyR50xjs6SWl0I=
X-Received: by 2002:a05:6402:26c4:b0:5ca:1598:195b with SMTP id
 4fb4d7f45d1cf-5cbbfa61785mr9946294a12.28.1730206255644; Tue, 29 Oct 2024
 05:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <173006362760.28451.11319467059840843945-0@git.sr.ht>
In-Reply-To: <173006362760.28451.11319467059840843945-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Oct 2024 12:50:44 +0000
Message-ID: <CAFEAcA_P=256Ttohd2YmzNRUK4vLcgAW40gopg6TkYkFXfevOw@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 0/2] docs/devel/reset: add missing words
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 29 Oct 2024 12:50:59 -0000

On Sun, 27 Oct 2024 at 21:14, ~axelheider <axelheider@git.sr.ht> wrote:
>
> v1:
> - Add missing words in documentation
>
> v2:
> -  add plural 's'
>
> Axel Heider (2):
>   docs/devel/reset: add missing words
>   docs/devel/reset: add plural 's'

Thanks for this fix to the docs. I've taken it into
target-arm.next (squashing the two patches into one
since they're fixing a problem in the same sentence).

-- PMM

