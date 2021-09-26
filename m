Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUdcp-00026i-3L
	for mharc-qemu-trivial@gnu.org; Sun, 26 Sep 2021 19:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUdcn-00024m-3i
 for qemu-trivial@nongnu.org; Sun, 26 Sep 2021 19:32:01 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUdcl-0002Nr-J8
 for qemu-trivial@nongnu.org; Sun, 26 Sep 2021 19:32:00 -0400
Received: by mail-ua1-x931.google.com with SMTP id 20so2849104uaj.6
 for <qemu-trivial@nongnu.org>; Sun, 26 Sep 2021 16:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6YOBMqTVipWsoYEeEQM9mP/a1fJtueUL5NfPY84QzE=;
 b=CyxZz6ZUu7KKYkf+FBEoHwa6aDC4Et7u4F42lAVIwAeiAi+Jpz5BkLr3DvFGY7FQUC
 VmzedoBfk2d89Pb8ixgNJvvQIYbGCJJIIbk9zEiNuh2C92X6S3MZBnvi2lQ5MoqTuX3M
 p+9wOT3Rmnl9+UqOP3DB/w4pNcjB8YimuoO/BOs95tME4qMQ6dUdAB+If1LwxkKtYJBc
 sLg55c9ycwnZUM+IGWP2OR+/MCDknjT6o+YP1hU58ef5Mr2VC1NP6ATD1Grd3ft5FIRx
 lefEK1IzyqOr/CmP9cPgEcDUaO3YOBU34+wpo5pKRiqehHvZRAjSo9tYJghlKftPyllK
 bYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6YOBMqTVipWsoYEeEQM9mP/a1fJtueUL5NfPY84QzE=;
 b=Z7wXoyxctkKF0Pz8Ik+C8CwLoq4V/AOeKdysRtVE0EHvDZVsIiskcROJO56il+IuXo
 xJI+9qTQ41pV4FGcPyc1Hwd09rccmMBb9y+k/PPzMk4QRYfikgfyRIvSrvoQd1lH52Ks
 Td0KV4TCDlDrEq31sG+K2fI3OBLSwWqVsmGU2sDCJUk6Xo+UsESqVXhTrPg0BCLEbYQb
 xFH7W7Ufel3guNdzJ3I9puU3AdOjWkYSf9N5QV1TrNrFQlcF4HmvUciaYJMXqzyvjyfm
 Kjg/5PzGJl8eRzTkfWVhBv0qGVWxMbBC6E25xnhTZACv9eqMIBPv3C7YgSgHZFExw1Hc
 D4Tw==
X-Gm-Message-State: AOAM5336NNXmWV5Vqyniu/NpUKy4UuUL3Rs3NfrNVPUfOehny8eEL6/k
 OhY+w28h53mxbzsf7OlGMXDoKRGYoK/su8uZBFSC+w==
X-Google-Smtp-Source: ABdhPJzXjqhzicPuZ5WyJ9JpLFn+pRmskkbtdHYP6D8NBYPmmFy4cbtvdHG+y8nQ33v89mvAAwk6QiNv3ztp7cEExcs=
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr8864904uae.85.1632699116937; 
 Sun, 26 Sep 2021 16:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
In-Reply-To: <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 17:31:45 -0600
Message-ID: <CANCZdfqm-+a2AqXx0+Rw7jETP8VuC0Eq4QJzs3uyoU9U_d3ZUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000e3f44005ccee62ae"
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 26 Sep 2021 23:32:01 -0000

--000000000000e3f44005ccee62ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 5:08 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/26/21 6:01 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Reported-by: Warner Losh <imp@bsdimp.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >   bsd-user/meson.build | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> > index 03695493408..a7607e1c884 100644
> > --- a/bsd-user/meson.build
> > +++ b/bsd-user/meson.build
> > @@ -1,3 +1,7 @@
> > +if not config_host.has_key('CONFIG_BSD')
> > +  subdir_done()
> > +endif
>
> Why here and not in the parent meson.build?
>

I have the same question... I never know where to 'filter' when it comes to
meson...

Waner

--000000000000e3f44005ccee62ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 26, 2021 at 5:08 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/26/21 6:01 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br=
>
&gt; Reported-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/meson.build | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
&gt; index 03695493408..a7607e1c884 100644<br>
&gt; --- a/bsd-user/meson.build<br>
&gt; +++ b/bsd-user/meson.build<br>
&gt; @@ -1,3 +1,7 @@<br>
&gt; +if not config_host.has_key(&#39;CONFIG_BSD&#39;)<br>
&gt; +=C2=A0 subdir_done()<br>
&gt; +endif<br>
<br>
Why here and not in the parent meson.build?<br></blockquote><div><br></div>=
<div>I have the same question... I never know where to &#39;filter&#39; whe=
n it comes to meson...</div><div><br></div><div>Waner=C2=A0</div></div></di=
v>

--000000000000e3f44005ccee62ae--

