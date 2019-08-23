Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i160t-0001Dk-Ua
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 05:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i160q-0001D3-Ej
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i160n-0007d1-M5
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:37:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i160n-0007bs-Cf; Fri, 23 Aug 2019 05:37:37 -0400
Received: by mail-ot1-x343.google.com with SMTP id c7so8232211otp.1;
 Fri, 23 Aug 2019 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VK3tHoLAJE5pXLWgsYcMHKFnFd1LYG8rko8XVVQD4vg=;
 b=SAKMmnm8DlEFbpf9FwvV8fGNKCVCyPINKlLBaNt/S75uCKHvslSUhoZQYQhdkEUATL
 WDPVHtxJ9IDyX5bwRBai0I9epHO2FnaubFfa7Dz+g50s8N/275coBdx5vDKrRz8sO7/N
 nYbJEmooSatBZY9JNyrdc0Lm5T3qvZd/poAoZfvQfeyPDtTgXJbTQCLzNP6FZAAV6gln
 xlu+O2ZjN2viNmqotlH+Gc3Iu0rPVyqKMyybSjFY6G1OtUITPf6SNMVcvHIUaMjayiAN
 5MtQCMXghTb2mzuUHbXKZ5TZBRIzMucJs27vtz7RcQvOyXpmktMWrwwYbzl9r895TcR6
 rQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VK3tHoLAJE5pXLWgsYcMHKFnFd1LYG8rko8XVVQD4vg=;
 b=ZWlO6AoD23ZfjdbA1oiiFbimyFtXUKdfDNYuhLGqGAo9bF61tH3Le8ljyg9e8cjgOy
 TNtDfCu4kSwH5RpeX3PBDVyxIjOIeqd1mNQCIiHXLQYGPDHsDqEI2VTdebqsPxOUYWo5
 iYGKsLfyiyM9LsCL51LSru5tvXelYJHgeQtfUhLcSX+Berw61cc1gyOKE6VZR4K6yDvB
 v4wzikDPbfIVygi8UDiNdELfwDijLdqKrHu2vdOSLG4iqU+tq9WXOuLAU8tWxC2glubz
 u0/8zSTF4t0W0Q09QA5+Wa7LSDpnHjwdkfY8rpd2gOXeI30Zl6ZDC6GRXeOBVuEALAT5
 JSkA==
X-Gm-Message-State: APjAAAVSEJ06jmaUhoSf3GkXJujs06k4lS62+gi01fwCfnx/4YVZQPIZ
 B5f7K8kFMbNQbnI97EXWyglVBlzbLjb9bIV/77Q=
X-Google-Smtp-Source: APXvYqw7kShhY6NNJUkHqNxTxCNBHSOqZoWb+RLmlXYCFAKgHGkYBZMNLSBz++ASwc+p+/gGxP074zzxPSHdFMVB7pU=
X-Received: by 2002:a9d:1288:: with SMTP id g8mr3312957otg.306.1566553054770; 
 Fri, 23 Aug 2019 02:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:37:34
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:37:34
 -0700 (PDT)
In-Reply-To: <20190822230916.576-2-philmd@redhat.com>
References: <20190822230916.576-1-philmd@redhat.com>
 <20190822230916.576-2-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 23 Aug 2019 11:37:34 +0200
Message-ID: <CAL1e-=hnAwWVobL7yP3GaC=8ywFtUvr-OeciJX8gFLQDJzaS7Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000059fd4d0590c58ed8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] mailmap: Reorder by
 sections
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
X-List-Received-Date: Fri, 23 Aug 2019 09:37:43 -0000

--00000000000059fd4d0590c58ed8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

23.08.2019. 01.13, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Our mailmap currently has 4 sections somehow documented.
> Reorder few entries not related to "addresses from the original
> git import" into the 3rd section, and add a comment to describe
> it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Just for the sake of tidiness, consider alphabetically ordering items in
the new section. (This would've been a challenge though if we had had many
Chinese contributors... :) ) In any case:

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  .mailmap | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index b8e08297c9..e1fdc88d25 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -4,20 +4,12 @@
>  # into proper addresses so that they are counted properly by git
shortlog.
>  Andrzej Zaborowski <balrogg@gmail.com> balrog
<balrog@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Anthony Liguori <anthony@codemonkey.ws> aliguori
<aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
> -Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <
aliguori@us.ibm.com>
>  Aurelien Jarno <aurelien@aurel32.net> aurel32
<aurel32@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Blue Swirl <blauwirbel@gmail.com> blueswir1
<blueswir1@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl
<edgar_igl@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Fabrice Bellard <fabrice@bellard.org> bellard
<bellard@c046a42c-6fe2-441c-8c8c-71466251a162>
> -James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>  Jocelyn Mayer <l_indien@magic.fr> j_mayer
<j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Paul Brook <paul@codesourcery.com> pbrook
<pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
> -Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
> -Aleksandar Markovic <amarkovic@wavecomp.com> <
aleksandar.markovic@mips.com>
> -Aleksandar Markovic <amarkovic@wavecomp.com> <
aleksandar.markovic@imgtec.com>
> -Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
> -Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
> -Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
>  Thiemo Seufer <ths@networkno.de> ths
<ths@c046a42c-6fe2-441c-8c8c-71466251a162>
>  malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
>
> @@ -32,6 +24,15 @@ Ian McKellar <ianloic@google.com> Ian McKellar via
Qemu-devel <qemu-devel@nongnu
>  Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <
qemu-devel@nongnu.org>
>  Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via
Qemu-devel <qemu-devel@nongnu.org>
>
> +# Next, replace old addresses by a more recent one.
> +Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <
aliguori@us.ibm.com>
> +James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> +Aleksandar Markovic <amarkovic@wavecomp.com> <
aleksandar.markovic@mips.com>
> +Aleksandar Markovic <amarkovic@wavecomp.com> <
aleksandar.markovic@imgtec.com>
> +Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
> +Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
> +Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> +Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>
>  # Also list preferred name forms where people have changed their
>  # git author config, or had utf8/latin1 encoding issues.
> --
> 2.20.1
>
>

