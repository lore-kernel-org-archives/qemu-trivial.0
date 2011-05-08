Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2fA-0002ms-6X
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:00:40 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2f7-0002h1-58
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2f5-00038C-Kv
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:00:37 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:48641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2ep-0002tr-MN; Sun, 08 May 2011 08:00:20 -0400
Received: by wyb42 with SMTP id 42so3834487wyb.4
	for <multiple recipients>; Sun, 08 May 2011 05:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Pc+9Y6lvESNaaaQYB4z8RUdzQzPtUWU1mSClNU9LbCU=;
	b=g/U/fdb8AZcuRco2Bjg3ECczWI4/QCDIQCh0rM1ZYiNCFnP64BVfNa0ypMaXmQDPq8
	mW8vGxxgus8TUZ2NgEMqk5JuPg6SnAh7th1CUL1NhNV5gfeVww8eNrs6kR4FwP70SWwF
	IC32ZH1TqLvJK5uh12ASVRGUrYfGBekmawx4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=D96E3PeR19s7Xu7JHnJ5W2p4jbv02Z+1TCQ+/Jas0PXGCNjVMBabDuhx0KcX/curGh
	YUMS4MkujSE1OOovq/D2PT73WSPRSLy0iKO554eQpKhs2wKHtf7QL/eTda1hpiOVveoX
	dbGZmgCBZc9xU8EOhvS8C+Rliyi5L/ya7wCqc=
Received: by 10.216.14.199 with SMTP id d49mr5588445wed.65.1304856018194;
	Sun, 08 May 2011 05:00:18 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id n2sm2500414wej.22.2011.05.08.05.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:00:16 -0700 (PDT)
Date: Sun, 8 May 2011 13:00:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110508120011.GA10500@stefanha-thinkpad.localdomain>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/18] Fix typos in comments
 (dependancy -> dependency)
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
X-List-Received-Date: Sun, 08 May 2011 12:00:38 -0000

On Thu, Apr 28, 2011 at 05:20:25PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  Changelog     |    2 +-
>  Makefile.objs |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied the series to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

