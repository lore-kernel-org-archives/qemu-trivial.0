Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYTJf-0001Cc-4L
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 11:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rYTJV-00017b-OI
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 11:01:19 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rYTJU-00069l-8I
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 11:01:17 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56001b47285so1571371a12.1
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 08:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707494474; x=1708099274; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vp22lOK/7vavlAwgAMcUbHYWwj5W5A4bUkj+jT9blj8=;
 b=b8BlfCW6BgdwbxoGZIXNCLtFdc237V7698zcJTAvq0sEI+sryM4ctBg/Gt2ugH5AbZ
 Z5m5NvNG/mcTwUKl+vM8Ryic/Tj8sdocku7IgGl7gGzc8oHl4XZWuBsNYwOYxA8eaKR7
 ItfgPrGo3TElQKD/gIg0z8OfJoyzeX+rAPHqHatjAg80OAdphXW+L4KoKE+tPoHsPMNc
 48yCNQQkEaPI7B7ka3MLGsBMK1WY+5X3WuLAJadVomwwDdosa/sbzKidPxjbEED7FaAR
 AF8AX70GaQe2W2iIOmAfBft+gevjjKa8e7jmdT5wwMAq6knSTO8PFxKsmPKzhAXLYVpX
 6jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707494474; x=1708099274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vp22lOK/7vavlAwgAMcUbHYWwj5W5A4bUkj+jT9blj8=;
 b=N2AcgdBZZm28CcOVYIrBNZupNEfUO3Gy8mGxGUfU1CZCeF00X1gcmthaEUJxLcYhHB
 sdEjulzgzFyUKy0t1Rs5rqvhKBTfHhqyjz7DQqvBckZV89ypOCZ/kF5jThkms9clTKoN
 P1hdLZ/uCOsnD9aPFpHnoUmUkfSKbDmxDeJjQQ8nWEYMf3a0BDtxBZy1ExhXvtFMEP4v
 Y9eiZ390Xrim01Y56i/tsrVpMNLo/sfHJKJf7JDtqto1V8oJ4VshJLubJoRT5t88iHgR
 jqXZW3Ugo0UxCn7EFyCDMEvpbBuXzKhoivaCbIJAl8mxcXKVwin/2she6o74UQJRuqpd
 KqIA==
X-Gm-Message-State: AOJu0Ywrqx4eD5X2FayCvzHBLTj6wRVzJlUdjCkiGrdclfWPq0BwB1oY
 OP28exYZPMMtHv/KYp7tVMfAaPn2UvXP/UhqPMio57C45ftOstMqwPWMIQznZsCsjJh4aA2Glqa
 YsKPmvhTJ48GbAPSTSvkU+ItdOf0lJWTUv2Afxw==
X-Google-Smtp-Source: AGHT+IGIe9b5efvkEmD6XOCrtJfehbHSbLh2gj8yynq587i1y3SS8XWiPV7yehRQXrfhsmyoC7Wt0ZF+c9IITD7ziYc=
X-Received: by 2002:a05:6402:649:b0:561:aa3:f9e5 with SMTP id
 u9-20020a056402064900b005610aa3f9e5mr1659199edx.3.1707494474091; Fri, 09 Feb
 2024 08:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20240209150039.22211-1-philmd@linaro.org>
 <20240209150039.22211-2-philmd@linaro.org>
In-Reply-To: <20240209150039.22211-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Feb 2024 16:01:02 +0000
Message-ID: <CAFEAcA82_L4tJTFB2OP795Yad1bTzgK0MzQNY41nGz5LEbkC6g@mail.gmail.com>
Subject: Re: [PATCH 1/3] cpu-target: Include missing 'exec/memory.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Xu <peterx@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 09 Feb 2024 16:01:19 -0000

On Fri, 9 Feb 2024 at 15:01, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Include "exec/memory.h" in order to avoid:
>
>   cpu-target.c:201:50: error: use of undeclared identifier 'TYPE_MEMORY_R=
EGION'
>       DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
>                                                    ^

Given that we don't actually see this error, presumably
we're implicitly dragging it in via some other include?
Anyway, better to be explicit than implicit, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

