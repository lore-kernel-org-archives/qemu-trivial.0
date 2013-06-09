Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlkQZ-0002QW-EK
	for mharc-qemu-trivial@gnu.org; Sun, 09 Jun 2013 14:33:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UlkQX-0002QE-11
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 14:33:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UlkQV-0002fj-NT
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 14:33:16 -0400
Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233]:48895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UlkQV-0002fT-J2
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 14:33:15 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so912521oah.24
	for <qemu-trivial@nongnu.org>; Sun, 09 Jun 2013 11:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=NenwlqJvJNKLPXrh7B1r2FQwyWmW/zazeiokAM8dFq4=;
	b=dvdVBOabmMS8oj4yQs3A01mOtysQFpW3XmKpyHObaHqbsnCt8D6FvXs2PddYYdKOCl
	so+mArJ7Q16sWN4cawjFpozR3JPBu9zi/jRb3ZKsaKknM6WXiALk44guX0sNNKyoVZ8y
	j719hYouRPajJ5GhI5sZGb8+LA7mn+fDvFrIMBN7zT+hZbxDseL1TshcEavYGPdyF1Ez
	CqcRn7Bw+AsrCJX0kdDK7ecMakBU9aXTTSD6HclhN8OA47GU0gCZ6PY0dPugVfzL45VT
	hpBWXBer8rZl5T5tknzY7brEeJAHKaaSuz/d6i/91qqaxyM+mz+qETjXIoh+uVsRnqAK
	XX3A==
MIME-Version: 1.0
X-Received: by 10.60.77.10 with SMTP id o10mr5411345oew.86.1370802794457; Sun,
	09 Jun 2013 11:33:14 -0700 (PDT)
Received: by 10.60.144.198 with HTTP; Sun, 9 Jun 2013 11:33:14 -0700 (PDT)
In-Reply-To: <11837115.9GZ72nQAUt@al>
References: <11837115.9GZ72nQAUt@al>
Date: Sun, 9 Jun 2013 13:33:14 -0500
Message-ID: <CA+aC4ktaHDBRywD6fReNWW5eNmOkr-TGBYjGXY426uMF=GMftw@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Peter Wu <lekensteyn@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQmM1AdHivU80ggaB2UtaSc/8Cll6U2O7XDjc3F0/NS+C8QreZ7S+0tRd3CJfGkvnTJI7l8+
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::233
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
X-List-Received-Date: Sun, 09 Jun 2013 18:33:18 -0000

On Sun, Jun 9, 2013 at 5:30 AM, Peter Wu <lekensteyn@gmail.com> wrote:
> Aiming for GTK as replacement for SDL, features like -full-screen and -no-frame
> should also be implemented.
>
> Bringing the window into full-screen mode is done by faking activating the full
> screen menu item with a NULL menu item (which currently is not used by
> gd_menu_full_screen). This is done after showing the windows to make the cursor
> and menu hidden.
>
> Signed-off-by: Peter Wu <lekensteyn@gmail.com>
> ---
>  include/ui/console.h |  2 +-
>  ui/gtk.c             | 10 +++++++++-
>  vl.c                 |  2 +-
>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 4307b5f..7174ba9 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -339,6 +339,6 @@ int index_from_keycode(int code);
>
>  /* gtk.c */
>  void early_gtk_display_init(void);
> -void gtk_display_init(DisplayState *ds);
> +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame);
>
>  #endif
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 3bc2842..3df2611 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1433,7 +1433,7 @@ static const DisplayChangeListenerOps dcl_ops = {
>      .dpy_cursor_define = gd_cursor_define,
>  };
>
> -void gtk_display_init(DisplayState *ds)
> +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame)
>  {
>      GtkDisplayState *s = g_malloc0(sizeof(*s));
>      char *filename;
> @@ -1457,6 +1457,10 @@ void gtk_display_init(DisplayState *ds)
>      s->scale_y = 1.0;
>      s->free_scale = FALSE;
>
> +    if (no_frame) {
> +        gtk_window_set_decorated(GTK_WINDOW(s->window), FALSE);
> +    }
> +

Is this really desirable?  Why do people use -no-frame?  I don't think
we should carry over features from SDL just because they are there.

>      setlocale(LC_ALL, "");
>      bindtextdomain("qemu", CONFIG_QEMU_LOCALEDIR);
>      textdomain("qemu");
> @@ -1509,6 +1513,10 @@ void gtk_display_init(DisplayState *ds)
>
>      gtk_widget_show_all(s->window);
>
> +    if (full_screen) {
> +        gd_menu_full_screen(NULL, s);
> +    }
> +

You should activate the menu item by using gtk_check_menu_item_set_active().

Otherwise the menu with be out of sync with the UI state.

Regards,

Anthony Liguori

>      register_displaychangelistener(&s->dcl);
>
>      global_state = s;
> diff --git a/vl.c b/vl.c
> index 47ab45d..5a00710 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4347,7 +4347,7 @@ int main(int argc, char **argv, char **envp)
>  #endif
>  #if defined(CONFIG_GTK)
>      case DT_GTK:
> -        gtk_display_init(ds);
> +        gtk_display_init(ds, full_screen, no_frame);
>          break;
>  #endif
>      default:
> --
> 1.8.3
>
>
>

