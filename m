Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNuSS-0003Zh-GK
	for mharc-qemu-trivial@gnu.org; Wed, 30 May 2018 02:19:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNuSP-0003Wk-Br
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 02:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNuSN-0001wQ-Sm
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 02:19:37 -0400
Received: from mail-yb0-f193.google.com ([209.85.213.193]:42007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNuSI-0001sn-Vo; Wed, 30 May 2018 02:19:31 -0400
Received: by mail-yb0-f193.google.com with SMTP id d123-v6so5967080ybh.9;
	Tue, 29 May 2018 23:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X/enLrvTvozeqa6gWdiJO+/5kI1bEHammfpcgV30Gvg=;
	b=VookSVL/JmJwEoPhd71CImOgIltsbwj+M+H8XYca4V9cvKr4BYIwXHM5jk06q1Zkhl
	rXa8NYmIv77U+WdUx3HjUTK6KJCWdhtieOOC4pRrHslT2fgIja9H3asBMW9yMBmavzGf
	9i5rViVKtb+s4EjJP2dq/4h6TnC7pwsTOrW0eeJFekwZceeKP9IB8AxhjoyYW8ec3VoV
	xZPu5fFd52AteWiucTLBOLFjS8NUy7S4n+pa8cdYWeKyGWiNtd0Wnxx6uvFeXRMuW9Jy
	v6u0/M9vLxYadwUmE+lwiPaZ4uPLHibIAkb26yAHDRBSpC2z1pRFfhqoCWm/yv5Sxcv3
	Zz6Q==
X-Gm-Message-State: ALKqPweWWxqMsy6qJalFmd//ropkz0Un0IvhCwoUtAxzeMaTLdjLlOhN
	2EanJUhObQPp74An9DrJbwAvyEXZPvFEqusdA9s=
X-Google-Smtp-Source: ADUXVKKBmdXHypaVQzVPrc08ufNFTeW9BucARNhT0UwFg7/u7JAzQMtwqG/3VJM26PA+fKVTCrDPbQ94iWYr6xdCE4A=
X-Received: by 2002:a25:4cc3:: with SMTP id
	z186-v6mr739513yba.81.1527661170269; 
	Tue, 29 May 2018 23:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
	<20180530074026-mutt-send-email-mst@kernel.org>
	<CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
In-Reply-To: <CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 30 May 2018 03:19:19 -0300
Message-ID: <CAAdtpL6eW5=djFE-k7bHUR6s_b=wAmMuOLM8Djb_CYPf54L8CA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>, 
	Anthony Green <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, 
	David Hildenbrand <david@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>, 
	"open list:S390" <qemu-s390x@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000642448056d665583"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.193
Subject: Re: [Qemu-trivial] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
X-List-Received-Date: Wed, 30 May 2018 06:19:38 -0000

--000000000000642448056d665583
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 30 mai 2018 02:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> a
=C3=A9crit :

> On Wed, May 30, 2018 at 1:42 AM, Michael S. Tsirkin <mst@redhat.com>
> wrote:
> > On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> Hi Cornelia,
> >>
> >> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
> >> > On Mon, 28 May 2018 20:27:07 -0300
> >> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >> >
> >> >> Code change produced with:
> >> >>     $ git grep '#include "exec/exec-all.h"' | \
> >> >>       cut -d: -f-1 | \
> >> >>       xargs egrep -L
> "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|singlestep|TranslationB=
lock)"
> | \
> >> >
> >> > Hm, does this expression catch all files that need to include
> >> > exec-all.h? The resulting patch seems fine, though.
> >>
> >> No, not all :/
> >> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
> >> more errors appear. In 2 more steps I added "cpu_address_space_init|"
> >> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for =
my
> >> goal than trying to build a regex to explode function/struct names fro=
m
> >> headers. This is a clever way to do it for long term command reuse tak=
en
> >> from commit messages...
> >
> > Brutebuilding isn't a good way to find unused includes, some other head=
er
> > might pull in an include you are trying to remove for its own purposes.
> > If you want to try brutebuilding you must also verify that's
> > not the case - e.g. look at the dependency file generated.
>

I think I get it for headers, but here I'm only modifying .c source files.
I'll restrict the shell command to .c


