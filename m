Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jycYR-0001H3-S9
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2020 10:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jycYQ-0001FP-91
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 10:50:38 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jycYO-0002OR-Ow
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 10:50:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id n24so4499855otr.13
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2020 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bMnIuZPptYQiztMQXabHxRzipBBZmadG3HFxkMkcIw=;
 b=cX+CmUFGBCJnsUGaQUBtQahEChSH7cYFh2BskdmIedVIvjiQ7kEbVKMbEnCf4q74w8
 /XX8ZpxpDbCJUAlLFVOO6GpYVUfiy9Eki2ACiwEqmD+SS3bFxx5ZmGt0RrG6Hltudve3
 aIf1a81kCyonGG9kS4XeIzOsO69d8xrG+fDQx2Gx0xFyte0NKC3WpfqD0AAoR2eAMeT2
 j7IbzfPpJ5IK+TAJhGy/eRYwcMyPHzobPIaFKtc2V1ccCoKEiPeelUon/TQPY5Pmwt9S
 REp90bHail1XPoe7ZEwG+Uf1aH5/X1rYzmWWLaDIrgxvwV54Glu4ypHK9b8eeHacf36c
 ojRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bMnIuZPptYQiztMQXabHxRzipBBZmadG3HFxkMkcIw=;
 b=CBijAlW9duBYquXy40DZ5/NLnmfN50O4bhDnN77SonBOu5Gmorcv6E8CQHkOv5ODwv
 6XbUF7mAETmiAPZzNGdw/fN2ryAvLKRBi9KfWrUgIOwrSYt1dbbiH43u4knF/g9aRidx
 7B/xlg72yAvAENDEfdHsLxHOVpPKVbs5smhAHv5+54KuqSd9noLeMWIztFO9yoWsBRM4
 bjEUJ+f2WRobu2CJJtCkW1c5eFX9qOnH/2mvOAeBwX4b9TuHABJ/phlss2JBQGqhV09W
 5lnipDaEGbDcGFVPN7vZPfy3aDNru1hEz8gAxjGVlx8+S6R1o4cFpI+eHiaomV9FqFGc
 PoSQ==
X-Gm-Message-State: AOAM531y3tJagUXB9IDoAtC+7CTg0dPeTeZ0zpoWO7IGxNYGcZDLQji5
 aoXO6c/JGXwe67LInXpNthPsjygXtvvI/LyFOpE4cw==
X-Google-Smtp-Source: ABdhPJw7Yi0RKrE+cNrgC47sKQdszkcG+f7lJ49kH+pD0zr3kezAdOykiQntMArjTanHVeLfD9gCRC78TsMBoJ6H4SU=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr4444561ota.91.1595515835450; 
 Thu, 23 Jul 2020 07:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200723132219.2956-1-thuth@redhat.com>
In-Reply-To: <20200723132219.2956-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jul 2020 15:50:24 +0100
Message-ID: <CAFEAcA8=38rqyH==tVeCMz2-MUdJWSSTcS79EAHCBGMuBgarhA@mail.gmail.com>
Subject: Re: [PATCH] target/unicore32: Remove CURSES stuff from the
 Makefile.objs
To: Thomas Huth <thuth@redhat.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2020 14:50:38 -0000

On Thu, 23 Jul 2020 at 14:23, Thomas Huth <thuth@redhat.com> wrote:
>
> The dependency on curses has been removed in commit c7a856b42e403e2b
> ("target/unicore32: Prefer qemu_semihosting_log_out() over curses").
> So we can remove the related lines in the Makefile now, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Another, unrelated, CONFIG_CURSES oddity:
hw/input/virtio-input-hid.c has an "#undef CONFIG_CURSES"
before it includes ui/console.h. But that header file
doesn't do anything different if CONFIG_CURSES is defined,
so I think the undef is now useless and can be removed.

thanks
-- PMM

