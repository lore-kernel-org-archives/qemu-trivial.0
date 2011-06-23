Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZk3y-0006tG-EF
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 09:35:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk3v-0006sU-JQ
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk3t-0003H4-OW
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:35:15 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:44374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZk3t-0003Gq-7t; Thu, 23 Jun 2011 09:35:13 -0400
Received: by wyf28 with SMTP id 28so1432836wyf.4
	for <multiple recipients>; Thu, 23 Jun 2011 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iEo1EC1F4oHFPaIIzglLfsGjKFJsU+hQyLAbTeQ45BM=;
	b=N/KfmduX5xmzGvA/7kV9vyjWQV3RGlzDZPMrHSNYSJPt88i1wiOxeCeSDnwwGecIfm
	9ph+8QXZpQK2w5REEuguICHJ0N6+P2cEHYSI0zOkZZyaquIX1US/V8FH04pDlATLvSbm
	Zf58cBZdYIICq85TeydQrT03mCBywHt3NSYu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mAvtMjxb0JmHQcelPUTn/STwBHcgwwsyEOmdRngUDmFW4GKPUsU++JDMOVK+H9UwLn
	XxQmUJKmKo1sCZygWjQdEgW+q+QEXiHU2XdrdPj5q9jsW4FIdP5/2mwzF0zpQBqicBj3
	tmJ4wtaKDGoCsjMquHp9HBaUPZZ1dg8QYTJbA=
Received: by 10.216.50.2 with SMTP id y2mr1859895web.77.1308836112207;
	Thu, 23 Jun 2011 06:35:12 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id a3sm867356wed.6.2011.06.23.06.35.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 06:35:11 -0700 (PDT)
Date: Thu, 23 Jun 2011 14:35:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20110623133508.GF12698@stefanha-thinkpad.localdomain>
References: <4E02F63E.3010908@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E02F63E.3010908@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Avoid double definitions of PRI*64
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
X-List-Received-Date: Thu, 23 Jun 2011 13:35:17 -0000

On Thu, Jun 23, 2011 at 10:15:58AM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Recent mingw32 provide those defines.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  qemu-common.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

It's never too late to implement C99!

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

