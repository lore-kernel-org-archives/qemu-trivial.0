Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qPlzE-0005qU-KS
	for mharc-qemu-trivial@gnu.org; Sat, 29 Jul 2023 11:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPlzD-0005fh-3F
 for qemu-trivial@nongnu.org; Sat, 29 Jul 2023 11:36:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPlzB-0000R0-K6
 for qemu-trivial@nongnu.org; Sat, 29 Jul 2023 11:36:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so6458424a12.0
 for <qemu-trivial@nongnu.org>; Sat, 29 Jul 2023 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690644963; x=1691249763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ve3lKj8r/zaJeKPeEgv98Ye5+Ok4TppUCldJHeR2sO0=;
 b=asl+adFbyFdVWXoLgN/T+zUpKlCq0wUIkPd8pvEkZIiVAfGLoFLjOaG+nHHK+wOzl4
 UvHz/UE1TQnPC29wU/K47qaAFHX3GC/fDJ4HOZ4ndPrSYd953+ssJ/tjXGQi2wq/15ok
 p0NTPWKxtYbZrTp8f203NdqQzfHb6j/4ztRuK5c6VdyWZ3JGtuelk3E8cntIqihUqjGa
 6NG6HUYIlv6F6e5Re4Pyfm0ovIezo6W0df2ldee8B4Gy+m/sRtpDvi+DUdKNRyjobgyE
 KihHlPwE32uVUi09hiLMvPFswvwv261uVWkTK+778ZYPuXKCSt5UKpNTxNufH2pS1dcY
 GzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690644963; x=1691249763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ve3lKj8r/zaJeKPeEgv98Ye5+Ok4TppUCldJHeR2sO0=;
 b=BOGFZHzjcbwPfgtZltUjpKwXPT1S4drDYktc1DIT16HCvp1oEpNytUqu78+wjQjolR
 64gG6KrG+euk/Snq5ah8z+zbqdMfjTXzoQ+W0n4580AuuUVNaXHKiIZd4zutLdJrYey6
 OM04jw1MFj91IdklvlaPJy+cnuAjbROndTngupDrLtP0Rns/DZXXKNUBnEo2cayUIciF
 iFhO3ZoyXo8a05BBd1xPX5Gf4ak07jewJ9SMKkTll61Y+saemtlZ0Mahex18QMDw5mTa
 gcWGxIw5bYTIAgxNSJ7qzqJKZ8H8WMPVT/5eD2vcWWSl4q/iYJSYU0JlEZ1y0GVFHkuY
 0RiA==
X-Gm-Message-State: ABy/qLYjsEI9RifynBQJXpBTwSUWQfsROFikOmDXgs3C1YDkyAHWO0ZF
 IQTHtTXBsra5GGdI3MUoKzX8RrKAJ6OfD9Ia0iMQUQ==
X-Google-Smtp-Source: APBJJlEeR9mHTtIPSi9NuM/cxxtpoZ9yWRDM8iHED4MD3svT6IfixWc6LL6GbUA9ei1OmKYF0uKegPApwfvGjcgvue4=
X-Received: by 2002:aa7:cc18:0:b0:51e:421e:d209 with SMTP id
 q24-20020aa7cc18000000b0051e421ed209mr5956541edt.13.1690644962902; Sat, 29
 Jul 2023 08:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230728195646.168997-1-danielhb413@gmail.com>
In-Reply-To: <20230728195646.168997-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Jul 2023 16:35:52 +0100
Message-ID: <CAFEAcA-79hxq7Uxne1wRx_waWkCy75ObKw5+krtbp-aTbxFkoQ@mail.gmail.com>
Subject: Re: [PATCH for-8.2 0/2] ppc: get rid of free() (gitlab #1798)
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Sat, 29 Jul 2023 15:36:07 -0000

On Fri, 28 Jul 2023 at 21:57, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
> Here's some trivial changes following Peter's call to arms against
> free() and friends in gitlab issue #1798 in an attempt to enforce
> our memory management guidelines [1].

To clarify, this isn't a "call to arms". The issue is marked up as
a "bite-sized task", which is to say that it's a potential easy
place to start for newcomers to the community who might be making
their first contribution to the codebase. The changes it suggests
aren't urgent; at most they're a nice-to-have, since glib
guarantees that you can mix malloc/free and g_malloc/g_free.

We've had this sitting around as a suggestion on the wiki page
for bite-sized-tasks for years, and occasionally people come
through and have a go at it. I wanted to clean up and expand
on the description of what we had in mind for the change, to
give those people a better chance of successfully completing
the task.

thanks
-- PMM