--00000000000059fd4d0590c58ed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
23.08.2019. 01.13, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"m=
ailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; Our mailmap currently has 4 sections somehow documented.<br>
&gt; Reorder few entries not related to &quot;addresses from the original<b=
r>
&gt; git import&quot; into the 3rd section, and add a comment to describe<b=
r>
&gt; it.<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Just for the sake of tidiness, consider alphabetically order=
ing items in the new section. (This would&#39;ve been a challenge though if=
 we had had many Chinese contributors... :) ) In any case:</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">&gt; =C2=A0.mailmap | 17 +++++++++--------<br>
&gt; =C2=A01 file changed, 9 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/.mailmap b/.mailmap<br>
&gt; index b8e08297c9..e1fdc88d25 100644<br>
&gt; --- a/.mailmap<br>
&gt; +++ b/.mailmap<br>
&gt; @@ -4,20 +4,12 @@<br>
&gt; =C2=A0# into proper addresses so that they are counted properly by git=
 shortlog.<br>
&gt; =C2=A0Andrzej Zaborowski &lt;<a href=3D"mailto:balrogg@gmail.com">balr=
ogg@gmail.com</a>&gt; balrog &lt;balrog@c046a42c-6fe2-441c-8c8c-71466251a16=
2&gt;<br>
&gt; =C2=A0Anthony Liguori &lt;<a href=3D"mailto:anthony@codemonkey.ws">ant=
hony@codemonkey.ws</a>&gt; aliguori &lt;aliguori@c046a42c-6fe2-441c-8c8c-71=
466251a162&gt;<br>
&gt; -Anthony Liguori &lt;<a href=3D"mailto:anthony@codemonkey.ws">anthony@=
codemonkey.ws</a>&gt; Anthony Liguori &lt;<a href=3D"mailto:aliguori@us.ibm=
.com">aliguori@us.ibm.com</a>&gt;<br>
&gt; =C2=A0Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net">aurel=
ien@aurel32.net</a>&gt; aurel32 &lt;aurel32@c046a42c-6fe2-441c-8c8c-7146625=
1a162&gt;<br>
&gt; =C2=A0Blue Swirl &lt;<a href=3D"mailto:blauwirbel@gmail.com">blauwirbe=
l@gmail.com</a>&gt; blueswir1 &lt;blueswir1@c046a42c-6fe2-441c-8c8c-7146625=
1a162&gt;<br>
&gt; =C2=A0Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com=
">edgar.iglesias@gmail.com</a>&gt; edgar_igl &lt;edgar_igl@c046a42c-6fe2-44=
1c-8c8c-71466251a162&gt;<br>
&gt; =C2=A0Fabrice Bellard &lt;<a href=3D"mailto:fabrice@bellard.org">fabri=
ce@bellard.org</a>&gt; bellard &lt;bellard@c046a42c-6fe2-441c-8c8c-71466251=
a162&gt;<br>
&gt; -James Hogan &lt;<a href=3D"mailto:jhogan@kernel.org">jhogan@kernel.or=
g</a>&gt; &lt;<a href=3D"mailto:james.hogan@imgtec.com">james.hogan@imgtec.=
com</a>&gt;<br>
&gt; =C2=A0Jocelyn Mayer &lt;<a href=3D"mailto:l_indien@magic.fr">l_indien@=
magic.fr</a>&gt; j_mayer &lt;j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162&g=
t;<br>
&gt; =C2=A0Paul Brook &lt;<a href=3D"mailto:paul@codesourcery.com">paul@cod=
esourcery.com</a>&gt; pbrook &lt;pbrook@c046a42c-6fe2-441c-8c8c-71466251a16=
2&gt;<br>
&gt; -Yongbok Kim &lt;<a href=3D"mailto:yongbok.kim@mips.com">yongbok.kim@m=
ips.com</a>&gt; &lt;<a href=3D"mailto:yongbok.kim@imgtec.com">yongbok.kim@i=
mgtec.com</a>&gt;<br>
&gt; -Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">ama=
rkovic@wavecomp.com</a>&gt; &lt;<a href=3D"mailto:aleksandar.markovic@mips.=
com">aleksandar.markovic@mips.com</a>&gt;<br>
&gt; -Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">ama=
rkovic@wavecomp.com</a>&gt; &lt;<a href=3D"mailto:aleksandar.markovic@imgte=
c.com">aleksandar.markovic@imgtec.com</a>&gt;<br>
&gt; -Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavec=
omp.com</a>&gt; &lt;<a href=3D"mailto:paul.burton@mips.com">paul.burton@mip=
s.com</a>&gt;<br>
&gt; -Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavec=
omp.com</a>&gt; &lt;<a href=3D"mailto:paul.burton@imgtec.com">paul.burton@i=
mgtec.com</a>&gt;<br>
&gt; -Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavec=
omp.com</a>&gt; &lt;<a href=3D"mailto:paul@archlinuxmips.org">paul@archlinu=
xmips.org</a>&gt;<br>
&gt; =C2=A0Thiemo Seufer &lt;<a href=3D"mailto:ths@networkno.de">ths@networ=
kno.de</a>&gt; ths &lt;ths@c046a42c-6fe2-441c-8c8c-71466251a162&gt;<br>
&gt; =C2=A0malc &lt;<a href=3D"mailto:av1474@comtv.ru">av1474@comtv.ru</a>&=
gt; malc &lt;malc@c046a42c-6fe2-441c-8c8c-71466251a162&gt;<br>
&gt;<br>
&gt; @@ -32,6 +24,15 @@ Ian McKellar &lt;<a href=3D"mailto:ianloic@google.c=
om">ianloic@google.com</a>&gt; Ian McKellar via Qemu-devel &lt;qemu-devel@n=
ongnu<br>
&gt; =C2=A0Julia Suvorova &lt;<a href=3D"mailto:jusual@mail.ru">jusual@mail=
.ru</a>&gt; Julia Suvorova via Qemu-devel &lt;<a href=3D"mailto:qemu-devel@=
nongnu.org">qemu-devel@nongnu.org</a>&gt;<br>
&gt; =C2=A0Justin Terry (VM) &lt;<a href=3D"mailto:juterry@microsoft.com">j=
uterry@microsoft.com</a>&gt; Justin Terry (VM) via Qemu-devel &lt;<a href=
=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt;<br>
&gt;<br>
&gt; +# Next, replace old addresses by a more recent one.<br>
&gt; +Anthony Liguori &lt;<a href=3D"mailto:anthony@codemonkey.ws">anthony@=
codemonkey.ws</a>&gt; Anthony Liguori &lt;<a href=3D"mailto:aliguori@us.ibm=
.com">aliguori@us.ibm.com</a>&gt;<br>
&gt; +James Hogan &lt;<a href=3D"mailto:jhogan@kernel.org">jhogan@kernel.or=
g</a>&gt; &lt;<a href=3D"mailto:james.hogan@imgtec.com">james.hogan@imgtec.=
com</a>&gt;<br>
&gt; +Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">ama=
rkovic@wavecomp.com</a>&gt; &lt;<a href=3D"mailto:aleksandar.markovic@mips.=
com">aleksandar.markovic@mips.com</a>&gt;<br>
&gt; +Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">ama=
rkovic@wavecomp.com</a>&gt; &lt;<a href=3D"mailto:aleksandar.markovic@imgte=
c.com">aleksandar.markovic@imgtec.com</a>&gt;<br>
&gt; +Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavec=
omp.com</a>&gt; &lt;<a href=3D"mailto:paul.burton@mips.com">paul.burton@mip=
s.com</a>&gt;<br>
&gt; +Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavec=
omp.com</a>&gt; &lt;<a href=3D"mailto:paul.burton@imgtec.com">paul.burton@i=
mgtec.com</a>&gt;<br>
&gt; +Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavec=
omp.com</a>&gt; &lt;<a href=3D"mailto:paul@archlinuxmips.org">paul@archlinu=
xmips.org</a>&gt;<br>
&gt; +Yongbok Kim &lt;<a href=3D"mailto:yongbok.kim@mips.com">yongbok.kim@m=
ips.com</a>&gt; &lt;<a href=3D"mailto:yongbok.kim@imgtec.com">yongbok.kim@i=
mgtec.com</a>&gt;<br>
&gt;<br>
&gt; =C2=A0# Also list preferred name forms where people have changed their=
<br>
&gt; =C2=A0# git author config, or had utf8/latin1 encoding issues.<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--00000000000059fd4d0590c58ed8--

