Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHjIs-0006ye-9r
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 18:12:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1SHjIp-0006qn-G4
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 18:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1SHjIn-0001PG-Oh
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 18:12:43 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:54029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1SHjIk-0001Nu-3n; Tue, 10 Apr 2012 18:12:38 -0400
Received: by werp12 with SMTP id p12so207913wer.4
	for <multiple recipients>; Tue, 10 Apr 2012 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q5EdKy5dmdfvnIXuVE++O49IB7I3YgWNln0gpc92pvc=;
	b=HPDHsBcHf84Se9P/K9gsUpeSXDRUZImDNsY2HNZ5J2Kf1FvrV1BgpfvJlwckZA1Pu7
	BT7xUglZYHMTGAwSMLt+ZaNQZRnHKIX5sTZM8T1OgzBvuHweymPANhm1Iu0rZHvUFFtB
	HeOphoa3ZVpb40ZvNRUyojQQ2M5aR0l5UGmDuGvMNC/Z9wl8uuyG+1EtcAv2nrC7K4hQ
	sEqEl6i1IhO3ro1cHjj0IDyI4a9lU4e9iUhgZw1gFSNiWq70ddd0VIMRyn0Wj21KJ8Bn
	/9W38f1raWfDdzlr4elAEfC7IzPfkdFk9AWxwX1DT5lSDqq06yp2QGam5Is9lkujyvMZ
	+OwA==
Received: by 10.216.132.216 with SMTP id o66mr7383829wei.14.1334095954694;
	Tue, 10 Apr 2012 15:12:34 -0700 (PDT)
Received: from localhost (h59ec324b.selukar.dyn.perspektivbredband.net.
	[89.236.50.75])
	by mx.google.com with ESMTPS id 17sm42257306wis.0.2012.04.10.15.12.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 15:12:33 -0700 (PDT)
Date: Wed, 11 Apr 2012 00:12:29 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Message-ID: <20120410221229.GB18813@zapo>
References: <1334030752-26476-1-git-send-email-peter.crosthwaite@petalogix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334030752-26476-1-git-send-email-peter.crosthwaite@petalogix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] petalogix_s3adsp1800: deleted bad FIXME
	comment
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
X-List-Received-Date: Tue, 10 Apr 2012 22:12:45 -0000

On Tue, Apr 10, 2012 at 02:05:52PM +1000, Peter A. G. Crosthwaite wrote:
> This FIXME has already been actioned. Deleted comment.

Applied, thanks Peter


> 
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> ---
>  hw/petalogix_s3adsp1800_mmu.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/petalogix_s3adsp1800_mmu.c b/hw/petalogix_s3adsp1800_mmu.c
> index ff154c7..8b37336 100644
> --- a/hw/petalogix_s3adsp1800_mmu.c
> +++ b/hw/petalogix_s3adsp1800_mmu.c
> @@ -51,7 +51,6 @@
>  
>  static void machine_cpu_reset(CPUMBState *env)
>  {
> -    /* FIXME: move to machine specfic cpu reset */
>      env->pvr.regs[10] = 0x0c000000; /* spartan 3a dsp family.  */
>  }
>  
> -- 
> 1.7.3.2
> 

