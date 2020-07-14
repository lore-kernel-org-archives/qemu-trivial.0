Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvRvA-00015r-Ui
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 16:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jvRv9-00015K-MH
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 16:52:59 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jvRv8-0003E0-0Q
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 16:52:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id y22so51775oie.8
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h3OqVDua9rI0LQfK4/qcIuTZ9e9E4RGmXdKfFSMaRcE=;
 b=YsRPp4iDG3rI8ta+MSGKFVeANfDSBRdJnHSwWjUkF3kBKraLwX4yj7up26UiPFGnTm
 j8f/SC8AZfj3dbiraryqNfu3NcyYhg3ABDRCfcQv2YPR65GlRAAIBcRyYw1UKaiNwLKv
 ORNxruNnBZJcXvnjrr4tk1oGLFVfmXTPWt5MjFHeAvBnIWLcCow/v9dcBOfjcUVvs/mo
 NT8Yx/ssygrAUWWBnPd1WqsoFnn64GAXqYj3O/k+E254cm6e4BCTYGfDz09gCdf17+2U
 axczQfmnFm6iKB7i4tNmadr3tNsZCkRZk0fEaY7F9DissR3MPxILEJXryCzhMbtK8EeC
 Xa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3OqVDua9rI0LQfK4/qcIuTZ9e9E4RGmXdKfFSMaRcE=;
 b=CgFrwW4A0ZPQkU2M9cyIpkmBTQ+Ye2WodJJfeK0yqzI+3ZSRCTjWUJ9bGhJrDaBOS6
 uF8VIOI3XYJ0FLgMX+/cBd+BkVu4EqZ1evrHJHWL+MinyQ1zBf7snOjffwVW6CI1lNxr
 yDUlrW6QgwqFf2atOw8VK719pbU5Uwrcyp0wHVbMNBdbxuTAtsZba/wKyA6My0iqczO9
 gxI1EX7rpF6OgZ97vDdy6Qm5oX4bq36GCcgxzyg0WCQ0Vu2xR+/zy/ycq0u9ZOKIVtzL
 Es9tPaXKEuCHFIu4bTns5erYnsa9gaaOifn3Q9xy8pD12wdLyfuVSAMIfCwx8hPt0r0X
 nrLg==
X-Gm-Message-State: AOAM530fQK0L8HEkoa12eumwFA0lwvd2Qrquc/QGQP+SdaKxLXL+uomd
 mPsiNE80B8vgg6ZmqVSFCvReoYndX923vOweX0sR6w==
X-Google-Smtp-Source: ABdhPJx6m0pGpSdKNwnQbtxIPVY1bDCRv8ueQzCzcTGzFdATp8wJF1ai0eBt70k11MUoy4sCWL+ud2Dtar/iODQxhMc=
X-Received: by 2002:aca:1706:: with SMTP id j6mr5049615oii.146.1594759976512; 
 Tue, 14 Jul 2020 13:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqwMKk1eCNg-T15KRAa_e1-r0cmZ49f-135sppTFWpTerQ@mail.gmail.com>
In-Reply-To: <CA+XhMqwMKk1eCNg-T15KRAa_e1-r0cmZ49f-135sppTFWpTerQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 21:52:45 +0100
Message-ID: <CAFEAcA-N2BnE25+kXCmZV_KBJk6H3=De7eV0B-d+Qrjd=t5hzQ@mail.gmail.com>
Subject: Re: [PATCH v1] util: OpenBSD build fix
To: David CARLIER <devnexen@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
X-List-Received-Date: Tue, 14 Jul 2020 20:52:59 -0000

On Tue, 14 Jul 2020 at 20:45, David CARLIER <devnexen@gmail.com> wrote:
>
> From e2103b86b031ab74ff4c8dd0a3944cb488c9333e Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Tue, 14 Jul 2020 21:34:59 +0100
> Subject: [PATCH] util: OpenBSD build fix.
>
> thread id implementation, using getthrid syscall.
> qemu_exec_dir implementation as beast as we can as
> path is not always possible to resolve this on this platform.

Hi; thanks for the patch.

These look like two separate changes, so they should be
in separate patches, please.

It would be useful to have a comment in the code documenting
what the limitations of the OpenBSD call are, and when
it's better than just using realpath() on the argv[0]
that we already have. (ie, in which cases is the argv[0]
which we get back via KERN_PROC_ARGV something other than
the argv[0] that was passed to the process?)

> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/oslib-posix.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 72907d4d7f..4a0cce15b4 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -56,6 +56,10 @@
>  #include <lwp.h>
>  #endif
>
> +#ifdef __OpenBSD__
> +#include <sys/sysctl.h>
> +#endif
> +
>  #ifdef __APPLE__
>  #include <mach-o/dyld.h>
>  #endif
> @@ -100,6 +104,8 @@ int qemu_get_thread_id(void)
>      return (int)tid;
>  #elif defined(__NetBSD__)
>      return _lwp_self();
> +#elif defined(__OpenBSD__)
> +    return getthrid();
>  #else
>      return getpid();
>  #endif
> @@ -408,6 +414,23 @@ void qemu_init_exec_dir(const char *argv0)
>              }
>          }
>      }
> +#elif defined(__OpenBSD__)
> +    {
> +
> +        char **args;
> +        size_t len;
> +        int mib[4] = {CTL_KERN, KERN_PROC_ARGS, getpid(), KERN_PROC_ARGV};
> +
> +        *buf = 0;
> +        if (!sysctl(mib, ARRAY_SIZE(mib), NULL, &len, NULL, 0)) {
> +            args = malloc(len);

If you want to use malloc() you need to check the return value.
But better to use g_malloc(), which can't return a failure value.

> +            if (!sysctl(mib, ARRAY_SIZE(mib), args, &len, NULL, 0)) {
> +                p = realpath(*args, buf);
> +            }
> +
> +            free(args);
> +        }
> +    }
>  #endif
>      /* If we don't have any way of figuring out the actual executable
>         location then try argv[0].  */
> --

thanks
-- PMM

