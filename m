Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF56F46446
	for <qemu-trivial@archiver.kernel.org>; Mon, 16 Mar 2026 10:16:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w24zd-0002Qr-Ou; Mon, 16 Mar 2026 06:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w24zb-0002OR-VB
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2026 06:16:12 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w24za-0004mz-56
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2026 06:16:11 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-649278a69c5so3748860d50.3
 for <qemu-trivial@nongnu.org>; Mon, 16 Mar 2026 03:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773656168; cv=none;
 d=google.com; s=arc-20240605;
 b=flqdSemXVwi4DTQV6D78rautQfeggQFcajz/c/0frKfT8TrfxImaQ0sgecXLYqMd7z
 rw/23b053tukRUey9ssFAK6Vxut8a/YaHZA+0puKsym5zXvTWcTLRCeIU5VVm7NejAZw
 l27LJa0Q8i6og0bkgssl4PJ9yi8k8hZ+WgB+ZgGFEZTdAUBZI5hAWrDE1hUAvbljXnH9
 f+3d6NZtBgghD+29Gye0HLnxXODx5j/iJkX1bc+emsXquHyZwEQmOUcjpNWvPiyzFY+7
 fOBhJpg6KK8RqWk5Xu/adK7gYBn5ZItyXkuJpxXSnZy0vDjX+eL24nbhffF5uOvql4jV
 ugJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KBtTHbchl8BVnt+wihrT4O66oryNkHN5cfbIdwz+1DI=;
 fh=omWRq+K/EB9vJYqDsYvUs2dNAapeMuUWs2gv1yy/mmI=;
 b=X7HIJZFIdD9p6vamjNb5yCiwzdV/+2BLxDE97Qf8vuwmsaou5Xj2dZw6OrEZxCed0Q
 i0biDz1VYp0VzQCNV2RLPp5X1nMmo9VWWLT8QEOqF0t5e2SrX4mq7s0msB6QauFzy0T1
 bacESuS1+QORW2OQ3xlmrbxM4vb9grhzWNjUR2Tg7Tdec2rbAo28ehke9kC3tDiFLpzS
 i9mZPoNECn+sDN8I/tRP19JRL8uRlpMTN+9SkNaaCwNFDvgViEQMi0ihLM1gFXTQUvsf
 ksW4oG8npBDYBLMbgjAAumJJ5BEhq5+Jacmpy+Bi02+vCxvO/MADdEnWAlvf6A9D0KH6
 T8Sw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773656168; x=1774260968; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBtTHbchl8BVnt+wihrT4O66oryNkHN5cfbIdwz+1DI=;
 b=wSKufxc/7d+jJntx6cdGBRz/eVww6cAOELrF2Uy/oFowu8Pw7oBRdypAo7N1xhKKLJ
 /xed4VRpvN84gS/W8+qxuXH5w9b8RSj/et7bo+ICLRU8Wh0BIymmxu7cIhD6MMGBzE3l
 HD1nsdh7zuLW9aJ5/6jnViNCSKAx+PokRsEa9ChzAg8G0vNidfudK0bl5K7R3B/M6JfB
 mQg3KqSK1IMJ+EvIlpqUNcOpGonErgwZv5zh3hsEs+W+gjbFCj75vT30ITKIfJhhmZN9
 6UFYFft+zVbhO4Un2Z6mIIroLj+ePorNPkLNPKRW3LeizeOLAMCIkX5Hk7qOy0tpiGSr
 C2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773656168; x=1774260968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KBtTHbchl8BVnt+wihrT4O66oryNkHN5cfbIdwz+1DI=;
 b=P2rXsXJfLgiFHUeciuJTiHUlvT+pjqvXYZA67lmQFq2/VEbBn/KJ7L0xscbLq6KN/b
 clPqVGqtwm98TD3i7s+2iXeaaf/h/NWDWwEZwBUgNb5vMhZ9ahoNUgkcu4stDrcll7z+
 96j7ufaGvTriZh+z6qofzg24u71wnIvY3kO03KDbMm925X1mBfB+pXKAXanhTlY2L0pU
 OtAOIbnWFRQiUHapQNq4r1PaC/2dUKG3Tubuz5wfVphQ4wZ3DnABFGJsNAJv/tWxqxk/
 7GBtGkQppUfVlaM2KcnxSE1c6W7vF57Azh3Eb+dVvOzxJAJpOn7xBX6C1ZZijZvq5Bv1
 ITQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnbY5emMVW2OzIAwvkJa6P0WYpZB50ZmrizKqmFr0MLMQ64VgyK8U21hfSkbjdPBhhuyqfhJncDc5gmyg=@nongnu.org
