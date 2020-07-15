Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvv0R-0002Zz-KE
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jul 2020 23:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1jvpb1-00072a-9T
 for qemu-trivial@nongnu.org; Wed, 15 Jul 2020 18:09:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36354
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1jvpaz-0004yp-L0
 for qemu-trivial@nongnu.org; Wed, 15 Jul 2020 18:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594850985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lDzg2tnLJ9OZ/Fxw8x+tGLZweJbgIrUzMUexvb9Pnc=;
 b=ITHZU9wvpgNlZA8Ptr42e9FQDLhaMWGxpdfix9/tNP2V9HK8p0yJjXEP7+r8igcRLqW6MW
 vkRzUr7YRlBkoqqBlMIx01Wcr5c+E9tz/PWtHra8ML2lsgmR9wpb1QoUkj7WTyBkUGdOdB
 ADuSdNEsVvBQmocu9ErhJ1emg7jgKD0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-7Nodqc8uOVWsPMeF3DL_Bw-1; Wed, 15 Jul 2020 18:09:04 -0400
X-MC-Unique: 7Nodqc8uOVWsPMeF3DL_Bw-1
Received: by mail-wr1-f69.google.com with SMTP id j16so2807275wrw.3
 for <qemu-trivial@nongnu.org>; Wed, 15 Jul 2020 15:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6lDzg2tnLJ9OZ/Fxw8x+tGLZweJbgIrUzMUexvb9Pnc=;
 b=YfFsuyJfZ6EP0XzgJotxKY/RJVN6yA82QIMrts/BgFExkEn2fs9yVO4ImpidBtV0PN
 +WKFM56WfaBAv1Gj4CWUD6kQHHKzNjX2FVxZy9NKm/43+qICgVf0bbPhaU3l772jjjqW
 6A9tlW4zIB92kc5tOAR0bImxkkmO0lqx5SOlUy9CK+zNKgej9IXIMJbhGkQrN3HLoBnK
 YNoNcuUOerTwGbUo4zGDhiA6ID8B2jlolGRUUuS7/Ygar9CGchtFvuEXmdFYrj9USBqT
 sk9fdkIrse1e0ZRb0f5/CqB58oDT5KCSpP67OBH7PCaJu1ZSkDu9q12WMAYLjnFbNm3l
 qJIw==
X-Gm-Message-State: AOAM530nhCy5gFvhSdsxT/RbOQYpvmNwpTGqueQj5Hx9qk4jNDDMZHxw
 4hB/+IlySVIXMh0dMh+hXFsOUMd7y0peOzxgMDpmqtWlxfRIkiu0/vEun9Sudpi5v9yEuUVwxR9
 5tKmpo6XMZncPtIAUPw==
X-Received: by 2002:adf:c986:: with SMTP id f6mr1760542wrh.168.1594850943544; 
 Wed, 15 Jul 2020 15:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMk3644isf2iLNLkomvbXy9UKqBNAcAaiyd/W1FIhTqpnzo5of+OdhJWXOVvBqrHFICLoQ+A==
X-Received: by 2002:adf:c986:: with SMTP id f6mr1760513wrh.168.1594850943170; 
 Wed, 15 Jul 2020 15:09:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:466:71c0:860:fcaf:c937:d7cb?
 ([2a01:e0a:466:71c0:860:fcaf:c937:d7cb])
 by smtp.gmail.com with ESMTPSA id z6sm5065027wmf.33.2020.07.15.15.09.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 15:09:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: build: haiky system build fix
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <CA+XhMqyTLP5_Jf=t8OCsMifrme0DgimM8-D=Y0RRR+779052Bg@mail.gmail.com>
Date: Thu, 16 Jul 2020 00:09:01 +0200
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Message-Id: <5834A3E7-BB4D-4F5F-8D24-268C32EE0506@redhat.com>
References: <CA+XhMqyTLP5_Jf=t8OCsMifrme0DgimM8-D=Y0RRR+779052Bg@mail.gmail.com>
To: David CARLIER <devnexen@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cdupontd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 18:09:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Jul 2020 23:56:21 -0400
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
X-List-Received-Date: Wed, 15 Jul 2020 22:09:47 -0000

nit: typo in the mail subject (haiky instead of haiku)

