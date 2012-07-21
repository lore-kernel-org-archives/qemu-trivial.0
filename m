Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWGy-0000uQ-6T
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:46:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWGv-0000uJ-Aw
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:46:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWGu-00072f-6I
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:46:49 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:33000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWGu-00072a-0N; Sat, 21 Jul 2012 05:46:48 -0400
Received: by weyz53 with SMTP id z53so3219864wey.4
	for <multiple recipients>; Sat, 21 Jul 2012 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dJwhSmRu+yuBdTjXjIN2FLJASutdV6eChYTqn/MlS/4=;
	b=x0ti5D8Rqi2A9+z50cvlkgDonRn5tnFKeSE1uBAYBMbdQ6kT02eUTvWhEaalcp/mTM
	OEmLhRmdt5AN79yRZImwd/xadHQD9TuJAgoNC84bLZa3jXcKFlWq+mw6j43BNWlhbYw+
	z1tCupvPygR5eZiNF99E6yVxax93TGySh+R1zCmmm9NwSPVDtzAT1mPZXri/R8di0wX2
	EivmhNEj5Kh0MDiK+58+KN//mIShe/xf81r7uGxKhKyQzlo4gXZ+s8brQkJAyw6fEy92
	Ts1VT49Wd/X8ouOZSsRLLQEBtgOBF+KcziH7rWXRl17SFHR+8uAEi2wYiudouUODjeE+
	Lqhw==
Received: by 10.180.99.232 with SMTP id et8mr13744952wib.11.1342864006830;
	Sat, 21 Jul 2012 02:46:46 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id h9sm3017682wiz.1.2012.07.21.02.46.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:46:46 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:46:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120721094645.GA14213@stefanha-thinkpad.localdomain>
References: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use macro QEMU_PACKED for
 new packed structures
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
X-List-Received-Date: Sat, 21 Jul 2012 09:46:50 -0000

On Wed, Jul 18, 2012 at 06:12:37PM +0200, Stefan Weil wrote:
> Since commit 541dc0d47f10973c241e9955afc2aefc96adec51,
> some new packed structures were added without using QEMU_PACKED.
> 
> QEMU_PACKED is needed for compilations with MinGW.
> For other platforms nothing changes.
> 
> The code was fixed using this command:
> 
>     git grep -la '__attribute__ ((packed))'|xargs perl -pi -e 's/__attribute__ \(\(packed\)\)/QEMU_PACKED/'
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/mfi.h          |   92 ++++++++++++++++++++++++++---------------------------
>  hw/ppce500_spin.c |    2 +-
>  2 files changed, 47 insertions(+), 47 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

