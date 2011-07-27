Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlzNa-0002tC-B7
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 04:22:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlzNX-0002i2-H5
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 04:22:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlzNW-0003rK-JZ
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 04:22:07 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:46706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlzNU-0003qy-81; Wed, 27 Jul 2011 04:22:04 -0400
Received: by wwf26 with SMTP id 26so1000162wwf.10
	for <multiple recipients>; Wed, 27 Jul 2011 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eg9pCbjDSWBs+X4oY1AVmAo096kOSIX9zR0uBIzi5hE=;
	b=ctA9ANQcfxxix+33/0httajgr5/f7AX83nYPSs1YQ6q3qbctHk44YfQfoYM7kEKoKF
	voZLpCQjwco3bM4QBZiIQOzbpi0DSoAkW2iVAGTTpSyabG93evp1XPkd7bLcxQUp0HU+
	A+1kRWL9ASCNCecvZYG38NCudp9bB+6UG0BjA=
Received: by 10.227.32.73 with SMTP id b9mr5881258wbd.107.1311754923243;
	Wed, 27 Jul 2011 01:22:03 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id gd1sm1113240wbb.61.2011.07.27.01.22.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 01:22:02 -0700 (PDT)
Date: Wed, 27 Jul 2011 09:21:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20110727082156.GA12956@stefanha-thinkpad.localdomain>
References: <4E2EED1E.6030402@linux.vnet.ibm.com>
	<1311698364-32395-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311698364-32395-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: add missing deps on
 $(GENERATED_HEADERS)
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
X-List-Received-Date: Wed, 27 Jul 2011 08:22:08 -0000

On Tue, Jul 26, 2011 at 11:39:24AM -0500, Michael Roth wrote:
> This fixes a build issue with make -j6+ due to qapi-generated files
> being built before $(GENERATED_HEADERS) have been created.
> 
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  Makefile |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

