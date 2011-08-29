Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qxygh-0004Sv-3k
	for mharc-qemu-trivial@gnu.org; Mon, 29 Aug 2011 06:03:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qxyga-0004Q4-TL
	for qemu-trivial@nongnu.org; Mon, 29 Aug 2011 06:03:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QxygZ-0001hq-MW
	for qemu-trivial@nongnu.org; Mon, 29 Aug 2011 06:03:20 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:36352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QxygZ-0001hh-Hz; Mon, 29 Aug 2011 06:03:19 -0400
Received: by wwf25 with SMTP id 25so5141987wwf.10
	for <multiple recipients>; Mon, 29 Aug 2011 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CuJ7F3luBzmtFVfAUAMWt2F4a+rUuKvT4CKp8n1U6v4=;
	b=xqJvWaxm3Pp9exwi638M/FbW5tQKtKvZJG1c2XHcUHLQHxgO3cJhkPEH/4Q8dqCmKq
	Q44OGnum6N/yyshQJo+nS/usHtTCVzkiHT6Ora/iaHrZ2n0i1IbPz7eGgSg0KLdJjmZK
	zox9iXz23eJkt7/BaRvptVycALQfCYwCXyE8A=
Received: by 10.216.201.170 with SMTP id b42mr3992525weo.11.1314612197378;
	Mon, 29 Aug 2011 03:03:17 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id fd4sm3593854wbb.30.2011.08.29.03.03.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 03:03:15 -0700 (PDT)
Date: Mon, 29 Aug 2011 11:03:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Message-ID: <20110829100305.GA18524@stefanha-thinkpad.localdomain>
References: <1314385561-22519-1-git-send-email-alevy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1314385561-22519-1-git-send-email-alevy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] hw/pci-stub: fix comment typo
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
X-List-Received-Date: Mon, 29 Aug 2011 10:03:24 -0000

On Fri, Aug 26, 2011 at 10:06:01PM +0300, Alon Levy wrote:
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  hw/pci-stub.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Fixed "doesn't" -> "don't".

Stefan

