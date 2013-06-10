Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um7VN-00066e-2X
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 15:11:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1Um7VK-00066R-GC
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 15:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1Um7VI-0002G3-Ox
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 15:11:46 -0400
Received: from e36.co.us.ibm.com ([32.97.110.154]:40676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1Um7VI-0002Fp-Ir
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 15:11:44 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Mon, 10 Jun 2013 13:11:41 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 10 Jun 2013 13:11:39 -0600
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com
	[9.17.195.226])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 5EA643E40042;
	Mon, 10 Jun 2013 13:11:20 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r5AJBAZk085170; Mon, 10 Jun 2013 13:11:11 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r5AJBNf9017593; Mon, 10 Jun 2013 13:11:24 -0600
Received: from titi.na.relay.ibm.com (sig-9-65-97-46.mts.ibm.com [9.65.97.46])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP
	id r5AJAZGG010627; Mon, 10 Jun 2013 13:11:21 -0600
From: Anthony Liguori <aliguori@us.ibm.com>
To: Peter Wu <lekensteyn@gmail.com>
In-Reply-To: <1502140.O0l1epaFmp@al>
References: <1502140.O0l1epaFmp@al>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 10 Jun 2013 14:09:49 -0500
Message-ID: <87ehc9lr42.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13061019-7606-0000-0000-00000C583688
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.154
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] gtk: implement
	-full-screen
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
X-List-Received-Date: Mon, 10 Jun 2013 19:11:48 -0000

Peter Wu <lekensteyn@gmail.com> writes:

> Aiming for GTK as replacement for SDL, a feature like -full-screen should also
> be implemented.
>
> Bringing the window into full-screen mode is done by activating the "Fullscreen"
> menu item. This is done after showing the windows to make the cursor and menu
> hidden.
>
> v2: drop -no-frame implementation, use booleans instead of ints and ensure
>     consistency between ui state and menu.
>
> Signed-off-by: Peter Wu <lekensteyn@gmail.com>

Reviewed-by: Anthony Liguori <aliguori@us.ibm.com>

Regards,

Anthony Liguori

> ---
>  include/ui/console.h | 2 +-
>  ui/gtk.c             | 6 +++++-
>  vl.c                 | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 4307b5f..f1d79f9 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -339,6 +339,6 @@ int index_from_keycode(int code);
>  
>  /* gtk.c */
>  void early_gtk_display_init(void);
> -void gtk_display_init(DisplayState *ds);
> +void gtk_display_init(DisplayState *ds, bool full_screen);
>  
>  #endif
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 3bc2842..1c625c0 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1433,7 +1433,7 @@ static const DisplayChangeListenerOps dcl_ops = {
>      .dpy_cursor_define = gd_cursor_define,
>  };
>  
> -void gtk_display_init(DisplayState *ds)
> +void gtk_display_init(DisplayState *ds, bool full_screen)
>  {
>      GtkDisplayState *s = g_malloc0(sizeof(*s));
>      char *filename;
> @@ -1509,6 +1509,10 @@ void gtk_display_init(DisplayState *ds)
>  
>      gtk_widget_show_all(s->window);
>  
> +    if (full_screen) {
> +        gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
> +    }
> +
>      register_displaychangelistener(&s->dcl);
>  
>      global_state = s;
> diff --git a/vl.c b/vl.c
> index 47ab45d..cfd2d3e 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4347,7 +4347,7 @@ int main(int argc, char **argv, char **envp)
>  #endif
>  #if defined(CONFIG_GTK)
>      case DT_GTK:
> -        gtk_display_init(ds);
> +        gtk_display_init(ds, full_screen);
>          break;
>  #endif
>      default:
> -- 
> 1.8.3


