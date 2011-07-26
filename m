Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlXSV-0005gI-Bv
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 22:33:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1QlXSS-0005Wl-Vf
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 22:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1QlXSR-0000fN-Dp
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 22:33:20 -0400
Received: from e4.ny.us.ibm.com ([32.97.182.144]:40779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>)
	id 1QlXSP-0000eL-Ke; Mon, 25 Jul 2011 22:33:17 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6Q2AGd1025144;
	Mon, 25 Jul 2011 22:10:16 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6Q2WjaH345224; Mon, 25 Jul 2011 22:32:45 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p6PMWWCK010112; Mon, 25 Jul 2011 19:32:32 -0300
Received: from [9.65.156.9] (sig-9-65-156-9.mts.ibm.com [9.65.156.9])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6PMWVE5010104; Mon, 25 Jul 2011 19:32:32 -0300
Message-ID: <4E2E274B.9020608@us.ibm.com>
Date: Mon, 25 Jul 2011 21:32:43 -0500
From: Anthony Liguori <aliguori@us.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: TeLeMan <geleman@gmail.com>
References: <1311647049-1896-1-git-send-email-geleman@gmail.com>
In-Reply-To: <1311647049-1896-1-git-send-email-geleman@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.144
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] console: Don't expose the the ui
 module's functions when the	module is not available.
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
X-List-Received-Date: Tue, 26 Jul 2011 02:33:21 -0000

On 07/25/2011 09:24 PM, TeLeMan wrote:
> If there is no sdl support, the implement of sdl_display_init() is missing and its declaration should not be exposed.
> vnc, cocoa, curses and other ui modules are the same as sdl.
>
> Signed-off-by: TeLeMan<geleman@gmail.com>

Nack.

There's no harm in exposing these and it avoids cluttered #ifdefs.

Regards,

Anthony Liguori

> ---
>   console.h |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/console.h b/console.h
> index 67d1373..ede8bea 100644
> --- a/console.h
> +++ b/console.h
> @@ -363,19 +363,24 @@ void qemu_console_copy(DisplayState *ds, int src_x, int src_y,
>                          int dst_x, int dst_y, int w, int h);
>
>   /* sdl.c */
> +#ifdef CONFIG_SDL
>   void sdl_display_init(DisplayState *ds, int full_screen, int no_frame);
> +#endif
>
>   /* cocoa.m */
> +#ifdef CONFIG_COCOA
>   void cocoa_display_init(DisplayState *ds, int full_screen);
> +#endif
>
>   /* vnc.c */
> +#ifdef CONFIG_VNC
>   void vnc_display_init(DisplayState *ds);
>   void vnc_display_close(DisplayState *ds);
>   int vnc_display_open(DisplayState *ds, const char *display);
>   void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
>   int vnc_display_disable_login(DisplayState *ds);
>   char *vnc_display_local_addr(DisplayState *ds);
> -#ifdef CONFIG_VNC
> +
>   int vnc_display_password(DisplayState *ds, const char *password);
>   int vnc_display_pw_expire(DisplayState *ds, time_t expires);
>   void do_info_vnc_print(Monitor *mon, const QObject *data);
> @@ -401,6 +406,8 @@ static inline void do_info_vnc_print(Monitor *mon, const QObject *data)
>   #endif
>
>   /* curses.c */
> +#ifdef CONFIG_CURSES
>   void curses_display_init(DisplayState *ds, int full_screen);
> +#endif
>
>   #endif


