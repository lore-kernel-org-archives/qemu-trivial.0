Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meGpi-0002s0-8H
	for mharc-qemu-trivial@gnu.org; Sat, 23 Oct 2021 09:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBTi-0005iP-AO; Sat, 23 Oct 2021 03:30:06 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:47474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBTf-0002fN-Vl; Sat, 23 Oct 2021 03:30:05 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 9ECB999370;
 Sat, 23 Oct 2021 07:29:54 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtCQ3pTGz3DxM;
 Sat, 23 Oct 2021 07:29:54 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 538FDA1B6;
 Sat, 23 Oct 2021 07:29:54 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f174.google.com with SMTP id z24so5586889qtv.9;
 Sat, 23 Oct 2021 00:29:54 -0700 (PDT)
X-Gm-Message-State: AOAM531iMg71YhV3A/XtOZsKO20x1Wb0LE+f9xA7VSuat2qW2IJHzMlN
 XjCRSdPXVh/TN5w5AewHqEaEYxR/M+UgrHFdbIY=
X-Google-Smtp-Source: ABdhPJy2jsZO0sHQqEhDTv9Pxfb8r9Q8rRmMuSV35bac/0fWUs6dR48YjViRLisrd4CIcadJgdgsav9zShKMAovSfII=
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr4798811qta.132.1634974193834; 
 Sat, 23 Oct 2021 00:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-2-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-2-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:29:42 -0500
X-Gmail-Original-Message-ID: <CACNAnaFc4xoC+gtNAASLrRzmNOYMcay0afrrYqV2rOa2+kEssA@mail.gmail.com>
Message-ID: <CACNAnaFc4xoC+gtNAASLrRzmNOYMcay0afrrYqV2rOa2+kEssA@mail.gmail.com>
Subject: Re: [PATCH 01/24] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 23 Oct 2021 09:12:57 -0400
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
X-List-Received-Date: Sat, 23 Oct 2021 07:30:06 -0000
X-List-Received-Date: Sat, 23 Oct 2021 07:30:06 -0000

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> As part of upstreaming, the include guards have been made more
> consistent. Update this file to use the new guards.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_sysarch.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
> index 632a5cd453..8cc6bff207 100644
> --- a/bsd-user/arm/target_arch_sysarch.h
> +++ b/bsd-user/arm/target_arch_sysarch.h
> @@ -17,8 +17,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#ifndef BSD_USER_ARCH_SYSARCH_H_
> -#define BSD_USER_ARCH_SYSARCH_H_
> +#ifndef _TARGET_ARCH_SYSARCH_H_
> +#define _TARGET_ARCH_SYSARCH_H_
>
>  #include "target_syscall.h"
>  #include "target_arch.h"
> @@ -75,4 +75,4 @@ static inline void do_freebsd_arch_print_sysarch(
>      }
>  }
>
> -#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
> +#endif /*!_TARGET_ARCH_SYSARCH_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

