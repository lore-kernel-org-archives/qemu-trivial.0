Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3FEF483D7
	for <qemu-trivial@archiver.kernel.org>; Mon, 23 Mar 2026 17:12:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w4ipF-0001R7-Uu; Mon, 23 Mar 2026 13:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4ipC-0001PK-B9
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2026 13:12:22 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4ipA-00033x-PB
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2026 13:12:22 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-79ab3e26cceso4441437b3.3
 for <qemu-trivial@nongnu.org>; Mon, 23 Mar 2026 10:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774285939; cv=none;
 d=google.com; s=arc-20240605;
 b=k1equ+Rv+vABx5SAun5iWvlYNnr+W6hZyVITPlsZywvtgr/StCIS7jJqMyYJIGdFVv
 i3dSyLIWXlIIvYhIS6QX0PFy8T6YfPykTO5VpOrx0L9v2pheOWRWKN/jy+uk11KZC47c
 6Zjq0SyRBk7dzzhj5vEeusPUU3w7LkyCkguN54UL/QsNGcWOQulfSSRMD9hkdDch9iC8
 iEM54XUpRmUc2A109rEa5K7+PMF+j3FQchoqewkB0HL/7qZsHGgN6qyMj5c2ju/Wh83x
 DWq7kWxLyTlZnhbf/yLWmyylztg5Hxj8jePBGT1OpqYoAIFVqUo12hF641ssjROzYIhL
 V1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GR1VkcQo+oVYC4DpG+EQ1/sIRNf4GzzeXMm3yrpItcM=;
 fh=kyAPe7XHD/mhLOrPUATSz6SQJMwO09DnN2BmVWPeGHU=;
 b=SdxB5n+kHYtJijn9vGlpelgqhTm2BP700AT5J/0+qtv/rg/XJOQt2pvD5YEgwCjsVp
 U+gPRoRM0Ebn1smj1Cd8Liz4zdZLFXT50wp9IvsOBOCHebAjxqce7VVzkK4Of3ihbQpV
 VNrnfwT78Dxwlw/oKXmQ7ks357LHISfb7cDaBEyE+YC5D2nt2whaIrgdNGfCu0nubsud
 ppmrfRSOUobzvZz7Fv6EAfuHph6N0iiLGo7czay3ry9VHendpXRzG/4fHSpKkZL7X71c
 Nwn2Cjoy9vP4Wo88j2/togSMpLQpg7GIwaX5bbppLrjJ/QBx7CTTiqpcUIMvXZMKJjFy
 LdRQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774285939; x=1774890739; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GR1VkcQo+oVYC4DpG+EQ1/sIRNf4GzzeXMm3yrpItcM=;
 b=NpJxoH6hPcoqynOCI9Td65iOQ1ZSA25pVb+41tSKV2DcHQreCkAuH6gcV68dzsdfbd
 ghYp3cMpl4plJTYBdXBGHtm/mq7DTwV05jaxAaS55y/ievyt9BtFThUii1ZdLp1fhHv3
 NOknNzmY8Ub2b+4d4C5c6n6TDj1AL9tZOvMpJsM+x4VyOG1fzv1UXqXigFT3V+oitoZJ
 0glWAhrL1fPHpWHZcyuWISU0+vWynzNTf43cbL44mk9m/B3+PE/YwJDwYPesFS9EB7q9
 2V5L04Li+exs3zhikmp1jpLLNscm/lRg7vfdTXAPxsmQFaVvYE4E4aM5W9grCQiB4dQy
 a1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774285939; x=1774890739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR1VkcQo+oVYC4DpG+EQ1/sIRNf4GzzeXMm3yrpItcM=;
 b=SQAq49RG7aK7Z696QVkrzqVXzp23ZIRL9iKbCxoEyhh0KlJ3+NcioYSv7xSGiiT5GI
 EMCsjiWFB0XxsQ9w9PrUiPYP/A4Kcu4KfCEAshFh+rasPCA2tXBP2bG6CsuBRhOwN8DX
 5bqaK2HLJSLvqbN/V3DHn+w7bRyzi06DgM5AWXYcq2S43Dy3H1/XqwBj+OCAXzYSP9qG
 hnBTlQClaVQKChofL4dJQvyjk3FNkJMTJAQ1TWGWVtH1TAvBS076gI6gJffpW3iuLUIY
 AoHNaoVGoAig2i94Z3va9PrWvEFq6+XYdjkSXpNeV8EdpaI71YgFYmX5VIwfgPRsQLY6
 Ewvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdIZzg6d3putj2UsCKvFbe6POUVjmpBvaiFziOZhvcaHG//TvBQe0Q31g3JktPyWo+mKgPE7Jm3ut6IfQ=@nongnu.org
