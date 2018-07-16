Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ff8aB-0004oa-B4
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2018 14:50:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krinkin.m.u@gmail.com>) id 1ff8a9-0004n1-0h
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 14:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krinkin.m.u@gmail.com>) id 1ff8a7-0000D5-Hk
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 14:50:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <krinkin.m.u@gmail.com>)
	id 1ff8a4-0000C8-W8; Mon, 16 Jul 2018 14:50:45 -0400
Received: by mail-wr1-x441.google.com with SMTP id e7-v6so13375174wrs.9;
	Mon, 16 Jul 2018 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nlb0UaJ00AjhLkJCUuWfB1Xc/nonGL/laQksnd0CKTo=;
	b=GCx7j/SGCRQUozyiLk8JhMjprjVANCjKCtQsaD0rcPhaJ57Lxx+1Z0LNLj9XM5otDo
	yaA9GQLU7p8QM9olDuTGfCvsYaRfecEXvXOf6QN24NWKu5ifnGPHaiapz4BnBORcNyGJ
	qlDfaJhgap720qwKoAUcUhA0QpJWfgcSfVWRytZD/gHRQDvKLZcCpFoWZzucfXX0BHst
	UgdVInz3FfQR46venyqW8A6YkxGc7bj8Tu3TpKEHrhQbysFae01qkNZP4MZjw0o47hqT
	5XWURAPP9Pq/RiyroOIFBQ4vUKlUOmCtmTzRPaad+BniG2baeOBfVkj8a/PmX9cj1Iq9
	1Ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nlb0UaJ00AjhLkJCUuWfB1Xc/nonGL/laQksnd0CKTo=;
	b=B7adLVVpu8NPjOOGeAnUQGv0f5SZtpTtvBCuRJHHi5MwKav0eOqfmfrphoXWXcuYrL
	XBiz7lOUgM6HihjQ6HNR3Cvi0ev+4OJ9gb0FnTe4DHlx/FExJUL2lCs/yL65QZC4oOOt
	tOZJBBs6DfPij6898xwJVwoSucNnQE008bGpOWot4VGL01+DwXjkgcIGrB979iTJ9oN5
	dfeGEnPMDjn3tp4lJXoBE0hiUWeP3/czkx+PBGp0PFgnQlSGRzjywRdtYwr2v5I7+IHa
	ZaiEHRP3xj56yn1K837lKPM+ji6vw57vP4FWoNDCm4JWcTeUZ/rAnxSoMp9YuWRxux8I
	gIxg==
X-Gm-Message-State: AOUpUlHxCPZgnxpMAC8hJRBVA3FKyUDkAVpoGDKIXaTQ+5FXlPlkvelo
	2vKYRhrBMLsF8FkRmXd9C9OmHsqpzQSlN/d+A4w=
X-Google-Smtp-Source: AAOMgpdiblKOrjJJVKqdQHa8n9CkrH684MuUU/RYI3cuwKUI58cs1OVBjU13RVPppsDxKcy04xMcp+5bftg1W1dg8yk=
X-Received: by 2002:adf:f6c4:: with SMTP id y4-v6mr13787541wrp.4.1531767043733;
	Mon, 16 Jul 2018 11:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180716174146.19845-1-krinkin.m.u@gmail.com>
	<20180716184752.GA30657@redhat.com>
In-Reply-To: <20180716184752.GA30657@redhat.com>
From: Mike Krinkin <krinkin.m.u@gmail.com>
Date: Mon, 16 Jul 2018 19:50:32 +0100
Message-ID: <CACpa5=-1prNeg7DNibyoiADnXVSmXB-5AVBDHQM7MAgXn1CbOw@mail.gmail.com>
To: berrange@redhat.com
Cc: qemu-devel@nongnu.org, armbru@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000853e030571224ed2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-trivial] [PATCH] opts: fix NULL pointer derefernce in
 get_opt_value
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
X-List-Received-Date: Mon, 16 Jul 2018 18:50:50 -0000

--000000000000853e030571224ed2
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 7:47 PM Daniel P. Berrange <berrange@redhat.com>
wrote:

> On Mon, Jul 16, 2018 at 06:41:46PM +0100, Mike Krinkin wrote:
> > The value argument can be NULL, for example, in hw/i386/multiboot.c
> > in the load_multiboot function get_opt_value is explicitly called
> > with NULL as the second argument.
> >
> > The problem was introduced in commit 950c4e6c94b1 ("opts: don't
> > silently truncate long option values"). This change fixes the
> > problem by adding a check whether the value is NULL or not.
> >
> > Signed-off-by: Mike Krinkin <krinkin.m.u@gmail.com>
> > ---
> >  util/qemu-option.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> This problem is fixed in this:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01490.html
>
> but it is still waiting for i386 maintainers to respond....
>

Thanks for the update, I searched through the archive briefly but didn't
find this fix, sorry for the noise and please ignore this path.


>
> Regards,
> Daniel
> --
> |: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/
> :|
> |: http://libvirt.org              -o-             http://virt-manager.org
> :|
> |: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/
> :|
>

--000000000000853e030571224ed2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Jul 16=
, 2018 at 7:47 PM Daniel P. Berrange &lt;<a href=3D"mailto:berrange@redhat.=
com">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Mon, Jul 16, 2018 at 06:41:46PM +0100, Mike Krinkin wrote:<br>
&gt; The value argument can be NULL, for example, in hw/i386/multiboot.c<br=
>
&gt; in the load_multiboot function get_opt_value is explicitly called<br>
&gt; with NULL as the second argument.<br>
&gt; <br>
&gt; The problem was introduced in commit 950c4e6c94b1 (&quot;opts: don&#39=
;t<br>
&gt; silently truncate long option values&quot;). This change fixes the<br>
&gt; problem by adding a check whether the value is NULL or not.<br>
&gt; <br>
&gt; Signed-off-by: Mike Krinkin &lt;<a href=3D"mailto:krinkin.m.u@gmail.co=
m" target=3D"_blank">krinkin.m.u@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 util/qemu-option.c | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
This problem is fixed in this:<br>
<br>
=C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg=
01490.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/arch=
ive/html/qemu-devel/2018-06/msg01490.html</a><br>
<br>
but it is still waiting for i386 maintainers to respond....<br></blockquote=
><div><br></div><div>Thanks for the update, I searched through the archive =
briefly but didn&#39;t find this fix, sorry for the noise and please ignore=
 this path.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"http://berrange.com" rel=3D"noreferrer" target=3D"_blank">htt=
p://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http:/=
/www.flickr.com/photos/dberrange/" rel=3D"noreferrer" target=3D"_blank">htt=
p://www.flickr.com/photos/dberrange/</a> :|<br>
|: <a href=3D"http://libvirt.org" rel=3D"noreferrer" target=3D"_blank">http=
://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://virt-manager=
.org" rel=3D"noreferrer" target=3D"_blank">http://virt-manager.org</a> :|<b=
r>
|: <a href=3D"http://entangle-photo.org" rel=3D"noreferrer" target=3D"_blan=
k">http://entangle-photo.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0=
 <a href=3D"http://search.cpan.org/~danberr/" rel=3D"noreferrer" target=3D"=
_blank">http://search.cpan.org/~danberr/</a> :|<br>
</blockquote></div></div>

--000000000000853e030571224ed2--

