Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlnV8-0005y1-0P
	for mharc-qemu-trivial@gnu.org; Sun, 09 Jun 2013 17:50:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UlnV3-0005sM-QP
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 17:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UlnV1-0002Sn-9l
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 17:50:09 -0400
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f]:39068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1UlnUv-0002Bb-0Z; Sun, 09 Jun 2013 17:50:01 -0400
Received: by mail-ee0-f47.google.com with SMTP id e49so2615046eek.34
	for <multiple recipients>; Sun, 09 Jun 2013 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=tkQw9FeLK3bV7qilkJ4gt6A32DPE+o8mEaIldkVQ6V4=;
	b=m6HCeTvvmmRr/OmUVpqhzqFpOYIek6D4mer7qi1atkDu+4yPtE+E9KbPuSUkYDrq+K
	+fI1OQjyPuUyVh31MVHdbbRitS8r3gQVmAMsNVUKRF0N4LaZC/O1ryGKS/PtnxKgWzhL
	K6qfZNVdh8frbxOkF3NKuxYKsx1Wwu+sJdnOWCXOoE+VIM2mF3tO8xLJ79IusBbsBIO1
	OLKMDjChuz0t7ANjkGw3E0ryjT89PkWHZMPIEVLUDPKuhsySU2DNw8g7ZRZmS01/NwmJ
	cyBQo82av+AT6vy3nUsR3fEC9ZFFJfmPWNo2YUakWO9t2Mawwy1rwooDg5MOldq5RAyR
	rR+Q==
X-Received: by 10.14.1.70 with SMTP id 46mr8083418eec.82.1370814599661;
	Sun, 09 Jun 2013 14:49:59 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	b7sm9578493eef.16.2013.06.09.14.49.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 09 Jun 2013 14:49:58 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Date: Sun, 09 Jun 2013 23:49:56 +0200
Message-ID: <12151202.rdheR2yjjV@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
In-Reply-To: <CA+aC4ktaHDBRywD6fReNWW5eNmOkr-TGBYjGXY426uMF=GMftw@mail.gmail.com>
References: <11837115.9GZ72nQAUt@al>
	<CA+aC4ktaHDBRywD6fReNWW5eNmOkr-TGBYjGXY426uMF=GMftw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22f
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: implement -full-screen
	and -no-frame
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
X-List-Received-Date: Sun, 09 Jun 2013 21:50:12 -0000

On Sunday 09 June 2013 13:33:14 Anthony Liguori wrote:
> On Sun, Jun 9, 2013 at 5:30 AM, Peter Wu <lekensteyn@gmail.com> wrote:
> > Aiming for GTK as replacement for SDL, features like -full-screen and
> > -no-frame should also be implemented.
> > 
> > Bringing the window into full-screen mode is done by faking activating the
> > full screen menu item with a NULL menu item (which currently is not used
> > by gd_menu_full_screen). This is done after showing the windows to make
> > the cursor and menu hidden.
> > 
> > Signed-off-by: Peter Wu <lekensteyn@gmail.com>
> > ---
> > 
> >  include/ui/console.h |  2 +-
> >  ui/gtk.c             | 10 +++++++++-
> >  vl.c                 |  2 +-
> >  3 files changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/ui/console.h b/include/ui/console.h
> > index 4307b5f..7174ba9 100644
> > --- a/include/ui/console.h
> > +++ b/include/ui/console.h
> > @@ -339,6 +339,6 @@ int index_from_keycode(int code);
> > 
> >  /* gtk.c */
> >  void early_gtk_display_init(void);
> > 
> > -void gtk_display_init(DisplayState *ds);
> > +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame);
> > 
> >  #endif
> > 
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index 3bc2842..3df2611 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -1433,7 +1433,7 @@ static const DisplayChangeListenerOps dcl_ops = {
> > 
> >      .dpy_cursor_define = gd_cursor_define,
> >  
> >  };
> > 
> > -void gtk_display_init(DisplayState *ds)
> > +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame)
> > 
> >  {
> >  
> >      GtkDisplayState *s = g_malloc0(sizeof(*s));
> >      char *filename;
> > 
> > @@ -1457,6 +1457,10 @@ void gtk_display_init(DisplayState *ds)
> > 
> >      s->scale_y = 1.0;
> >      s->free_scale = FALSE;
> > 
> > +    if (no_frame) {
> > +        gtk_window_set_decorated(GTK_WINDOW(s->window), FALSE);
> > +    }
> > +
> 
> Is this really desirable?  Why do people use -no-frame?  I don't think
> we should carry over features from SDL just because they are there.

I started using it because -full-screen didn't work well in SDL. In SDL, full-
screen mode changes de video mode too. At some point, I even managed to crash 
QEMU in full screen mode with certain Xorg settings.

I just added it to GTK because it was possible to do so. In GTK, I -full-
screen hides the menu bar (although there is still some pixels visible on the 
top!) and the border without changing modes (which is a plus!). Due to this, 
there is not really a need for -no-frame for me.

Others are likely using -no-frame in a space-constrained environment where 
they need to show multiple windows.

> >      setlocale(LC_ALL, "");
> >      bindtextdomain("qemu", CONFIG_QEMU_LOCALEDIR);
> >      textdomain("qemu");
> > 
> > @@ -1509,6 +1513,10 @@ void gtk_display_init(DisplayState *ds)
> > 
> >      gtk_widget_show_all(s->window);
> > 
> > +    if (full_screen) {
> > +        gd_menu_full_screen(NULL, s);
> > +    }
> > +
> 
> You should activate the menu item by using gtk_check_menu_item_set_active().
> 
> Otherwise the menu with be out of sync with the UI state.

Alright, I forgot to check that. I will this fix in a next patch where I will 
leave out -no-frame as well.

Thanks for review!

Regards,
Peter

> Regards,
> 
> Anthony Liguori
> 
> >      register_displaychangelistener(&s->dcl);
> >      
> >      global_state = s;
> > 
> > diff --git a/vl.c b/vl.c
> > index 47ab45d..5a00710 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -4347,7 +4347,7 @@ int main(int argc, char **argv, char **envp)
> > 
> >  #endif
> >  #if defined(CONFIG_GTK)
> >  
> >      case DT_GTK:
> > -        gtk_display_init(ds);
> > +        gtk_display_init(ds, full_screen, no_frame);
> > 
> >          break;
> >  
> >  #endif
> >  
> >      default:
> > --
> > 1.8.3

