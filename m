Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIa6v-000313-Ed
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2023 13:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIa6t-0002xz-LM
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 13:58:03 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIa6s-0007Sl-4i
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 13:58:03 -0500
Received: by mail-pg1-x52e.google.com with SMTP id d10so2267471pgm.13
 for <qemu-trivial@nongnu.org>; Thu, 19 Jan 2023 10:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5WrPnkELUeVGgkCXZoy8sDE5IkOPwyOA95XpqkAtxWc=;
 b=n9Qjny4kTtVi38K9i6aYsZcC7p7V3ecO2rvC+WXky0ogVhEKGl9qjHU2maRKxw94p2
 oqL+8SHwbqlFLCrdsqmchFKARtBo9pYNqtanrZNE7VynUfjvITFHX1+VfG9oNDKR6Fy6
 WpoQcNovRth4LARueIX2MBLrSARvrPbqrX+vlWa6JVwCv+GBTKa17eXzPGGT9cRrDOND
 nZgiSEzYKaroiOOjAkQETqZc7cCWYaBaAajscN/Z4e+xcwGB+OosjEUm7fMbPIrzhE/P
 FFYlOeipsmi0HuVoNxAr1qvm7RbYq/+e98TUwHAp46kjyubHyWjL+a7G0MahYcz+wlYz
 o49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5WrPnkELUeVGgkCXZoy8sDE5IkOPwyOA95XpqkAtxWc=;
 b=wsgd+5uUj+OFGiydZHTS3nAmUW6SsLrpOVRMA+5DylruqliHYG+zYFxlWI3TyvXJn8
 G0AOVR2N+B1eR67HE/8WryqzSN5PKSSuwc21Ndxwp8ch5IpOcZdfWFFL9SsLsEZtGIoo
 nvUvq9rsWo2hESM+pIt/GEOyoWulE97zjgztw5Em2Q3EUNktETwEFzb2rdCAlHvvuIkf
 pX8li+0EtOESshT/uO0Q7pC1L4KhVjD7TPk9+Udh1YBZWVoec535TWOCDtCelyZ31DBv
 ZaCzrM/Fh77XzobUeKpb2zqFMuAQktSW4y6Kiy0wZ8Qn4yb64WSZU79Nh6zP59X4jpkR
 EABw==
X-Gm-Message-State: AFqh2kreTGzSgMJOW5/PJHgTSWMcFub7GR69x3WlyksE92i6Ajj3Wj2z
 WJDszBfDTFP9idtkoDrfVsqrhwI7TslqZ+5eoPU6lA==
X-Google-Smtp-Source: AMrXdXspICNS9hjtYplFwec/lPVlyFQGA7Zwl3bQatgNnhrh+nHFeL821l/j5XBVC3wV2ioMC1zBdYSgGR2c7gu4bAI=
X-Received: by 2002:a63:844:0:b0:4ac:ee3f:a6ea with SMTP id
 65-20020a630844000000b004acee3fa6eamr1055824pgi.302.1674154680639; Thu, 19
 Jan 2023 10:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20230118075234.2322131-1-laurent@vivier.eu>
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 18:57:49 +0000
Message-ID: <CAFEAcA-CbK3zpwt4jGHtv00=o9obdf0fuJFG9pkM4wNL4JeruQ@mail.gmail.com>
Subject: Re: [PULL 00/15] Trivial branch for 8.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 18:58:03 -0000

On Wed, 18 Jan 2023 at 07:56, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit a8d6abe1292e1db1ad9be5b2b124b9c01bcda094:
>
>   Merge tag 'mips-20230113' of https://github.com/philmd/qemu into staging (2023-01-16 11:24:11 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-8.0-pull-request
>
> for you to fetch changes up to b93b3cb1bb72f313d8c33791e0a82a25da780cf0:
>
>   hw/ssi/sifive_spi.c: spelling: reigster (2023-01-17 10:02:37 +0100)
>
> ----------------------------------------------------------------
> trivial branch pull request 20230118
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

