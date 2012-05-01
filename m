Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SP99h-0004f3-Do
	for mharc-qemu-trivial@gnu.org; Tue, 01 May 2012 05:13:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SP99f-0004Xg-6G
	for qemu-trivial@nongnu.org; Tue, 01 May 2012 05:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SP99d-0008RG-7m
	for qemu-trivial@nongnu.org; Tue, 01 May 2012 05:13:54 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:40284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SP99Z-0008Gu-PF; Tue, 01 May 2012 05:13:49 -0400
Received: by wgbfm10 with SMTP id fm10so1446186wgb.10
	for <multiple recipients>; Tue, 01 May 2012 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TFKKcaF0RX9GISqqpe8sSgnA0jhQCxsQGfhRu1XyGA8=;
	b=tcniWp+IbyqMphzTx/Rx8LoUgkqpLNiMIxt+16bWUGsHQSMDrXLx9gpXpw1kpukRWr
	r/fIDVSKrXGkur7LXCiPHE7D7Zg8fVTTL6X4FtkNFciRWbSby60L555CyQOVIXnFdZGu
	bku2JKs5+f2yB+drecRj+eLCvUAZFozTh6nOVB/PivY5fW02veR11ntswjhWqPKPzKpH
	m5gUpgJT4IRQ9zJsDrlEIK/X+vFsxw+na6p1eRR5TBburIvrd+mbUWl4s8W8FXUS+yOr
	P7DyYjSJG0cqIxZJFxaKDdNcnydMYpaq8t9i4ZIcX5TqTHt6jMj0RFsDAgmfVzF2yB4d
	l1/w==
Received: by 10.180.8.231 with SMTP id u7mr3655289wia.9.1335863626755;
	Tue, 01 May 2012 02:13:46 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	du4sm55449061wib.10.2012.05.01.02.13.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 02:13:46 -0700 (PDT)
Date: Tue, 1 May 2012 10:13:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120501091344.GA4082@stefanha-thinkpad.localdomain>
References: <1335719326-31264-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1335719326-31264-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] async: Use bool for
 boolean struct members and remove a hole
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
X-List-Received-Date: Tue, 01 May 2012 09:13:56 -0000

On Sun, Apr 29, 2012 at 07:08:45PM +0200, Stefan Weil wrote:
> Using bool reduces the size of the structure and improves readability.
> A hole in the structure was removed.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  async.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied both to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

