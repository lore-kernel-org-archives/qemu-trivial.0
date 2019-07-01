Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hi4Kk-0003cp-Cd
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2019 17:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hi4Kh-0003Yk-3m
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 17:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hi4Kf-0007uI-LO
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 17:59:31 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hi4Kf-0007u5-Dx; Mon, 01 Jul 2019 17:59:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id w7so11269999oic.3;
 Mon, 01 Jul 2019 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=giwH7CgD6/A63HEnNwr1sQ4JxuR6Deb9LpUuZLXIuxc=;
 b=cjEKlP+oD5jhjwdPimkYk7w0HhfZPp9uQaxhWuIv7hFDxDhRljecYXAv5z0D1sVZa+
 suG29Sfi7h4CB8y6emXvcSvlRNhpzDR2GJgYUJxNwFCHDUf5Q4WgfF0Y3JXkXXjjD5bT
 YmpvFb3/91vLzZNhyTGOisqivW3Fpe0DFRelSakugMHksHWsDshZnC71GUgVEBGjbeJk
 IZv8wK/f3P+/xssqgB2XpcfCKEAbaQ1YppdVrLfIhtDgARGtwbfM0T1BUYSoD7LetT+x
 0FrCCh++MEGViXzwo7AAGvAOBdC6BWSf2zkuHJYY7ScaIphskdSPCBOjg6zrosbzRY/4
 8fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=giwH7CgD6/A63HEnNwr1sQ4JxuR6Deb9LpUuZLXIuxc=;
 b=ZMu72GuIuNNAqUkRjsmOSbdVw8tEnPPY080/2hEyKmVpfaWjTEaObU8PsZgow57wMK
 WVkE/IPN2zuky81em9EDjJVyocYB61PfgrD/eMCn47Hu86A91LSDvQmogods/N8R9smF
 wQv52Ex/28O0O/hir6B1KJhtjrOI2aIZ3lKXL0A8gi5zvuszRhXxnzICwIbCPpEZpIAz
 DDqW44vEr1Qeop1XnpUyPBazCXbGAcJ75rsv7I5yRJe3lCcKnEyD2k/bE7rfpriLZjc3
 tok432kwyE/8hEl3LiQTS8iXvu/eaJg2ERfDhTWn1uY7PKnsHiKvwxIx0Dh0ysY9KNhl
 ujiQ==
X-Gm-Message-State: APjAAAV5gxwcj1KD4kAJF8dGHv+39oPjdP9G/A+KM8YDrO0s4dFSCMAl
 puKW/yCzgnNF7XJ1h438DwcPHpBoKp7ONAh6t7wEOg==
X-Google-Smtp-Source: APXvYqwKs/levlATGmDoZjTsqCGH5vrd0vmMo/14DURow/y9KCgErPJG34cQGcMZ7q/LvXLjEjPVoRhBlt88yFn8Ml8=
X-Received: by 2002:aca:310a:: with SMTP id x10mr271485oix.62.1562001901761;
 Mon, 01 Jul 2019 10:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP;
 Mon, 1 Jul 2019 10:25:01 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP;
 Mon, 1 Jul 2019 10:25:01 -0700 (PDT)
In-Reply-To: <20190701152332.GA30640@localhost.localdomain>
References: <20190607174953.22342-1-philmd@redhat.com>
 <a09936fe-4fdc-1623-6300-43f4891ff389@redhat.com>
 <CAL1e-=hoWQpmttzUGGbW7x8gGme7VMfEKhw=cFpL5Pg9A9sHDQ@mail.gmail.com>
 <20190701152332.GA30640@localhost.localdomain>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 1 Jul 2019 19:25:01 +0200
Message-ID: <CAL1e-=gukWv2ZTDFSmnTLA-pMpgxYDTUghvXk88ur6Fc-8RP1w@mail.gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 ehabkost@redhat.com, Aleksandar Rikalo <arikalo@wavecomp.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="0000000000007e3a0a058ca1e8c2"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.194
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
X-List-Received-Date: Mon, 01 Jul 2019 21:59:32 -0000

--0000000000007e3a0a058ca1e8c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Jul 1, 2019 5:23 PM, "Cleber Rosa" <crosa@redhat.com> wrote:
>
> On Mon, Jul 01, 2019 at 05:03:33PM +0200, Aleksandar Markovic wrote:
> > On Jul 1, 2019 4:22 PM, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.co=
m>
wrote:
> > >
> > > ping?
> > >
> > > On 6/7/19 7:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > In commit f6e501a28ef9, Eduardo started to use "check_" as a
> > > > prefix for methods of similar purpose. Follow this prior art,
> > > > since it might become the conventions when writting Avocado
> > > > tests.
> > > >
> > > > Suggested-by: Cleber Rosa <crosa@redhat.com>
> > > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > > ---
> >
> > Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>
> And queued on my python-next branch.
>

