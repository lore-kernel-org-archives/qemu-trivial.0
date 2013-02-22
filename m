Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8y2P-0001UG-56
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 14:12:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8y2M-0001TA-81
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 14:12:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8y2F-0005MZ-AT
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 14:12:02 -0500
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:45927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8y2E-0005MK-PZ
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 14:11:55 -0500
Received: from /spool/local
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Sat, 23 Feb 2013 05:04:39 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 23 Feb 2013 05:04:37 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 760382CE8023;
	Sat, 23 Feb 2013 06:11:51 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r1MJBlA850724948; Sat, 23 Feb 2013 06:11:49 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r1MJBniJ032554; Sat, 23 Feb 2013 06:11:49 +1100
Received: from titi.na.relay.ibm.com (sig-9-65-10-252.mts.ibm.com
	[9.65.10.252])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r1MJBjYT032519; Sat, 23 Feb 2013 06:11:47 +1100
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
In-Reply-To: <1361554844-21054-1-git-send-email-sw@weilnetz.de>
References: <1361554844-21054-1-git-send-email-sw@weilnetz.de>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Fri, 22 Feb 2013 13:11:44 -0600
Message-ID: <878v6gupsf.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13022219-3568-0000-0000-0000033285AB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.142
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/gtk: Use menu item from
	stock for full screen
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
X-List-Received-Date: Fri, 22 Feb 2013 19:12:03 -0000

Stefan Weil <sw@weilnetz.de> writes:

> This reduces the required translations and gives a nicer menu
> with an icon.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  po/de_DE.po    |    4 ----
>  po/it.po       |    4 ----
>  po/messages.po |    4 ----
>  ui/gtk.c       |    3 ++-
>  4 files changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/po/de_DE.po b/po/de_DE.po
> index cb74d7c..8755783 100644
> --- a/po/de_DE.po
> +++ b/po/de_DE.po
> @@ -24,10 +24,6 @@ msgstr "_Datei"
>  msgid "_View"
>  msgstr "_Ansicht"
>=20=20
> -#: ../ui/gtk.c:1002
> -msgid "_Full Screen"
> -msgstr "Voll_bild"
> -
>  #: ../ui/gtk.c:1029
>  msgid "Zoom To _Fit"
>  msgstr "Auf _Fenstergr=C3=B6=C3=9Fe skalieren"
> diff --git a/po/it.po b/po/it.po
> index 2b23491..7d77fff 100644
> --- a/po/it.po
> +++ b/po/it.po
> @@ -24,10 +24,6 @@ msgstr "_File"
>  msgid "_View"
>  msgstr "_Visualizza"
>=20=20
> -#: ../ui/gtk.c:1002
> -msgid "_Full Screen"
> -msgstr "_Schermo intero"
> -
>  #: ../ui/gtk.c:1029
>  msgid "Zoom To _Fit"
>  msgstr "Adatta alla _finestra"
> diff --git a/po/messages.po b/po/messages.po
> index a90cd6f..191e81c 100644
> --- a/po/messages.po
> +++ b/po/messages.po
> @@ -24,10 +24,6 @@ msgstr ""
>  msgid "_View"
>  msgstr ""
>=20=20
> -#: ../ui/gtk.c:1002
> -msgid "_Full Screen"
> -msgstr ""
> -
>  #: ../ui/gtk.c:1029
>  msgid "Zoom To _Fit"
>  msgstr ""
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 57553b2..237f7ad 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1016,7 +1016,8 @@ static void gd_create_menus(GtkDisplayState *s)
>      gtk_menu_set_accel_group(GTK_MENU(s->view_menu), accel_group);
>      s->view_menu_item =3D gtk_menu_item_new_with_mnemonic(_("_View"));
>=20=20
> -    s->full_screen_item =3D gtk_check_menu_item_new_with_mnemonic(_("_Fu=
ll Screen"));
> +    s->full_screen_item =3D
> +        gtk_image_menu_item_new_from_stock(GTK_STOCK_FULLSCREEN,
> NULL);

Good thinking but it needs to stay a check menu item because of the
various calls to gtk_check_menu_item_get_active.

Regards,

Anthony Liguori

>      gtk_menu_item_set_accel_path(GTK_MENU_ITEM(s->full_screen_item),
>                                   "<QEMU>/View/Full Screen");
>      gtk_accel_map_add_entry("<QEMU>/View/Full Screen", GDK_KEY_f, GDK_CO=
NTROL_MASK | GDK_MOD1_MASK);
> --=20
> 1.7.10.4


