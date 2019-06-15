Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hc16K-00070r-OI
	for mharc-qemu-trivial@gnu.org; Sat, 15 Jun 2019 01:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50591)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hc16A-0006mD-Sc
 for qemu-trivial@nongnu.org; Sat, 15 Jun 2019 01:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hc0y7-0007lP-SY
 for qemu-trivial@nongnu.org; Sat, 15 Jun 2019 01:11:12 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hc0y6-0007dI-I8; Sat, 15 Jun 2019 01:11:10 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so4124305wmj.5;
 Fri, 14 Jun 2019 22:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahfDBaZpWRRMUSU14banV4tDohtU7GQ0/Bn+quR5tGk=;
 b=H6Pii8mP5cGFjrndSVNTbbCrqkCZCpdxTHGt3dfZKexIc6mkQmVjWo0A6jlX4Uh1y6
 305+BMsGhuZ39++nsrJuYSqShsPbY1fqxbBS4OV3JTC8RiK4VjqAHqXhd00TsR7P+GZ/
 OWFlhpt2ntPOPAglUk8+Xt126Dq4GcLOUgnDIneZli64AGXFQzZplzlRwY6LzV5dBpFm
 WIlMLeC0Z8r/ij9lff5QATCbfa9MTdIfmjIrdScjgE68lB6DPYjBUcUK4EoYJkWSR2BZ
 MimoVGGgoy7cR/mgo3z6VzBNM7r5daWiX838mTGlprEkWsETfZipJnEdwy4FzU6l8zdd
 L5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahfDBaZpWRRMUSU14banV4tDohtU7GQ0/Bn+quR5tGk=;
 b=YMn9uLm0mgVvCMxdMhJDN0/kRDyO2l4jblOP+kz6aiDdRVN/QT1VyL0bnrD54AHviA
 WIcE1WNEN8ZWnCmefz/TXWEOtTO5i3uHVvPZgM7RvZb/zmXiPyQsnUPsijxrzra1O1OJ
 13SY7/+vr4mYwqcOUqK0rbrtCrfE/ldctJ36jJKXjmE2/Z7lbFIQSAmR4nZ1GZF0Gtob
 yBEp2S4+VicgdgKoblWp29wt7MO38j97dsrQrl9YQJZfNw7xIgNY3fVaZEZVbyntZoS2
 riWWFCTcIdO/H9q/VsfQn5gx3jG7Z7gRugj2VHS5tsYToIsyv1Kz+zsItiGdxG/1/yKZ
 tgXw==
X-Gm-Message-State: APjAAAWQu+eQ5UX/sSqeqKuUdJpKKzqRmBb35OFqvr+pZAxYhVlAudzp
 XXWyLY7+AjbR7Qd9FuLIREOhPctbzeXdBWKQ5ps=
X-Google-Smtp-Source: APXvYqyvg8omQXD5iOnlCHDqIqdKLK57j/uE+dVxbVyhVCgJIT7XLhgfwq0A9H2AIQTZFcuAXD7AV7RS5m6n3+s7bIw=
X-Received: by 2002:a1c:c255:: with SMTP id s82mr10881568wmf.6.1560575467518; 
 Fri, 14 Jun 2019 22:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190611145556.12940-1-rfried.dev@gmail.com>
 <f826d073-da60-96f0-9a37-c33761844cc2@vivier.eu>
 <CAGi-RUL2QThfiYPeZOE6iuryxT7Daj-y-Q=SSgUBRFcDsWP+zw@mail.gmail.com>
 <200eff56-ffff-904d-eeef-408b52ce2fa5@vivier.eu>
In-Reply-To: <200eff56-ffff-904d-eeef-408b52ce2fa5@vivier.eu>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 15 Jun 2019 08:10:56 +0300
Message-ID: <CAGi-RUKY_WPsaL+aYfuZzKLGcPj7=+PCUo94Oxm5-ERCGEgtzQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000062ff64058b55cad1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] net: cadence_gem: fix
 compilation error when debug is on
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
X-List-Received-Date: Sat, 15 Jun 2019 05:19:32 -0000

--00000000000062ff64058b55cad1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 10:40 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 12/06/2019 =C3=A0 06:27, Ramon Fried a =C3=A9crit :
> >
> >
> > On Tue, Jun 11, 2019 at 7:21 PM Laurent Vivier <laurent@vivier.eu
> > <mailto:laurent@vivier.eu>> wrote:
> >
> >     Le 11/06/2019 =C3=A0 16:55, Ramon Fried a =C3=A9crit :
> >     > defining CADENCE_GEM_ERR_DEBUG causes compilation
> >     > errors, fix that.
> >     >
> >     > Signed-off-by: Ramon Fried <rfried.dev@gmail.com
> >     <mailto:rfried.dev@gmail.com>>
> >     > ---
> >     > v2: change %lx to HWADDR_PRIx and %lx to %zdx
> >
> >     HWADDR_PRIx is to use with hwaddr type (packet_desc_addr).
> >     rx_desc_get_buffer() is uint64_t, you must use PRIx64.
> >     It may be better to remove also the cast to unsigned.
> >
> > Other places in the code also use HWADDR_PRIx with  rx_desc_get_buffer(=
).
> > Should I change them also ?
>
> No, in fact you should change the return type of rx_desc_get_buffer() to
> hwaddr.
>
Make sense.
I'll do it in a different patch.

>
> Thanks,
> Laurent
>

--00000000000062ff64058b55cad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2019 at 10:40 AM Laurent =
Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 12/06/2=
019 =C3=A0 06:27, Ramon Fried a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Jun 11, 2019 at 7:21 PM Laurent Vivier &lt;<a href=3D"mailto:l=
aurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a><br>
&gt; &lt;mailto:<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">laur=
ent@vivier.eu</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 11/06/2019 =C3=A0 16:55, Ramon Fried a =C3=A9cri=
t=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; defining CADENCE_GEM_ERR_DEBUG causes compilat=
ion<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; errors, fix that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Ramon Fried &lt;<a href=3D"mail=
to:rfried.dev@gmail.com" target=3D"_blank">rfried.dev@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:rfried.dev@gmail.com" =
target=3D"_blank">rfried.dev@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; v2: change %lx to HWADDR_PRIx and %lx to %zdx<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0HWADDR_PRIx is to use with hwaddr type (packet_desc=
_addr).<br>
&gt;=C2=A0 =C2=A0 =C2=A0rx_desc_get_buffer() is uint64_t, you must use PRIx=
64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0It may be better to remove also the cast to unsigne=
d.<br>
&gt; <br>
&gt; Other places in the code also use HWADDR_PRIx with=C2=A0 rx_desc_get_b=
uffer().<br>
&gt; Should I change them also ?<br>
<br>
No, in fact you should change the return type of rx_desc_get_buffer() to<br=
>
hwaddr.<br></blockquote><div>Make sense.</div><div>I&#39;ll do it in a diff=
erent patch.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Laurent<br>
</blockquote></div></div>

--00000000000062ff64058b55cad1--

