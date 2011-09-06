Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0wDK-0004O9-Dq
	for mharc-qemu-trivial@gnu.org; Tue, 06 Sep 2011 10:01:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0wDD-00043R-3A
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 10:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0wD7-00021v-D9
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 10:01:15 -0400
Received: from mail-ey0-f171.google.com ([209.85.215.171]:51938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R0wD0-00020z-SF; Tue, 06 Sep 2011 10:01:03 -0400
Received: by eyg24 with SMTP id 24so3466053eyg.16
	for <multiple recipients>; Tue, 06 Sep 2011 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xaUMGdVk+4zgF5FFRPH/uuOQIcrQoZ9sBOXy0gkYWQM=;
	b=MbeyY5skA5uKXiGt2pffRPtMuVHdDhuXIdhd9u6DLzPeJLhf22oCxzoGaL1mQciqFj
	8XLAstivnh0pisXpX0tKZHpy0W+NzUNij/Czrt9thGQ5lMXEuLUED4vwt7UTbixvCdlj
	nggKM/bUsM8HnO7u3UmcfWCas8CiJiO/CndzE=
Received: by 10.213.8.130 with SMTP id h2mr853703ebh.47.1315317660289;
	Tue, 06 Sep 2011 07:01:00 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id i6sm400421eeb.11.2011.09.06.07.00.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 07:00:58 -0700 (PDT)
Date: Tue, 6 Sep 2011 15:00:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20110906140052.GA11558@stefanha-thinkpad.localdomain>
References: <1315296096-8115-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315296096-8115-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.171
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] docs: Fix qdev-device-use.txt typo in
 -chardev serial, path=COM<NUM>
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
X-List-Received-Date: Tue, 06 Sep 2011 14:01:20 -0000

On Tue, Sep 06, 2011 at 10:01:36AM +0200, Markus Armbruster wrote:
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/qdev-device-use.txt |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

