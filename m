Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmKKx-0002PF-7q
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 04:53:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UmKKt-0002KM-4v
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 04:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UmKKq-0002sD-3Y
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 04:53:51 -0400
Received: from mail-bk0-x22d.google.com ([2a00:1450:4008:c01::22d]:37845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1UmKKk-0002qw-L6; Tue, 11 Jun 2013 04:53:42 -0400
Received: by mail-bk0-f45.google.com with SMTP id je9so2280462bkc.18
	for <multiple recipients>; Tue, 11 Jun 2013 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=nqI1q/aWTE/r0aRIwsiDkVkyZEFj6vMCeK9JQJaSJU8=;
	b=VgBA/E6uEHINWosLTLX8U1Nx+kYHNwp/q3pDW9w0MdTmxNEXExWDYLSUvirhLo5qOV
	OlxEPkQr4iFvgNocv48GqM3q647s5Ql4FkUGVnkXL8Dvs8OL/YeSeBXI0Y8AAvOzt+Zw
	2QXPoCeJXBCEUMSqgp68B64Lw08IP1ooc8pWA1a9GS05pE/o/VT/GScQUnL0maa796yN
	fuxVWbDD+V7xK9emoL69p9fRhevYIwPqiiq8R59pPD71MhhZQZvk6KHo9EyEozu1myv6
	45MOv9RDAOgD730uD54mXJr4DT2vNMOwWntjoSkBd1DQqps9zuDvJuF8hkAlITm9h8Xo
	Ku/A==
X-Received: by 10.204.237.130 with SMTP id ko2mr2018146bkb.154.1370940821097; 
	Tue, 11 Jun 2013 01:53:41 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	rj5sm5122702bkb.1.2013.06.11.01.53.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 01:53:40 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Date: Tue, 11 Jun 2013 10:53:37 +0200
Message-ID: <6223452.CkX1vrxQoH@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
In-Reply-To: <871u894oql.fsf@codemonkey.ws>
References: <8922048.8EFbqlEaG9@al> <871u894oql.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 11 Jun 2013 08:53:53 -0000

On Monday 10 June 2013 16:53:06 Anthony Liguori wrote:
> Peter Wu <lekensteyn@gmail.com> writes:
> > When QEMU is built without SDL support, -no-quit would print an error
> > message that SDL is disabled. Since GTK also supports -no-quit, enable
> > the option when GTK or SDL is enabled at compile time.
> > 
> > While at it, do not create the no_quit variable when it is not used.
> > 
> > Signed-off-by: Peter Wu <lekensteyn@gmail.com>
> 
> Any harm in just making -no-quit unconditional?

No harm, there are just 4 bytes more memory wasted and some code, not a big 
deal.

> It's a nop for VNC and presumably for spice too but it's not incorrect
> AFAICT.
> 
> Would be nice to drop #ifdefs if we can.

The readability should increase by dropping it. By the way, this integer 
should really be a bool.

As shortly discussed on IRC, a better approach is testing for the sanity of 
certain usages instead of ifdef'ing stuff. Having SDL compiled in and then 
using VNC still does not make -alt-grab more valid.

Let's drop this patch, I will submit a new one which checks the option at run-
time.

Regards,
Peter

> Regards,
> 
> Anthony Liguori
> 
> > ---
> > 
> >  include/sysemu/sysemu.h |  2 ++
> >  vl.c                    | 13 +++++++++----
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> > index 2fb71af..b9b8e52 100644
> > --- a/include/sysemu/sysemu.h
> > +++ b/include/sysemu/sysemu.h
> > @@ -117,7 +117,9 @@ extern int smp_cpus;
> > 
> >  extern int max_cpus;
> >  extern int cursor_hide;
> >  extern int graphic_rotate;
> > 
> > +#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
> > 
> >  extern int no_quit;
> > 
> > +#endif
> > 
> >  extern int no_shutdown;
> >  extern int semihosting_enabled;
> >  extern int old_param;
> > 
> > diff --git a/vl.c b/vl.c
> > index cfd2d3e..74ab050 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -202,7 +202,9 @@ static int full_screen = 0;
> > 
> >  #ifdef CONFIG_SDL
> >  static int no_frame = 0;
> >  #endif
> > 
> > +#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
> > 
> >  int no_quit = 0;
> > 
> > +#endif
> > 
> >  CharDriverState *serial_hds[MAX_SERIAL_PORTS];
> >  CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
> >  CharDriverState *virtcon_hds[MAX_VIRTIO_CONSOLES];
> > 
> > @@ -3523,6 +3525,13 @@ int main(int argc, char **argv, char **envp)
> > 
> >              case QEMU_OPTION_full_screen:
> >                  full_screen = 1;
> >                  break;
> > 
> > +            case QEMU_OPTION_no_quit:
> > +#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
> > +                no_quit = 1;
> > +#else
> > +                fprintf(stderr, "SDL and GTK support are disabled\n");
> > +#endif
> > +                break;
> > 
> >  #ifdef CONFIG_SDL
> >  
> >              case QEMU_OPTION_no_frame:
> >                  no_frame = 1;
> > 
> > @@ -3533,9 +3542,6 @@ int main(int argc, char **argv, char **envp)
> > 
> >              case QEMU_OPTION_ctrl_grab:
> >                  ctrl_grab = 1;
> >                  break;
> > 
> > -            case QEMU_OPTION_no_quit:
> > -                no_quit = 1;
> > -                break;
> > 
> >              case QEMU_OPTION_sdl:
> >                  display_type = DT_SDL;
> >                  break;
> > 
> > @@ -3543,7 +3549,6 @@ int main(int argc, char **argv, char **envp)
> > 
> >              case QEMU_OPTION_no_frame:
> >              case QEMU_OPTION_alt_grab:
> > 
> >              case QEMU_OPTION_ctrl_grab:
> > -            case QEMU_OPTION_no_quit:
> >              case QEMU_OPTION_sdl:
> >                  fprintf(stderr, "SDL support is disabled\n");
> >                  exit(1);

