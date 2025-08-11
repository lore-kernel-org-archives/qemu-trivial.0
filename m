Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBFDC87FDB
	for <qemu-trivial@archiver.kernel.org>; Mon, 11 Aug 2025 10:01:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ulPKc-0002uV-Bn; Mon, 11 Aug 2025 06:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulPKZ-0002uG-EZ
 for qemu-trivial@nongnu.org; Mon, 11 Aug 2025 06:00:39 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulPKW-0005I6-NB
 for qemu-trivial@nongnu.org; Mon, 11 Aug 2025 06:00:39 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-71bce78e14fso42615757b3.1
 for <qemu-trivial@nongnu.org>; Mon, 11 Aug 2025 03:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754906434; x=1755511234; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsPQh2cLC7nXcV2D6WOVMEq6geO8j4x4Y22KNmkTKiY=;
 b=Nb13zDJhuf+v8q5lHP7TgTFAJBMa3iA9wtcZJwywTpdbOahXNNcZX0Rn68sg8x7sC+
 UGorPjypPgVnADSe+aaeaDRrcAec8WN9TuIOx2Y3rpL5XpQrTgMr4LEof0FOP32D+fQU
 1TVJXEftWyFt7xwmNIlNKd+jq9nYKnqWawKy+fjtsijL6SEWL5tF4SsHejF3t6zvY3rm
 8Jc5mMr0FPKIyc8vKz92zvlcTNe+hX5+qx0HH42rY9sD355fc/nng01Ys7OAzb0Y/DSa
 pbHWlud++GWGeUt0Ze4lpMEkv81MAYWNFSxNmWmJTQFcFcopOJfTflNn4tcMG+XDDUWI
 +/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754906434; x=1755511234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsPQh2cLC7nXcV2D6WOVMEq6geO8j4x4Y22KNmkTKiY=;
 b=W0xPGoij+MF+H7Tb5oFY1LOwa2Hxpt8GZOeFO6/ReN1jopC1xdw8gZlxqvAY2VkSiJ
 cZTu2S43cggiQ+JEfBMsm1L2VSjIbwxQFBsBwqnB+xgTNkreiZX7ZdNZDll1XasuMWhG
 0DzyH4uxmb9z2xIkuKQXEpPPNJXhWsPnPtRm9/02neaiwCqYYH2yruJR29giCVxOg2Ux
 0/q2j3O2IqnsEO7OtVAh5wdgSmR4ACY15iS+fKY2lk9UJ1GIysXw1yJ+XVBAFk0I21Mt
 es+x5LVadzYMeeVBECTZ9e0jYZEhXmNJtCAjHibUuT6DXrby7gMzUj2CMr6XOruFclA7
 BWfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJZpwU9JCwjL6TCn9em5tPOFVvWYmel2BYEZ07ZsnT/I2Y+YzYmh9brTONp/sT/qRkObGel49i+e7FkE0=@nongnu.org
X-Gm-Message-State: AOJu0YzowApkm4dO1Ixc7vJ903KxvDCUIT44f0rlQmHRZmrzGY2X3EuC
 D3C8x6E69Na7ETV/7EPe3cZMUw7qf0u3tz+R1LZJGXeUDUdpCM/SQO8he2fH2mzIfLFzRp0k/aw
 RAkLKSeyX+mWFwsSinB8BLCna49Ms+VeFanTPS5dT1Q==
X-Gm-Gg: ASbGncs8/M3hEl40Pfj/fMr578qMa5o7DQWXjxQcISEygRF8Uumr6MW7a07iCJmucJx
 RCEGMaDUTAfh3HCW2m3RU7wRf8efeiKjvd29DV3o3B+5k/qkEb8WuQg5crJhsp9p/vd20iyRnx4
 VZcMF0cnfQWEFgCSVrYIrS0FmHLvEOu95wJouuJ+GvyhZsYdiIuAy5tbyRo1UzmvmsJFjVBVlgD
 EapCN/E
X-Google-Smtp-Source: AGHT+IEIOb47crAn/VZ+BErJh+f89CI3UdkmsOCT5/S9l1Cacl3+hjjlLzuT5+sdwb6pXZ9pF+vCNn8vNANlcldyHQg=
X-Received: by 2002:a05:690c:4d03:b0:71c:530:146a with SMTP id
 00721157ae682-71c0530176amr121489907b3.24.1754906433546; Mon, 11 Aug 2025
 03:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250811094341.91597-1-philmd@linaro.org>
In-Reply-To: <20250811094341.91597-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Aug 2025 11:00:21 +0100
X-Gm-Features: Ac12FXxr5-m5BYrlnSjMEXK2tCrjUkDyyxDJnkbYEINa1Q6xnUWSpQYVDmQRIVE
Message-ID: <CAFEAcA8ccVxecxNd3fLiT-bNoWT-cUBJSQA1WfMr2OpWva4xoA@mail.gmail.com>
Subject: Re: [PATCH] scripts/coverity-scan/COMPONENTS.md: Add a 'plugins'
 category
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Mon, 11 Aug 2025 at 10:43, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Cover the TCG plugins files under their own Coverity category.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  scripts/coverity-scan/COMPONENTS.md | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/=
COMPONENTS.md
> index 72995903ff9..95805b536bc 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -147,6 +147,9 @@ tcg
>  system
>    ~ .*/qemu(/system/.*|/accel/.*)
>
> +plugins
> +  ~ .*/qemu(/contrib|/tests/tcg)?/plugins/.*
> +
>  (headers)
>    ~ .*/qemu(/include/.*)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This reminded me to check if we'd missed putting any other
COMPONENTS updates into the coverity website. The only
missing one is the deletion of the "cris" component last year;
I just made that change.

(It is a pity that coverity scan does not have an
"upload components file" feature, only a GUI for
making changes.)

-- PMM

