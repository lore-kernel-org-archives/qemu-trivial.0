Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz60I-0006Rr-8E
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 15:03:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dz60F-0006RY-NN
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 15:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dz60E-00051V-QD
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 15:03:43 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:46154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dz60E-0004zg-JQ
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 15:03:42 -0400
Received: by mail-wm0-x229.google.com with SMTP id m72so12468286wmc.1
	for <qemu-trivial@nongnu.org>; Mon, 02 Oct 2017 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fTwmPbYQQjxYTLKtWa77F2IWUJgLWK9IG6K+j11ZE+o=;
	b=OpsBUAe8Nf2EocaqD0D0wLVdlp4xjP/p/w9xSoEpxX35iBJV1Ne2lbIhumHsQ3SGc+
	4bJs5fUpRXWYB4DIp8xFEguKpXrKzqBQNxt46hFz2yF3p2Mk1/rydgp9gb/8tHE6Iam+
	/yrVvM+GI8yzpwTV2p56vcDIjnNu1GxGnV9zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fTwmPbYQQjxYTLKtWa77F2IWUJgLWK9IG6K+j11ZE+o=;
	b=B6//pHZg4kWav6ZTkbzaZ/qtJ52tiZQVRzuwMPBppNMNkNzehovGKE2VK2ngYA75Ec
	BDY58PPNjwGmZuVvXCA2wEMdkYWs1QBINZ886VvjE01+q4Hyg3A9vKjibFmAuRMte1Gj
	DMyUcXMwodTsa6B0Rg+IF8b/IOXK61YLxt36LSBQDnUKDY2idB+X9H8wsQ5HfbZv1fjL
	9UG5fcXHvjRNLwpZYD277p5yL39m63a3yvnJpvTDbt7IWip3csg7L2NRPQaM5FBr+UFP
	TVZzBt6wRX5MMUcR2jqhJd+nJIebQ72flRIjHQ1h+sb813jh+o+HbgQXPEpQUSc1cBga
	Zh1w==
X-Gm-Message-State: AMCzsaXr5E/V+ybwkb3pBn/oeOIyDW6z2dLYXgY4xiTzosqBHV+4n+k9
	nDuC9cNbCb0zGA9tHmK32KjLNo4DWHAIse/UGYeLtw==
X-Google-Smtp-Source: AOwi7QBWr9iIfQ6tBcXqxOgkNF5o8p0er3+VkOyJeWJlffnhqKxsWEcX3/ZycBkpubS7vuRFt8njkBnyC9nbYjVu60w=
X-Received: by 10.28.133.1 with SMTP id h1mr8159171wmd.148.1506971021430; Mon,
	02 Oct 2017 12:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.136.135 with HTTP; Mon, 2 Oct 2017 12:03:40 -0700 (PDT)
In-Reply-To: <20170922160111.31885-11-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Mon, 2 Oct 2017 15:03:40 -0400
Message-ID: <CAFXwXrnnvn0MStu=bPvtTVJbE7TXX-j9t6qaKGeqQTL7OnCwBg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	qemu-trivial@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="001a1144277e6b7c6a055a950826"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 33/34] hw/alpha: remove old
 i386 dependency
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 19:03:44 -0000

--001a1144277e6b7c6a055a950826
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2017-09-22 12:01 GMT-04:00 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>:

> diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
> index b6d8369ed7..ac685c1c46 100644
> --- a/hw/alpha/alpha_sys.h
> +++ b/hw/alpha/alpha_sys.h
> @@ -5,8 +5,6 @@
>
>  #include "target/alpha/cpu-qom.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pci_host.h"
> -#include "hw/ide.h"
>

Why are you deleting pci/pci_host.h here?
Alternately, why are you leaving pci/pci.h?


> diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
> index 8dde637bfe..c370762ea6 100644
> --- a/hw/alpha/pci.c
> +++ b/hw/alpha/pci.c
> @@ -8,6 +8,8 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
>

One way we have a double-include of pci/pci.h here,
the other way we shouldn't re-include either.


r~

--001a1144277e6b7c6a055a950826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2017=
-09-22 12:01 GMT-04:00 Philippe Mathieu-Daud=C3=A9 <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<=
/span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">diff --git a/hw/alpha/alpha_sys.h=
 b/hw/alpha/alpha_sys.h<br>
index b6d8369ed7..ac685c1c46 100644<br>
--- a/hw/alpha/alpha_sys.h<br>
+++ b/hw/alpha/alpha_sys.h<br>
@@ -5,8 +5,6 @@<br>
<br>
=C2=A0#include &quot;target/alpha/cpu-qom.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
-#include &quot;hw/pci/pci_host.h&quot;<br>
-#include &quot;hw/ide.h&quot;<br></blockquote><div><br></div><div>Why are =
you deleting pci/pci_host.h here?</div><div>Alternately, why are you leavin=
g pci/pci.h?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">diff --g=
it a/hw/alpha/pci.c b/hw/alpha/pci.c<br>
index 8dde637bfe..c370762ea6 100644<br>
--- a/hw/alpha/pci.c<br>
+++ b/hw/alpha/pci.c<br>
@@ -8,6 +8,8 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;hw/pci/pci_host.h&quot;<br></blockquote><div><br></div><div=
>One way we have a double-include of pci/pci.h here,</div><div>the other wa=
y we shouldn&#39;t re-include either.</div><div><br></div><div><br></div><d=
iv>r~</div></div></div></div>

--001a1144277e6b7c6a055a950826--