Beautiful, thanks!

> >
> > > >  tests/acceptance/linux_ssh_mips_malta.py | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/tests/acceptance/linux_ssh_mips_malta.py
> > b/tests/acceptance/linux_ssh_mips_malta.py
> > > > index aafb0c39f6..134f10cac3 100644
> > > > --- a/tests/acceptance/linux_ssh_mips_malta.py
> > > > +++ b/tests/acceptance/linux_ssh_mips_malta.py
> > > > @@ -162,7 +162,7 @@ class LinuxSSH(Test):
> > > >          self.assertIn(True, ["0dfbe8aa4c20b52e1b8bf3cb6cbdf193" in
line
> > > >                               for line in stdout])
> > > >
> > > > -    def do_test_mips_malta(self, endianess, kernel_path, uname_m):
> > > > +    def check_mips_malta(self, endianess, kernel_path, uname_m):
> > > >          self.boot_debian_wheezy_image_and_ssh_login(endianess,
> > kernel_path)
> > > >
> > > >          stdout, stderr =3D self.ssh_command('uname -a')
> > > > @@ -184,7 +184,7 @@ class LinuxSSH(Test):
> > > >          kernel_hash =3D '592e384a4edc16dade52a6cd5c785c637bcbc9ad'
> > > >          kernel_path =3D self.fetch_asset(kernel_url,
> > asset_hash=3Dkernel_hash)
> > > >
> > > > -        self.do_test_mips_malta('be', kernel_path, 'mips')
> > > > +        self.check_mips_malta('be', kernel_path, 'mips')
> > > >
> > > >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
> > Travis-CI')
> > > >      def test_mips_malta32el_kernel3_2_0(self):
> > > > @@ -199,7 +199,7 @@ class LinuxSSH(Test):
> > > >          kernel_hash =3D 'a66bea5a8adaa2cb3d36a1d4e0ccdb01be8f6c2a'
> > > >          kernel_path =3D self.fetch_asset(kernel_url,
> > asset_hash=3Dkernel_hash)
> > > >
> > > > -        self.do_test_mips_malta('le', kernel_path, 'mips')
> > > > +        self.check_mips_malta('le', kernel_path, 'mips')
> > > >
> > > >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
> > Travis-CI')
> > > >      def test_mips_malta64eb_kernel3_2_0(self):
> > > > @@ -213,7 +213,7 @@ class LinuxSSH(Test):
> > > >                        'vmlinux-3.2.0-4-5kc-malta')
> > > >          kernel_hash =3D 'db6eea7de35d36c77d8c165b6bcb222e16eb91db'
> > > >          kernel_path =3D self.fetch_asset(kernel_url,
> > asset_hash=3Dkernel_hash)
> > > > -        self.do_test_mips_malta('be', kernel_path, 'mips64')
> > > > +        self.check_mips_malta('be', kernel_path, 'mips64')
> > > >
> > > >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
> > Travis-CI')
> > > >      def test_mips_malta64el_kernel3_2_0(self):
> > > > @@ -227,4 +227,4 @@ class LinuxSSH(Test):
> > > >                        'vmlinux-3.2.0-4-5kc-malta')
> > > >          kernel_hash =3D '6a7f77245acf231415a0e8b725d91ed2f3487794'
> > > >          kernel_path =3D self.fetch_asset(kernel_url,
> > asset_hash=3Dkernel_hash)
> > > > -        self.do_test_mips_malta('le', kernel_path, 'mips64')
> > > > +        self.check_mips_malta('le', kernel_path, 'mips64')
> > > >
> > >

