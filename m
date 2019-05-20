Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hSX7t-0001Fr-Pl
	for mharc-qemu-trivial@gnu.org; Sun, 19 May 2019 21:30:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hSX7r-0001E7-1t
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 21:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hSX7p-0004M9-OJ
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 21:30:03 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1hSX7m-0004Kr-Hn; Sun, 19 May 2019 21:29:58 -0400
Received: by mail-oi1-x241.google.com with SMTP id u199so8800459oie.5;
	Sun, 19 May 2019 18:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S9RNOcgssDqjMUxMAN7FCHPIqt7bbrCMTaGyjBJsw5I=;
	b=DrjGWVE8CJrcWokPgSI35UqKojYyTngbigv0dX3IUMUrlOg17GUZ5O9EPFVRr6zJ2I
	yZ/WExlb/FnHQ/afbh8YLrOorgZ4mTGJw2i2kFOAB4BaPVB8HJmNXhtSYQtpUQavnOG7
	LllCoaC89NzRTmSJRktipd6IVjbt5/bNHFdK6yDqduPd72FnN6tCoL7G7uHXyXZUa7aR
	qg6wQgi/stwtZahi4cXX24hpkmG1zuUo6D/7bGGjXl2BlFh2bDZsz71mFfRUdWT3Aol+
	+iyAkwlEjbvc2K7U+LKXAXF8l7KHOOgqRtw8o2B3RhUrVS8L44E4LmOkVtDNBM0KjR/b
	fQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S9RNOcgssDqjMUxMAN7FCHPIqt7bbrCMTaGyjBJsw5I=;
	b=GB2be2hmMGs4xr2j0TzGJKN33pwtijCISTyCT0C++3vIsAdVvIbE5skAVFwwuQe34g
	AkYsi+K9BF5BDMbViWoQ6gHd+F1DUj1cARgnjaSx+tohD8/U9SPtcQymw1JvBfDVosmw
	ag1NwblUKaQe+T6mY6WiAn4yHYfJL/bSeWlenMfyn7KHGD2ATbkrVrtKma597Klp/QeD
	cVunc17IdbFH6WCparZlWOaQwbl/c4raARbjPmZAlosjGV4rAO1Px8/C+H0Ne+agkNBy
	NRL1kZOf3hHBtgPsmaJbh8lf3YgO4qZKdVBoBsoGmif8whWG9zVR7I6r+dxaudv9ZMQc
	eplQ==
X-Gm-Message-State: APjAAAVKtegnklg0R5Te7OfZPbWo/34QOPeqYFZMXlVAM5LUj01ic3m0
	cYDgrk9QZ1txY9uU0XDCAoZJZpTNo8YsEIKyaGs=
X-Google-Smtp-Source: APXvYqyk7qwpkGaaebF00xshUHpdSJEkEJ2WNcLhAQQSXVCtNPOB/f2YGDXlvxYcLwdJ3eYelrL7uEGVmWpGCYOvWJo=
X-Received: by 2002:aca:fd45:: with SMTP id b66mr22383587oii.157.1558315797622;
	Sun, 19 May 2019 18:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190518032811.60341-1-liq3ea@163.com>
	<20190518032811.60341-2-liq3ea@163.com>
	<20190518082020.6b223ab0@x1.home>
In-Reply-To: <20190518082020.6b223ab0@x1.home>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 20 May 2019 09:29:21 +0800
Message-ID: <CAKXe6SLsoyCh=O1yyOFOukYdFoeySpSS1H8QG7fhp1ZQ35vD+g@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Li Qiang <liq3ea@163.com>, lvivier@redhat.com, 
	Qemu Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000090b617058947abb9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [PATCH 2/4] hw: vfio: drop TYPE_FOO MACRO in
 VMStateDescription
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
X-List-Received-Date: Mon, 20 May 2019 01:30:04 -0000

--00000000000090b617058947abb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex Williamson <alex.williamson@redhat.com> =E4=BA=8E2019=E5=B9=B45=E6=9C=
=8818=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8810:20=E5=86=99=E9=81=93=
=EF=BC=9A

> On Fri, 17 May 2019 20:28:09 -0700
> Li Qiang <liq3ea@163.com> wrote:
>
> > As the vmstate structure names aren't related with
> > the QOM type names.
>
> Seems contrary to the first patch in the series.
>
>
No, once there is a discussion of this:
-->https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02175.html

Thanks,
Li Qiang



