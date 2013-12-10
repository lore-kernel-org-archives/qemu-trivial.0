Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VqPAM-0007rf-6l
	for mharc-qemu-trivial@gnu.org; Tue, 10 Dec 2013 10:24:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VqPAF-0007f2-Dm
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 10:24:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VqPA8-0005cV-Ai
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 10:23:59 -0500
Received: from mail-oa0-f50.google.com ([209.85.219.50]:63100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VqPA8-0005cG-6V
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 10:23:52 -0500
Received: by mail-oa0-f50.google.com with SMTP id n16so5660003oag.23
	for <qemu-trivial@nongnu.org>; Tue, 10 Dec 2013 07:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=W9Kl40nevoL42A8kJ0dkIe+6i1on24fsgKO/+rIky3o=;
	b=kVSafID2UlwyKu/Zn1ZaCQ2ky9ABHWB6HmeeZeIwLa/cr35uTF6tSFrjDCxNY8uTuU
	9C/l9zdWYknEcUJoAUInSkySK9BjEbnxH5XzYfPcIYH5Sik4/uTXX1ntlOdIKTFMtj1y
	u/b96PYANotd4uLPEf8oxCKSvwzajwU73FBlY2B9v9+Ydcj1OverZhtujnvXP5l0vODy
	sWtgt3gDCh7M1FK+QxCeEeEN7tQHooCEhiqzeT7iDMOzd6TaX7mh6TLMBNYC97PrncIs
	cerwGPmMjQ5vv/qWjGYY9TcM3y2CQlPlf5iKxqOCaULemUlKayLlPqxBqjV5IYcC2Dc2
	Chiw==
X-Gm-Message-State: ALoCoQmPxVFJoTDDU+uvpU4W4A1UUOinJ4tEES5/4cVobCX3nrTyoH6xdYt12OilgTa1kZlwZJQJ
MIME-Version: 1.0
X-Received: by 10.60.150.238 with SMTP id ul14mr17153369oeb.28.1386689031461; 
	Tue, 10 Dec 2013 07:23:51 -0800 (PST)
Received: by 10.60.157.228 with HTTP; Tue, 10 Dec 2013 07:23:51 -0800 (PST)
Received: by 10.60.157.228 with HTTP; Tue, 10 Dec 2013 07:23:51 -0800 (PST)
In-Reply-To: <87a9g8lxb5.fsf@blackfin.pond.sub.org>
References: <1386675153-1147-1-git-send-email-imammedo@redhat.com>
	<87a9g8lxb5.fsf@blackfin.pond.sub.org>
Date: Tue, 10 Dec 2013 07:23:51 -0800
Message-ID: <CA+aC4kuKzJ4_i8jQj3zkhO301MGsp_DvrNnCsWMXfwXQKyvbTg@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary=047d7b5d35b822882604ed2fb33c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.50
Cc: qemu-trivial <qemu-trivial@nongnu.org>, sw@weilnetz.de, mjt@tls.msk.ru,
	qemu-devel <qemu-devel@nongnu.org>, kraxel@redhat.com,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix build regression in
 qxl-render.c caused by ac86048
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
X-List-Received-Date: Tue, 10 Dec 2013 15:24:05 -0000

--047d7b5d35b822882604ed2fb33c
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I'll commit in a few hours

Regards,

Anthony Liguori
On Dec 10, 2013 4:37 AM, "Markus Armbruster" <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
>
> > fixes regression caused by commit
> >   ac86048 trace: Remove trace.h from console.h (less dependencies)
> > which makes build fail with:
> >
> > hw/display/qxl-render.c: In function =91qxl_blit=92:
> > hw/display/qxl-render.c:34:5: error: implicit declaration of function
> =91trace_qxl_render_blit=92 [-Werror=3Dimplicit-function-declaration]
> >      trace_qxl_render_blit(qxl->guest_primary.qxl_stride,
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/display/qxl-render.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> > index d34b0c4..84f1367 100644
> > --- a/hw/display/qxl-render.c
> > +++ b/hw/display/qxl-render.c
> > @@ -20,6 +20,7 @@
> >   */
> >
> >  #include "qxl.h"
> > +#include "trace.h"
> >
> >  static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
> >  {
>
> Fix is pending already:
> https://lists.nongnu.org/archive/html/qemu-devel/2013-12/msg01314.html
>
>

--047d7b5d35b822882604ed2fb33c
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I&#39;ll commit in a few hours</p>
<p dir=3D"ltr">Regards,</p>
<p dir=3D"ltr">Anthony Liguori</p>
<div class=3D"gmail_quote">On Dec 10, 2013 4:37 AM, &quot;Markus Armbruster=
&quot; &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; w=
rote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.co=
m</a>&gt; writes:<br>
<br>
&gt; fixes regression caused by commit<br>
&gt; =A0 ac86048 trace: Remove trace.h from console.h (less dependencies)<b=
r>
&gt; which makes build fail with:<br>
&gt;<br>
&gt; hw/display/qxl-render.c: In function =91qxl_blit=92:<br>
&gt; hw/display/qxl-render.c:34:5: error: implicit declaration of function =
=91trace_qxl_render_blit=92 [-Werror=3Dimplicit-function-declaration]<br>
&gt; =A0 =A0 =A0trace_qxl_render_blit(qxl-&gt;guest_primary.qxl_stride,<br>
&gt;<br>
&gt; Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com=
">imammedo@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0hw/display/qxl-render.c | 1 +<br>
&gt; =A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c<br>
&gt; index d34b0c4..84f1367 100644<br>
&gt; --- a/hw/display/qxl-render.c<br>
&gt; +++ b/hw/display/qxl-render.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt; =A0 */<br>
&gt;<br>
&gt; =A0#include &quot;qxl.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt;<br>
&gt; =A0static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)<br>
&gt; =A0{<br>
<br>
Fix is pending already:<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2013-12/msg0131=
4.html" target=3D"_blank">https://lists.nongnu.org/archive/html/qemu-devel/=
2013-12/msg01314.html</a><br>
<br>
</blockquote></div>

--047d7b5d35b822882604ed2fb33c--

