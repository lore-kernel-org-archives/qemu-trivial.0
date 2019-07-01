Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhy9j-00015W-90
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2019 11:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hhy9g-00011v-V0
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 11:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hhy9f-0005WQ-Px
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 11:23:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1hhy9d-0005TG-37; Mon, 01 Jul 2019 11:23:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2748C057F88;
 Mon,  1 Jul 2019 15:23:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-124-195.rdu2.redhat.com
 [10.10.124.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D4A2BA4D;
 Mon,  1 Jul 2019 15:23:34 +0000 (UTC)
Date: Mon, 1 Jul 2019 11:23:32 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>, ehabkost@redhat.com
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20190701152332.GA30640@localhost.localdomain>
References: <20190607174953.22342-1-philmd@redhat.com>
 <a09936fe-4fdc-1623-6300-43f4891ff389@redhat.com>
 <CAL1e-=hoWQpmttzUGGbW7x8gGme7VMfEKhw=cFpL5Pg9A9sHDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAL1e-=hoWQpmttzUGGbW7x8gGme7VMfEKhw=cFpL5Pg9A9sHDQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 15:23:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 01 Jul 2019 15:23:46 -0000

On Mon, Jul 01, 2019 at 05:03:33PM +0200, Aleksandar Markovic wrote:
> On Jul 1, 2019 4:22 PM, "Philippe Mathieu-Daud=E9" <philmd@redhat.com> =
wrote:
> >
> > ping?
> >
> > On 6/7/19 7:49 PM, Philippe Mathieu-Daud=E9 wrote:
> > > In commit f6e501a28ef9, Eduardo started to use "check_" as a
> > > prefix for methods of similar purpose. Follow this prior art,
> > > since it might become the conventions when writting Avocado
> > > tests.
> > >
> > > Suggested-by: Cleber Rosa <crosa@redhat.com>
> > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > ---
>=20
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

And queued on my python-next branch.

>=20
> > >  tests/acceptance/linux_ssh_mips_malta.py | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/tests/acceptance/linux_ssh_mips_malta.py
> b/tests/acceptance/linux_ssh_mips_malta.py
> > > index aafb0c39f6..134f10cac3 100644
> > > --- a/tests/acceptance/linux_ssh_mips_malta.py
> > > +++ b/tests/acceptance/linux_ssh_mips_malta.py
> > > @@ -162,7 +162,7 @@ class LinuxSSH(Test):
> > >          self.assertIn(True, ["0dfbe8aa4c20b52e1b8bf3cb6cbdf193" in=
 line
> > >                               for line in stdout])
> > >
> > > -    def do_test_mips_malta(self, endianess, kernel_path, uname_m):
> > > +    def check_mips_malta(self, endianess, kernel_path, uname_m):
> > >          self.boot_debian_wheezy_image_and_ssh_login(endianess,
> kernel_path)
> > >
> > >          stdout, stderr =3D self.ssh_command('uname -a')
> > > @@ -184,7 +184,7 @@ class LinuxSSH(Test):
> > >          kernel_hash =3D '592e384a4edc16dade52a6cd5c785c637bcbc9ad'
> > >          kernel_path =3D self.fetch_asset(kernel_url,
> asset_hash=3Dkernel_hash)
> > >
> > > -        self.do_test_mips_malta('be', kernel_path, 'mips')
> > > +        self.check_mips_malta('be', kernel_path, 'mips')
> > >
> > >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
> Travis-CI')
> > >      def test_mips_malta32el_kernel3_2_0(self):
> > > @@ -199,7 +199,7 @@ class LinuxSSH(Test):
> > >          kernel_hash =3D 'a66bea5a8adaa2cb3d36a1d4e0ccdb01be8f6c2a'
> > >          kernel_path =3D self.fetch_asset(kernel_url,
> asset_hash=3Dkernel_hash)
> > >
> > > -        self.do_test_mips_malta('le', kernel_path, 'mips')
> > > +        self.check_mips_malta('le', kernel_path, 'mips')
> > >
> > >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
> Travis-CI')
> > >      def test_mips_malta64eb_kernel3_2_0(self):
> > > @@ -213,7 +213,7 @@ class LinuxSSH(Test):
> > >                        'vmlinux-3.2.0-4-5kc-malta')
> > >          kernel_hash =3D 'db6eea7de35d36c77d8c165b6bcb222e16eb91db'
> > >          kernel_path =3D self.fetch_asset(kernel_url,
> asset_hash=3Dkernel_hash)
> > > -        self.do_test_mips_malta('be', kernel_path, 'mips64')
> > > +        self.check_mips_malta('be', kernel_path, 'mips64')
> > >
> > >      @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on
> Travis-CI')
> > >      def test_mips_malta64el_kernel3_2_0(self):
> > > @@ -227,4 +227,4 @@ class LinuxSSH(Test):
> > >                        'vmlinux-3.2.0-4-5kc-malta')
> > >          kernel_hash =3D '6a7f77245acf231415a0e8b725d91ed2f3487794'
> > >          kernel_path =3D self.fetch_asset(kernel_url,
> asset_hash=3Dkernel_hash)
> > > -        self.do_test_mips_malta('le', kernel_path, 'mips64')
> > > +        self.check_mips_malta('le', kernel_path, 'mips64')
> > >
> >

