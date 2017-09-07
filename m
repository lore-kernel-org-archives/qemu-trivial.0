Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpzJP-00087g-Tc
	for mharc-qemu-trivial@gnu.org; Thu, 07 Sep 2017 12:05:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dpzJJ-00081f-Lb
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 12:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dpzJE-000712-P5
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 12:05:45 -0400
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1dpzJE-000708-Hh
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 12:05:40 -0400
Received: by mail-oi0-f54.google.com with SMTP id x190so794145oix.3
	for <qemu-trivial@nongnu.org>; Thu, 07 Sep 2017 09:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QHcktpQBahhrzWz3N4CmmoK1scMk9yDRMXW15ZzpfIY=;
	b=g/ihSJNKURZ9LQpHQ2301HUqU23eiPgwePPKgHSpb4vFaic5vbQSdP2nwjT11N4AYl
	QExmEKlGjT7e5GBI0KUHahwLMd7iTf1guL854MT2+KgkQxR3r+XEjWmN3sXkDA/0jms5
	kZGTpnKH8IVqwHrxulFdWqEOvDpIgQBsxFGUhB2Ubw36zgdk+LK0iBg3fDRuBh8cWvlb
	4QJFsS5GpM1dz/+G8VC/+Rn6vQmsw2eUgnEw1d+GOtRgFlOuqT/jWREqCDTUMJpz3UVQ
	JZzKkug2qunwr9A5ISAn6e0Y2ydnHjztx5keNQZxDknPgltI4Gtphg+kb5x7Xf7i/1hb
	sFcA==
X-Gm-Message-State: AHPjjUjm1BzeyXZH13a1rUhWfrGLD8RTHvtQNGO7JYTUAVJojyXyrYxI
	/whvdPgG4DjHUuaqfhXckRLhNh0H8VCx
X-Google-Smtp-Source: ADKCNb6XAj+ohk6/Rnc8eVObkNOOTcFfe+y2VgEDPlOpKqJgPWLCDxtIP42MVhO68WNT8IjnDuNQyS3b2lp3wCE5efY=
X-Received: by 10.202.82.4 with SMTP id g4mr3672983oib.154.1504800338681; Thu,
	07 Sep 2017 09:05:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.185 with HTTP; Thu, 7 Sep 2017 09:05:37 -0700 (PDT)
Received: by 10.157.56.185 with HTTP; Thu, 7 Sep 2017 09:05:37 -0700 (PDT)
In-Reply-To: <20170902091520.bxecfhisvy46o4cb@aurel32.net>
References: <20170901110332.32650-1-otubo@redhat.com>
	<20170901143016.GK7570@localhost.localdomain>
	<20170902091520.bxecfhisvy46o4cb@aurel32.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 7 Sep 2017 18:05:37 +0200
Message-ID: <CABgObfZ-CthwUFC-E2QTxnpqYZ-Sr_f_M3-FdmH6tQPdjG3OAg@mail.gmail.com>
To: "Jarno, Aurelien" <aurelien@aurel32.net>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Gibson,
	David" <david@gibson.dropbear.id.au>, 
	Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>, mst@redhat.com,
	Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="001a113d84caa5370605589ba120"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.218.54
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dma/i82374: avoid double
 creation of i82374 device
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
X-List-Received-Date: Thu, 07 Sep 2017 16:05:50 -0000

--001a113d84caa5370605589ba120
Content-Type: text/plain; charset="UTF-8"

Il 02 set 2017 11:17 AM, "Aurelien Jarno" <aurelien@aurel32.net> ha scritto:

On 2017-09-01 11:30, Eduardo Habkost wrote:
> i82374 is compiled in only on ppc and sh4, so I'm CCing the
> maintainers for those architectures.

The i82374 device is not useful nor usable on SH4. It has just been
added in commit 85d3846a39 to be able to run the tests.


But that means that the patch is wrong and probably was not tested with
"make check".

Eduardo's proposal is the right one.

Paolo


Aurelien

--
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

--001a113d84caa5370605589ba120
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote=
">Il 02 set 2017 11:17 AM, &quot;Aurelien Jarno&quot; &lt;<a href=3D"mailto=
:aurelien@aurel32.net">aurelien@aurel32.net</a>&gt; ha scritto:<br type=3D"=
attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">On 2017-09=
-01 11:30, Eduardo Habkost wrote:<br>
&gt; i82374 is compiled in only on ppc and sh4, so I&#39;m CCing the<br>
&gt; maintainers for those architectures.<br>
<br>
</div>The i82374 device is not useful nor usable on SH4. It has just been<b=
r>
added in commit 85d3846a39 to be able to run the tests.<br></blockquote></d=
iv></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">But that means=
 that the patch is wrong and probably was not tested with &quot;make check&=
quot;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Eduardo&#39;s pro=
posal is the right one.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<font color=3D"#888888"><br>
Aurelien<br>
<br>
--<br>
Aurelien Jarno=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPG: 4096R/1DDD8C9B<br>
<a href=3D"mailto:aurelien@aurel32.net">aurelien@aurel32.net</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.a=
urel32.net" rel=3D"noreferrer" target=3D"_blank">http://www.aurel32.net</a>=
<br>
<br>
</font></blockquote></div><br></div></div></div>

--001a113d84caa5370605589ba120--

