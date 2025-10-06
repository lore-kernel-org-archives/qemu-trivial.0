Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AAACAC5B8
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Oct 2025 12:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v5jwq-0000kb-K6; Mon, 06 Oct 2025 08:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5jwo-0000k6-Ga
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 08:04:10 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5jwk-0003od-4F
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 08:04:10 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63605f6f926so4011657d50.0
 for <qemu-trivial@nongnu.org>; Mon, 06 Oct 2025 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759752238; x=1760357038; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UDE8Z7qyajMCaXMrzd0HtBzhao2U4HKL5heui9QTuYg=;
 b=RZqUtSAp4Ba7olcpUI5b4g99MN067kLDv/9GllWcNdhPqr0f8sd84/K9eiw72XvWOG
 mjxHI3Bza4EVIfAQJPyEKHwgOwLPRoFYEDBsKcieVKSUZ/egy64j/VekBU0Ury6wmzef
 +rg+gLl/8Rn7JsUptnekb6VYMH6DJLbL+ZE8Eon4x7P7g6JV3SJHqoT1YkvJS2f1ArDb
 IE9ojeLzFZ8QO6Mq7msTDQTl7K27UxcCcZEFbzr0jo+nNKOgx3HIeTPMcnWrjsviVWNy
 TU3+QyEjtuwa0XI/73avgYWZmk8fLQGtdTKfGUxHZbZwX8AO7r6WcfEOAFL669hjvp1U
 dQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759752238; x=1760357038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDE8Z7qyajMCaXMrzd0HtBzhao2U4HKL5heui9QTuYg=;
 b=dEHOveicdxq+PxQOLKbAoACOtY6oL/88L8r/ZnJZAgeIiz7a1e64hHmlvl6mq5fojf
 9IRnNCF6yZmWHMhqRK66qh3dDKX7imcs1Hts+g1Uv+THfrOPYvE6ZAsWoN7DvQfN3vlf
 dcEEgxmOivcYKX2jOSlay5Sxi6W5QGmmYWm/1MxaA78KgtjJxaCJMw1VhN2Q9DP22/SW
 AhGQUEZq2OPvQ29qnRDegBj+wY+Wloel9sjR6wbmjK+rHgBeSBTH/pyZ+XfnaprIY+Iw
 7YGTNW+m6K414nyFoSs4hBdAzDyeqY0Mn2X/aFhbJL6c4peGPMheHzdqoP71U1fpQCTt
 7Nnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKoT/0HnIfzQA1qAI5ByytMDg4QrVtZHx4PRJPx9x/Vd13wRUbduiOjxbcwTaB0IGe0+6mOt/I4h2AZoE=@nongnu.org
X-Gm-Message-State: AOJu0Yx/XjTkkUgYnC90b38YQzIF/junD1T/9M9B+8UHbLMvDR8YdHHA
 Gvc7pBT98e2/ntEqG8y3hd49AFrhhNrfdtw46346NwiydV1453ZIACtqx8JpkyikDFphQOcRvjC
 9gp8E77+X2gMjxXqktffPTGRX+0NYeMRtxw7MBLOCOnO7suME4UTV
X-Gm-Gg: ASbGncukHqOSQmSKkkqC8luqQ/3/PObMOG75c9WbpcRqdKywLxcCmzXaa2Tt0JpQDQE
 Wq836nsKxcYOn8cxU7TDvIk4RWvaSnuNiCjk5ih5haIKbGKkqhSa6TpkHTfvK9Lga4eylXivDFC
 Cr1hga2OAYX6mZ/OfQHvs6Oni/DDlmoEr3GltHCbs1M0Jqpv1GJts/o6w6tifTCSiXJG48NFCY5
 w82uag2BOCUQnFa5t+tbVdkdTJipaae1elz
X-Google-Smtp-Source: AGHT+IFXqHZtrVuGjLZn1QobnOxMXN/Jcf2T2mSyTeyzJwvvKcfV62sSz9/Nq1M5CdubhOHsDhig01Poxi0vNmK/jEo=
X-Received: by 2002:a05:690e:ec7:b0:633:9631:2fe1 with SMTP id
 956f58d0204a3-63b9a05cdb5mr8677254d50.4.1759752237361; Mon, 06 Oct 2025
 05:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
 <CAFEAcA_PbfzTAW2qeFao1MhPG=jn9dtzt0AzwL-aPCEULijsuw@mail.gmail.com>
 <A1FB7B7D-603D-4D21-807E-17C1B18891CC@gmail.com>
In-Reply-To: <A1FB7B7D-603D-4D21-807E-17C1B18891CC@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Oct 2025 13:03:45 +0100
X-Gm-Features: AS18NWApgEMzNDZO0kxtQwB4du5YI0fAGqNypH-mlecyAMviTJQmK4da_dNMK_4
Message-ID: <CAFEAcA_F1OGcOQBw0xVG8g51t8v_kFz+oAtAve8mFMbKuJ6pog@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add pvpanic mmio device for arm
To: Alexander Gryanko <xpahos@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Mon, 6 Oct 2025 at 12:52, Alexander Gryanko <xpahos@gmail.com> wrote:
>
> Would it be acceptable to add a new device like uefi-vars-sysbus that can connect to the sysbus?

I'm not a fan of the dynamic-sysbus mechanism either.
We end up using it for annoying cases where there is
no way to use cleanly dynamically pluggable probeable
bus for something. For pvpanic, there is a PCI pvpanic
device, and PCI is dynamically pluggable and probeable
in software.

thanks
-- PMM

