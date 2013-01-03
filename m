Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tqged-0005fk-1D
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2013 03:59:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TqgeZ-0005fd-F8
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 03:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TqgeY-0006jJ-7c
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 03:59:55 -0500
Received: from mail-qc0-f177.google.com ([209.85.216.177]:39468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TqgeY-0006jF-46; Thu, 03 Jan 2013 03:59:54 -0500
Received: by mail-qc0-f177.google.com with SMTP id u28so7760734qcs.22
	for <multiple recipients>; Thu, 03 Jan 2013 00:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gEJJhjYq2nxYlAS5TdB7ppIAly7lJkngz+RtO96JWd0=;
	b=FXlfDygXang/Y8uUFLEP+Li2eXm4zvZWaVsqyjQny6qQHgtcxAcVL6PyCts9eg2gPd
	pzzDOe3EWydT+KfZbzGdJ8OJUQy0rZrgCObWj+bQVZtgWbEsDTXgVogUQh+1GBbbrrh3
	LnUD0d1vYxQE31zKZ1TkjMuT5c1rA6fntevG4zvBU3fRJ9zTGFVTYvUWgqW/CNdMK53B
	UvFStWBxI3KCIBao6dQn+74vCV4AEpDUminWQlefUhQRmoBi2nud7pMO+uMChZoQN+Cb
	KKWP99En28+nZwCak0MjulrvnUWfa9Y4Tb20dAEvepKXPe6ICACVJQJkiLnD+4gRANkF
	/STA==
X-Received: by 10.224.73.6 with SMTP id o6mr26332479qaj.26.1357203593514;
	Thu, 03 Jan 2013 00:59:53 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id x4sm9585910qeu.7.2013.01.03.00.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 00:59:51 -0800 (PST)
Date: Thu, 3 Jan 2013 09:59:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130103085946.GA11586@stefanha-thinkpad.muc.redhat.com>
References: <1355986241-32461-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355986241-32461-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.177
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pseries: Remove unneeded
 include statement (fixes MinGW builds)
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
X-List-Received-Date: Thu, 03 Jan 2013 08:59:57 -0000

On Thu, Dec 20, 2012 at 07:50:41AM +0100, Stefan Weil wrote:
> sys/mman.h is not needed (tested on Linux) and unavailable for MinGW,
> so remove it.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/spapr_nvram.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I audited the code and cannot see anything that would require
<sys/mman.h>.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

