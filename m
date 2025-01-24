Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tbIoX-0001kD-Fn
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jan 2025 07:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbIoU-0001jj-TL
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2025 07:29:31 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbIoS-0002ET-EL
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2025 07:29:29 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e53537d8feeso3072802276.0
 for <qemu-trivial@nongnu.org>; Fri, 24 Jan 2025 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737721766; x=1738326566; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=efMVIS2OJvZChKfhD3bA4i8iiE1MrrvOurOUjNZNHAA=;
 b=q7FHYCgJvh96IiUOVFrsdOWaAPzaHB7qZNlDw7SB9PFz9BNTKF+GpCqyt2+TqaiMYi
 ERbAAUbGQhQWXJO6TRKi0vR2zKs4AUHNIxkljah+9ZR1Zkx3jIAAXIMY/7x1MOxFGsMe
 n6OhRJHCtwQq/J3BMrseTyiurfhZ7u9aWI+jLduu3dc4Uz2hn3ysPQul9kOme4Kjulln
 WNYOi+iqlDXqVxMlqR50OtucMBSH2GaASydorftCIIHj6wIE9Fqt3uxobgc8D+PCAgpz
 6LqjFQTeHUxMS3puOS+gPebpf6cS8bKJU55Gl/zAE5u6470SPlYm5lGluHflDab51HE5
 QUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737721766; x=1738326566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=efMVIS2OJvZChKfhD3bA4i8iiE1MrrvOurOUjNZNHAA=;
 b=LajCnPtRpaPGw4dQ9t9xUOaier6zzpaDe0c0KCElDm8gseCQPuvkI8zIs+HoEpt5U1
 d9L7CXhRHqzIdsnbAgfOWgcVqU2+EmdeHzmiAdsAhehMVkBlM5L+HUPmghQe2wfR7R5o
 bY9LTybXfT7kePH14PjJiBaOMw2YUXbuOB9dA5h5ldFYWMOpSZ2LeAkDIdmwhFs6deZV
 Y3dOyj+WfvQ0++Q5XzWhakJlNLhu0tEvwjWbaZib5fNnW6tIYxASreAalwBAzSHji9oV
 gtHtQ6Rbuvx+JZbo97C/ebET6EntuizHcEJ08d99+AD3vC7m2OW5lEdp/beivq8j+n7X
 tHHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ+yfY+tHyzjyXBlNpaaqG2dMUQFQ0u2wncVYt0L8fAFjkLNN56ER7FTQ6l3fwUui3YtBIYRyh4qtVvng=@nongnu.org
X-Gm-Message-State: AOJu0YziCprnrYSoT6v6sji2za84zCOMdwmde5NmN8tfIN6whbynF7JT
 Z/9nYnu1KgDqQ41Vtly1Yuh/hwSfZjwpKjRO2RJXoaap8fdeZmBHMNb9DdZnOXyAZ6hSqaFlMIx
 oUS9ouoTA71qyYDFbEgSnl8v39tv3J0e9dxA5vA==
X-Gm-Gg: ASbGncv9wZgYdgtzgj42kWgbA2nYK7xICRq/zdBUtj3nnANXDWKcxTcP8CSuJgSutOg
 r32Ou3wKQGyIoe6PbZmCuLF8PfYO8PxKkjbvCEFe90PfzUQl7lkF0nauyM844/CE=
X-Google-Smtp-Source: AGHT+IFe5/kv+gI0EVGRyX+u5Ax7KrFo6z70X7gn/YvA0Vzr/nqnYHLMF3rwNmuVWUAO5u1NPNhAoY8nvaYn7/avdHU=
X-Received: by 2002:a05:6902:15ce:b0:e58:183e:90e0 with SMTP id
 3f1490d57ef6-e58183eb5e1mr7348147276.11.1737721766687; Fri, 24 Jan 2025
 04:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20250124025322.C47A24E602B@zero.eik.bme.hu>
In-Reply-To: <20250124025322.C47A24E602B@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2025 12:29:15 +0000
X-Gm-Features: AbW1kvY1wfkncgAQtVuYHX5EvXiQMvbuR42PcLV2XeISeXSANYH_FB-4ymU4DLU
Message-ID: <CAFEAcA_2d1mE2btg-TghmjNy1u1UftB8LCMC7QnWX+xV1+rObg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/usb/hcd-ehci: Fix debug printf format string
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Fri, 24 Jan 2025 12:29:31 -0000

On Fri, 24 Jan 2025 at 02:53, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> The variable is uint64_t so needs %ld instead of %d.
>
> Fixes: 3ae7eb88c47 ("ehci: fix overflow in frame timer code")
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ehci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

