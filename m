Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ujnwi-0000ew-9d
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 05:54:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Ujnwc-0000b8-5a
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 05:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UjnwX-0005TA-5D
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 05:54:22 -0400
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:38577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1UjnwW-0005Sn-RI; Tue, 04 Jun 2013 05:54:17 -0400
Received: by mail-wi0-f178.google.com with SMTP id hj6so3487480wib.11
	for <multiple recipients>; Tue, 04 Jun 2013 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=IumQPjcWpFTV0y/YwJo6KmNh1bbMeLfsc/Px0V/g4co=;
	b=K5lryWxsDkUn5CpCgvJmMKAxfBGz2+nD9kJ6+NjvdM6jEXgX4VLP9yYvzMKHeOyDbY
	x0U1M18WVsx+vFhHJ9RQPBqboowxACRcHuB6wSLgjelVzFEoGzjEIuHGAw22Ae6dapOW
	XLQRlgfmBm9Uh3Lm/CFL53MKZ6fmXeQB9J+ubhNAiawwbkWAlTbxx5sdp79n7z3otCrJ
	vYHYCX5hxIML8U3MNP1w+kp+IEyw3yY0+BZ45XH8biOTkYKJGhg+k9+SSWFToEPRGFgq
	b8xKbAA21EQd1tYwfPtdeeVRFZXbo44PbCbGOkhvOwOLZ3MunhcDgW+oionjSaDH9Cj3
	ICzg==
X-Received: by 10.194.123.69 with SMTP id ly5mr22915638wjb.29.1370339655996;
	Tue, 04 Jun 2013 02:54:15 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	ff10sm1496271wib.10.2013.06.04.02.54.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 02:54:15 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 04 Jun 2013 11:54:12 +0200
Message-ID: <2462603.M8I5x88OGL@al>
User-Agent: KMail/4.10.3 (Linux/3.9.1-1-custom; KDE/4.10.3; x86_64; ; )
In-Reply-To: <51AD65B2.5010903@msgid.tls.msk.ru>
References: <6745553.ZazUN2dGpZ@al> <51AD65B2.5010903@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc,
	help: update options/keys for GTK/SDL
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
X-List-Received-Date: Tue, 04 Jun 2013 09:54:26 -0000

Thanks for your feedback, replies are inlined below.

On Tuesday 04 June 2013 07:57:38 Michael Tokarev wrote:
> 03.06.2013 14:54, Peter Wu wrote:
> > The GTK display type has been introduced in 1.5, replacing SDL as default.
> > Some options only work with SDL and not GTK. This patch tries to address
> > them.
> > 
> > The `-display` option is updated with the new `gtk` option.
> > 
> > The `-alt-grab` and `-ctrl-alt` options are not possible in GTK according
> > to commit 5104a1f65088285ddf870aa641b9061064e8757d, this is now mentioned
> > explicitly. Another related change is that only Ctrl-Alt-G can be used
> > for (un)grbabing.
> > 
> > Window scaling seems also to be a SDL-specific feature and has been marked
> > as such.
> 
> This is a clear improvement.  However, we fail to mention VNC everywhere,
> which actually works pretty much like SDL.  This might go as a separate
> change however...

I did not know that the monitor could be used inside the VNC UI. I will try to 
update the docs with it. Aside, the `-display vnc=:0` option looks odd and 
inconsistent with other options. It would look saner if something like `-
display vnc,display=:0` was possible.

While we are at it, the `-display sdl` option contains:

    "...see the SDL documentation for other possibilities..."

Which documentation is meant? External documentation on the sdl website? The 
part about Ctrl-Alt-F? The `-sdl` option, which is extensively documented? 
("Enable SDL."). Or.. the `qemu-system-x86_64 --help` output? Shall I change 
something like `@item sdl` to `@item sdl[,frame=on|off],...` for clarity in the 
manual page?

> >  During the graphical emulation, you can use special key combinations to
> >  change> 
> > -modes. The default key mappings are shown below, but if you use
> > @code{-alt-grab} -then the modifier is Ctrl-Alt-Shift (instead of
> > Ctrl-Alt) and if you use -@code{-ctrl-grab} then the modifier is the
> > right Ctrl key (instead of Ctrl-Alt): +modes. The default key mappings
> > are shown below. If you are using SDL display +mode instead of GTK, you
> > can use @code{-alt-grab} to change the modifier to +Ctrl-Alt-Shift
> > (instead of Ctrl-Alt) and @code{-ctrl-grab} to change it to right
> > +Ctrl key (instead of Ctrl-Alt):
> I'd made a reference to -display option here, and s/SDL display mode/SDL
> display/.
Done, I now explicitly note that it was made for sdl and mentioned the `-
display sdl` option.

