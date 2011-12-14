Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RamkH-0001ck-Ve
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2011 06:11:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RamkA-0001Fi-VJ
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:11:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ramk5-0007pE-84
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:11:26 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:43239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ramk2-0007om-7Z; Wed, 14 Dec 2011 06:11:18 -0500
Received: by faao26 with SMTP id o26so1070243faa.4
	for <multiple recipients>; Wed, 14 Dec 2011 03:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a087Goko6UxnK6rC8ouEVNmFkniqaLuFzqLCl3dI+UA=;
	b=aXNhW/VuVytYOc4yGDnckARfnYU9L5V1UPt40gUJzGHUJ0M8GFj4fz3EDZLe99FnkL
	5eYSSuLKYuz9DW9O4mUjp7EjfRBPAhk4G7GxpqWVazyGXB5JtFxeTRf098aXKcHEWNXC
	ByzIF+mXW016ces8YqUd/I03SE6Q+CDKmmIKY=
Received: by 10.180.105.232 with SMTP id gp8mr3584041wib.65.1323861076849;
	Wed, 14 Dec 2011 03:11:16 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id ep16sm3189601wbb.21.2011.12.14.03.11.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 03:11:15 -0800 (PST)
Date: Wed, 14 Dec 2011 11:11:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111214111114.GA10403@stefanha-thinkpad.localdomain>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/6] New fixes for some misspellings
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
X-List-Received-Date: Wed, 14 Dec 2011 11:11:32 -0000

On Sat, Dec 10, 2011 at 12:19:40AM +0100, Stefan Weil wrote:
> This patch series tries to fix the most common misspellings
> using the tool 'codespell'.
> 
> See http://wiki.qemu.org/Contribute/SpellCheck for more information
> on using codespell with QEMU.
> 
> Regards,
> Stefan Weil
> 
> [PATCH 1/6] Add spelling exceptions for codespell
> [PATCH 2/6] fmopl: Fix spelling in code and comments
> [PATCH 3/6] hw: Fix spelling (licenced->licensed)
> [PATCH 4/6] hw: Fix spelling in comments
> [PATCH 5/6] hw: Fix spelling in comments and code
> [PATCH 6/6] Fix spelling in comments, documentation and messages

Applied all except Patch 1 to the trivial-patches-next tree:

http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

There might be some more discussion around Patch 1.  Please post it
separately and let Anthony merge it into qemu.git.

Stefan

