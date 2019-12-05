Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ichCv-00089O-Lr
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2019 21:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hhan@redhat.com>) id 1ichCr-000840-Or
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 21:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hhan@redhat.com>) id 1ichCq-0008MP-5b
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 21:49:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33268
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhan@redhat.com>) id 1ichCp-0008KH-UM
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 21:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575514167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INrzNWQ2sEFB49pmeNP5OwZF3YgSouxq+qJpAnZvbAI=;
 b=YPg3aEjr1YF14r5jCsIDVl5BM6BIguytu5o8r5BaQohm6fErrbK0GX5g3jbt9NIhizaNgn
 iQB7caCqvB45/DbCNvWYLYOai2jtI/fVSaEIrlwVylABjNUdlbh8kOKS5N/eLXHYirriCA
 9Y3NFdyRUHRSg0WI0yHfRu4nLiLCICU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-wteKcZ_2NnecS6fc7eOmxw-1; Wed, 04 Dec 2019 21:49:25 -0500
Received: by mail-oi1-f199.google.com with SMTP id q82so946893oih.14
 for <qemu-trivial@nongnu.org>; Wed, 04 Dec 2019 18:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FHyWsJWlmYQyUU2NNNx+HtFBNJMHMBbTGB3Wb/GcF8=;
 b=YHryLHS/0TQflCRjB56bXulMgVu3cAOLB/jzcLQvTD9VU0R3hqxtRwvpqMA6AAJomH
 lygnLVjEHaVUHpCdEVlAPJyZkyOjkl/Loc+xhuueDo0EQdHafteWog8NV2a4Q3xkDmTU
 hx5FObO+WVX5m5eL2xHS3njQQpDsbtgnWK+U5Ij0RBTMS8FlRbB5S8s53b+Q5xmY4vWA
 a82XfMO2MtGNrXBfDFaLxpKjoJ3vqr2KUN5KqHOW4r8k8a6SOr3KnM5Q78O/l7TdfSwV
 FGp/PvYGmrf90R/8U2G1x17yHz9uwmwuNJL3eijcQ7jc+8hYPfRJiOV1dubmZWJ+OzwK
 bEhw==
X-Gm-Message-State: APjAAAUBhZJKtftEidFUd+nVwDTHHPanr7MP0vP5TBWGpv46dIcirZCX
 D4CuinoPIBwxuBLUk/eiC/zE1+N+R6aw2+TlgIUCt/EF0jD60art8og8+LOSjIXMLF9HNNfgqTY
 uox3EteC+8Mxci42BrUHeqEoJ4G45DFA/hw==
X-Received: by 2002:aca:ab85:: with SMTP id u127mr5278978oie.96.1575514164773; 
 Wed, 04 Dec 2019 18:49:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlyAXtUyyxI3QGjsh/EoRk9Z3MpOWYCeWbYx9irJzOxpktrb7T4jsC/UkzgbDqmZXwrH4hX82YzbeQnqp96e4=
X-Received: by 2002:aca:ab85:: with SMTP id u127mr5278972oie.96.1575514164558; 
 Wed, 04 Dec 2019 18:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20191204085628.2892-1-hhan@redhat.com>
 <20191204122140.GI3325@work-vm>
In-Reply-To: <20191204122140.GI3325@work-vm>
From: Han Han <hhan@redhat.com>
Date: Thu, 5 Dec 2019 10:49:13 +0800
Message-ID: <CAHjf+S_qH0MSxQX+A98uVi5iFYPvLd-dzAoArkPFovYGFvLs6A@mail.gmail.com>
Subject: Re: [PATCH] Revert "qemu-options.hx: Update for reboot-timeout
 parameter"
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu
X-MC-Unique: wteKcZ_2NnecS6fc7eOmxw-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="0000000000001e17d70598ebfa3d"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2019 02:49:31 -0000

--0000000000001e17d70598ebfa3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK. Updated in version 2.

On Wed, Dec 4, 2019 at 8:21 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Han Han (hhan@redhat.com) wrote:
> > This reverts commit bbd9e6985ff342cbe15b9cb7eb30e842796fbbe8.
>
> Patchew spotted you're missing the signed-off-by; please send one.
>
> Dave
>
> > In 20a1922032 we allowed reboot-timeout=3D-1 again, so update the doc
> > accordingly.
> > ---
> >  qemu-options.hx | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 65c9473b73..e14d88e9b2 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -327,8 +327,8 @@ format(true color). The resolution should be
> supported by the SVGA mode, so
> >  the recommended is 320x240, 640x480, 800x640.
> >
> >  A timeout could be passed to bios, guest will pause for
> @var{rb_timeout} ms
> > -when boot failed, then reboot. If @option{reboot-timeout} is not set,
> > -guest will not reboot by default. Currently Seabios for X86
> > +when boot failed, then reboot. If @var{rb_timeout} is '-1', guest will
> not
> > +reboot, qemu passes '-1' to bios by default. Currently Seabios for X86
> >  system support it.
> >
> >  Do strict boot via @option{strict=3Don} as far as firmware/BIOS
> > --
> > 2.24.0.rc1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

--=20
Best regards,
-----------------------------------
Han Han
Quality Engineer
Redhat.

Email: hhan@redhat.com
Phone: +861065339333

--0000000000001e17d70598ebfa3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK. Updated in version 2.<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 4, 2019 at 8:21 P=
M Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilber=
t@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">* Han Han (<a href=3D"mailto:hhan@redhat.com" target=3D"_blank"=
>hhan@redhat.com</a>) wrote:<br>
&gt; This reverts commit bbd9e6985ff342cbe15b9cb7eb30e842796fbbe8.<br>
<br>
Patchew spotted you&#39;re missing the signed-off-by; please send one.<br>
<br>
Dave<br>
<br>
&gt; In 20a1922032 we allowed reboot-timeout=3D-1 again, so update the doc<=
br>
&gt; accordingly.<br>
&gt; ---<br>
&gt;=C2=A0 qemu-options.hx | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 65c9473b73..e14d88e9b2 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -327,8 +327,8 @@ format(true color). The resolution should be suppo=
rted by the SVGA mode, so<br>
&gt;=C2=A0 the recommended is 320x240, 640x480, 800x640.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 A timeout could be passed to bios, guest will pause for @var{rb_=
timeout} ms<br>
&gt; -when boot failed, then reboot. If @option{reboot-timeout} is not set,=
<br>
&gt; -guest will not reboot by default. Currently Seabios for X86<br>
&gt; +when boot failed, then reboot. If @var{rb_timeout} is &#39;-1&#39;, g=
uest will not<br>
&gt; +reboot, qemu passes &#39;-1&#39; to bios by default. Currently Seabio=
s for X86<br>
&gt;=C2=A0 system support it.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Do strict boot via @option{strict=3Don} as far as firmware/BIOS<=
br>
&gt; -- <br>
&gt; 2.24.0.rc1<br>
&gt; <br>
--<br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
">Best regards,</div><div dir=3D"ltr">-----------------------------------<b=
r></div><div dir=3D"ltr">Han Han<br>Quality Engineer<br>Redhat.<br><br>Emai=
l: <a href=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@redhat.com</a>=
<br>Phone: +861065339333<br></div></div></div></div></div></div>

--0000000000001e17d70598ebfa3d--


