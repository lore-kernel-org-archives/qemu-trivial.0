Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhxqG-0004HF-Iy
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2019 11:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35095)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hhxqD-0004Bd-BH
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 11:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hhxqB-000279-SH
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 11:03:37 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hhxqB-000265-Lj; Mon, 01 Jul 2019 11:03:35 -0400
Received: by mail-oi1-x244.google.com with SMTP id m202so10206390oig.6;
 Mon, 01 Jul 2019 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=B+A0hFAVCheAwsnwyOOvGgSh2Ve5m1gtOdssRqihzKA=;
 b=Ny+0Zv5yuCIhwi5lRvING1hLhyWtLqDmURc1PtK83Skr2k2tPMT7cnr/rglA4Iz0YS
 xVHzBUhG5oPRbReRV33HOUri+W/PHe4VC1SemXJLtk+kSjpOIfLs6qyyiImqSLrgfs7y
 PFdpXfGEtEb6pnrtwY70J7dBsRCSKbOfAqp4ZXj7Juu4A6MnAc0bSdF4HEA0mapHanDe
 2zvi4DVw9ICTpeznxvikIE81NJvyPB5R3CKTvV/2qvbQVq9OAhi8BCdmAs5tUYmYPM+z
 Ha1r1zZjGMoEjR27Itj4W+GBo7BuGZeQJPP+hGrMK9j6LdwlBBxJ7RsgYR5ixFByeZPS
 vaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=B+A0hFAVCheAwsnwyOOvGgSh2Ve5m1gtOdssRqihzKA=;
 b=QCmd8XTY4IO0LqgWFangP3eO6bhNc9mWe0AreQsGcjXC2Nn848WiEL10Yr2cpxCtEq
 EmpuZn/HaPEtmaFkOqT0BkIplPYnzdlnMzbyRb/yx1kr5/FC6c+7jazCfwTXQUEE0TVO
 k8gW1gwNzPSOjZ3sfy5b/FUeJZ3l1Bqb3GDA7LoW3LoTDjjY0bT7ANLnk1b2zNWu9x68
 jg1KgjhD5N/FhMbsx91BXYg8qWseiMpOmarKD2wo8GXngxDQV9txtT3qhN2F4tdm4wwI
 gnBgpP//BHf5GldIrnfHCpwCUCWoOt5uo5lCFMGliXlPnElsQ6OQPimP70WdRU7j8QiA
 +KdA==
X-Gm-Message-State: APjAAAXi3OtNoaVDLzKXxc5O1+fNfMUn/Kyz72Yd/zUYrY1Bs6ZYOhR0
 +YXdlkCJjbgcBzkG2JkDr0uxPqAQMTKSOK9/f/w=
X-Google-Smtp-Source: APXvYqxHWwGhso8Mz2wTb49BqOq4IT1XfDdKLJRXcz6pN7y9jHYoeVaRCDbp8V2MyaXhbb5BS66mKF6509ErPEsvakU=
X-Received: by 2002:aca:310a:: with SMTP id x10mr7327300oix.62.1561993414062; 
 Mon, 01 Jul 2019 08:03:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP;
 Mon, 1 Jul 2019 08:03:33 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP;
 Mon, 1 Jul 2019 08:03:33 -0700 (PDT)
In-Reply-To: <a09936fe-4fdc-1623-6300-43f4891ff389@redhat.com>
References: <20190607174953.22342-1-philmd@redhat.com>
 <a09936fe-4fdc-1623-6300-43f4891ff389@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 1 Jul 2019 17:03:33 +0200
Message-ID: <CAL1e-=hoWQpmttzUGGbW7x8gGme7VMfEKhw=cFpL5Pg9A9sHDQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, 
 Aleksandar Rikalo <arikalo@wavecomp.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="0000000000009636f3058c9feec8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] BootLinuxSshTest: Only use
 'test' for unittest.TestCase method names
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
X-List-Received-Date: Mon, 01 Jul 2019 15:03:39 -0000

--0000000000009636f3058c9feec8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Jul 1, 2019 4:22 PM, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> w=
rote:
>
> ping?
>
> On 6/7/19 7:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > In commit f6e501a28ef9, Eduardo started to use "check_" as a
> > prefix for methods of similar purpose. Follow this prior art,
> > since it might become the conventions when writting Avocado
> > tests.
> >
> > Suggested-by: Cleber Rosa <crosa@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

