Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8O-0002Ik-Lv
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uoln1-0002Pr-I0
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uoln0-00041l-Ai
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:36:59 -0400
Received: from [222.73.24.84] (port=18266 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uolmx-00041B-CU; Mon, 17 Jun 2013 22:36:55 -0400
X-IronPort-AV: E=Sophos;i="4.87,885,1363104000"; 
   d="scan'208";a="7583487"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 10:33:59 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I2ariY010798;
	Tue, 18 Jun 2013 10:36:53 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061810345111-2220536 ;
	Tue, 18 Jun 2013 10:34:51 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51B70F11.7090101@msgid.tls.msk.ru>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51B70F11.7090101@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 10:34:43 +0800
Message-ID: <1371522883.31705.31.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 10:34:51,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 10:34:51,
	Serialize complete at 2013/06/18 10:34:51
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:19 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] vnc: pass bool
 pararmeter for vnc_connect
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
X-List-Received-Date: Tue, 18 Jun 2013 02:37:01 -0000

=E5=9C=A8 2013-06-11=E4=BA=8C=E7=9A=84 15:50 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 11.06.2013 09:15, liguang wrote:
> > type last parameter of vnc_connect if bool,
> > so pass 'false' instead of '0' for it.
>=20
> There's another parameter in here, `skipauth', which should be
> bool in vnc_connect(), and should be bool in vnc_display_add_client()
> too.
>=20
> Also, there's no big point in splitting 1/5 and 2/5 (vnc_listen_read),
> I think.
>=20
> Does something like the below look ok? (not even compile-tested)

OK for me.

> (and I'd really rename `skipauth' to `doauth' everywhere, to mean
> exactly the opposite so that we don't have double negatives, but
> it is too late already)
>=20
> From: Michael Tokarev <mjt@tls.msk.ru>
> Date:   Tue Jun 11 15:42:44 2013 +0400
>=20
>     vnc: use booleans for vnc_connect, vnc_listen_read and vnc_display_ad=
d_client
>=20
>     Some arguments to these functions are booleans - either by declaratio=
n,
>     or by actual usage, but sometimes value of 0 or 1 is passed for a boo=
l,
>     and sometimes it is declared as int but a bool value, or true/false,
>     is passed to it instead.  Clean it up a bit.
>=20
>     Cc: liguang <lig.fnst@cn.fujitsu.com>
>     Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>=20
> diff --git a/include/ui/console.h b/include/ui/console.h
> index f1d79f9..98edf41 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -314,7 +314,7 @@ void cocoa_display_init(DisplayState *ds, int full_sc=
reen);
>  /* vnc.c */
>  void vnc_display_init(DisplayState *ds);
>  void vnc_display_open(DisplayState *ds, const char *display, Error **err=
p);
> -void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
> +void vnc_display_add_client(DisplayState *ds, int csock, bool skipauth);
>  char *vnc_display_local_addr(DisplayState *ds);
>  #ifdef CONFIG_VNC
>  int vnc_display_password(DisplayState *ds, const char *password);
> diff --git a/ui/vnc.c b/ui/vnc.c
> index dfc7459..5601cc3 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2771,7 +2771,8 @@ static void vnc_refresh(DisplayChangeListener *dcl)
>      }
>  }
>=20
> -static void vnc_connect(VncDisplay *vd, int csock, int skipauth, bool we=
bsocket)
> +static void vnc_connect(VncDisplay *vd, int csock,
> +                        bool skipauth, bool websocket)
>  {
>      VncState *vs =3D g_malloc0(sizeof(VncState));
>      int i;
> @@ -2883,19 +2884,19 @@ static void vnc_listen_read(void *opaque, bool we=
bsocket)
>      }
>=20
>      if (csock !=3D -1) {
> -        vnc_connect(vs, csock, 0, websocket);
> +        vnc_connect(vs, csock, false, websocket);
>      }
>  }
>=20
>  static void vnc_listen_regular_read(void *opaque)
>  {
> -    vnc_listen_read(opaque, 0);
> +    vnc_listen_read(opaque, false);
>  }
>=20
>  #ifdef CONFIG_VNC_WS
>  static void vnc_listen_websocket_read(void *opaque)
>  {
> -    vnc_listen_read(opaque, 1);
> +    vnc_listen_read(opaque, true);
>  }
>  #endif /* CONFIG_VNC_WS */
>=20
> @@ -3283,7 +3284,7 @@ void vnc_display_open(DisplayState *ds, const char =
*display, Error **errp)
>          if (csock < 0) {
>              goto fail;
>          }
> -        vnc_connect(vs, csock, 0, 0);
> +        vnc_connect(vs, csock, false, false);
>      } else {
>          /* listen for connects */
>          char *dpy;
> @@ -3341,9 +3342,9 @@ fail:
>  #endif /* CONFIG_VNC_WS */
>  }
>=20
> -void vnc_display_add_client(DisplayState *ds, int csock, int skipauth)
> +void vnc_display_add_client(DisplayState *ds, int csock, bool skipauth)
>  {
>      VncDisplay *vs =3D vnc_display;
>=20
> -    vnc_connect(vs, csock, skipauth, 0);
> +    vnc_connect(vs, csock, skipauth, false);
>  }
>=20
>=20



