Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bU97O-0005fP-Gq
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 05:02:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bU97M-0005bp-AG
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 05:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bU97K-0008IS-8G
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 05:02:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bU97F-0008H9-AG; Mon, 01 Aug 2016 05:02:29 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D2ED85376;
	Mon,  1 Aug 2016 09:02:28 +0000 (UTC)
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7192PXb014593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 1 Aug 2016 05:02:26 -0400
To: Colin Lord <clord@redhat.com>, qemu-devel@nongnu.org
References: <1469636506-1768-1-git-send-email-clord@redhat.com>
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, peter.maydell@linaro.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <318fbc9d-333d-f756-7c13-8bf552d70c92@redhat.com>
Date: Mon, 1 Aug 2016 11:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1469636506-1768-1-git-send-email-clord@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 01 Aug 2016 09:02:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] help: Update help to reflect that GTK is
 the default
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
X-List-Received-Date: Mon, 01 Aug 2016 09:02:37 -0000



On 27/07/2016 18:21, Colin Lord wrote:
> Updates the messages displayed in the help option to reflect that GTK is
> the default display, not SDL.
> ---
>  qemu-options.hx | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8e0d9a5..5bec1d3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -967,7 +967,7 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
>  STEXI
>  @item -nographic
>  @findex -nographic
> -Normally, QEMU uses SDL to display the VGA output. With this option,
> +Normally, QEMU uses GTK to display the VGA output. With this option,

IIRC SDL is the default if GTK is not enabled.  So perhaps "uses GTK or
SDL"?

Since you are at it, replace "the VGA output" with "output (such as
graphics, console, and the QEMU monitor)"

>  you can totally disable graphical output so that QEMU is a simple
>  command line application. The emulated serial port is redirected on
>  the console and muxed with the monitor (unless redirected elsewhere
> @@ -977,12 +977,12 @@ the console and monitor.
>  ETEXI
>  
>  DEF("curses", 0, QEMU_OPTION_curses,
> -    "-curses         use a curses/ncurses interface instead of SDL\n",
> +    "-curses         use a curses/ncurses interface instead of GTK\n",

Remove "instead of GTK" altogether?

>      QEMU_ARCH_ALL)
>  STEXI
>  @item -curses
>  @findex -curses
> -Normally, QEMU uses SDL to display the VGA output.  With this option,
> +Normally, QEMU uses GTK to display the VGA output.  With this option,

Same as above ("GTK or SDL").

>  QEMU can display the VGA output when in text mode using a
>  curses/ncurses interface.  Nothing is displayed in graphical mode.
>  ETEXI
> @@ -1034,6 +1034,14 @@ STEXI
>  Enable SDL.
>  ETEXI
>  
> +DEF("gtk", 0, QEMU_OPTION_gtk,
> +    "-gtk            enable GTK (default)\n", QEMU_ARCH_ALL)
> +STEXI
> +@item -gtk
> +@findex -gtk
> +Enable GTK.
> +ETEXI

We try to avoid adding new "-foo" options.  All of them invariably end
up requiring some sort of suboption, which is why we have "-display" now.

>  DEF("spice", HAS_ARG, QEMU_OPTION_spice,
>      "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
>      "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
> @@ -1228,7 +1236,7 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
>  STEXI
>  @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
>  @findex -vnc
> -Normally, QEMU uses SDL to display the VGA output.  With this option,
> +Normally, QEMU uses GTK to display the VGA output.  With this option,

Same as above ("GTK or SDL").

Thanks,

Paolo

>  you can have QEMU listen on VNC display @var{display} and redirect the VGA
>  display over the VNC session.  It is very useful to enable the usb
>  tablet device when using this option (option @option{-usbdevice
> 