X-Gm-Message-State: AOJu0YzF+VrMcprc+veVSLhEYTq1juZOduiYCWqQFDOPtVT63GB5GQHE
 lrWFFEI2At4fOto4KD/CnJbP6XGQtbPBy72ytCU5Y/pCBkTWKb3TYY7JgUwaNka56gyjUH8vHeM
 K7xwm9lGWAQdVi7nCQ+AbBmq327ahROBMrbQutMmrRhxJZmqAb+KN3/w=
X-Gm-Gg: ATEYQzwobYLBJSOju5t2QF87AbSaKp7k4vZM2755Bwoi4PqZNPIQyTkbzvk0oscccHn
 v5kDhCDauhcsH+2heMYJOezkjKP5cXPdYopxzuCUsxWeFIDNNbsTihfVSjdg10rX+sUD99LdlLt
 X2YwsNDhV+RJ5ruzE35jRvDHQbHcaFYu0gteqMddGTcxsVSWikjiAe3aiiwKJQe9oHnvFyA8AYU
 fzQYU8+9B0wo8dLoyvy7R3wmkfBFMPDUyM6Lra1Afag/lf0thCnsIBDfEqcAiZ6pbnMM41CSj8f
 8PCK4VQbURKrJaSX/DC2RtyQBE93wUIj1pddjtX1o5tQskd+1jeRQB6RYFvlUOmGpDU=
X-Received: by 2002:a05:690e:4146:b0:64e:7240:ce24 with SMTP id
 956f58d0204a3-64e7240d1fcmr7377286d50.26.1773656168470; Mon, 16 Mar 2026
 03:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260316071005.91624-1-mjt@tls.msk.ru>
In-Reply-To: <20260316071005.91624-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2026 10:15:57 +0000
X-Gm-Features: AaiRm51EYjcbh8Ypj0jkLdAARfWfwrxt6IftmH6jT_z2Yz0PLQusxdmfQXjyGog
Message-ID: <CAFEAcA8+9Cxs7k2TyzxEx31GzWoAP8TN90=DEtVLUpvdevYdtw@mail.gmail.com>
Subject: Re: [PULL 00/14] Trivial patches for 2026-03-16
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Mon, 16 Mar 2026 at 07:10, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit fff352b9b6080e580aa1fadd29b4eccf4cb292=
2a:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2026-03-12 15:21:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 4ba98cfd263ba3e657b9d18c90bc5a4f2dcb0c63:
>
>   rename CONFIG_EPOLL_CREATE1 to CONFIG_EPOLL, and stop checking for epol=
l in meson.build (2026-03-16 10:05:25 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2026-03-16
>
> a few patches accumulated in trivial-patches tree to date.
> A larger part of it is my linux-user cleanup series.
>
> ----------------------------------------------------------------

Hi; this fails to build on some configs, eg:

https://gitlab.com/qemu-project/qemu/-/jobs/13506360670

../net/slirp.c:72:12: error: =E2=80=98get_last_str_sep=E2=80=99 defined but=
 not used
[-Werror=3Dunused-function]
   72 | static int get_last_str_sep(char *buf, int buf_size, const
char **pp, int sep)
      |            ^~~~~~~~~~~~~~~~

Looks like one of the patches defines the function unconditionally
but puts the only callsite inside an ifdef, so if the config
means we don't compile the code that calls it then the compiler
complains about the unused function.

thanks
-- PMM

