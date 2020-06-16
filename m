Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jl7hR-0000RP-Ml
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2020 05:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl7hP-0000Pt-BA
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 05:16:07 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl7hN-0005DL-Is
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 05:16:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id t6so15377516otk.9
 for <qemu-trivial@nongnu.org>; Tue, 16 Jun 2020 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZPMf8RR8JuwRmnqCoyl18LA5rP4v6lj0UyBV+pUOOw=;
 b=XtDOFccHOndnKmlboi5cwKXntuQeUKYOU8T5tEfwNAe9v3IZtrR/20iB1QD40MK3CF
 ai4ggrkCSoq5olubP9YTDpi3X8LVPTIyHHsg9SVa01qC72uzeZ0o5YQ/k3B3Mbk08Ji4
 jHL5vI2sf9ilHuZUESklXj6vrLpLH0lRkP/qh1L3oUL0zyuePTt6kJ/01tqahhM1i0wL
 ek71mIPf6FlNBYYMU1lqzqzpApu5W/NURNsfBm8FGEOg2g99lsnHzflt9bwqjCTY5Ifa
 L1VrN92IK6dxr3ieA6f8zVTd/+leZI+NmgTGLZeOm13DNo5wr5/1FMCg57XwViYoQ82F
 7c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZPMf8RR8JuwRmnqCoyl18LA5rP4v6lj0UyBV+pUOOw=;
 b=tlcPii2i6nZNKn4eEfXchWRDZ7buDycwDQjqA23KZOsiitDibbi49NLHxxDe1AQqVo
 vYyqnjHu5Tt6bem9Ue52ndlh3/f60a5JiZlnpJ5K8kssb9/gwQWeUfh8le2079KVQLEk
 jOhwUeUSGpRQHehNh1GOSctDtoDwUyZIUKf1l87TifUzB9kLuWP1Df7T7K+wi/sOk8Yl
 PD3GTKJ5YYBBIqarD7WLVFjP2xu7rOobJRgPN+qcLcD+KfrMZsKcOCy1egZ0Tor9N9pW
 WV7o50Eiwbwbc+Tz/Qhf5TzKziuKNUPt4bRrQKQvzO749oP/NoF+lpT8mx1CtbcjMLSa
 mhjw==
X-Gm-Message-State: AOAM533rdhtMjZVgvAUvlRUJfLbGweCQPoNya9wFx2Oz40KHfywpdRt6
 cxOJI729wbhDPuYMBEGzmPJd9JB1Ei8sS0ANTXv2bg==
X-Google-Smtp-Source: ABdhPJwa9Kx20/cGAqx6+IsXynN+ASoshQK1szCh5uDl3CYP7aOo/pSlNfcPTOcXjvWeDb9SXu1/idvu5h36LNOKDTQ=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr1630762oto.91.1592298963711; 
 Tue, 16 Jun 2020 02:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqyzW=ah4Q=OCE9KP6DYpiQN18oQpVWjqFCvzQfH3MvQFA@mail.gmail.com>
 <CAFEAcA_e_0rFWGU2VtN3270sUhssHwe0eEgqb-U2Qq-HQKGLWA@mail.gmail.com>
 <CA+XhMqwe5ro+hw9=rVHuXb+7PhbCuU6jEOi=UOJzXu44E1Q8Cw@mail.gmail.com>
In-Reply-To: <CA+XhMqwe5ro+hw9=rVHuXb+7PhbCuU6jEOi=UOJzXu44E1Q8Cw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 10:15:52 +0100
Message-ID: <CAFEAcA82aXcvLGhEd0uRVLkroBjqS+4bEo-BXj7R6s+TN38chA@mail.gmail.com>
Subject: Re: [PATCH v3] util/oslib-posix: : qemu_init_exec_dir implementation
 for Mac
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 16 Jun 2020 09:16:07 -0000

On Mon, 15 Jun 2020 at 20:14, David CARLIER <devnexen@gmail.com> wrote:
>
> With this basic program
>
> #include <mach-o/dyld.h>
> #include <stdio.h>
>
> int main(void)
> {
> char buf[4096];
> uint32_t bufsize = sizeof(buf);
> _NSGetExecutablePath(buf, &bufsize);
> printf("%s\n", buf);
> return 0;
> }
>
> I get
>
> Davids-MacBook-Pro-2:Contribs dcarlier$ ./a.out
> /Users/dcarlier/Contribs/./a.out

Hmm. I think we should run that through realpath() just
to get rid of the /./ in that. This is similar to how
Chromium uses it (though it uses a different API for
doing the absolutifying):
https://chromium.googlesource.com/chromium/src/base/+/master/base_paths_mac.mm#41

Thanks for the test program, I used it a minor variation of
it to confirm that this does do the right thing even when
argv[0] has been passed as a different string:

$ (exec -a foo /tmp/zz9)
_NSGetExecutablePath: /tmp/zz9
argv[0]: foo

So _NSGetExecutablePath() is definitely the thing to use here.

> The cast was to avoid possible warning with pedantic compile flags if used.

We don't compile with -pedantic, so you don't need to guard
against using it.

thanks
-- PMM

