Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7Zi5-0001cz-Jo
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 18:29:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T7Zi2-0001bO-TG
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 18:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T7Zi1-0005qq-Ug
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 18:29:02 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:36154
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T7Zi1-0005qi-OB
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 18:29:01 -0400
Received: from treguer.localnet ([90.32.144.8]) by mwinf5d09 with ME
	id taV01j0080B56Sa03aV0gw; Sat, 01 Sep 2012 00:29:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Organization: BZH lan
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 Sep 2012 00:28:59 +0200
User-Agent: KMail/1.13.5 (Linux/3.5.3-treguer; KDE/4.4.5; x86_64; ; )
References: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
	<20120831064931.GA6425@stefanha-thinkpad.localdomain>
	<CAFEAcA8ahSGNEWvLpY+HrQsA6cxBjw+NjBTb7-R3RyOpi5-O7g@mail.gmail.com>
In-Reply-To: <CAFEAcA8ahSGNEWvLpY+HrQsA6cxBjw+NjBTb7-R3RyOpi5-O7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201209010028.59501.yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.127
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH 0/2 v2] Fix static linking for cURL and
	SDL
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
X-List-Received-Date: Fri, 31 Aug 2012 22:29:04 -0000

Peter, All,

On Friday 31 August 2012 10:18:49 Peter Maydell wrote:
> On 31 August 2012 07:49, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > On Tue, Aug 28, 2012 at 01:01:32AM +0200, Yann E. MORIN wrote:
> >> Currently, configure checks for cURL and SDL with either pkg-config (the
> >> default), or with {curl,sdl}-config (as a fallback).
> 
> > Patch 2's commit message still references "curl" instead of "sdl".
> >
> > I'd like for one more person to review this and then it can be merged
> > into qemu.git, rather than through qemu-trivial.
> 
> ...this patch doesn't seem to have been sent to qemu-devel?

I can send them to -devel if it's better. Should I then keep -trivial in CC?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

