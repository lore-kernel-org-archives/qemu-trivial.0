Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4Xl6-0004sa-2v
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:15:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4Xkz-0004sS-TV
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4Xkr-0007hB-8M
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:15:17 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:56981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4Xkq-0007ge-VM; Mon, 05 Mar 2012 08:15:09 -0500
Received: by wgbfm10 with SMTP id fm10so2294527wgb.10
	for <multiple recipients>; Mon, 05 Mar 2012 05:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates
	10.216.134.155 as permitted sender) client-ip=10.216.134.155; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of stefanha@gmail.com
	designates 10.216.134.155 as permitted sender)
	smtp.mail=stefanha@gmail.com;
	dkim=pass header.i=stefanha@gmail.com
Received: from mr.google.com ([10.216.134.155])
	by 10.216.134.155 with SMTP id s27mr4941748wei.80.1330953306547
	(num_hops = 1); Mon, 05 Mar 2012 05:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WS+ZxnDRmkuq7uv25kFngjK4EgIa3ekGTkDPnin39Tc=;
	b=T5AAnC3e9di/RX1n2bMP+ahC8C0h1lwHF0dpqjllidcFisgQEXR5tMkRfcXJSBA+ba
	MMZG0I5aKC2lh6a905G4eGoCgXQNAkCzak6T4it7n9etjlyB8JDdVVaue9EVmfj5/xkE
	V303mmZU8WjAwayPkK14nreGjCcxYJr7y5pSHaC7IyLCCf+GLrom2E9bm06YNN72sIbp
	OWgDRfR8Ii5z3Xtgs0K5v+1Z1X85Y0r9uJx4c4HP/IM4tZctMOFCiRklo42bTObMWv5J
	mM/y2NEWY1dvCt9UDGkS29FeIlFcBMJQtAuR0DWCoHAhShHC0ilsGuiz0Iak0OY4nIbP
	rtfQ==
Received: by 10.216.134.155 with SMTP id s27mr4081803wei.80.1330953306484;
	Mon, 05 Mar 2012 05:15:06 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	gp8sm20851077wib.5.2012.03.05.05.15.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:15:05 -0800 (PST)
Date: Mon, 5 Mar 2012 13:15:02 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305131502.GE28506@stefanha-thinkpad.localdomain>
References: <1330176948-14379-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330176948-14379-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Fix packed boolean
	struct members
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
X-List-Received-Date: Mon, 05 Mar 2012 13:15:22 -0000

On Sat, Feb 25, 2012 at 02:35:47PM +0100, Stefan Weil wrote:
> This patch fixes warnings reported by splint:
> 
> For variables which are packed in a single bit, a signed data type
> like 'int' does not make much sense.
> 
> There is no obvious reason why the two values should be packed,
> so I removed the packing and changed the data type to bool
> because both are used as boolean values.
> 
> Cc: Anthony Liguori <aliguori@us.ibm.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/vnc-auth-sasl.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

