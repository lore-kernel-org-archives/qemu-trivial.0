Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4XiY-0002de-Ah
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:12:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4XiT-0002dV-01
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4XiR-00071x-3k
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:12:40 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:35507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4XiQ-00071k-RH; Mon, 05 Mar 2012 08:12:39 -0500
Received: by wgbfm10 with SMTP id fm10so2292304wgb.10
	for <multiple recipients>; Mon, 05 Mar 2012 05:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates
	10.180.93.233 as permitted sender) client-ip=10.180.93.233; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of stefanha@gmail.com
	designates 10.180.93.233 as permitted sender)
	smtp.mail=stefanha@gmail.com;
	dkim=pass header.i=stefanha@gmail.com
Received: from mr.google.com ([10.180.93.233])
	by 10.180.93.233 with SMTP id cx9mr2596433wib.14.1330953156407
	(num_hops = 1); Mon, 05 Mar 2012 05:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NLkhAxTY4FeDZBEnalmlllh0lnnQmkU9hYbKXW7dUYs=;
	b=u9j8+PhwDhx+EgRrVKVH5QlV/CDVMEHvATRdgVYm9wSGxJV0F3N3yRpbZvjk+ULni/
	weZnBH7mNRpLphVU06HFScWyYPWHJXrT/1z2cJTh8yAspoadDVOj3NLS7kg9JClp82e7
	rE597pFEEX4Mrfc/uo0sc9W+XY4PWoEqOPxLW0D3Z3QS+HZ4st/NvD/h2kTrZG4P0jjm
	4G4yubW5nPZmTOdJH5N5w0MAjhwX6qTZNfC61IdgvXYXcuZUdzDw+CDw8TjOPzYB7iWN
	Uxy2ibL/zZUPQuHHxlZxiJgnBMtl6xq7XA8yOw92PxS2rZK81hBXGtL2hYxg1Y3ggHR0
	wd1w==
Received: by 10.180.93.233 with SMTP id cx9mr2048533wib.14.1330953156352;
	Mon, 05 Mar 2012 05:12:36 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	fl2sm61896903wib.4.2012.03.05.05.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:12:35 -0800 (PST)
Date: Mon, 5 Mar 2012 13:12:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305131234.GD28506@stefanha-thinkpad.localdomain>
References: <1330175506-19167-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330175506-19167-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix sign of sscanf format
	specifiers
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
X-List-Received-Date: Mon, 05 Mar 2012 13:12:45 -0000

On Sat, Feb 25, 2012 at 02:11:46PM +0100, Stefan Weil wrote:
> All values read by sscanf are unsigned, so replace %d by %u.
> 
> This signed / unsigned mismatch was detected by splint.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  cursor.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