> Not a comment about this particular patch, but I think we should disallow
> -alt-grab for modes where it makes no sense (or at least warn about that
> usage).  For example, as stated, -alt-grab does not work for gtk, so we
> may as well warn in case `-display gtk -alt-grab'.  Ditto for -display none
> maybe.
A warning message would be nice indeed. The option should be ignored, not 
abort the startup as it may break configurations (in theory).

> -alt-grab is also ignored by vnc -- should we change/fix that?
As is -ctrl-grab, what about keeping it as-is? VNC is remote anyway, if -*-
grab does not change the default ctrl-alt modifier, it will provide a 
consistent experience. I have no strong preference on this though.

> >  @table @key
> >  @item Ctrl-Alt-f
> > 
> > @@ -294,7 +295,8 @@ Shrink the screen
> > 
> >  @item Ctrl-Alt-u
> >  @kindex Ctrl-Alt-u
> > 
> > -Restore the screen's un-scaled dimensions
> > +Restore the screen's un-scaled dimensions (SDL windows only, GTK does not
> > +feature window scaling)
> > 
> >  @item Ctrl-Alt-n
> >  @kindex Ctrl-Alt-n
> > 
> > @@ -308,16 +310,20 @@ Monitor
> > 
> >  Serial port
> >  @end table
> > 
> > +@item Ctrl-Alt-G
> > +@kindex Ctrl-Alt-G
> > +Toggle mouse and keyboard grab in GTK mode.
> > +
> > 
> >  @item Ctrl-Alt
> >  @kindex Ctrl-Alt
> > 
> > -Toggle mouse and keyboard grab.
> > +Toggle mouse and keyboard grab in SDL windows.
> > 
> >  @end table
> >  
> >  @kindex Ctrl-Up
> >  @kindex Ctrl-Down
> >  @kindex Ctrl-PageUp
> >  @kindex Ctrl-PageDown
> > 
> > -In the virtual consoles, you can use @key{Ctrl-Up}, @key{Ctrl-Down},
> > +In the virtual consoles of SDL, you can use @key{Ctrl-Up},
> > @key{Ctrl-Down},> 
> >  @key{Ctrl-PageUp} and @key{Ctrl-PageDown} to move in the back log.
> 
> is it sdl-specific?
Apparently yes. In GTK, Ctrl-Up results in "5A" being inserted, Ctrl-Down in 
"5B" and similar results for PageUp/PageDown. In VNC, pressing those keys have  
no effect.

> >  @kindex Ctrl-a h
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index bf94862..f7b0172 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -338,7 +338,7 @@ STEXI
> > 
> >  @item -name @var{name}
> >  @findex -name
> >  Sets the @var{name} of the guest.
> > 
> > -This name will be displayed in the SDL window caption.
> > +This name will be displayed in the SDL and GTK window captions.
> > 
> >  The @var{name} will also be used for the VNC server.
> >  Also optionally set the top visible process name in Linux.
> >  ETEXI
> > 
> > @@ -804,7 +804,7 @@ ETEXI
> > 
> >  DEF("display", HAS_ARG, QEMU_OPTION_display,
> >  
> >      "-display sdl[,frame=on|off][,alt_grab=on|off][,ctrl_grab=on|off]\n"
> > 
> > -    "            [,window_close=on|off]|curses|none|\n"
> > +    "            [,window_close=on|off]|gtk|curses|none|\n"
> > 
> >      "            vnc=<display>[,<optargs>]\n"
> >      "                select display type\n", QEMU_ARCH_ALL)
> >  
> >  STEXI
> > 
> > @@ -813,6 +813,8 @@ STEXI
> > 
> >  Select type of display to use. This option is a replacement for the
> >  old style -sdl/-curses/... options. Valid values for @var{type} are
> >  @table @option
> > 
> > +@item gtk
> > +Display video output via GTK which includes a menu bar.
> 
> s/which includes a menu bar/in a separate window/ (maybe mention
> the menu bar but this IMHO isn't an important detail).
I think most users do not care about the technology (SDL vs GTK), the menu bar 
is the most obvious difference. I have changed it to:

    "Display video output via GTK in a separate window which includes a menu 
bar."

> >  @item sdl
> >  Display video output via SDL (usually in a separate graphics
> >  window; see the SDL documentation for other possibilities).
> > 
> > @@ -839,7 +841,7 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
> > 
> >  STEXI
> >  @item -nographic
> >  @findex -nographic
> > 
> > -Normally, QEMU uses SDL to display the VGA output. With this option,
> > +Normally, QEMU uses GTK to display the VGA output. With this option,
> > 
> >  you can totally disable graphical output so that QEMU is a simple
> >  command line application. The emulated serial port is redirected on
> >  the console. Therefore, you can still use QEMU to debug a Linux kernel
> > 
> > @@ -852,7 +854,7 @@ DEF("curses", 0, QEMU_OPTION_curses,
> > 
> >  STEXI
> >  @item -curses
> >  @findex -curses
> > 
> > -Normally, QEMU uses SDL to display the VGA output.  With this option,
> > +Normally, QEMU uses GTK to display the VGA output.  With this option,
> > 
> >  QEMU can display the VGA output when in text mode using a
> >  curses/ncurses interface.  Nothing is displayed in graphical mode.
> >  ETEXI
> > 
> > @@ -869,27 +871,29 @@ workspace more convenient.
> > 
> >  ETEXI
> >  
> >  DEF("alt-grab", 0, QEMU_OPTION_alt_grab,
> > 
> > -    "-alt-grab       use Ctrl-Alt-Shift to grab mouse (instead of
> > Ctrl-Alt)\n", +    "-alt-grab       use Ctrl-Alt-Shift to grab mouse in
> > SDL (instead of Ctrl-Alt)\n",> 
> >      QEMU_ARCH_ALL)
> >  
> >  STEXI
> >  @item -alt-grab
> >  @findex -alt-grab
> > 
> > -Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that this
> > also -affects the special keys (for fullscreen, monitor-mode switching,
> > etc). +Use Ctrl-Alt-Shift to grab mouse in SDL windows (instead of
> > Ctrl-Alt). Note that +this also affects the special keys (for fullscreen,
> > monitor-mode switching, +etc).
> > 
> >  ETEXI
> >  
> >  DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
> > 
> > -    "-ctrl-grab      use Right-Ctrl to grab mouse (instead of
> > Ctrl-Alt)\n", +    "-ctrl-grab      use Right-Ctrl to grab mouse in SDL
> > (instead of Ctrl-Alt)\n",> 
> >      QEMU_ARCH_ALL)
> >  
> >  STEXI
> >  @item -ctrl-grab
> >  @findex -ctrl-grab
> > 
> > -Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this also
> > -affects the special keys (for fullscreen, monitor-mode switching, etc).
> > +Use Right-Ctrl to grab mouse in SDL windows (instead of Ctrl-Alt). Note
> > that +this also affects the special keys (for fullscreen, monitor-mode
> > switching, +etc).
> > 
> >  ETEXI
> >  
> >  DEF("no-quit", 0, QEMU_OPTION_no_quit,
> > 
> > -    "-no-quit        disable SDL window close capability\n",
> > QEMU_ARCH_ALL) +    "-no-quit        disable SDL and GTK window close
> > capability\n", QEMU_ARCH_ALL)> 
> >  STEXI
> >  @item -no-quit
> >  @findex -no-quit
> > 
> > @@ -1080,7 +1084,7 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
> > 
> >  STEXI
> >  @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
> >  @findex -vnc
> > 
> > -Normally, QEMU uses SDL to display the VGA output.  With this option,
> > +Normally, QEMU uses GTK to display the VGA output.  With this option,
> > 
> >  you can have QEMU listen on VNC display @var{display} and redirect the
> >  VGA
> >  display over the VNC session.  It is very useful to enable the usb
> >  tablet device when using this option (option @option{-usbdevice

I have added the "(GTK and SDL)" note to Ctrl-Alt-[f+-] to make clear that it 
is not available in other displays such as VNC. (VNC clients may have their 
own shortcuts for toggling fullscreen though). There seems also a bug in the 
C-A-[-+[ handling in SDL that needs some attention 
(https://bugs.launchpad.net/qemu/+bug/1187319)

Once I get more feedback on this I will send v2.

Thanks,
Peter

