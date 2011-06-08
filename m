Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QUDpM-0004xg-Gq
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2011 04:09:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QUDpJ-0004x5-7Q
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2011 04:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QUDpH-0005Iz-VG
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2011 04:09:20 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:50958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QUDpE-0005ID-8U; Wed, 08 Jun 2011 04:09:16 -0400
Received: by wwj40 with SMTP id 40so208932wwj.10
	for <multiple recipients>; Wed, 08 Jun 2011 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nrDlW/RYnhTolvXL5ICIAsk902quyjc7y67ICBXh/q4=;
	b=AsJ8lm/EqGh7hslODczlLD4RITzVwPlKtOgW73b61VFoVBiANl/rc1g/gZ5J8E8lEX
	p7kfgZpRzkB/GwUhaNLY+yVAsyN7Os2PpRAVvM1tDbScsHi5d5UlMI94Bkm9ZrenRbYA
	klDpqWr9xjYVc48uoVx0zXPFLvXdsgtjysydc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cnkj1PA83AuLZqiqHgVTksEuJL0BBHuHgYIVChqaVW45xjQs8kvsMv7NQqPMILHuNc
	EaR+c/dUv7z9kEsgLskzqjARhxP2dtcJBe0T+aJ8rPr1GuUNVIe93v2rrhtN/EzDyMBT
	LB6Qf51ty3OJjy48XKv6ahl+XicXxnVNMPOco=
Received: by 10.216.143.74 with SMTP id k52mr6865830wej.0.1307520554843;
	Wed, 08 Jun 2011 01:09:14 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id r20sm125024wec.31.2011.06.08.01.09.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 01:09:13 -0700 (PDT)
Date: Wed, 8 Jun 2011 09:09:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Message-ID: <20110608080907.GA26703@stefanha-thinkpad.localdomain>
References: <4DCFB3EF.3060801@web.de>
 <4DEE49DE.2050302@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DEE49DE.2050302@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] ioapic: Implement
	polarity
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
X-List-Received-Date: Wed, 08 Jun 2011 08:09:22 -0000

On Tue, Jun 07, 2011 at 05:55:10PM +0200, Jan Kiszka wrote:
> On 2011-05-15 13:07, Jan Kiszka wrote:
> > From: Jan Kiszka <jan.kiszka@siemens.com>
> > 
> > If the polarity bit is set in a redirection table entry, the input level
> > simply has to inverted as it is low active in this case.
> 
> Ping for this and
> http://thread.gmane.org/gmane.comp.emulators.qemu/102459. Maybe even
> trivial, so CC'ing.

Looks simple but I don't know x86 interrupt controller details, let's
see if Anthony can pick this up.

Stefan