> > CC: qemu-trivial@nongnu.org
> > Signed-off-by: Li Qiang <liq3ea@163.com>
> > ---
> >  hw/vfio/amd-xgbe.c      | 2 +-
> >  hw/vfio/ap.c            | 2 +-
> >  hw/vfio/calxeda-xgmac.c | 2 +-
> >  hw/vfio/ccw.c           | 2 +-
> >  hw/vfio/platform.c      | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
> > index ee64a3b4a2..1b06c0f3ea 100644
> > --- a/hw/vfio/amd-xgbe.c
> > +++ b/hw/vfio/amd-xgbe.c
> > @@ -26,7 +26,7 @@ static void amd_xgbe_realize(DeviceState *dev, Error
> **errp)
> >  }
> >
> >  static const VMStateDescription vfio_platform_amd_xgbe_vmstate =3D {
> > -    .name =3D TYPE_VFIO_AMD_XGBE,
> > +    .name =3D "vfio-amd-xgbe",
> >      .unmigratable =3D 1,
> >  };
> >
> > diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> > index d8b79ebe53..564751650f 100644
> > --- a/hw/vfio/ap.c
> > +++ b/hw/vfio/ap.c
> > @@ -155,7 +155,7 @@ static void vfio_ap_reset(DeviceState *dev)
> >  }
> >
> >  static const VMStateDescription vfio_ap_vmstate =3D {
> > -    .name =3D VFIO_AP_DEVICE_TYPE,
> > +    .name =3D "vfio-ap",
> >      .unmigratable =3D 1,
> >  };
> >
> > diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
> > index e7767c4b02..6cc608b6ca 100644
> > --- a/hw/vfio/calxeda-xgmac.c
> > +++ b/hw/vfio/calxeda-xgmac.c
> > @@ -26,7 +26,7 @@ static void calxeda_xgmac_realize(DeviceState *dev,
> Error **errp)
> >  }
> >
> >  static const VMStateDescription vfio_platform_calxeda_xgmac_vmstate =
=3D {
> > -    .name =3D TYPE_VFIO_CALXEDA_XGMAC,
> > +    .name =3D "vfio-calxeda-xgmac",
> >      .unmigratable =3D 1,
> >  };
> >
> > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > index 31dd3a2a87..d9e39552e2 100644
> > --- a/hw/vfio/ccw.c
> > +++ b/hw/vfio/ccw.c
> > @@ -468,7 +468,7 @@ static Property vfio_ccw_properties[] =3D {
> >  };
> >
> >  static const VMStateDescription vfio_ccw_vmstate =3D {
> > -    .name =3D TYPE_VFIO_CCW,
> > +    .name =3D "vfio-ccw",
> >      .unmigratable =3D 1,
> >  };
> >
> > diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> > index 398db38f14..e59a0234dd 100644
> > --- a/hw/vfio/platform.c
> > +++ b/hw/vfio/platform.c
> > @@ -697,7 +697,7 @@ out:
> >  }
> >
> >  static const VMStateDescription vfio_platform_vmstate =3D {
> > -    .name =3D TYPE_VFIO_PLATFORM,
> > +    .name =3D "vfio-platform",
> >      .unmigratable =3D 1,
> >  };
> >
>
>

--00000000000090b617058947abb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alex Williamson &lt;<a href=3D"mailto=
:alex.williamson@redhat.com">alex.williamson@redhat.com</a>&gt; =E4=BA=8E20=
19=E5=B9=B45=E6=9C=8818=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8810:20=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, 17 May 2019 20:28:09 -0700<br>
Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com" target=3D"_blank">liq3ea@163=
.com</a>&gt; wrote:<br>
<br>
&gt; As the vmstate structure names aren&#39;t related with<br>
&gt; the QOM type names.<br>
<br>
Seems contrary to the first patch in the series.<br>
<br></blockquote><div><br></div><div>No, once there is a discussion of this=
:</div><div>--&gt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/=
2018-10/msg02175.html">https://lists.gnu.org/archive/html/qemu-devel/2018-1=
0/msg02175.html</a></div><div><br></div><div>Thanks,</div><div>Li Qiang</di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; CC: <a href=3D"mailto:qemu-trivial@nongnu.org" target=3D"_blank">qemu-=
trivial@nongnu.org</a><br>
&gt; Signed-off-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com" target=
=3D"_blank">liq3ea@163.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/vfio/amd-xgbe.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/vfio/ap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/vfio/calxeda-xgmac.c | 2 +-<br>
&gt;=C2=A0 hw/vfio/ccw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 hw/vfio/platform.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 5 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c<br>
&gt; index ee64a3b4a2..1b06c0f3ea 100644<br>
&gt; --- a/hw/vfio/amd-xgbe.c<br>
&gt; +++ b/hw/vfio/amd-xgbe.c<br>
&gt; @@ -26,7 +26,7 @@ static void amd_xgbe_realize(DeviceState *dev, Error=
 **errp)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const VMStateDescription vfio_platform_amd_xgbe_vmstate =
=3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D TYPE_VFIO_AMD_XGBE,<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;vfio-amd-xgbe&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .unmigratable =3D 1,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c<br>
&gt; index d8b79ebe53..564751650f 100644<br>
&gt; --- a/hw/vfio/ap.c<br>
&gt; +++ b/hw/vfio/ap.c<br>
&gt; @@ -155,7 +155,7 @@ static void vfio_ap_reset(DeviceState *dev)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const VMStateDescription vfio_ap_vmstate =3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D VFIO_AP_DEVICE_TYPE,<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;vfio-ap&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .unmigratable =3D 1,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c<br>
&gt; index e7767c4b02..6cc608b6ca 100644<br>
&gt; --- a/hw/vfio/calxeda-xgmac.c<br>
&gt; +++ b/hw/vfio/calxeda-xgmac.c<br>
&gt; @@ -26,7 +26,7 @@ static void calxeda_xgmac_realize(DeviceState *dev, =
Error **errp)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const VMStateDescription vfio_platform_calxeda_xgmac_vmst=
ate =3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D TYPE_VFIO_CALXEDA_XGMAC,<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;vfio-calxeda-xgmac&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .unmigratable =3D 1,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c<br>
&gt; index 31dd3a2a87..d9e39552e2 100644<br>
&gt; --- a/hw/vfio/ccw.c<br>
&gt; +++ b/hw/vfio/ccw.c<br>
&gt; @@ -468,7 +468,7 @@ static Property vfio_ccw_properties[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const VMStateDescription vfio_ccw_vmstate =3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D TYPE_VFIO_CCW,<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;vfio-ccw&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .unmigratable =3D 1,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c<br>
&gt; index 398db38f14..e59a0234dd 100644<br>
&gt; --- a/hw/vfio/platform.c<br>
&gt; +++ b/hw/vfio/platform.c<br>
&gt; @@ -697,7 +697,7 @@ out:<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const VMStateDescription vfio_platform_vmstate =3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D TYPE_VFIO_PLATFORM,<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;vfio-platform&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .unmigratable =3D 1,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
<br>
</blockquote></div></div>

--00000000000090b617058947abb9--

