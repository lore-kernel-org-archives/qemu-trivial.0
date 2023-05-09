Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pwNa8-00070y-4M
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2023 09:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNa2-0006va-Bu
 for qemu-trivial@nongnu.org; Tue, 09 May 2023 09:40:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNZz-00047z-FM
 for qemu-trivial@nongnu.org; Tue, 09 May 2023 09:40:38 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc394919cso8941229a12.2
 for <qemu-trivial@nongnu.org>; Tue, 09 May 2023 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683639633; x=1686231633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bf1wqcR5Yo9smAjpiA/dFWnPkuayBfSB4FtraJxSHus=;
 b=PCm23Xx07WQg0NpwOjKqfIMQn3T+yu90LUyp4M4q+xiO5L2OZyl2jEOsNb+Lk0/w5e
 lMjbbK0h/XI5fVeSI1yt6R9glwAdoDyQWN3Mtcg/kqfWSAibslRBUO/uHljO59I9Tl8K
 /ON1BvsYAn0nhxk3QJKl8IMYzXNdTEIP8ZYQvOMlLPvYINCcrLo31p2ErpNJ7zd8MYI4
 mxERJnMp3tdZWMIqmFrKO027NL/rLls7YvCWm1gf3xw2xSXceYxByLIKc67Z6DzaPT4r
 1qlIjnnLLdPJeUxCovZ2eJljCIV0r09i8SdY9SqY2X6mgBLmyUP5wAntmBry2Z4AIvqZ
 AmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683639633; x=1686231633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bf1wqcR5Yo9smAjpiA/dFWnPkuayBfSB4FtraJxSHus=;
 b=fKU2s3AfjrfKPbz5dl2kAfebCA6s2uLwtYFIciNeHK0tRHwp0TJKg7FlX3oQy/eSVK
 JW9YU9LJzBc95FJ64fqZ5cW78/kCOPmbR8B2M2xsDLbMVDXDcrmbJSSGAKc1y2f+/ptn
 at3UUImNhh3l1o+r9Jw8cdrpg/L23v6wC2C4oMbYumAXrWZ7MYwEl531IsMRXq4nkioW
 e0NY7d/DDiLZt0rtfqO/T3iZXFN6FlZtxypiU7Xyo6/Fb+w3sPIAl5aAU+X/biKsMP05
 V4gyxDuVu+H4WlOez16EHrhq2tagbTUq7dopM9yOGFKcOz6tWUx3KmCzpeETJ4AUVjNR
 TUKg==
X-Gm-Message-State: AC+VfDy3P+0H55Ok62C+V1ewSNtAmywDX6vdZ0Pwu5Nr+hmsFRXW6sLY
 K0T+cTs0JHiGJzUsJbnoEqyT3NanH/lbuEK3myHBxZ5sFT7b01ld
X-Google-Smtp-Source: ACHHUZ50p9M14UHPlFHXaPXzAhcn3BJYe3U1ZabonGIissSyBRg+dml4iBqkOI/WDDLQNvLV1MZp+hfXCCvQUiuK0lo=
X-Received: by 2002:aa7:ce0e:0:b0:50b:c584:527b with SMTP id
 d14-20020aa7ce0e000000b0050bc584527bmr12245721edv.29.1683639633549; Tue, 09
 May 2023 06:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230421163642.1151904-1-peter.maydell@linaro.org>
 <878rdxeirm.fsf@pond.sub.org>
In-Reply-To: <878rdxeirm.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:40:22 +0100
Message-ID: <CAFEAcA-P3Exg_up02jKmdmSrr9Cd=hUqfJZ7xAKCL3J7vWUQiA@mail.gmail.com>
Subject: Re: [PATCH] docs: Remove unused weirdly-named cross-reference targets
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Tue, 09 May 2023 13:40:39 -0000

On Tue, 9 May 2023 at 14:28, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In the doc sources, we have a few cross-reference targets with odd
> > names "pcsys_005fxyz".  These are the legacy of the semi-automated
> > conversion of the old info docs to rST (the '005f' is because ASCII
> > 0x5f is '_' and the old info link names had underscores in them).
> >
> > Remove the targets which nothing links to, and rename the two targets
> > which are used to something a bit more descriptive.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks; I'll take this via target-arm.next since I'm doing
a pullreq this week anyway.

-- PMM