> >  tests/acceptance/linux_ssh_mips_malta.py | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/acceptance/linux_ssh_mips_malta.py
b/tests/acceptance/linux_ssh_mips_malta.py
> > index aafb0c39f6..134f10cac3 100644
> > --- a/tests/acceptance/linux_ssh_mips_malta.py
> > +++ b/tests/acceptance/linux_ssh_mips_malta.py
> > @@ -162,7 +162,7 @@ class LinuxSSH(Test):
> >          self.assertIn(True, ["0dfbe8aa4c20b52e1b8bf3cb6cbdf193" in lin=
e
> >                               for line in stdout])
> >
> > -    def do_test_mips_malta(self, endianess, kernel_path, uname_m):
> > +    def check_mips_malta(self, endianess, kernel_path, uname_m):
> >          self.boot_debian_wheezy_image_and_ssh_login(endianess,
kernel_path)
> >
> >          stdout, stderr =3D self.ssh_command('uname -a')
> > @@ -184,7 +184,7 @@ class LinuxSSH(Test):
> >          kernel_hash =3D '592e384a4edc16dade52a6cd5c785c637bcbc9ad'
> >          kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> >
> > -        self.do_test_mips_malta('be', kernel_path, 'mips')
> > +        self.check_mips_malta('be', kernel_path, 'mips')
> >
> >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
Travis-CI')
> >      def test_mips_malta32el_kernel3_2_0(self):
> > @@ -199,7 +199,7 @@ class LinuxSSH(Test):
> >          kernel_hash =3D 'a66bea5a8adaa2cb3d36a1d4e0ccdb01be8f6c2a'
> >          kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> >
> > -        self.do_test_mips_malta('le', kernel_path, 'mips')
> > +        self.check_mips_malta('le', kernel_path, 'mips')
> >
> >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
Travis-CI')
> >      def test_mips_malta64eb_kernel3_2_0(self):
> > @@ -213,7 +213,7 @@ class LinuxSSH(Test):
> >                        'vmlinux-3.2.0-4-5kc-malta')
> >          kernel_hash =3D 'db6eea7de35d36c77d8c165b6bcb222e16eb91db'
> >          kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> > -        self.do_test_mips_malta('be', kernel_path, 'mips64')
> > +        self.check_mips_malta('be', kernel_path, 'mips64')
> >
> >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
Travis-CI')
> >      def test_mips_malta64el_kernel3_2_0(self):
> > @@ -227,4 +227,4 @@ class LinuxSSH(Test):
> >                        'vmlinux-3.2.0-4-5kc-malta')
> >          kernel_hash =3D '6a7f77245acf231415a0e8b725d91ed2f3487794'
> >          kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> > -        self.do_test_mips_malta('le', kernel_path, 'mips64')
> > +        self.check_mips_malta('le', kernel_path, 'mips64')
> >
>

--0000000000009636f3058c9feec8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 1, 2019 4:22 PM, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=
=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ping?<br>
&gt;<br>
&gt; On 6/7/19 7:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; In commit f6e501a28ef9, Eduardo started to use &quot;check_&quot;=
 as a<br>
&gt; &gt; prefix for methods of similar purpose. Follow this prior art,<br>
&gt; &gt; since it might become the conventions when writting Avocado<br>
&gt; &gt; tests.<br>
&gt; &gt; <br>
&gt; &gt; Suggested-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com"=
>crosa@redhat.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:=
philmd@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; &gt; ---</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">&gt; &gt;=C2=A0 tests/acceptance/linux_ssh_mips_malta.py | 1=
0 +++++-----<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acc=
eptance/linux_ssh_mips_malta.py<br>
&gt; &gt; index aafb0c39f6..134f10cac3 100644<br>
&gt; &gt; --- a/tests/acceptance/linux_ssh_mips_malta.py<br>
&gt; &gt; +++ b/tests/acceptance/linux_ssh_mips_malta.py<br>
&gt; &gt; @@ -162,7 +162,7 @@ class LinuxSSH(Test):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(True, [&quot;0dfb=
e8aa4c20b52e1b8bf3cb6cbdf193&quot; in line<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for line in stdout])<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 def do_test_mips_malta(self, endianess, kernel_pat=
h, uname_m):<br>
&gt; &gt; +=C2=A0 =C2=A0 def check_mips_malta(self, endianess, kernel_path,=
 uname_m):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.boot_debian_wheezy_image_a=
nd_ssh_login(endianess, kernel_path)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout, stderr =3D self.ssh_com=
mand(&#39;uname -a&#39;)<br>
&gt; &gt; @@ -184,7 +184,7 @@ class LinuxSSH(Test):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;592e384a4e=
dc16dade52a6cd5c785c637bcbc9ad&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asse=
t(kernel_url, asset_hash=3Dkernel_hash)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#39;be&#39;=
, kernel_path, &#39;mips&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39;be&#39;, =
kernel_path, &#39;mips&#39;)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 @skipIf(os.getenv(&#39;CONTINUOUS_INTEGRATION=
&#39;), &#39;Running on Travis-CI&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_mips_malta32el_kernel3_2_0(self):<br=
>
&gt; &gt; @@ -199,7 +199,7 @@ class LinuxSSH(Test):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;a66bea5a8a=
daa2cb3d36a1d4e0ccdb01be8f6c2a&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asse=
t(kernel_url, asset_hash=3Dkernel_hash)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#39;le&#39;=
, kernel_path, &#39;mips&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39;le&#39;, =
kernel_path, &#39;mips&#39;)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 @skipIf(os.getenv(&#39;CONTINUOUS_INTEGRATION=
&#39;), &#39;Running on Travis-CI&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_mips_malta64eb_kernel3_2_0(self):<br=
>
&gt; &gt; @@ -213,7 +213,7 @@ class LinuxSSH(Test):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;vmlinux-3.2.0-4-5kc-malta&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;db6eea7de3=
5d36c77d8c165b6bcb222e16eb91db&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asse=
t(kernel_url, asset_hash=3Dkernel_hash)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#39;be&#39;=
, kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39;be&#39;, =
kernel_path, &#39;mips64&#39;)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 @skipIf(os.getenv(&#39;CONTINUOUS_INTEGRATION=
&#39;), &#39;Running on Travis-CI&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_mips_malta64el_kernel3_2_0(self):<br=
>
&gt; &gt; @@ -227,4 +227,4 @@ class LinuxSSH(Test):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;vmlinux-3.2.0-4-5kc-malta&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;6a7f77245a=
cf231415a0e8b725d91ed2f3487794&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asse=
t(kernel_url, asset_hash=3Dkernel_hash)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#39;le&#39;=
, kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39;le&#39;, =
kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; <br>
&gt;<br>
</p>

--0000000000009636f3058c9feec8--

