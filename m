Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmA1a-0004rK-Pk
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 17:53:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UmA1X-0004qQ-RB
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UmA1V-0002T3-Ku
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:53:11 -0400
Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234]:52687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UmA1V-0002Sp-H2
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:53:09 -0400
Received: by mail-oa0-f52.google.com with SMTP id g12so1907450oah.11
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 14:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:in-reply-to:references:user-agent:date:message-id
	:mime-version:content-type:x-gm-message-state;
	bh=OcZB4uBbfi2x7PkUT2h6MnVUWZxN4N7DHVBZqD4+rU0=;
	b=JGCIRA1ZoVwi1iGnXyBqg7bUmQk5ExBCMu69bJexWLiARQmsrG2+oxLRRBfk4udkJb
	poT4En6Ea9Q2C7NmvH6vFkG6n+lK6YmFD73EyvCVrVE/uTyiQGeB3z9cbC++Bu2MkjoR
	nQ79UWgpwJaLg3lm2SzSvoKLEwqZ/wrOsY620F8+HWSFpJOLy/yhRVscVnVIvGQjxNW4
	u9lzbKmvdqIBjmWCD0KWJguHAoc6z9IPXNOiYTqMQerqRmxnKoQfXttGlHDMH7d09DqM
	TVI/LIEMa4r/bKMlCS/DnBwb4bqH/v4+k4M2pOeR4pFohv0q6mLeD99iSs3z6zKh8qjO
	8WGQ==
X-Received: by 10.60.121.106 with SMTP id lj10mr10082107oeb.128.1370901188856; 
	Mon, 10 Jun 2013 14:53:08 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87])
	by mx.google.com with ESMTPSA id r4sm25045058oem.3.2013.06.10.14.53.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 14:53:08 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Peter Wu <lekensteyn@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
In-Reply-To: <8922048.8EFbqlEaG9@al>
References: <8922048.8EFbqlEaG9@al>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 10 Jun 2013 16:53:06 -0500
Message-ID: <871u894oql.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQmWUEDkHFoJJZP3rNHrTSCqZCejdug1eAJ/YFEa/YqZQtirM39nR0oVzZtGG8LRxsTXG+Gw
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Unbreak -no-quit for GTK
	when SDL is disabled
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2013 21:53:13 -0000

Peter Wu <lekensteyn@gmail.com> writes:

> When QEMU is built without SDL support, -no-quit would print an error message
> that SDL is disabled. Since GTK also supports -no-quit, enable the option when
> GTK or SDL is enabled at compile time.
>
> While at it, do not create the no_quit variable when it is not used.
>
> Signed-off-by: Peter Wu <lekensteyn@gmail.com>

Any harm in just making -no-quit unconditional?

It's a nop for VNC and presumably for spice too but it's not incorrect
AFAICT.

Would be nice to drop #ifdefs if we can.

Regards,

Anthony Liguori

> ---
>  include/sysemu/sysemu.h |  2 ++
>  vl.c                    | 13 +++++++++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 2fb71af..b9b8e52 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -117,7 +117,9 @@ extern int smp_cpus;
>  extern int max_cpus;
>  extern int cursor_hide;
>  extern int graphic_rotate;
> +#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
>  extern int no_quit;
> +#endif
>  extern int no_shutdown;
>  extern int semihosting_enabled;
>  extern int old_param;
> diff --git a/vl.c b/vl.c
> index cfd2d3e..74ab050 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -202,7 +202,9 @@ static int full_screen = 0;
>  #ifdef CONFIG_SDL
>  static int no_frame = 0;
>  #endif
> +#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
>  int no_quit = 0;
> +#endif
>  CharDriverState *serial_hds[MAX_SERIAL_PORTS];
>  CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
>  CharDriverState *virtcon_hds[MAX_VIRTIO_CONSOLES];
> @@ -3523,6 +3525,13 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_full_screen:
>                  full_screen = 1;
>                  break;
> +            case QEMU_OPTION_no_quit:
> +#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
> +                no_quit = 1;
> +#else
> +                fprintf(stderr, "SDL and GTK support are disabled\n");
> +#endif
> +                break;
>  #ifdef CONFIG_SDL
>              case QEMU_OPTION_no_frame:
>                  no_frame = 1;
> @@ -3533,9 +3542,6 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_ctrl_grab:
>                  ctrl_grab = 1;
>                  break;
> -            case QEMU_OPTION_no_quit:
> -                no_quit = 1;
> -                break;
>              case QEMU_OPTION_sdl:
>                  display_type = DT_SDL;
>                  break;
> @@ -3543,7 +3549,6 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_no_frame:
>              case QEMU_OPTION_alt_grab:
>              case QEMU_OPTION_ctrl_grab:
> -            case QEMU_OPTION_no_quit:
>              case QEMU_OPTION_sdl:
>                  fprintf(stderr, "SDL support is disabled\n");
>                  exit(1);
> -- 
> 1.8.3

