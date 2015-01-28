Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGTaQ-00009O-CG
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 09:27:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1YGTaO-00006f-Cv
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:27:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1YGTaK-00039A-JA
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:27:16 -0500
Received: from afflict.kos.to ([92.243.29.197]:35842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>)
	id 1YGTaG-00037j-2I; Wed, 28 Jan 2015 09:27:08 -0500
Received: by afflict.kos.to (Postfix, from userid 1000)
	id 6D3FE264DA; Wed, 28 Jan 2015 15:27:05 +0100 (CET)
Date: Wed, 28 Jan 2015 16:27:05 +0200
From: Riku Voipio <riku.voipio@iki.fi>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20150128142705.GA22971@afflict.kos.to>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
	<54C6566B.6050205@sunrus.com.cn>
	<CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
X-message-flag: Warning: message not sent with a DRM-Certified client
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 92.243.29.197
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Chen Gang S <gang.chen@sunrus.com.cn>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Let all
 lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Wed, 28 Jan 2015 14:27:17 -0000

Hi,

First of all, thanks Chen for taking time to improve the linux-user
codebase in qemu!

On Mon, Jan 26, 2015 at 03:01:52PM +0000, Peter Maydell wrote:
> On 26 January 2015 at 14:59, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> > On 1/26/15 06:10, Peter Maydell wrote:
> >> I would just like the commit message to be clear about the
> >> scope of the work the patch covers. If the patch is just "Fix
> >> mismatched lock/unlock calls in IPC struct conversion functions"
> >> then that's fine, but the commit message should say that. At the
> >> moment the commit message is very vague.
> >>
> >
> > OK, thanks.
> >
> > I am not quite familiar with this file, so I describe the modification
> > by function name, e.g. lock_user_struct() and unlick_user_struct() in
> > the patch subject.

> In a big file I think it's often more useful to describe the
> functions which are being changed. My suggested subject would be:
 
> "Fix mismatched lock/unlock calls in IPC struct conversion functions"
 
> Riku can decide if he wants a v2 or will just fix it up as he
> applies it to his linux-user tree.

No need for v2, I've change the title in my tree.

Riku


