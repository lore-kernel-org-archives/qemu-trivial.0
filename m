Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54C2F483F8
	for <qemu-trivial@archiver.kernel.org>; Mon, 23 Mar 2026 21:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w4mXw-0004X6-SN; Mon, 23 Mar 2026 17:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4mXv-0004WH-2A
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2026 17:10:47 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4mXt-0002xD-31
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2026 17:10:46 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79a8e873ca1so37434717b3.1
 for <qemu-trivial@nongnu.org>; Mon, 23 Mar 2026 14:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774300243; cv=none;
 d=google.com; s=arc-20240605;
 b=UNEeh7bLCn0jlNAJBokVyUK+71Pq1reC1sZFij2IR1XLUnLELiDcsg4kHedQuWCfZV
 gE5mME0zLQ3EKRcyFrq2fkj58mxu0iVPfM0frshPFx3sJj9gF3QOq/Rx8WhYtVKFYyXd
 kuearocYSddVJe8LYk4MFDR9q0/7nvZ9cdqG+e1M5ICSACkNLYcuX0HQndIvowkCCj3Q
 2JtKctvPbBicOOYjWh7l8OsR2PUIel1SwQwFYlcvoW/MJuqmye7xkWU0NWNvZHZ2R3i0
 avns7919HQeExWy/qYZbfmkkpSWy3vFHeOUU2PS45LRWMmHoJq1+OSWmIboMs1EkO3ib
 KqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+VkP2Ok3TrhK9DJqpqJO4krnnwLSGahL3oNcBXnzt7c=;
 fh=KQToVzJw2MBzlxLH5c5mETAQ6NYjmAYG3BGSivDOF1U=;
 b=hBICGTK/Hg/jXsIgKVyJ4xUTVSCRiWTkoPErTVIAzPntwn/l4VayBP/tRBY3sjAO4x
 j6SEN8YuZpFQu3cj1GFy8faYlFurJzK6R1pMsb1eboEgMwVY+neajg1gL17d0cw+WnLf
 7C1z/z9TDtyQ3FULxTpG44+UsYCeMMIEQQduZHCSmpBUPfxw+JxU87QtXK0iwwNO1xjr
 5MJ4pvLdxvYrf6UN8L2p5y7HWouI84LkfLhMM1lYhv8fnPSTnoyVGkwF5Fov3dDINCVP
 tKraiO6febYi7PcKn9lV0DpLc3bcGPB+W1RKB6F8eEsaa1vw9MO/FrFoaLHQc4+Nmmx1
 RkTw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774300243; x=1774905043; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+VkP2Ok3TrhK9DJqpqJO4krnnwLSGahL3oNcBXnzt7c=;
 b=NAuM78+GKKn9k7iBaoepZVJtIjco/qCiGxk/pJ6/+D0RrlBh6jM0ONKhGIFLfuHbFB
 VtUKNJEoaZlgKGOfgvNhoEO7uhf+jVAlRiXjrJ4FoRdXvoTBz7Oti0k0s62JCRELm7Ri
 E1XckPXqztcA+TKjtYtnXQ9IRiw7bbBuf0qU3poZXhv3j9IiGptAYCBAWXZRpoRVVXV7
 j/Qzo2FuXFagirjIjpW2bpG2c12DeVPy1taFXjvomLFq0HkUh1Fq+pa66CUjn5gETlB6
 rIs1XAiyeH/AsTWEEfMI+MjWj73xSq5lTmGp0tUXd9X+tMjGTca2/KbZE+PhKurIr1OW
 CHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774300243; x=1774905043;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VkP2Ok3TrhK9DJqpqJO4krnnwLSGahL3oNcBXnzt7c=;
 b=gQf9HccmtD/jdPciIYtta+BZRE56xwOr25kwW2RdPh9Ygk9zLGn43QhOylwjxq/gnO
 SAHJ7lZUi8xsGdC3vnlhiuLwfHTXUGZ81sESvMebIOKszPtnTKF4yXQK4OqW9vy7uinO
 gHd/OZLwQUw86/RjHJL+aa34FV6Q/PNbsRVXH1of+ONsKiz0/SQXDZ3g9Z3dNigc7jaL
 sdluGXJumxDVpLLTNnrTZC75904qp5IHDa27lVw4wRSfWxvmXdRPWauue7vZPQvcOmAc
 k10CCXwR2GzSWs1N+mSRbJu/BiMpepVodvFEywE3WK4RIfutGxD5/vXqoYVvnCnImdDI
 ec7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP/Juo5eqM/ooixUnKnyTePjdmP7/jbpGmygjAdIixTz2rTgqQYspURECMwiIHjin0wfyGczxmmTScszM=@nongnu.org
