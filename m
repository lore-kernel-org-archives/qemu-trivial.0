Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeY2t-0001O5-Me
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2023 05:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeY2s-0001NE-7I
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 05:44:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeY2p-0002gQ-D2
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 05:44:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce52ef4so2445685a12.2
 for <qemu-trivial@nongnu.org>; Fri, 08 Sep 2023 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694166292; x=1694771092; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vg9BMQjcSBA9mBWGBwAx75WW9ZFpExtipUaKCo82LAs=;
 b=ZpBTywv+d2u2xABIdH8bew4Dad12tEViNuYwZlqb9oR05lfy6eEinYvFqhQjE3fLVK
 cCYoINqSwT1fWfZE34p3/NBD6kQ+pwY/pM/1ssrB3dWV7rj+UAAY3eAaqxXi0H84YT3W
 q4u3ssgJVVffSPcK9w7eNa/ICmLi9i4bJV1jI9weJGIKaN2bEkJeuvFnp9WNZBIvesP6
 y720sU7P+k/wBcgcp+K4dM9oyq31zYb4JK3XUWPN6v/9/T4VS52nIGbyFtn1Cu1HYOvP
 PexkFMoWjHeyxZurix/sT/BqtEwlPVqxx/kKSvGKOcPNogXiTs1ZFoMhmpWlx4v2Mar7
 o9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694166292; x=1694771092;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vg9BMQjcSBA9mBWGBwAx75WW9ZFpExtipUaKCo82LAs=;
 b=PBFOsm7sBbWpUT2BJ+T7Xc/qhzOMrIniX2D20far5AhiKgAHO+iym5Hxey6Y0hLdrH
 MNRtkhoWXl0OF1bF+yZ01eRFb6f/V6jW1BaP0WTH2YNiYTrpALr7e9pdwye0/LICyA2P
 HaeQHgPLiKGG+4xqt4yTPM7MCWw8TkyJ3hMIum8D/fawaCHWbzH021TTJeAMsG1maTzD
 IpqJraAwonFJyactOdB4TvseFj7BQrzpXdXey1j4hDE45Tx2AQfjjfRw15aWrzsni8gU
 jUpO3bz341GsaQTwhShhXOHGsuNtgkEzcDQbdaibS76q28bcB5yLMFaYDh9cJ0LkzQDf
 Uikw==
X-Gm-Message-State: AOJu0YxaVnd2LuPpiE4/Z8tVz29mmIyD3MYP3NQzjVy690ZRxvYvm4IH
 yTKPCWbCHQxpJgOGWUjGTE4B8KeXf82qHdFnlLLRKQ==
X-Google-Smtp-Source: AGHT+IFVHnD53Y8WZ53atFSyEIwP2RRQRjnnzrOZNgz1enejG3U9ylUcEwf8AVdVOzN5nFZ0DDPaK7K4m+1V126HpHA=
X-Received: by 2002:aa7:c6da:0:b0:51d:d390:143f with SMTP id
 b26-20020aa7c6da000000b0051dd390143fmr1476472eds.5.1694166292712; Fri, 08 Sep
 2023 02:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230907203440.257845-1-mjt@tls.msk.ru>
In-Reply-To: <20230907203440.257845-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 10:44:41 +0100
Message-ID: <CAFEAcA8kioEXGor4tMzFPQwX8nPVHso9pQHsZ=ffRapjqsOd_Q@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: update comments
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Fri, 08 Sep 2023 09:44:58 -0000

On Thu, 7 Sept 2023 at 21:35, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> From: Peter Maydell <peter.maydell@linaro.org>
>
> Clarify somewhat misleading code comments.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/display/xlnx_dp.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> Peter, this is the result of your suggestions in this area.
> Since it's entirely your wording, can I specify your
> authorship too?

Sure.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

