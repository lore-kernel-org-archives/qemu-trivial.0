Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAf8U-0005S1-Qi
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 11:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bAcQL-0005k4-W7
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 08:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>) id 1bAcQG-0003xQ-UO
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 08:17:29 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:5753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Maciej.Rozycki@imgtec.com>)
	id 1bAcQ6-0003ur-N9; Wed, 08 Jun 2016 08:17:14 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 58241989B5E7F;
	Wed,  8 Jun 2016 13:17:07 +0100 (IST)
Received: from [10.20.78.130] (10.20.78.130) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server id 14.3.294.0; Wed, 8 Jun 2016
	13:17:09 +0100
Date: Wed, 8 Jun 2016 13:16:59 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Stefan Weil <sw@weilnetz.de>
CC: QEMU Developer <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>
In-Reply-To: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
Message-ID: <alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
References: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.20.78.130]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
X-Mailman-Approved-At: Wed, 08 Jun 2016 11:11:12 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Use $(..)
 instead of deprecated `..`
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 12:17:31 -0000

On Mon, 16 May 2016, Stefan Weil wrote:

> This fixes these warnings from shellcheck:
> 
>     ^-- SC2006: Use $(..) instead of deprecated `..`
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> More warnings from shellcheck for configure and other files
> will be handled by later patches.

 Unlike `..` the $(..) Bourne shell construct is not fully portable, some 
implementations do not recognise it.  Consequently this change potentially 
breaks building QEMU on some systems, possibly in a non-obvious way, as 
there's no explicit check for the presence this feature and a graceful 
failure path included with this patch or the other one AFAICT.  We may or 
may not care about those systems, but still this is a functional 
regression and therefore I think there has to be a good reason for 
introducing it.

 So what's the technical justification -- beyond shutting up some random 
checker tool -- for making this change?  Does the benefit recognised in 
making this change outweigh the limitation introduced?  How about handling 
failures properly?

 NB given the above, and especially because of the introduced functional 
regression mentioned, I don't think this change qualifies as trivial.

  Maciej