X-Gm-Message-State: AOJu0YyHvKpKVUTjsCe66HFgKiXumjsulKI9InSSIFQtAHBE3ULqO4x7
 IB1ZEYxsvTn/P2Q5A/ldW7UFbQApNpw02k9ajkSUm9D1gWhOsFtCpkEHNFJMjGJh6lMfGwCdVzv
 RS+tD4jI8Apqebjdr8XXiLPXiscT2r4Gvws3O78AhRA==
X-Gm-Gg: ATEYQzybC7DPdImFT0CqvVQTEaDAbJocsWbvOoUsj4154Elonjw1HFnGg2KQJeqNf9n
 xpJK9GgLA5nCyrceNQA/snh+6pwU64fX/xWPCDDkakqXSN8pIvd65ACuJYngPwdIo58G0JxKYYT
 r+RrIb/jRjraPL8zNPmpoQUmIJxlK7tYN5Xvx4r6+RuACbtjgIPfLlMNpwV0Ab8dyrKRdndRtgb
 zw2vUSdkDfNmFX76xHRm+6jQQAW5psvs7Ukb/hbspTmN4KA1XwrRQ7SZMUzdJbLxVSapesvBsdn
 sPpLgu1S0jqlEDkC277NgM8MAUUeznFLYCzvmJtfa01mcU4YpdIkKiZhB9ihmjyxMJo=
X-Received: by 2002:a05:690c:c4f9:b0:79a:b49a:cb4e with SMTP id
 00721157ae682-79ac2e74e58mr12123267b3.6.1774300243463; Mon, 23 Mar 2026
 14:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260318174522.87902-1-sw@weilnetz.de>
 <CAFEAcA--mf5DoEkvPi+9M5zHhxhqOScX4hWKowcR49zE5iwFnA@mail.gmail.com>
 <a3b30fca-f7ea-4408-8e5a-a84ead4a3c8c@tls.msk.ru>
In-Reply-To: <a3b30fca-f7ea-4408-8e5a-a84ead4a3c8c@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 21:10:31 +0000
X-Gm-Features: AaiRm50N4gmEhi3k4GkdXxbEWwD-BCNxS1SaII6zE5Ws_Z1YgXu0jxPVBWj5_IE
Message-ID: <CAFEAcA-0C509rKSqGLniyqGFDKxG6b+MnQzo6c_mQ43DLWSU3Q@mail.gmail.com>
Subject: Re: [PATCH for-11.0.0] Fix include statement for u2f-emu.h
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 23 Mar 2026 at 17:22, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 23.03.2026 20:12, Peter Maydell wrote:
>
> > Hi, Stefan. Could I ask you to try a tweak to your git config
> > which (assuming you use git-send-email) I hope will fix the problem
> > where the mailing list rewrites the From headers of your emails
> > to "Stefan Weil via qemu development <qemu-devel@nongnu.org>" and
> > then when a maintainer picks them up they need to manually adjust
> > the git commit author line ?
> >
> > This is the suggestion that our .mailmap has:
> >
> > # If the mailing list munges your emails, use:
> > #   git config sendemail.from '"Your Name" <your.email@example.com>'
> > # the use of "" in that line will differ from the typically unquoted
> > # 'git config user.name', which in turn is sufficient for 'git send-email'
> > # to add an extra From: line in the body of your email that takes
> > # precedence over any munged From: in the mail's headers.
> > # See https://lists.openembedded.org/g/openembedded-core/message/166515
> > # and https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg06784.html
> >
> > Hopefully that will help...
>
> It might help if the original email did not have From: header at all.
> But I doubt that was the case here, as From-less emails (messages w/o
> From: header) gets dropped almost everywhere, so there should be
> delivery probs for other places too.

The point about the change is that it puts a From line in
the *body* of the email. git will pay attention to that if
it is there and ignore the incorrect email-header From: header.

> > (I don't really understand why our mailing list still does some
> > address rewriting -- I thought we had configured it so it never
> > changes the mails any more and so shouldn't need to rewrite senders,
> > but a few people still seem to have their addresses rewritten :-( )
>
> I guess most uses who's From addresses gets rewritten have DKIM set up.
> Your domain definitely does use DKIM signing, and so is mine.

Yeah, but the theory was that the mailing list should not need
to ever rewrite emails, regardless of whether DKIM is set up or not.

-- PMM

