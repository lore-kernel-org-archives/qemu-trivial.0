Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2hb-0004ip-9w
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:03:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2hY-0004eD-EP
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:03:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2hX-0003dG-Ih
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:03:08 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:45971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2hV-0003bY-C7; Sun, 08 May 2011 08:03:05 -0400
Received: by wwj40 with SMTP id 40so4338913wwj.10
	for <multiple recipients>; Sun, 08 May 2011 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pViakkJysllS5oPbeAVXJMtieS5mRzlh1VKGxbccyB8=;
	b=PcD58dDV8LHqdYecyebzSHD3T7FKJpi+9X6vw0d+bY295OIiElBOadhUdCV1xyLdoa
	bysHInENKo4ZnnimGmtjy3JW8+geEdLGPnu9Q4YDHvafS7EMDx61hf7QUeXAVDGujKm2
	orzIIH4vDA6NrfgbWf+itrbo7lWbw3+tEm17E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YAYbasPPMmrJu+bSIuS6NCfBWSBGxfXvNZVvLrhPjMsgN15S016d7ySbEL6JiTPKO8
	Vx+VIuF16OJM2JPg8ujx/zF249ywpuMxDiqxu4PtGRY71LNamcYuzfMKLS+B5naBJ/GW
	WljBxWZoytjIYVQgsdmFjCrd1ut3KaSaEUhYA=
Received: by 10.227.184.66 with SMTP id cj2mr4596256wbb.90.1304856183351;
	Sun, 08 May 2011 05:03:03 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id y29sm3110361wbd.38.2011.05.08.05.03.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:03:02 -0700 (PDT)
Date: Sun, 8 May 2011 13:02:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110508120259.GD10500@stefanha-thinkpad.localdomain>
References: <1304799603-19402-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304799603-19402-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling in comments
 (intruction -> instruction)
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
X-List-Received-Date: Sun, 08 May 2011 12:03:09 -0000

On Sat, May 07, 2011 at 10:20:03PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  bsd-user/main.c   |    2 +-
>  linux-user/main.c |    2 +-
>  tests/test-i386.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

