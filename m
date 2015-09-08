Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZJLR-00088y-FQ
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 09:53:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZZJLJ-0007vd-IR
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 09:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZZJLF-00077x-0q
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 09:53:49 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:58889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZZJLE-00077X-O7; Tue, 08 Sep 2015 09:53:44 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id t88Drhg1008289;
	Tue, 8 Sep 2015 09:53:43 -0400
Date: Tue, 8 Sep 2015 09:53:43 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Message-ID: <1917133616.27415210.1441720423804.JavaMail.zimbra@redhat.com>
In-Reply-To: <1441708475-27578-1-git-send-email-berrange@redhat.com>
References: <1441708475-27578-1-git-send-email-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF39 (Win)/8.0.6_GA_5922)
Thread-Topic: avoid redefining _WIN32_WINNT macro
Thread-Index: cK+kv48LHJadkr5WG7FoFy8n7xHqAA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] gtk: avoid redefining _WIN32_WINNT
	macro
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
X-List-Received-Date: Tue, 08 Sep 2015 13:53:53 -0000



----- Messaggio originale -----
> Da: "Daniel P. Berrange" <berrange@redhat.com>
> A: qemu-devel@nongnu.org
> Cc: "Gerd Hoffmann" <kraxel@redhat.com>, qemu-trivial@nongnu.org, "Paolo =
Bonzini" <pbonzini@redhat.com>, "Stefan
> Weil" <sw@weilnetz.de>, "Daniel P. Berrange" <berrange@redhat.com>
> Inviato: Marted=C3=AC, 8 settembre 2015 12:34:35
> Oggetto: [PATCH v2] gtk: avoid redefining _WIN32_WINNT macro
>=20
> When building for Mingw64 target on Fedora 22 a warning
> is issued about _WIN32_WINNT being redefined.
>=20
> In file included from ui/gtk.c:40:0:
> include/ui/gtk.h:5:0: warning: "_WIN32_WINNT" redefined
>  # define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_=
VSC
>  */
>   ^
> In file included from
> /usr/i686-w64-mingw32/sys-root/mingw/include/crtdefs.h:10:0,
>                  from /usr/i686-w64-mingw32/sys-root/mingw/include/stdio.=
h:9,
>                  from
>                  /home/berrange/src/virt/qemu/include/qemu/fprintf-fn.h:1=
2,
>                  from /home/berrange/src/virt/qemu/include/qemu-common.h:=
18,
>                  from ui/gtk.c:37:
> /usr/i686-w64-mingw32/sys-root/mingw/include/_mingw.h:225:0: note: this i=
s
> the location of the previous definition
>  #define _WIN32_WINNT 0x502
>  ^
>=20
> Rather than try to get MAPVK_VK_TO_VSC defined indirectly
> by defining _WIN32_WINNT, instead just define it explicitly
> if missing.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  include/ui/gtk.h | 4 ----
>  ui/gtk.c         | 9 +++++++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index ee6dffd..0359333 100644
> --- a/include/ui/gtk.h
> +++ b/include/ui/gtk.h
> @@ -1,10 +1,6 @@
>  #ifndef UI_GTK_H
>  #define UI_GTK_H
> =20
> -#ifdef _WIN32
> -# define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_=
VSC
> */
> -#endif
> -
>  #ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>  /* Work around an -Wstrict-prototypes warning in GTK headers */
>  #pragma GCC diagnostic push
> diff --git a/ui/gtk.c b/ui/gtk.c
> index df2a79e..80d5c20 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -104,6 +104,15 @@
>  #define GDK_KEY_Pause GDK_Pause
>  #endif
> =20
> +/* Some older mingw versions lack this constant or have
> + * it conditionally defined */
> +#ifdef _WIN32
> +# ifndef MAPVK_VK_TO_VSC
> +#  define MAPVK_VK_TO_VSC 0
> +# endif
> +#endif
> +
> +
>  #define HOTKEY_MODIFIERS        (GDK_CONTROL_MASK | GDK_MOD1_MASK)
> =20
>  static const int modifier_keycode[] =3D {
> --
> 2.4.3
>=20
>=20

Nice, thanks!

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