> On 25 Jun 2020, at 20:36, David CARLIER <devnexen@gmail.com> wrote:
> 
> From 25adbdcdc17ef51a41759f16576901338ed8a469 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Thu, 25 Jun 2020 19:32:42 +0000
> Subject: [PATCH] build: haiku system build fix
> 
> Most of missing features resides in the bsd library.
> Also defining constant equivalence.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> configure            |  4 ++--
> include/qemu/bswap.h |  2 ++
> os-posix.c           |  4 ++++
> util/compatfd.c      |  2 ++
> util/drm.c           |  2 ++
> util/main-loop.c     |  3 +++
> util/oslib-posix.c   | 20 ++++++++++++++++++++
> util/qemu-openpty.c  |  2 +-
> 8 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index ba88fd1824..3732ad4e35 100755
> --- a/configure
> +++ b/configure
> @@ -901,8 +901,8 @@ SunOS)
> ;;
> Haiku)
>   haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS $QEMU_CFLAGS"
> -  LIBS="-lposix_error_mapper -lnetwork $LIBS"
> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
> +  LIBS="-lposix_error_mapper -lnetwork -lbsd $LIBS"
> ;;
> Linux)
>   audio_drv_list="try-pa oss"
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 2a9f3fe783..1d3e4c24e4 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -8,6 +8,8 @@
> # include <machine/bswap.h>
> #elif defined(__FreeBSD__)
> # include <sys/endian.h>
> +#elif defined(__HAIKU__)
> +# include <endian.h>
> #elif defined(CONFIG_BYTESWAP_H)
> # include <byteswap.h>
> 
> diff --git a/os-posix.c b/os-posix.c
> index 3cd52e1e70..ca07b7702d 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -42,6 +42,8 @@
> #include <sys/prctl.h>
> #endif
> 
> +#include <sys/mman.h>
> +
> /*
>  * Must set all three of these at once.
>  * Legal combinations are              unset   by name   by uid
> @@ -339,10 +341,12 @@ int os_mlock(void)
> {
>     int ret = 0;
> 
> +#if !defined(__HAIKU__)
>     ret = mlockall(MCL_CURRENT | MCL_FUTURE);
>     if (ret < 0) {
>         error_report("mlockall: %s", strerror(errno));
>     }
> 
> +#endif
>     return ret;
> }
> diff --git a/util/compatfd.c b/util/compatfd.c
> index c296f55d14..ee47dd8089 100644
> --- a/util/compatfd.c
> +++ b/util/compatfd.c
> @@ -16,7 +16,9 @@
> #include "qemu/osdep.h"
> #include "qemu/thread.h"
> 
> +#if defined(CONFIG_SIGNALFD)
> #include <sys/syscall.h>
> +#endif
> 
> struct sigfd_compat_info
> {
> diff --git a/util/drm.c b/util/drm.c
> index a23ff24538..8540578c09 100644
> --- a/util/drm.c
> +++ b/util/drm.c
> @@ -38,9 +38,11 @@ int qemu_drm_rendernode_open(const char *rendernode)
> 
>     fd = -1;
>     while ((e = readdir(dir))) {
> +#if !defined(__HAIKU__)
>         if (e->d_type != DT_CHR) {
>             continue;
>         }
> +#endif
> 
>         if (strncmp(e->d_name, "renderD", 7)) {
>             continue;
> diff --git a/util/main-loop.c b/util/main-loop.c
> index eda63fe4e0..1ce3081ced 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -85,6 +85,9 @@ static int qemu_signal_init(Error **errp)
>      * by sigwait() in the signal thread. Otherwise, the cpu thread will
>      * not catch it reliably.
>      */
> +#ifndef SIGIO
> +#define SIGIO SIGPOLL
> +#endif
>     sigemptyset(&set);
>     sigaddset(&set, SIG_IPI);
>     sigaddset(&set, SIGIO);
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 39ddc77c85..a18d90a68a 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -38,7 +38,12 @@
> #include "qemu/sockets.h"
> #include "qemu/thread.h"
> #include <libgen.h>
> +#if !defined(__HAIKU__)
> #include <sys/signal.h>
> +#else
> +#include <kernel/image.h>
> +#include <signal.h>
> +#endif
> #include "qemu/cutils.h"
> 
> #ifdef CONFIG_LINUX
> @@ -390,6 +395,21 @@ void qemu_init_exec_dir(const char *argv0)
>             }
>         }
>     }
> +#elif defined(__HAIKU__)
> +    {
> +        image_info ii;
> +        int32_t c = 0;
> +
> +    *buf = '\0';
> +    while (get_next_image_info(0, &c, &ii) == B_OK) {
> +            if (ii.type == B_APP_IMAGE) {
> +                strncpy(buf, ii.name, sizeof(buf));
> +            buf[sizeof(buf) - 1] = '\0';
> +        p = buf;
> +                break;
> +            }
> +        }
> +    }
> #endif
>     /* If we don't have any way of figuring out the actual executable
>        location then try argv[0].  */
> diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
> index 2e8b43bdf5..c29fc2cbf9 100644
> --- a/util/qemu-openpty.c
> +++ b/util/qemu-openpty.c
> @@ -35,7 +35,7 @@
> #include "qemu/osdep.h"
> #include "qemu-common.h"
> 
> -#if defined(__GLIBC__)
> +#if defined(__GLIBC__) || defined(__HAIKU__)
> # include <pty.h>
> #elif defined CONFIG_BSD
> # include <termios.h>
> -- 
> 2.26.0
> 