> Hmm you mean the .d files in the build dir?
>
> i.e.
> $ find lm32-softmmu -name \*.d -exec fgrep -L exec-all.h {} \; | sed
> -e 's/.*-softmmu\/\(.*\)d$/\1c/'
> dump.c
> numa.c
> tcg/tcg-common.c
> tcg/optimize.c
> tcg/tcg-op-gvec.c
> tcg/tcg-op-vec.c
> accel/tcg/tcg-runtime-gvec.c
> accel/tcg/tcg-all.c
> accel/accel.c
> accel/stubs/whpx-stub.c
> accel/stubs/hvf-stub.c
> accel/stubs/kvm-stub.c
> accel/stubs/hax-stub.c
> hw/lm32/milkymist.c
> hw/lm32/lm32_boards.c
> hw/core/generic-loader.c
> ...
>
> Then look why each .c included it?
>
> >
> >> >>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
> >> >>
> >> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

--000000000000642448056d665583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">Le mer. =
30 mai 2018 02:50, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@=
amsat.org">f4bug@amsat.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Wed, May 30, 2018 at 1:42 AM, Michael S. Tsirkin &lt=
;<a href=3D"mailto:mst@redhat.com" target=3D"_blank" rel=3D"noreferrer">mst=
@redhat.com</a>&gt; wrote:<br>
&gt; On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=C3=A9 =
wrote:<br>
&gt;&gt; Hi Cornelia,<br>
&gt;&gt;<br>
&gt;&gt; On 05/29/2018 08:40 AM, Cornelia Huck wrote:<br>
&gt;&gt; &gt; On Mon, 28 May 2018 20:27:07 -0300<br>
&gt;&gt; &gt; Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat=
.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Code change produced with:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0$ git grep &#39;#include &quot;exec/ex=
ec-all.h&quot;&#39; | \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cut -d: -f-1 | \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xargs egrep -L &quot;(cpu_addre=
ss_space_init|cpu_loop_|tlb_|tb_|GETPC|singlestep|TranslationBlock)&quot; |=
 \<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hm, does this expression catch all files that need to include=
<br>
&gt;&gt; &gt; exec-all.h? The resulting patch seems fine, though.<br>
&gt;&gt;<br>
&gt;&gt; No, not all :/<br>
&gt;&gt; I started with &quot;(cpu_loop_|tlb_|tb_)&quot; then kept brutebui=
lding until no<br>
&gt;&gt; more errors appear. In 2 more steps I added &quot;cpu_address_spac=
e_init|&quot;<br>
&gt;&gt; then &quot;|GETPC|singlestep|TranslationBlock&quot;. Quick and dir=
ty enough for my<br>
&gt;&gt; goal than trying to build a regex to explode function/struct names=
 from<br>
&gt;&gt; headers. This is a clever way to do it for long term command reuse=
 taken<br>
&gt;&gt; from commit messages...<br>
&gt;<br>
&gt; Brutebuilding isn&#39;t a good way to find unused includes, some other=
 header<br>
&gt; might pull in an include you are trying to remove for its own purposes=
.<br>
&gt; If you want to try brutebuilding you must also verify that&#39;s<br>
&gt; not the case - e.g. look at the dependency file generated.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think I ge=
t it for headers, but here I&#39;m only modifying .c source files.=C2=A0</d=
iv><div dir=3D"auto">I&#39;ll restrict the shell command to .c=C2=A0</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
Hmm you mean the .d files in the build dir?<br>
<br>
i.e.<br>
$ find lm32-softmmu -name \*.d -exec fgrep -L exec-all.h {} \; | sed<br>
-e &#39;s/.*-softmmu\/\(.*\)d$/\1c/&#39;<br>
dump.c<br>
numa.c<br>
tcg/tcg-common.c<br>
tcg/optimize.c<br>
tcg/tcg-op-gvec.c<br>
tcg/tcg-op-vec.c<br>
accel/tcg/tcg-runtime-gvec.c<br>
accel/tcg/tcg-all.c<br>
accel/accel.c<br>
accel/stubs/whpx-stub.c<br>
accel/stubs/hvf-stub.c<br>
accel/stubs/kvm-stub.c<br>
accel/stubs/hax-stub.c<br>
hw/lm32/milkymist.c<br>
hw/lm32/lm32_boards.c<br>
hw/core/generic-loader.c<br>
...<br>
<br>
Then look why each .c included it?<br>
<br>
&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xargs sed -i.bak &#39;/#include=
 &quot;exec\/exec-all.h&quot;/d&#39;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D=
"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.o=
rg</a>&gt;<br>
</blockquote></div></div></div>

--000000000000642448056d665583--

