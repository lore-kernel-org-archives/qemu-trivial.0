Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SLCpr-00079Q-V5
	for mharc-qemu-trivial@gnu.org; Fri, 20 Apr 2012 08:21:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLCpk-0006q3-Do
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLCpb-0001E6-3u
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:21:03 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:46237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SLCpH-000132-2G; Fri, 20 Apr 2012 08:20:35 -0400
Received: by wgbds1 with SMTP id ds1so725279wgb.4
	for <multiple recipients>; Fri, 20 Apr 2012 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1D0CG7EXVNLM9VrNm58J7fWe88ptThK3AjHUUroG+CE=;
	b=a86E4LGB29TXgTa97yfbW+9q+3/kPm5VjCaA7uBqeBp8/6DrUofNje8kW8TjYHmlrv
	vghWGMcHqA7iMLs22ltv3KvTWI2fwwq2VBzd0qnLmTjCGo0qCNQIq44lT6qs0JWJyZKH
	Ea73njEsUyetMenM6OE1kTG/4WqaHolQ/oiRYJOVtZcnd8x1r6Xo/BAVC91pK3zf8Krz
	D8kLZExOOw0hctkeItO/p/ipou8GqRUdMLXqbqejyWgzfS6aT7N1oGGasPpdt03TBUJP
	eXHVuaAXmyVdky5vyZ2uqGH3ge2iA7Xe4ty6QCnF3E7GUyGN92vadYilFe84MAGAE0Y6
	zv+w==
Received: by 10.180.80.104 with SMTP id q8mr14568960wix.14.1334924431889;
	Fri, 20 Apr 2012 05:20:31 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id e6sm5113697wix.8.2012.04.20.05.20.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Apr 2012 05:20:31 -0700 (PDT)
Date: Fri, 20 Apr 2012 13:20:29 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120420122029.GA13274@stefanha-thinkpad.localdomain>
References: <1334685493-6867-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334685493-6867-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm-dis: Fix spelling in
 comments (iff -> if)
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
X-List-Received-Date: Fri, 20 Apr 2012 12:21:10 -0000

On Tue, Apr 17, 2012 at 07:58:13PM +0200, Stefan Weil wrote:
> The spelling 'iff' is sometimes used for 'if and only if'.
> Even if that meaning could be applied here, it is not used
> consistently. It is also quite unusual to use 'if and only if'
> in technical documentation. Therefore a simple 'if' should be
> preferred here.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  arm-dis.c |   22 +++++++++++-----------
>  1 files changed, 11 insertions(+), 11 deletions(-)

Given the discussion about the origin of this code I think it makes
sense to leave the 'iff' to reduce spurious differences.

I am not taking this patch for now.  Feel free to discuss more if you do
think it should go in.

Stefan

