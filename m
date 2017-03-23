Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqxtq-0007Sv-OO
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 04:15:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cqxtj-0007O6-0u
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 04:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cqxte-0005jY-7h
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 04:15:07 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1cqxte-0005jI-13; Thu, 23 Mar 2017 04:15:02 -0400
Received: by mail-lf0-x242.google.com with SMTP id g70so15946112lfh.3;
	Thu, 23 Mar 2017 01:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=52SjrvKaXfbGpycixZSsZmkvAggmaZIjAPrRKQwkC8k=;
	b=WH57Km3Bic+W1dZoI9X7v5oXt48TaIy3SS5oDgo68XTf7Sf2587aeBzJJJWWbP0oy0
	MxMlzT19I3NRa0BxCdQ47VbW+vjRLIklGa8DeWALtXSpN+YowLQgyLAkh0i/cBGjbgLh
	77RV8+I5GyeQ0m+JKcHQxryVZMYCdU+pVtCrBbokDD+bHoH/ZA/CkAlSjrIgfNOYwJKf
	WyLsUh7lwrQZzx5EeKEHvO/D//swBdbwkFX9zht/2o2umAfi2pgMBWJkq4DtdfTOuOy5
	DCz3f7QPZzSNESVi/+IkrY5awzk2teojbNEYf2fRiArFktxU3bIG8JB5sRFCHy4kF+N4
	R6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=52SjrvKaXfbGpycixZSsZmkvAggmaZIjAPrRKQwkC8k=;
	b=JRHdtJVuVc/TkVu8Jr7RHa9PA+TvhIJG4t2Ml7ewk8n9C1AZ4FHP2v78zFEu34+90E
	RK+Z2ZJaI/wz6TRCEIjRG1rxRVQD9pbeNmOAYPELba8PyGI2HzQXKkD3/WbLuSRTgXJB
	6zyRp+3JtjVoAtN/W6nwxpIzJ6hPlRivHXGvNSwLhAuorSKKH6NW9fmtOBLwUxTncfqC
	lZ5FF59l9vJELRZQQ9HyU+ZzJ7BccgehxHKBDzUafmco1jqU4zHn6HjLdzhURMLs/HJB
	SLzUtRTqAQhVgYRG8rKy8UeN673SuiZqMrWzwtDYVynIniWCsfK7rp023UkNUtrkmHu1
	6g1A==
X-Gm-Message-State: AFeK/H2pt8HHc+JjXOo/DZQ9W7Baynj/9jysL/8l6AYu3Mgj8Xzxed7bceUZ9CKVrAeDNiy+AMLY++qRb1+h8g==
X-Received: by 10.25.195.16 with SMTP id t16mr665876lff.149.1490256900850;
	Thu, 23 Mar 2017 01:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-2-f4bug@amsat.org>
	<87y3vw1o94.fsf@dusky.pond.sub.org>
	<1490255007.463.11.camel@redhat.com>
In-Reply-To: <1490255007.463.11.camel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 23 Mar 2017 08:14:49 +0000
Message-ID: <CAJ+F1CJNy+e83EHR_8uzAHURxDk6idnNTTL_FoD-krWPue7Lww@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary=94eb2c1a19c6330a7b054b61795a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 1/3] usb-ccid: make
 ccid_write_data_block() cope with null buffers
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
X-List-Received-Date: Thu, 23 Mar 2017 08:15:12 -0000

--94eb2c1a19c6330a7b054b61795a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 23, 2017 at 11:44 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > +    if (len =3D=3D 0) {
> > > +        return;
> >
> > Correct only if messages without data always have the same meaning as n=
o
> > message.  Gerd?
>
> Not a ccid expert, but looking through the code it seems writing a
> (reply) data block with status and without payload (data =3D NULL and len
> =3D 0) is perfectly fine and can happen in case no (virtual) smartcard is
> inserted into the card reader.  Which this patch breaks.  So,
>
> NACK.
>

 oops, there are hard-coded calls with NULL/0. I suppose to fix clang
warning, it would need to check if data !=3D null for memcpy.
--=20
Marc-Andr=C3=A9 Lureau

--94eb2c1a19c6330a7b054b61795a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Thu, Mar 23, 2017 at 11:44 AM Gerd Hoffmann &lt;<a href=3D"mailto:kraxe=
l@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">=C2=A0 Hi,<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; &gt; +=C2=A0 =C2=A0 if (len =3D=3D 0) {<br class=3D"gmail_msg">
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Correct only if messages without data always have the same meaning as =
no<br class=3D"gmail_msg">
&gt; message.=C2=A0 Gerd?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Not a ccid expert, but looking through the code it seems writing a<br class=
=3D"gmail_msg">
(reply) data block with status and without payload (data =3D NULL and len<b=
r class=3D"gmail_msg">
=3D 0) is perfectly fine and can happen in case no (virtual) smartcard is<b=
r class=3D"gmail_msg">
inserted into the card reader.=C2=A0 Which this patch breaks.=C2=A0 So,<br =
class=3D"gmail_msg">
<br class=3D"gmail_msg">
NACK.<br class=3D"gmail_msg"></blockquote><div><br></div><div>=C2=A0oops, t=
here are hard-coded calls with NULL/0. I suppose to fix clang warning, it w=
ould need to check if data !=3D null for memcpy.<br></div></div></div></div=
><div dir=3D"ltr">-- <br></div><div data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>

--94eb2c1a19c6330a7b054b61795a--