--0000000000007e3a0a058ca1e8c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 1, 2019 5:23 PM, &quot;Cleber Rosa&quot; &lt;<a href=3D"mailto:crosa=
@redhat.com">crosa@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jul 01, 2019 at 05:03:33PM +0200, Aleksandar Markovic wrote:<b=
r>
&gt; &gt; On Jul 1, 2019 4:22 PM, &quot;Philippe Mathieu-Daud=C3=A9&quot; &=
lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ping?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 6/7/19 7:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; &gt; &gt; In commit f6e501a28ef9, Eduardo started to use &quot;ch=
eck_&quot; as a<br>
&gt; &gt; &gt; &gt; prefix for methods of similar purpose. Follow this prio=
r art,<br>
&gt; &gt; &gt; &gt; since it might become the conventions when writting Avo=
cado<br>
&gt; &gt; &gt; &gt; tests.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Suggested-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@r=
edhat.com">crosa@redhat.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt; Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@=
wavecomp.com">amarkovic@wavecomp.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa=
@redhat.com</a>&gt;<br>
&gt;<br>
&gt; And queued on my python-next branch.<br>
&gt;</p>
<p dir=3D"ltr">Beautiful, thanks!</p>
<p dir=3D"ltr">&gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 tests/acceptance/linux_ssh_mips_malta.py | 10 +++=
++-----<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/tests/acceptance/linux_ssh_mips_malta.py<b=
r>
&gt; &gt; b/tests/acceptance/linux_ssh_mips_malta.py<br>
&gt; &gt; &gt; &gt; index aafb0c39f6..134f10cac3 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/acceptance/linux_ssh_mips_malta.py<br>
&gt; &gt; &gt; &gt; +++ b/tests/acceptance/linux_ssh_mips_malta.py<br>
&gt; &gt; &gt; &gt; @@ -162,7 +162,7 @@ class LinuxSSH(Test):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(True, [=
&quot;0dfbe8aa4c20b52e1b8bf3cb6cbdf193&quot; in line<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for line in stdout])=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 def do_test_mips_malta(self, endianess, =
kernel_path, uname_m):<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 def check_mips_malta(self, endianess, ke=
rnel_path, uname_m):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.boot_debian_whee=
zy_image_and_ssh_login(endianess,<br>
&gt; &gt; kernel_path)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout, stderr =3D se=
lf.ssh_command(&#39;uname -a&#39;)<br>
&gt; &gt; &gt; &gt; @@ -184,7 +184,7 @@ class LinuxSSH(Test):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;=
592e384a4edc16dade52a6cd5c785c637bcbc9ad&#39;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.=
fetch_asset(kernel_url,<br>
&gt; &gt; asset_hash=3Dkernel_hash)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#=
39;be&#39;, kernel_path, &#39;mips&#39;)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39=
;be&#39;, kernel_path, &#39;mips&#39;)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 @skipIf(os.getenv(&#39;CONTINUOUS_I=
NTEGRATION&#39;), &#39;Running on<br>
&gt; &gt; Travis-CI&#39;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_mips_malta32el_kernel3_2_0=
(self):<br>
&gt; &gt; &gt; &gt; @@ -199,7 +199,7 @@ class LinuxSSH(Test):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;=
a66bea5a8adaa2cb3d36a1d4e0ccdb01be8f6c2a&#39;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.=
fetch_asset(kernel_url,<br>
&gt; &gt; asset_hash=3Dkernel_hash)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#=
39;le&#39;, kernel_path, &#39;mips&#39;)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39=
;le&#39;, kernel_path, &#39;mips&#39;)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 @skipIf(os.getenv(&#39;CONTINUOUS_I=
NTEGRATION&#39;), &#39;Running on<br>
&gt; &gt; Travis-CI&#39;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_mips_malta64eb_kernel3_2_0=
(self):<br>
&gt; &gt; &gt; &gt; @@ -213,7 +213,7 @@ class LinuxSSH(Test):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmlinux-3.2.0-4-5kc-malta&#39;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;=
db6eea7de35d36c77d8c165b6bcb222e16eb91db&#39;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.=
fetch_asset(kernel_url,<br>
&gt; &gt; asset_hash=3Dkernel_hash)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#=
39;be&#39;, kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39=
;be&#39;, kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 @skipIf(os.getenv(&#39;CONTINUOUS_I=
NTEGRATION&#39;), &#39;Running on<br>
&gt; &gt; Travis-CI&#39;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_mips_malta64el_kernel3_2_0=
(self):<br>
&gt; &gt; &gt; &gt; @@ -227,4 +227,4 @@ class LinuxSSH(Test):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmlinux-3.2.0-4-5kc-malta&#39;)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;=
6a7f77245acf231415a0e8b725d91ed2f3487794&#39;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.=
fetch_asset(kernel_url,<br>
&gt; &gt; asset_hash=3Dkernel_hash)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.do_test_mips_malta(&#=
39;le&#39;, kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_mips_malta(&#39=
;le&#39;, kernel_path, &#39;mips64&#39;)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
</p>

--0000000000007e3a0a058ca1e8c2--

