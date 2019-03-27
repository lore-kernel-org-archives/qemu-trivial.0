Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h94a1-0002JI-Ps
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 05:10:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h94Zz-0002Hr-QO
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h94Zx-0004H9-8i
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:10:38 -0400
Received: from mail-yw1-f41.google.com ([209.85.161.41]:44704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h94Zm-0004BA-Dq; Wed, 27 Mar 2019 05:10:26 -0400
Received: by mail-yw1-f41.google.com with SMTP id c4so11912357ywa.11;
	Wed, 27 Mar 2019 02:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BBhfZbV5NBifmbE/K2HTKl3hNcARs32HspARHHAiJ9Y=;
	b=CyxHPFztLxLbLP6gNfkwQ7wnh5sD4BWRcEkglagpp0ylOQH3jgjY7YX1yR+wnjVFUc
	zUItvbWiV3ZKB8QtzxswSax28EhxtK/11+aVgIX6G3q9j1syyTUH1vQzMDRpyDVSJglQ
	8A+ik1rE1tbWbIdk86AIANnEUbDA9/dhtLwZuOGrwSLmftjoYK3Z2R8KRN4H8SIwZSZp
	XlZcFHxp64VlXd6r1qORZHqv0AbimOQceDjSJbX6o3p2tyauY+qQFc49G4ihunKqA8iQ
	toK30nvRU/1+zLwXrAIqPmG24QSY8soubk9IM6zzPx0BeljpW6klc01j3vO4OhJnk9/6
	RJDw==
X-Gm-Message-State: APjAAAWpx7v4nCz0GFHRJjGX5XBYIQFEaNJZxYpJCXRP9JtbzrT7L0V7
	jApu1iCk3X8C28fS+L8ZW+SdrZ9dXF3lmXYAYAk=
X-Google-Smtp-Source: APXvYqwuq4ZJVhXTgVQRokHn0pGDGer5Zs+wcBKFOYoLO5YMtw01hmlzllcpVuFpaIuvxVqO1m7Os7cuc2F4jlT7hQ8=
X-Received: by 2002:a25:49c4:: with SMTP id w187mr5462479yba.457.1553677825145;
	Wed, 27 Mar 2019 02:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <155364147432.16467.15898335025013220939.stgit@gimli.home>
In-Reply-To: <155364147432.16467.15898335025013220939.stgit@gimli.home>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 27 Mar 2019 10:10:13 +0100
Message-ID: <CAAdtpL7jxd-Hdm4Hpg_1jiXd1cXsfLEgijfGa9Cu6L5j0njqgQ@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, mst@redhat.com, 
	qemu-trivial@nongnu.org, peterx@redhat.com, pbonzini@redhat.com, 
	rth@twiddle.net
Content-Type: multipart/alternative; boundary="000000000000dd01c205850fcebf"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.41
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] intel_iommu: Correct
 caching-mode error message
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
X-List-Received-Date: Wed, 27 Mar 2019 09:10:41 -0000

--000000000000dd01c205850fcebf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 27 mars 2019 00:06, Alex Williamson <alex.williamson@redhat.com> a
=C3=A9crit :

> If we try to use the intel-iommu device with vfio-pci devices without
> caching mode enabled, we're told:
>
>   qemu-system-x86_64: We need to set caching-mode=3D1 for intel-iommu to
> enable
>   device assignment with IOMMU protection.
>
> But to enable caching mode, the option is actually "caching-mode=3Don".
>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/i386/intel_iommu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index b90de6c66461..b62badd4f08d 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2919,7 +2919,7 @@ static void
> vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      IntelIOMMUState *s =3D vtd_as->iommu_state;
>
>      if (!s->caching_mode && new & IOMMU_NOTIFIER_MAP) {
> -        error_report("We need to set caching-mode=3D1 for intel-iommu to
> enable "
> +        error_report("We need to set caching-mode=3Don for intel-iommu t=
o
> enable "
>                       "device assignment with IOMMU protection.");
>          exit(1);
>      }
>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--000000000000dd01c205850fcebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le m=
er. 27 mars 2019 00:06, Alex Williamson &lt;<a href=3D"mailto:alex.williams=
on@redhat.com">alex.williamson@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">If we try to use the intel-iommu device =
with vfio-pci devices without<br>
caching mode enabled, we&#39;re told:<br>
<br>
=C2=A0 qemu-system-x86_64: We need to set caching-mode=3D1 for intel-iommu =
to enable<br>
=C2=A0 device assignment with IOMMU protection.<br>
<br>
But to enable caching mode, the option is actually &quot;caching-mode=3Don&=
quot;.<br>
<br>
Signed-off-by: Alex Williamson &lt;<a href=3D"mailto:alex.williamson@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">alex.williamson@redhat.com</a>&g=
t;<br>
---<br>
=C2=A0hw/i386/intel_iommu.c |=C2=A0 =C2=A0 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c<br>
index b90de6c66461..b62badd4f08d 100644<br>
--- a/hw/i386/intel_iommu.c<br>
+++ b/hw/i386/intel_iommu.c<br>
@@ -2919,7 +2919,7 @@ static void vtd_iommu_notify_flag_changed(IOMMUMemory=
Region *iommu,<br>
=C2=A0 =C2=A0 =C2=A0IntelIOMMUState *s =3D vtd_as-&gt;iommu_state;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!s-&gt;caching_mode &amp;&amp; new &amp; IOMMU_NOTI=
FIER_MAP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;We need to set caching-mode=
=3D1 for intel-iommu to enable &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;We need to set caching-mode=
=3Don for intel-iommu to enable &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;device assignment with IOMMU protection.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0}<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000dd01c205850fcebf--

