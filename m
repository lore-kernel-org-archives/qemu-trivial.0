Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLSWO-0006ef-J6
	for mharc-qemu-trivial@gnu.org; Fri, 18 Oct 2019 09:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iLSWM-0006cp-D0
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 09:42:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iLSWL-0001z4-7w
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 09:42:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46144)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iLSWK-0001yj-UM
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 09:42:21 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8D2E73A66
 for <qemu-trivial@nongnu.org>; Fri, 18 Oct 2019 13:42:19 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id r187so4990318wme.0
 for <qemu-trivial@nongnu.org>; Fri, 18 Oct 2019 06:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CM22kF1hX/gKyH1MdvDK6bYTJUPtBgkegAIt1Fo6asQ=;
 b=A+pkeHqi93wLDExY638TKbZt1Fb17v/Iwb0+CCRdYbXHYKt4UINyezuPspil9x18PE
 UBFXRJWDsrZBQ+4/LlzSgwXJkLcoNJtfW+NPqR5Bsd0jhlSB09/f8fEc7BMKNGqjfx3W
 iAK7T8l8tCF59Jgh+jYSNjK4VYr0/9ZS0l+zJxGavqKwKPWNP/+DnnIu1b3vEwupP/Ly
 iR9wRLaBdSWkDe4yGJlyL5xYXABM9Gm6Ry04pyP2jVbi8FJC3kCv8xDI5wECciRxm527
 LWdhEWkr+VrnznZHqrGBtIHIilkOKxG1j/1WJnnTabmcWcxAjl0xzPCif05nX+8BMOeD
 kv9w==
X-Gm-Message-State: APjAAAWGZFrdxS6H6ZRucasIef8Wxelo9c1pzOQ9qtWEkkDvMJ2QpMz2
 RWkQHYNR9X6n/5WJV3Gs5EA1vL0Cyky3PkAI6AnZ71WVhgIsWrCGmZcjM0oodIqwaSfo/kBjZKM
 FyY/7BiLEN7keG2qLiA==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr8118707wrw.106.1571406138479; 
 Fri, 18 Oct 2019 06:42:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXaJUm2DeK+PvdOriUphd1170tmdyQZkDowuqXh2mz58Byb1jDM9lu6MZ80QdhB50unka6NQ==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr8118678wrw.106.1571406138158; 
 Fri, 18 Oct 2019 06:42:18 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
 [79.52.200.174])
 by smtp.gmail.com with ESMTPSA id w7sm4461539wmd.22.2019.10.18.06.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 06:42:17 -0700 (PDT)
Date: Fri, 18 Oct 2019 15:42:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, berrange@redhat.com
Subject: Re: [PATCH v2] Do not use %m in common code to print error messages
Message-ID: <20191018134215.u6psfffrrxlsa2ns@steredhat>
References: <20191018130716.25438-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018130716.25438-1-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 18 Oct 2019 13:42:23 -0000

On Fri, Oct 18, 2019 at 03:07:16PM +0200, Thomas Huth wrote:
> The %m format specifier is an extension from glibc - and when compiling
> QEMU for NetBSD, the compiler correctly complains, e.g.:
> 
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_handler':
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is only
>  allowed in syslog(3) like functions [-Wformat=]
>              printf("read from sigfd returned %zd: %m\n", len);
>              ^
> Let's use g_strerror() here instead, which is an easy-to-use wrapper
> around the thread-safe strerror_r() function.
> 
> While we're at it, also convert the "printf()" in main-loop.c into
> the preferred "error_report()".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Do not try to g_free() the strings
> 
>  hw/misc/tmp421.c | 4 ++--
>  util/main-loop.c | 3 ++-
>  util/systemd.c   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

There are many uses of %m also in hw/vfio/ but that's Linux stuff.
Should we change those too or it doesn't matter since it never really
compiled on NetBSD?

Anyway, this patch LGTM:
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

> 
> diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
> index 9f044705fa..c0bc150bca 100644
> --- a/hw/misc/tmp421.c
> +++ b/hw/misc/tmp421.c
> @@ -120,7 +120,7 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
>      int tempid;
>  
>      if (sscanf(name, "temperature%d", &tempid) != 1) {
> -        error_setg(errp, "error reading %s: %m", name);
> +        error_setg(errp, "error reading %s: %s", name, g_strerror(errno));
>          return;
>      }
>  
> @@ -160,7 +160,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
>      }
>  
>      if (sscanf(name, "temperature%d", &tempid) != 1) {
> -        error_setg(errp, "error reading %s: %m", name);
> +        error_setg(errp, "error reading %s: %s", name, g_strerror(errno));
>          return;
>      }
>  
> diff --git a/util/main-loop.c b/util/main-loop.c
> index e3eaa55866..eda63fe4e0 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -61,7 +61,8 @@ static void sigfd_handler(void *opaque)
>          }
>  
>          if (len != sizeof(info)) {
> -            printf("read from sigfd returned %zd: %m\n", len);
> +            error_report("read from sigfd returned %zd: %s", len,
> +                         g_strerror(errno));
>              return;
>          }
>  
> diff --git a/util/systemd.c b/util/systemd.c
> index d22e86c707..1dd0367d9a 100644
> --- a/util/systemd.c
> +++ b/util/systemd.c
> @@ -60,8 +60,8 @@ unsigned int check_socket_activation(void)
>               * and we should exit.
>               */
>              error_report("Socket activation failed: "
> -                         "invalid file descriptor fd = %d: %m",
> -                         fd);
> +                         "invalid file descriptor fd = %d: %s",
> +                         fd, g_strerror(errno));
>              exit(EXIT_FAILURE);
>          }
>      }
> -- 
> 2.18.1
> 
> 

-- 

