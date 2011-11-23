Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RT9RB-0004uy-3Z
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 04:48:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9R7-0004k0-KB
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:48:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9R6-0000tO-P5
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:48:13 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:46679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RT9R0-0000sM-5Z; Wed, 23 Nov 2011 04:48:06 -0500
Received: by yenq2 with SMTP id q2so1411242yen.4
	for <multiple recipients>; Wed, 23 Nov 2011 01:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xXtdhrluqd1cxsZjzXM+10a84WuyaXRFNqwodq9U2vM=;
	b=rO2Rm+GviZdPtc7EZnu3IHU8qfcD1UGdjfUVR6st1T1zrmK0O7elhdioys3tzPKk5U
	Wr4Y6oRm4YurObP+gnbPZnUVrYOwn/myez+BetCSKyS7aBoaDg2POlLqiAXbcWHes534
	zXkvKL7qvZ0NFPugOQh8/FwcIblSS2UXnekaE=
Received: by 10.152.106.130 with SMTP id gu2mr14234630lab.37.1322041684918;
	Wed, 23 Nov 2011 01:48:04 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id no9sm15333626lab.0.2011.11.23.01.48.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 01:48:04 -0800 (PST)
Date: Wed, 23 Nov 2011 09:48:02 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111123094802.GA21327@stefanha-thinkpad.localdomain>
References: <1321959547-2602-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321959547-2602-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] Trivial console_putchar() fixes
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
X-List-Received-Date: Wed, 23 Nov 2011 09:48:14 -0000

On Tue, Nov 22, 2011 at 11:59:05AM +0100, Markus Armbruster wrote:
> Markus Armbruster (2):
>   console: Clean up confusing indentation in console_putchar()
>   console: Fix console_putchar() for CSI J
> 
>  console.c |   19 ++++++++++---------
>  1 files changed, 10 insertions(+), 9 deletions(-)
> 
> -- 

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

