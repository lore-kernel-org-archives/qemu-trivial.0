Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8a6q-0007vq-4Y
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 13:06:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T8a6n-0007qy-C1
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T8a6h-0007pI-8J
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:06:45 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:28374
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T8a6h-0007og-2Q
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:06:39 -0400
Received: from treguer.localnet ([90.32.144.8]) by mwinf5d58 with ME
	id uh6d1j00C0B56Sa03h6d7G; Mon, 03 Sep 2012 19:06:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Organization: BZH lan
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Sep 2012 19:06:36 +0200
User-Agent: KMail/1.13.5 (Linux/3.5.3-treguer; KDE/4.4.5; x86_64; ; )
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
	<201209031828.15426.yann.morin.1998@free.fr>
	<CAFEAcA-4CMyAONn5QOb7PKi0Zv=pioEOxgCLEZBmSM7t+Cgv7g@mail.gmail.com>
In-Reply-To: <CAFEAcA-4CMyAONn5QOb7PKi0Zv=pioEOxgCLEZBmSM7t+Cgv7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201209031906.37062.yann.morin.1998@free.fr>
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
X-List-Received-Date: Mon, 03 Sep 2012 17:06:46 -0000

Peter, All,

On Monday 03 September 2012 18:38:48 Peter Maydell wrote:
> On 3 September 2012 17:28, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On Monday 03 September 2012 17:44:51 Peter Maydell wrote:
> >> Personally I think it might indeed be a good idea to just say
> >> "statically linked softmmu isn't supported" and forbid it, unless
> >> somebody has a good use case for it...
> >
> > I personnally have such a use-case: provide run-everywhere qemu softmmu
> > binaries that do have minimal requirements on the distro they'll be
> > running on, especially when the distros can be very different (in kinds
> > and in age).
> 
> ...have you audited all of qemu's library usage to confirm that it
> doesn't use any of the bits of glibc that don't work in the static
> linking scenario? I'm reasonably confident that the linux-user binaries
> are OK, much less so for the system binaries...

I guess you mean the nsswitch stuff?

I'm using a uClibc-based toolchain that does not have such libs, and allows
a truly static link.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

