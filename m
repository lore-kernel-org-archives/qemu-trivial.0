Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDoz0-0007Dh-3I
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 01:41:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <macro@linux-mips.org>) id 1YDdth-0007oG-4Y
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:51:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <macro@linux-mips.org>) id 1YDdtg-0001kR-4D
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:51:29 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:41135
	helo=cvs.linux-mips.org) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <macro@linux-mips.org>)
	id 1YDdtb-0001e7-Ax; Tue, 20 Jan 2015 13:51:23 -0500
Received: from localhost.localdomain ([127.0.0.1]:49598 "EHLO
	localhost.localdomain" rhost-flags-OK-OK-OK-OK)
	by eddie.linux-mips.org with ESMTP id S27011260AbbATSvQSvaD4 (ORCPT
	<rfc822;qemu-devel@nongnu.org> + 1 other);
	Tue, 20 Jan 2015 19:51:16 +0100
Date: Tue, 20 Jan 2015 18:51:16 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8kwLL0T-riyEO-AKyYeueCszMVB2eDR5DWuY=oKNE_cw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1501201845220.28301@eddie.linux-mips.org>
References: <1421747963-2860-1-git-send-email-armbru@redhat.com>
	<CAFEAcA9Gw-q+NDvb-Ysj-uB=QRdK_1GQJJZUQ2sOjpeBMnGDwg@mail.gmail.com>
	<87lhkxiqak.fsf@blackfin.pond.sub.org>
	<alpine.LFD.2.11.1501201811480.28301@eddie.linux-mips.org>
	<CAFEAcA8kwLL0T-riyEO-AKyYeueCszMVB2eDR5DWuY=oKNE_cw@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 148.251.95.138
X-Mailman-Approved-At: Wed, 21 Jan 2015 01:41:40 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Leon Alrae <leon.alrae@imgtec.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
 switch fall through after commit fecd264
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
X-List-Received-Date: Tue, 20 Jan 2015 18:51:30 -0000

On Tue, 20 Jan 2015, Peter Maydell wrote:

> In this particular case, this part of the file is fine and the
> problem is simply that this patch as it stands introduces a single
> line (the one above) that's not indented correctly. The only fix
> required is to delete one space in the line added by the patch
> (thus avoiding introducing any new misindented lines).

 Right!  That's what I've been following too -- not to introduce 
misindentation despite any surrounding lines suffering from this problem.

> In the general case, we tend to not do whole-file reindentation,
> because it breaks 'git blame' and similar tools. It's not an
> outright ban, though -- I guess it comes down to a maintainer
> judgement call whether they think the benefit outweighs the cost
> for a particular bit of code.

 Fair enough.  In some cases misindentation causes confusion, but here it 
does seem to be the case.

  Maciej

