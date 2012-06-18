Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SgYZD-00012P-UN
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jun 2012 05:48:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SgYZ6-0000c9-6O
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 05:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SgYZ0-0005ME-1a
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 05:48:07 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:59834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SgYYo-0005Ja-SY; Mon, 18 Jun 2012 05:47:51 -0400
Received: by wibhn6 with SMTP id hn6so1333546wib.10
	for <multiple recipients>; Mon, 18 Jun 2012 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qN+W6eJEkYCIM+Jb9q9uRaGvDRNQj1D3pnkgJoFCH1Y=;
	b=aZ1YH5Md6vx2u4GGQ3Lgj+unJBGpSYS4YobLBISBp7MggqJ/PspLGeW87oZT0UZqa9
	abEM929g8uGDBzpwRmGKmjbBUTJj3Uy7zkFpzAELRo1GckZfZjEw5dKVP62jafFUSB5c
	z/bhs7qWiVTPeUmpDdjqw3D0ShKlD1K+u4789chR2prjsPWeDFOnOJon0AeYjCdEFMro
	+5wqWdYuBgb/QYjTqcoWsYrTeKmox6KNdFYNPWWhARYoLBcTkxwM0zuWiQpuNPBAGNWI
	H8NHzRgI1PjY1CYMx99nrRwESP+ZyAlpS+FLBPpiXyn0pbt8Ev/lyVe8U7eJgU7Z+AEt
	MAGw==
Received: by 10.180.95.100 with SMTP id dj4mr22693782wib.17.1340012868075;
	Mon, 18 Jun 2012 02:47:48 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	e20sm24816493wiv.7.2012.06.18.02.47.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 02:47:47 -0700 (PDT)
Date: Mon, 18 Jun 2012 10:47:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Message-ID: <20120618094746.GC6031@stefanha-thinkpad.localdomain>
References: <1339981218-25247-1-git-send-email-peter.crosthwaite@petalogix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339981218-25247-1-git-send-email-peter.crosthwaite@petalogix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
	john.williams@petalogix.com, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] arm_gic: Send dbg msgs to stderr not
 stdout
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
X-List-Received-Date: Mon, 18 Jun 2012 09:48:14 -0000

On Mon, Jun 18, 2012 at 11:00:18AM +1000, Peter A. G. Crosthwaite wrote:
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> ---
>  hw/arm_gic.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

