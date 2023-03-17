Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdDsK-0002vq-HF
	for mharc-qemu-trivial@gnu.org; Fri, 17 Mar 2023 13:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDsI-0002v8-Ds
 for qemu-trivial@nongnu.org; Fri, 17 Mar 2023 13:28:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDsG-0002um-SB
 for qemu-trivial@nongnu.org; Fri, 17 Mar 2023 13:28:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k2so6031142pll.8
 for <qemu-trivial@nongnu.org>; Fri, 17 Mar 2023 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679074095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xduJVcuAgQuB7bxyjGWP8oKwzv/ArE6QVMLy0HUQ6XM=;
 b=MW6pxty4jvCSJZsHjJCrZf4dRn6sk2QjmuTtOfKOeCbzGWGBNJ+IyTZrvq9cJSy6si
 YJx/A/GeEmUlZzrvGzYzX4ZLGyh+0ZIN/+6WASKha19GGZ3PnVNcZD39mekK1dhLb3GU
 QlwTCkVVTTK9JeGfuNhS+VGODwNt5U4JuDq7EWIfA/V46QD1TSKDz5G/H8H91tZVu+q7
 CAPa4DagUeNjtuDetgGi41Qk9JsH77vtmznsASVmHWJD+q9n0ytU1FaZjMrVTojAByPQ
 Y7dP8QRwHp+c5dXYNHzZPssF/R0OkKkSP9XO9K2pO8WOFcqrA+usheXLZQ4Hb/r4lQoD
 4y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xduJVcuAgQuB7bxyjGWP8oKwzv/ArE6QVMLy0HUQ6XM=;
 b=D7ta44JwhOGIQvggQja1Vv8fr3sNuc5YidI3Gh/x5KK/nQimtYfx+M/rjk73UrTni6
 M1XOlxCJQBEVWZD5wB/yF9Rd5SsGj21prmhyjGADGkjvamJgmGKOeX2SHQt4yy0yYq3Q
 CtBdDgf/5iOyl2sBMMyTf+MxMWagUwbon01GBfspMq5Ta6rZ/QKC3M09LbmCSKooBhGw
 vIaTkcYpzyn1UnWzuI7PB7Gv3MEHf+Wg0SZPy8rmPlmI6klyjSpEhZlUSq5ozMEVw7C9
 bMJ71uM5IEQB1AhWwEUCKUZUH7+1SEr4oWXSYpyf9M986gdm8T7lHlFD02Oawp3UnmoW
 rmMA==
X-Gm-Message-State: AO0yUKXrUvoeDQ1BBDEsY2MnCOGmu91AMCdqcziwwf2FrCxt9uUvheb8
 TWOaQJZ4IP8KppDJlR1uEiuouBKHFR+wW98jFYcDVQ==
X-Google-Smtp-Source: AK7set/OIrPFz9AyfEBnv1dIVtVQHz69pK0hIzjNK2UtxQOTTtCRDQPfbRR/YCqmQCrrFfztA7wzO1LECTiwbiDT2lc=
X-Received: by 2002:a17:903:24d:b0:19f:2339:b2ef with SMTP id
 j13-20020a170903024d00b0019f2339b2efmr3267286plh.9.1679074095303; Fri, 17 Mar
 2023 10:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230317141808.826875-1-laurent@vivier.eu>
In-Reply-To: <20230317141808.826875-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:28:04 +0000
Message-ID: <CAFEAcA-J3a8YM_g5uSLPGnVZc4iqpiJpy96yQKufUt1GiMbQzQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Trivial branch for 8.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Fri, 17 Mar 2023 17:28:18 -0000

On Fri, 17 Mar 2023 at 14:19, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 652737c8090eb3792f8b4c4b22ab12d7cc32073f:
>
>   Update version for v8.0.0-rc0 release (2023-03-14 19:25:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-8.0-pull-request
>
> for you to fetch changes up to 364206640c6b34bae3bb9e428817e51d23a794d0:
>
>   docs/sphinx/kerneldoc.py: Honour --enable-werror (2023-03-16 14:39:10 +0100)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20230317
>
> Fix doc
> Fix sh4 cpu log output
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

