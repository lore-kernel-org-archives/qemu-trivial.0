Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVaJE-0003cf-UG
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 08:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaJD-0003Zs-UW
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 08:34:55 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaJD-0001fY-1i
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 08:34:55 -0400
Received: by mail-oi1-x244.google.com with SMTP id x10so6472555oie.1
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5VZHewKhQppRcarv8cNfP1eJNWRWWRTgbVobzrECKM=;
 b=cCEOL2B24QQ7jdP3TaOfVE2Jh070NfhWjXKLYi7owI2fU0VRoT4sJMAtcHUF72pvO0
 EDaXnMFZOLM35e4h+o40COqnQQQd102COFi2RFWNMWPdVJ+2sv9XP8sFVfmlhjiVpe7m
 JkLC28Y+ym7K+V3X+vLOtVvq4DP+Z801fCP0WD+9kXQKOzdw30XKXxgJgXjgggVX9e99
 vA8cSsRvnbbXfrW+O0GC2uJ1tpJCDr28kCYStrPkmqMmenDaNhDTBlktOKjyfhXRxCm3
 2KIrzLUrEGqc2Il0X4S2fKOwoWV8y68c1mihYTlNPffJYaCpO2YRJmmZSkdFIRPOcthA
 bqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5VZHewKhQppRcarv8cNfP1eJNWRWWRTgbVobzrECKM=;
 b=e/2dfl/ArGfVo/kRjQxDpfsJSmob5eE6DOkKUg/2UFFxO2tY0x9f9oGRUAyw+PXSgn
 H3kwKRG2a8DRp61CY79abC40Wz/H5YBe9J7vO5ww4+BQy+cons/DSWfcB5i84Ksg250u
 mDf6rJyfz+2KCGFXIk1GAp7qUNDov30HAPi25ZcqlbFGXlrQDDQnVdyL27QZWT4jBby/
 sPWHzcT+2gYzDWYdjAVHO8CulAEfdLivo/3l1wLrQxS8CdHNW9LQm8akfezxQFQzm1rx
 wzNhMBEph3fHtb9GsZ0vz24qIMhB/EpaC91wT4yvIopeFReaZV28e2Wp3s134jCUhgmn
 z2pg==
X-Gm-Message-State: AGi0PubHUx3PzDMsEGDEnLHfPhwYtE0rF9c0ycJRu/7uhnww2Lqwd/mB
 cpiff3DXnuAQOJy0ylpNCXlBdCZbtJaUl1uR48mjmQ==
X-Google-Smtp-Source: APiQypL6uraSh/axNnt0mFx7rdBmhL62klhxvsP61G01yCoMv4KIRddxsma72tP0s0XMLq7Fk877P8iSCl6yNoWwO68=
X-Received: by 2002:aca:895:: with SMTP id 143mr8641615oii.163.1588595693801; 
 Mon, 04 May 2020 05:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200504115758.283914-1-laurent@vivier.eu>
 <CAFEAcA_FDt+1+ezAyRE-fwdd=VuG5YNThkKiHHTUOYqtRHLoyg@mail.gmail.com>
In-Reply-To: <CAFEAcA_FDt+1+ezAyRE-fwdd=VuG5YNThkKiHHTUOYqtRHLoyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 13:34:42 +0100
Message-ID: <CAFEAcA-V=ZF8rLv82fmj=3NgHcUNvCs_Ddm5k9FnfssgDr8c_w@mail.gmail.com>
Subject: Re: [PULL 00/20] Trivial branch for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
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
X-List-Received-Date: Mon, 04 May 2020 12:34:56 -0000

On Mon, 4 May 2020 at 13:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 4 May 2020 at 13:05, Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > The following changes since commit 2ef486e76d64436be90f7359a3071fb2a56ce835:
> >
> >   Merge remote-tracking branch 'remotes/marcel/tags/rdma-pull-request' into s=
> > taging (2020-05-03 14:12:56 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.1-pull-request
> >
> > for you to fetch changes up to 4341a0106781043a708c061b676312e5bb5d4488:
> >
> >   hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning (202=
> > 0-05-04 12:06:21 +0200)
> >
> > ----------------------------------------------------------------
> > trivial patches (20200504)
> >
> > Silent static analyzer warning
> > Remove dead assignments
> > Support -chardev serial on macOS
> > Update MAINTAINERS
> > Some cosmetic changes
>
>
> Compile failure, OSX:
> /Users/pm215/src/qemu-for-merges/block/file-posix.c:1620:9: error:
> unused variable 'ret' [-Werror,-Wunused-variable]
>     int ret;
>         ^
>

This one also shows up on FreeBSD and OpenBSD (and maybe NetBSD, that
result hasn't come back yet).

thanks
-- PMM

