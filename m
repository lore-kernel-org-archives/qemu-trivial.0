Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSoje-00082O-C0
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 06:41:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RSojX-0007dr-N1
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 06:41:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RSojT-0007JC-GD
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 06:41:51 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:39816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RSojJ-0007IL-7T; Tue, 22 Nov 2011 06:41:37 -0500
Received: by eyh6 with SMTP id 6so68959eyh.4
	for <multiple recipients>; Tue, 22 Nov 2011 03:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3BVeDpTqMdzB+0QfN2XNBOH4/vRglT5QevhTm2Ns/38=;
	b=Gxt0TTjH5jLUGjY7AX16mCaFImE/U3SmGhN89Vt1EZh3d3aKmLA4rqPZ8x1Gsl4k9p
	g0TZMDjC4u7tVgvXzrY5z/trUJ+Kdm/64QUEpQIqbQez1zmko410CCSpxvX/YXpY3Ro/
	yWMt38kreSVUU7A4iq9Cr4LoTYS2QRfRtepxI=
Received: by 10.14.11.10 with SMTP id 10mr1318773eew.112.1321962096052;
	Tue, 22 Nov 2011 03:41:36 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	q28sm40924467eea.6.2011.11.22.03.41.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 03:41:35 -0800 (PST)
Date: Tue, 22 Nov 2011 11:41:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111122114134.GA2845@stefanha-thinkpad.localdomain>
References: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] darwin-user: Fix format string in debug
 message
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
X-List-Received-Date: Tue, 22 Nov 2011 11:41:56 -0000

On Sat, Nov 19, 2011 at 08:18:39PM +0100, Stefan Weil wrote:
> This was spotted by cppcheck.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  darwin-user/signal.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

