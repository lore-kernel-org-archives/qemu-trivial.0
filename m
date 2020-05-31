Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfL2l-0004X3-Rb
	for mharc-qemu-trivial@gnu.org; Sun, 31 May 2020 06:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfL2j-0004Wm-W2
 for qemu-trivial@nongnu.org; Sun, 31 May 2020 06:18:14 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfL2i-0003Za-Bx
 for qemu-trivial@nongnu.org; Sun, 31 May 2020 06:18:13 -0400
Received: by mail-wm1-x341.google.com with SMTP id u13so8010966wml.1
 for <qemu-trivial@nongnu.org>; Sun, 31 May 2020 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6VitTAZO31NvPPlsjIBNuIBVg2qH7etlYXXjt/e8mgQ=;
 b=TYzlqmHiv84y8bpUjv0Ke12DDtKnf4Xvg8OC3xK0dYn88yFuLUe/NvOHL/GSql+fPq
 +Hwq3kpJZy3lK/dgMbHIzCqW5FjGh/KxlA91/QgD6NuMqW7mLX5JdGUl6IhnCDHJWiJp
 6MeKaO1+vVRHEstq0nMqxWJPFCa4uxjI5z0UEMiOGpnHEEKS0Ecr6FMNl9FvHMT23qrJ
 m8w/UrrZ3lI9gHQLrDmdGiw6cBRa0Qud/1a34Wpb7885HFT9sW1D7WSsNZXwZDRcTRth
 nARRbj2mj0S0MVWcHKq5VGc20PgBTZCuhuK0lVPnUrszphtZuOMLHCm57eo7rSvzB5r3
 PlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6VitTAZO31NvPPlsjIBNuIBVg2qH7etlYXXjt/e8mgQ=;
 b=p8oIQqEUxBEATCi0Ow2Hx+ddZlbn5mT+UTrGengcqulkRaxiVMI8SzsCWkFWDsQ7mI
 nXpxufPh1bht0GEbrc4W0Qe4xGkcVtbZgXe1ivRu0MMnGIYvcxl/QvXj8AT1k8NTlqGQ
 gWJzd42XUBeVtVARYTNHWfo+Lh+lmMd0ZdYHM4ZizDZilPW4caKZ++Ek2gL6W1am0o8V
 BaBIIqF5KpkRESQ9iA+t7wt6CP/k8ff16rgh79BPG+4AWJbpIgaBt5oEo5AWNLqIinjO
 o9FLpMC/rmWM0q6z2QJfOWwgIcCTp6qINXexzlpO7KUOsC8vc4t0RfYsb5L7R5r7jeje
 nbjQ==
X-Gm-Message-State: AOAM530VRfR2ExG+OuSOu+vRhfKGPJWt+NpzJVw//zHVvSUtiqbFkYqY
 NkRX3z761ggZsx2bACjIFlY00g==
X-Google-Smtp-Source: ABdhPJzkvgHbHJQFB0Vl9pkW/Iow3gjSEDxxH4fOhnneQefphexvAd84zisQveMIWr0xT/Y+QYFMEg==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr17552813wmb.6.1590920290135;
 Sun, 31 May 2020 03:18:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f71sm2667547wmf.22.2020.05.31.03.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 03:18:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04E951FF7E;
 Sun, 31 May 2020 11:18:08 +0100 (BST)
References: <20200530092306.26628-1-f4bug@amsat.org>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Fam Zheng
 <fam@euphon.net>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>
Subject: Re: [PATCH 0/5] hw/sh4: current patch queue
In-reply-to: <20200530092306.26628-1-f4bug@amsat.org>
Date: Sun, 31 May 2020 11:18:07 +0100
Message-ID: <87eer0v25c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 31 May 2020 10:18:14 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi,
>
> As there is no SH4 active maintainer, I gathered various
> patches in a single series, in case someone is willing to
> apply them.

I'm sure you you could put yourself down as an "Odd Fixes" maintainer
and put together a PR if you want?

>
> CI report:
> https://travis-ci.org/github/philmd/qemu/builds/692828388
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/sh4: Use MemoryRegion typedef
>   hw/sh4: Extract timer definitions to 'hw/timer/tmu012.h'
>   hw/timer/sh_timer: Remove unused 'qemu/timer.h' include
>
> Thomas Huth (2):
>   tests/acceptance: Add boot tests for sh4 QEMU advent calendar image
>   .travis.yml: Test SH4 QEMU advent calendar image
>
>  include/hw/sh4/sh.h                    | 12 +-----------
>  include/hw/timer/tmu012.h              | 23 +++++++++++++++++++++++
>  hw/sh4/sh7750.c                        |  1 +
>  hw/timer/sh_timer.c                    |  3 ++-
>  .travis.yml                            |  2 +-
>  tests/acceptance/boot_linux_console.py | 13 +++++++++++--
>  6 files changed, 39 insertions(+), 15 deletions(-)
>  create mode 100644 include/hw/timer/tmu012.h


--=20
Alex Benn=C3=A9e

