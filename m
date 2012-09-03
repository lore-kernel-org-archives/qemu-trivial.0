Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8ZzH-00043w-R1
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 12:58:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T8ZVc-0006ce-W2
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T8ZVb-0003qN-GO
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:28:20 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:55384
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T8ZVb-0003q6-7f
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:28:19 -0400
Received: from treguer.localnet ([90.32.144.8]) by mwinf5d58 with ME
	id ugUF1j00h0B56Sa03gUFz7; Mon, 03 Sep 2012 18:28:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Organization: BZH lan
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Sep 2012 18:28:14 +0200
User-Agent: KMail/1.13.5 (Linux/3.5.3-treguer; KDE/4.4.5; x86_64; ; )
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
	<5044CFBC.9050800@suse.de>
	<CAFEAcA88-bBA57REcsfU+FmLr7J2y_qD+n+_G_mBp6f1EtxuBw@mail.gmail.com>
In-Reply-To: <CAFEAcA88-bBA57REcsfU+FmLr7J2y_qD+n+_G_mBp6f1EtxuBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201209031828.15426.yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.125
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2 v3] Fix static linking
	for cURL and SDL
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 16:58:58 -0000

Hello All,

On Monday 03 September 2012 17:44:51 Peter Maydell wrote:
> On 3 September 2012 16:41, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> > The only use case for QEMU's --static compilation I know is linux-user,
> > and that doesn't need cURL or SDL AFAIK. Shouldn't we rather sanitize
> > our configure-time checks to only look for the actually needed stuff
> > than making sure that unnecessary dependencies are generated nicely?
>=20
> In particular it might be nice to be able to build in a single
> run both (a) dynamically linked softmmu targets and (b) statically
> linked linux-user targets (and maybe even also (c) dynamically
> linked linux-user targets?).
>=20
> Personally I think it might indeed be a good idea to just say
> "statically linked softmmu isn't supported" and forbid it, unless
> somebody has a good use case for it...

I personnally have such a use-case: provide run-everywhere qemu softmmu
binaries that do have minimal requirements on the distro they'll be
running on, especially when the distros can be very different (in kinds
and in age).

=46or example, I can use it to provide:
  - a qemu binary
  - a VM image
  - a script
that users can simply drop anywhere they want (without needing root
access) and run the VM, without requiring them to install a myriad
packages, especially on older distros that may lack those packages,
or whose packaged versions are too old for qemu.

Regards,
Yann E. MORIN.

=2D-=20
=2E-----------------.--------------------.------------------.--------------=
=2D-----.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
=2D---'

