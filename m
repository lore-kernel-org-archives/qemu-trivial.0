Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryt3H-0007Ht-Re
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2024 08:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ryt3C-0007Ca-2V
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 08:45:38 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ryt3A-0005Li-EU
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 08:45:37 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so1481250a12.3
 for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2024 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713789934; x=1714394734; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Gvssde9/xaurWK599MgZqx+vkz5GaGp8TSAAqSjOMw=;
 b=GyxE8pGfBucj0lBw/e05ZkKM58hQyf7kg1P5vUW15XhThONP4mNd60Sz9wywG6Y70+
 5WoHha33wDJ+S2csg6hsQkxYpy/UpUgZlmsSQWizVfqr59WpGl8c3hsJ4cbttltl46vs
 pGXALDD4DkQUyZPUioHF56Xl3e7x8OtePyJAKWmEVMDpi5iOAhG7Xd2tZ9SxYGGUdUc6
 LSylJCdsfm1qLU5JnMhWO53uH7PwqLFdRG/VKbv+FWF+Y1OO0XrBBCThsw8oXGTuJx3F
 Dfqj5oFEcWLmgAk06aEDd9IOHUmuojGwAPNi8R0IwWBa3rQaAKTmmRrx4FKNwmkJwJ1a
 TK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713789934; x=1714394734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Gvssde9/xaurWK599MgZqx+vkz5GaGp8TSAAqSjOMw=;
 b=puC8lEZDKUdSDShz3K2gylcWOJhA4GYj3CfhMAoK/ZfajVPgKp90ztBGCcbar9t4j3
 PA34fg9nUc2dvyFXTo55xjaVnuGMXxgBFR/rGd9JcsrcvyGtAH3EhS/tU69Fr0XBIN7i
 odYvoMgLfhT7exxanfDTV/5ecZiYGY6irLPgsDtGck0X6V43kboq28sdIze9PngDJzbs
 sWqr1zFM6kpkijuxxeRJtY4AF1JR6i5VwIfwbMO8esCNDx+DyD/V+eFSdQy1QNOgpEBo
 ZASiMtJexH2iuHWziwLdMe3JHuWUPoHLucq5xekafDFqtNH7/sHleKTX84GcaIHp5LMa
 kodA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVLhkG5OI7dNypD6i3U2FfJuEEqa4DIbXDYtotOYngd0c8oxMKLbEObo5GUHpmBLBm9hbZZw3FlkBmqm4iGgIFK7ChVJ/aSA==
X-Gm-Message-State: AOJu0YwnGC7Bixsgvcx7ekGqD1PhE71BIBZWSHsGw7UbkyV9h/6KZhT/
 X8LcDVEp5cy6RvtcLNfVE9L/MlxGjHLMqz4bLORiUSCTeYuGxPBtNhmEtcXWFefHmGYDTpjO3Aa
 e6ANf+X0EDGOZZqi9A0ELrsmeqmQiYYheeH2q7g==
X-Google-Smtp-Source: AGHT+IGotxdISTlx1oD6A4f/aljsRACWpwmNSAotUDKFGgabI6UwsdtoR4xXyVi+ljmv6lQ1EAxZqPTujQ5RpBkuK/I=
X-Received: by 2002:a50:bac6:0:b0:568:d19e:7ab0 with SMTP id
 x64-20020a50bac6000000b00568d19e7ab0mr8330839ede.36.1713789934271; Mon, 22
 Apr 2024 05:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240422124128.4034482-1-manos.pitsidianakis@linaro.org>
In-Reply-To: <20240422124128.4034482-1-manos.pitsidianakis@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Apr 2024 13:45:22 +0100
Message-ID: <CAFEAcA-NgdMgJfWZqWV7khgnEzz8K7NWPg6tgHDKtA+KaP85eQ@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: fix minor typo in submitting-a-patch.rst
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Mon, 22 Apr 2024 12:45:38 -0000

On Mon, 22 Apr 2024 at 13:43, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> s/Resolved:/Resolves:/
>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  docs/devel/submitting-a-patch.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index c641d948f1..83e9092b8c 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -177,7 +177,7 @@ add an additional line with "Fixes: <at-least-12-digits-of-SHA-commit-id>
>
>  If your patch fixes a bug in the gitlab bug tracker, please add a line
>  with "Resolves: <URL-of-the-bug>" to the commit message, too. Gitlab can
> -close bugs automatically once commits with the "Resolved:" keyword get
> +close bugs automatically once commits with the "Resolves:" keyword get
>  merged into the master branch of the project. And if your patch addresses
>  a bug in another public bug tracker, you can also use a line with
>  "Buglink: <URL-of-the-bug>" for reference here, too.
>
> base-commit: 62dbe54c24dbf77051bafe1039c31ddc8f37602d
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

