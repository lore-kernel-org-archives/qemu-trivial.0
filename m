Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T630O-00010y-KE
	for mharc-qemu-trivial@gnu.org; Mon, 27 Aug 2012 13:21:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T630J-0000zN-M2
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 13:21:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T630F-0001Eb-KS
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 13:21:35 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:36379
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T630F-0001EU-EK
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2012 13:21:31 -0400
Received: from treguer.localnet ([90.32.252.246]) by mwinf5d34 with ME
	id rtMV1j00B5Kjsuq03tMVkr; Mon, 27 Aug 2012 19:21:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Organization: BZH lan
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 27 Aug 2012 19:21:28 +0200
User-Agent: KMail/1.13.5 (Linux/3.5.2-treguer; KDE/4.4.5; x86_64; ; )
References: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
	<20120824110224.GE10867@stefanha-thinkpad.localdomain>
In-Reply-To: <20120824110224.GE10867@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201208271921.28628.yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.133
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/3] configure: fix detection for cURL
	libs when static linking
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
X-List-Received-Date: Mon, 27 Aug 2012 17:21:39 -0000

Stefan, All,

On Friday 24 August 2012 13:02:24 Stefan Hajnoczi wrote:
> On Mon, Aug 20, 2012 at 11:39:07PM +0200, Yann E. MORIN wrote:
> > Currently, configure uses the same code-path to check for cURL libraries,
> > whether we are doing a static or dynamic build.
> > 
> > Fix that by pasing the proper arguments: '--static-libs' for curl-config
> > and '--static --libs' for pkg-config when a static build is attempted.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  configure |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> Can you set pkgconfig --static --libs in one place so the if [ "$static"
> = "yes" ] code isn't duplicated several times?  (This is a general
> question about the entire patch series.)

Yes, it perfectly makes sense; I'll work on this. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

