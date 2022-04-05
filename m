Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nbiW1-0005pM-P4
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2022 08:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbiVz-0005nF-RE
 for qemu-trivial@nongnu.org; Tue, 05 Apr 2022 08:42:31 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbiVy-0005cF-0N
 for qemu-trivial@nongnu.org; Tue, 05 Apr 2022 08:42:31 -0400
Received: by mail-yb1-xb29.google.com with SMTP id g9so23129233ybf.1
 for <qemu-trivial@nongnu.org>; Tue, 05 Apr 2022 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fU8wMZy0p6GIKBtOYQzfgAUmrqT/FDuWU8SlkC/Ee58=;
 b=e5yUCGvFxwcAj+WsNXk1LgN3W4PI5PzNnxOBX4ItLmvxYaYr4WmlaDIkCeFqKcB4Vd
 spt8nlPrayPn15LzMzFRVH2Cr9dQ+OCB2w8cWLPMJlR43TidWw6oSKDgVccIP1XVSODn
 xzxqMzy2lat31qmCvWv2Rja7LyOFJHdfVLDcKveO1DpPH48yPmFcQO3QPKkdKQbW5aHw
 hvSprjNXWJERIyRFjid15e3tAtcgw6GRjeABsXryKjl/V6LRzk79VAIUTVZvR3Msrq2L
 fUS1zVtwIEOAUZ9jeWVl+yLaE05RVHBaS/Gm9d+5oCDH79X1ge+jwjZhPzGfNmSsW9iH
 VIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fU8wMZy0p6GIKBtOYQzfgAUmrqT/FDuWU8SlkC/Ee58=;
 b=LT2oLEIi9qFxqUOabeXVy3JwgrqzKWgpgQ2TQqRxxBeNkAT2KFPYlkrYFQOyGkcK4n
 JJ81Nt8SkqvjSZGwai61rZApdSW3zV5I63KPeR2JTBvEA7v0clqYkmdBtdIg8qfRfNTE
 TqnUovowDRl0kmZI0o6uIpkQSn9KJFj2mp58dF3uh50sARxFVVl7mGBFkHFyMN3eFOw2
 wNdQ2l1J/dq+bzeS6F6QUtmmAN9dVDuyK+qMdKDzG+IYh8O1xfDZB80w09B3YTTFW7PY
 mbMBBcERs5wLmVlT3Biw2EacD0zELhY5AXtLvXuTHChFGL2AO7ar/go/mkYfwNAGEIvA
 RKkA==
X-Gm-Message-State: AOAM531q4Dn/fKOxYkSa075+I6bxpNL2XD1BRh6TmG/UEp24+sMwxIer
 LATVKqR1tgRlkUHjNGrfcXocLA7ce2ZOBUlsnttY6A==
X-Google-Smtp-Source: ABdhPJxUFqmYsZQRvsMzVTy3k7vUwLr2p+bbBrfKQ8hkUQuoeLqu6kgn//4dUBI5fNJs1yPHx9mwnBv0yIooHyOxpU8=
X-Received: by 2002:a25:418c:0:b0:63d:84a2:2364 with SMTP id
 o134-20020a25418c000000b0063d84a22364mr2336390yba.85.1649162548802; Tue, 05
 Apr 2022 05:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220405123534.3395-1-shentey@gmail.com>
In-Reply-To: <20220405123534.3395-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 13:42:17 +0100
Message-ID: <CAFEAcA8ni+WGVRoi=8jboQwyMsFetRCtd81RDL_5LZJHWGiVVA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/ppc/ppc405_boards: Initialize g_autofree pointer
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "open list:ppc4xx" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Tue, 05 Apr 2022 12:42:32 -0000

On Tue, 5 Apr 2022 at 13:40, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Resolves the only compiler warning when building a full QEMU under Arch L=
inux:
>
>   Compiling C object libqemu-ppc-softmmu.fa.p/hw_ppc_ppc405_boards.c.o
>   In file included from /usr/include/glib-2.0/glib.h:114,
>                    from qemu/include/glib-compat.h:32,
>                    from qemu/include/qemu/osdep.h:132,
>                    from ../src/hw/ppc/ppc405_boards.c:25:
>   ../src/hw/ppc/ppc405_boards.c: In function =E2=80=98ref405ep_init=E2=80=
=99:
>   /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning: =E2=80=98=
filename=E2=80=99 may be used uninitialized in this function [-Wmaybe-unini=
tialized]
>      28 |   g_free (*pp);
>         |   ^~~~~~~~~~~~
>   ../src/hw/ppc/ppc405_boards.c:265:26: note: =E2=80=98filename=E2=80=99 =
was declared here
>     265 |         g_autofree char *filename;
>         |                          ^~~~~~~~
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