X-Gm-Message-State: AOJu0YzVo6lWTgi5csLxCUVtUbRvUNnaQVQt2P9M3dxKKASS9tkDQ9bk
 2Ft+Ct4ZuZR6OORsiJBW/RNLj+p143b+FLAfq8Bnr8NbVhE8fs/m0bfKfgFYY9yDieoQ79v24YJ
 8xYXuibGC9HzM4f/MgZnwHmLj4EpnYl8ZM2sVEuomdA==
X-Gm-Gg: ATEYQzyASUr2Goeb7TsB9zQ+n1JUx7sXK6GqlACQgO+4C4bDxd4tKKsokdIFbPpmVcE
 0hJeNbNnRSv/LOkp25KxD4mN/rNIrfjKe21dAPEzcCapENfOPdlpU43foA3v7FCa1yMRugBwyzH
 2Sv6NN0ncRDcsIDWMh+3wBMAAYveTWXaFj7zs2fRpfTvekRZ1xOvt9lGeI7ibskGHlq00O8xYdU
 kq8NkkCHvROn3QkZ0q1dPZIrI5pOAqv3iFZnqlsNU5Ev1OGyvF31BWrxzk894v3htfexx745j/0
 6PiO0CTcSiML9et3n5xjGIn9TCKbq/ayQsSuagjTVquiokJMcWmd39QLxab+/p47MVURv2/392P
 gjA==
X-Received: by 2002:a05:690c:385:b0:79a:373c:107 with SMTP id
 00721157ae682-79a90aa0315mr137772517b3.12.1774285939204; Mon, 23 Mar 2026
 10:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260318174522.87902-1-sw@weilnetz.de>
In-Reply-To: <20260318174522.87902-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 17:12:07 +0000
X-Gm-Features: AaiRm502k7P7ZrbjeTCpd6UvfsJjeozmxOau-WnLR5rw4Huae0ymBeWmMLPcHlg
Message-ID: <CAFEAcA--mf5DoEkvPi+9M5zHhxhqOScX4hWKowcR49zE5iwFnA@mail.gmail.com>
Subject: Re: [PATCH for-11.0.0] Fix include statement for u2f-emu.h
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Wed, 18 Mar 2026 at 17:46, Stefan Weil via qemu development
<qemu-devel@nongnu.org> wrote:
>
> All examples on https://github.com/Agnoctopus/libu2f-emu/ don't
> simply include u2f-emu.h without any added directory.
>
> The additional include directory does not exist when libu2f
> was built with meson.
>
> It's up to pkgconfig to make sure that u2f-emu.h is found in any case.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Hi, Stefan. Could I ask you to try a tweak to your git config
which (assuming you use git-send-email) I hope will fix the problem
where the mailing list rewrites the From headers of your emails
to "Stefan Weil via qemu development <qemu-devel@nongnu.org>" and
then when a maintainer picks them up they need to manually adjust
the git commit author line ?

This is the suggestion that our .mailmap has:

# If the mailing list munges your emails, use:
#   git config sendemail.from '"Your Name" <your.email@example.com>'
# the use of "" in that line will differ from the typically unquoted
# 'git config user.name', which in turn is sufficient for 'git send-email'
# to add an extra From: line in the body of your email that takes
# precedence over any munged From: in the mail's headers.
# See https://lists.openembedded.org/g/openembedded-core/message/166515
# and https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg06784.html

Hopefully that will help...

(I don't really understand why our mailing list still does some
address rewriting -- I thought we had configured it so it never
changes the mails any more and so shouldn't need to rewrite senders,
but a few people still seem to have their addresses rewritten :-( )

thanks
-- PMM

