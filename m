Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlGNz-0006Io-RK
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2020 14:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlGNy-0006Ie-K2
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 14:32:38 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlGNw-00069v-RM
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 14:32:38 -0400
Received: by mail-oi1-x244.google.com with SMTP id p70so20115764oic.12
 for <qemu-trivial@nongnu.org>; Tue, 16 Jun 2020 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzYyUbnYXAeNe9Bej6UR4BBIi1PkOJ2G7dYBf27O9Gs=;
 b=Fas/Qeq8YhBamSEKgJBSeCrFQwyECQM9FM4uHd1q+yXlMAE7uRxahzf+t1zr8IZ50l
 KinlDkCCwNRy2ygF3AfP8v1AfREhdg3EqfZQbSAEYF1HMDHEZNTJMeET/adkpxISgJWw
 1QuzgsFeWow58OPstP2MSotYm0nwFLvGvaSCliyMb+q/D8xGQYNXkV6UIfraZOVMRsbO
 OvpINem6CI8Jb9D3uSbL/wv7j9bSC0vOsuiiXwLawQuw5CnIjZBr/BSNiY/SPUA5Twzt
 IAnOM2Y+ZsY2+50MPKl5keXB9hNQspqZ46VGNDAB7BwPZ5XOe6XMbABo/sir+4LeKeJJ
 SNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzYyUbnYXAeNe9Bej6UR4BBIi1PkOJ2G7dYBf27O9Gs=;
 b=Xt6lpcGiZ/0rQ56/gWfX9Bjz7todAGB8rNfTGkLgiKVt6uOnw5AqsfaKoFcQT/GQXu
 d4OgKEvuOs3V75WonHjQHJmvMuRoUFbkmSfS84lQAqzq41umgobE5If8EPfK34xXfk6P
 cOj0rWRHrYwpx7FAkBQ29Vg0o1OBqE4pDPsEvE7WEuRB5xnCVTNkNwQAcjdrI528awes
 hAPHH0loHsXdcpKDhu/v+u5cgAszNnPiFLvw3g1eK/CkAvePPqYn0ijokk55NrlhfvRe
 AhoZM9G60VMlOM1XFAbd1J1njgSG+s+py62q2VJ++FSxdoS/X8sEjQ3wgjT7GV8qWqcc
 tKCg==
X-Gm-Message-State: AOAM531ZeQ02OBIG+wIHxSLctSevOs+6h/gs1MZyjbV3sI61Fv3+iemS
 RMIR90WgwHiiscHsRy5fqic90RptnpdjkNC1TEqHwQ==
X-Google-Smtp-Source: ABdhPJxuvMrHRPwKqZbqN5gyYgmCOa4l97FZyIlTypHJt0xxr1unY6V30B7hA0Q6iweKUYOPaInmrXUZAsFmMeJkoxE=
X-Received: by 2002:aca:568c:: with SMTP id k134mr4249179oib.48.1592332355418; 
 Tue, 16 Jun 2020 11:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqx6VjRhT6xBzJ-UYs7cPDXVK=PNdfNVdad3Tqhe43P=Ew@mail.gmail.com>
In-Reply-To: <CA+XhMqx6VjRhT6xBzJ-UYs7cPDXVK=PNdfNVdad3Tqhe43P=Ew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 19:32:24 +0100
Message-ID: <CAFEAcA_NjB4m6mg-cbH5WrLukSnMx4aZ=bpqoMHB1KLVV87iLg@mail.gmail.com>
Subject: Re: [PATCH V4] util/oslib-posix : qemu_init_exec_dir implementation
 for Mac
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 16 Jun 2020 18:32:38 -0000

On Tue, 16 Jun 2020 at 17:12, David CARLIER <devnexen@gmail.com> wrote:
>
> From 7eef8b803cdb0e7148fdf894d2992052695c1ff8 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Tue, 26 May 2020 21:35:27 +0100
> Subject: [PATCH] util/oslib-posix : qemu_init_exec_dir implementation for Mac
>
> Using dyld API to get the full path of the current process.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/oslib-posix.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 916f1be224..3612c2c80e 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -57,6 +57,10 @@
>  #include <lwp.h>
>  #endif
>
> +#ifdef __APPLE__
> +#include <mach-o/dyld.h>
> +#endif
> +
>  #include "qemu/mmap-alloc.h"
>
>  #ifdef CONFIG_DEBUG_STACK_USAGE
> @@ -375,6 +379,16 @@ void qemu_init_exec_dir(const char *argv0)
>              p = buf;
>          }
>      }
> +#elif defined(__APPLE__)
> +    {
> +        uint32_t len = sizeof(buf);
> +        if (_NSGetExecutablePath(buf, &len) == 0) {
> +     char fpath[PATH_MAX];

(Something seems to have gone wrong with the indentation here;
QEMU indent is always-spaces, 4-spaces-per-indent.)

> +            buf[len - 1] = 0;

_NSGetExecutablePath() will 0-terminate the string, so
you don't need to write this 0 here. (The function call
will fail if the buffer is not long enough for both the
path string and the terminating NUL character.)

> +      realpath(buf, fpath);

You need to check the return value from realpath() in
case it returns an error; compare the code just below
that handles calling realpath() on argv0.

> +            p = fpath;

This is setting p to a pointer to a buffer which goes
out of scope, and then using it after it's out of scope,
which is undefined behaviour. You can avoid that by
doing _NSGetExecutablePath() into the tightly-scoped
'fpath[]', and then doing realpath() into 'buf[]'
(which is still live to the end of the function).

> +        }
> +    }
>  #endif
>      /* If we don't have any way of figuring out the actual executable
>         location then try argv[0].  */

thanks
-- PMM

