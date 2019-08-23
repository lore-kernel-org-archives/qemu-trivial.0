Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i15su-0003Dt-Rk
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 05:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i15ss-0003Br-4V
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:29:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i15sq-0003zZ-Pf
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:29:26 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i15sq-0003zM-KN; Fri, 23 Aug 2019 05:29:24 -0400
Received: by mail-oi1-x242.google.com with SMTP id b25so6564360oib.4;
 Fri, 23 Aug 2019 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=45/t6Cx/KCdCPIpHkNsMDMO631LAyzQIDPsrlm/uvpg=;
 b=A4ZteFVhl89SNiNvC6QDwvi3V+23+xYfnPtcnj/B8ssBbn6L3vfx/gfyeq7aejN6Pk
 bliGnXnvfoobF6igeOTpgWXxw67f/qkbNetyHnmduO9VqikY+yO59pqzbZcBF/De3u4I
 jOGrTLuCf/OjHuayf4S8a95a6Z7oNZLIrQcgw8H6WoMBH4jVtCXD6+OejOi1fR79Laxy
 sfEMxpHX2JvtKIGIrLPS5RUcDzl0MzI7e0NPc0eb5NAqXND78pVtsSaDDNKpOFFhT+XJ
 x6Z2a4fBdAJ2GaZgslXDzVPR0MJmu7D2KjG1Hytrt2KoCdzzHNE3y6e0yxZvBWGsJxKJ
 i9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=45/t6Cx/KCdCPIpHkNsMDMO631LAyzQIDPsrlm/uvpg=;
 b=YU2OBj34XfeBrdUcoB3D7iVoiwTa24BH9zcB3HgJBVI8kQt7h8FIjRNS/lRS7kJMzG
 84/iUluoGVoPYuKHcilGJ9lOtC3OA+S/hDBfoLCuQdCe70kTWGyhm3cWRFN548gDIuH5
 8uWZmfXLOtUtLfStrF5jBVFPj7cFAGb+8vSHXo7xjCFc8yyWR1h84rpJL4vN+Banik30
 syV9QzXCjMpOqrtvClOZRCVsVLH5PMkpxYnNVuEezN8HbO8NDkL6lovT1geSq4KlxFc5
 jd9JtF7g6OdSDtrWSSIo4Ud6X76BCe98B/DUVzYcCIst1w8Qgw921pApLTZYoZoyeuCc
 I2LA==
X-Gm-Message-State: APjAAAV/OpEeM1iV8XBzGy/O+gLRKMCKsS0S4kzyxpkWGFsSf2YQ/rNT
 bZ8sbgUsPCQc0krQRZ1+O1dQn0aqOXBcgWXlm88=
X-Google-Smtp-Source: APXvYqyiK8c321HSDwhIOMrogF8tsOj8heLRtU0zZpxVR0tKrZlZQ3g0W+9H46jz0XKCzGCATP4L3EzzT2ORAN7gqI8=
X-Received: by 2002:a05:6808:198:: with SMTP id
 w24mr2408941oic.53.1566552563545; 
 Fri, 23 Aug 2019 02:29:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:29:22
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:29:22
 -0700 (PDT)
In-Reply-To: <20190822231231.1306-1-philmd@redhat.com>
References: <20190822231231.1306-1-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 23 Aug 2019 11:29:22 +0200
Message-ID: <CAL1e-=g1_PCiQLXGQBmKFQHrMj2e7Ag6H9PCm8pysfmRboJUKw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000127c080590c57171"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] contrib/gitdm: Add RT-RK to
 the domain-map
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
X-List-Received-Date: Fri, 23 Aug 2019 09:29:28 -0000

--000000000000127c080590c57171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

23.08.2019. 01.16, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> This company has at least 7 contributors, add a domain-map entry.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  contrib/gitdm/domain-map | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index fa9d454473..9efe066ec9 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -18,6 +18,7 @@ nokia.com       Nokia
>  oracle.com      Oracle
>  proxmox.com     Proxmox
>  redhat.com      Red Hat
> +rt-rk.com       RT-RK
>  siemens.com     Siemens
>  sifive.com      SiFive
>  suse.de         SUSE
> --

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

Excellent! Merci beaucoup!

> 2.20.1
>
>

--000000000000127c080590c57171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
23.08.2019. 01.16, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"m=
ailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; This company has at least 7 contributors, add a domain-map entry.<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0contrib/gitdm/domain-map | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map<br>
&gt; index fa9d454473..9efe066ec9 100644<br>
&gt; --- a/contrib/gitdm/domain-map<br>
&gt; +++ b/contrib/gitdm/domain-map<br>
&gt; @@ -18,6 +18,7 @@ <a href=3D"http://nokia.com">nokia.com</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Nokia<br>
&gt; =C2=A0<a href=3D"http://oracle.com">oracle.com</a>=C2=A0 =C2=A0 =C2=A0=
 Oracle<br>
&gt; =C2=A0<a href=3D"http://proxmox.com">proxmox.com</a>=C2=A0 =C2=A0 =C2=
=A0Proxmox<br>
&gt; =C2=A0<a href=3D"http://redhat.com">redhat.com</a>=C2=A0 =C2=A0 =C2=A0=
 Red Hat<br>
&gt; +<a href=3D"http://rt-rk.com">rt-rk.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
RT-RK<br>
&gt; =C2=A0<a href=3D"http://siemens.com">siemens.com</a>=C2=A0 =C2=A0 =C2=
=A0Siemens<br>
&gt; =C2=A0<a href=3D"http://sifive.com">sifive.com</a>=C2=A0 =C2=A0 =C2=A0=
 SiFive<br>
&gt; =C2=A0<a href=3D"http://suse.de">suse.de</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SUSE<br>
&gt; -- </p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">Excellent! Merci beaucoup!</p>
<p dir=3D"ltr">&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--000000000000127c080590c57171--

