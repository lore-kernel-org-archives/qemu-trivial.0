Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWeUT-0004eA-2z
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 02:56:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bWeUN-0004ZJ-43
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 02:56:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bWeUG-0001fG-Fu
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 02:56:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bWeUA-0001eA-Dp; Mon, 08 Aug 2016 02:56:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36AD4A89A;
	Mon,  8 Aug 2016 06:56:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u786uR4j019527
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 8 Aug 2016 02:56:28 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C7C9A11386A2; Mon,  8 Aug 2016 08:56:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Colin Lord <clord@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	peter.maydell@linaro.org
References: <1470420195-32551-1-git-send-email-clord@redhat.com>
Date: Mon, 08 Aug 2016 08:56:26 +0200
In-Reply-To: <1470420195-32551-1-git-send-email-clord@redhat.com> (Colin
	Lord's message of "Fri, 5 Aug 2016 14:03:15 -0400")
Message-ID: <87zioniw9x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 08 Aug 2016 06:56:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] help: Update help to
 reflect that GTK is the default
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 06:56:46 -0000

Colin Lord <clord@redhat.com> writes:

> Updates the help messages to reflect that GTK is the default display (if
> enabled), not SDL.
>
> Signed-off-by: Colin Lord <clord@redhat.com>
> ---
>  v2: Update to try to implement Paolo's suggested wordings. It looks to
>  me like the subsections get wrapped at 72 lines, which mean there was a
>  bit of a ripple effect and the changes look bigger than they are.
>  qemu-options.hx | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a71aaf8..657d083 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -982,13 +982,14 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
>  STEXI
>  @item -nographic
>  @findex -nographic
> -Normally, QEMU uses SDL to display the VGA output. With this option,
> -you can totally disable graphical output so that QEMU is a simple
> -command line application. The emulated serial port is redirected on
> -the console and muxed with the monitor (unless redirected elsewhere
> -explicitly). Therefore, you can still use QEMU to debug a Linux kernel
> -with a serial console.  Use @key{C-a h} for help on switching between
> -the console and monitor.
> +Normally, QEMU uses GTK or SDL to display the output (such as graphics,

For a value of "normally" :)

Here's how main() picks the default display:

    #if defined(CONFIG_GTK)
            display_type = DT_GTK;
    #elif defined(CONFIG_SDL)
            display_type = DT_SDL;
    #elif defined(CONFIG_COCOA)
            display_type = DT_COCOA;
    #elif defined(CONFIG_VNC)
            vnc_parse("localhost:0,to=99,id=default", &error_abort);
    #else
            display_type = DT_NONE;
    #endif

> +console, and the QEMU monitor). With this option, you can totally
> +disable graphical output so that QEMU is a simple command line
> +application. The emulated serial port is redirected on the console and
> +muxed with the monitor (unless redirected elsewhere explicitly).
> +Therefore, you can still use QEMU to debug a Linux kernel with a serial
> +console. Use @key{C-a h} for help on switching between the console and
> +monitor.

-nographic additionally instructs board code to omit optional graphics
devices, by setting machine property "graphics".

Aside: -nographic is hard to understand because it does too many things.

Your patch is an improvement for common configurations, but still
misleading when CONFIG_GTK and CONFIG_SDL are both off.  Additionally
covering the DT_COCOA case is easy enough, just refrain from going into
unnecessary technical detail: "Normally, QEMU displays output such as
guest graphics, guest console, monitor in a Window."  Still doesn't
cover the DT_NONE case with and without VNC, but I can't think of a
concise way to describe it right now.

>  ETEXI
>  
>  DEF("curses", 0, QEMU_OPTION_curses,
> @@ -997,9 +998,10 @@ DEF("curses", 0, QEMU_OPTION_curses,
>  STEXI
>  @item -curses
>  @findex -curses
> -Normally, QEMU uses SDL to display the VGA output.  With this option,
> -QEMU can display the VGA output when in text mode using a
> -curses/ncurses interface.  Nothing is displayed in graphical mode.
> +Normally, QEMU uses GTK or SDL to display the output (such as graphics,
> +console, and the QEMU monitor). With this option, QEMU can display the
> +VGA output when in text mode using a curses/ncurses interface. Nothing
> +is displayed in graphical mode.
>  ETEXI
>  
>  DEF("no-frame", 0, QEMU_OPTION_no_frame,
> @@ -1243,13 +1245,13 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
>  STEXI
>  @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
>  @findex -vnc
> -Normally, QEMU uses SDL to display the VGA output.  With this option,
> -you can have QEMU listen on VNC display @var{display} and redirect the VGA
> -display over the VNC session.  It is very useful to enable the usb
> -tablet device when using this option (option @option{-usbdevice
> -tablet}). When using the VNC display, you must use the @option{-k}
> -parameter to set the keyboard layout if you are not using en-us. Valid
> -syntax for the @var{display} is
> +Normally, QEMU uses GTK or SDL to display the output (such as graphics,
> +console, and the QEMU monitor). With this option, you can have QEMU
> +listen on VNC display @var{display} and redirect the VGA display over
> +the VNC session. It is very useful to enable the usb tablet device when
> +using this option (option @option{-usbdevice tablet}). When using the
> +VNC display, you must use the @option{-k} parameter to set the keyboard
> +layout if you are not using en-us. Valid syntax for the @var{display} is
>  
>  @table @option

Preexisting: the "must use -k" part has long become wrong.  You need -k
only if you use a VNC viewer that doesn't understand extended key
events.  If your viewer understand them, you're better off without -k.
You don't have to fix this in this patch.

https://www.berrange.com/posts/2010/07/04/more-than-you-or-i-ever-wanted-to-know-about-virtual-keyboard-handling/

