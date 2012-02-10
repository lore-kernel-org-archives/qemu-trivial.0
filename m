Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rvmz2-0005w7-QG
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2012 04:41:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rvmyw-0005W9-7o
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 04:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rvmyq-0007mm-QU
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 04:41:30 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:63421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rvmyq-0007mh-KJ; Fri, 10 Feb 2012 04:41:24 -0500
Received: by werh12 with SMTP id h12so2087809wer.4
	for <multiple recipients>; Fri, 10 Feb 2012 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YmkLwGwIuk+BgzMyfkIsTpORlIC6y2vGuhFchZMzHU8=;
	b=KGAby72Ym87cllYGjwNqudsGaK80t/LWe71nP1p8F2qQX5Hrt3ZBV3Sghp49uncnob
	VafilwkdWBp3vRY1R4smbYe5T1O1TObrRFR6FZ9FoMjpyOV9bZrnKFYmixc1tqP0Kc5R
	+3jC1AtXJheg3uMHQcoVNZIMrp2jFnPdK9rrc=
Received: by 10.216.138.89 with SMTP id z67mr501670wei.10.1328866883708;
	Fri, 10 Feb 2012 01:41:23 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id y6sm2024809wix.10.2012.02.10.01.41.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 01:41:21 -0800 (PST)
Date: Fri, 10 Feb 2012 08:23:50 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alex Barcelo <abarcelo@ac.upc.edu>
Message-ID: <20120210082350.GB17878@stefanha-thinkpad.localdomain>
References: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
	<4F3413D9.7040204@suse.de>
	<CAFKAgTe-7hZ1U-CE5khEQ792VxsEayuWG6rCmR2F0uuHi7O1PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFKAgTe-7hZ1U-CE5khEQ792VxsEayuWG6rCmR2F0uuHi7O1PQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL] sas_ss_flags bug for
 powerpc
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
X-List-Received-Date: Fri, 10 Feb 2012 09:41:35 -0000

On Thu, Feb 09, 2012 at 08:00:49PM +0100, Alex Barcelo wrote:
> On Thu, Feb 9, 2012 at 19:43, Andreas Färber <afaerber@suse.de> wrote:
> > Am 09.02.2012 19:30, schrieb Alex Barcelo:
> > The patch should describe what it touches
> > (linux-user), what it does, what for and make clear why that is correct.
> > Is there a particular test case that's broken without the patch?[1]
> >
> > I can't speak for Stefan, but to me it is totally unclear from looking
> > at the patch what sas_ss_flags() does here so this is likely not really
> > a trivial one.
> 
> Well, is really trivial when compared to the other architectures,
> because all do a zero check and this one does it the other way round.
> I'm really new here, and I still don't get the workflow and the way to
> do things. Will try my best!

Changes which require knowledge of a specific device model are often not
trivial to anyone who hasn't studied the specification.  So if the patch
requires background knowledge of ppc ABI, hardware registers, etc then
it's usually best sent to relevant subsystem maintainer (see
./MAINTAINERS).

Basically I draw the line when it requires me too do too much background
readying to be able to review the patch! ;)

Stefan

