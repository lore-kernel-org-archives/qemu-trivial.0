Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSm6M-0001L7-60
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 05:57:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSm6J-0001G4-JH
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:57:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSm6I-00076C-NF
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:57:43 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TSm68-00074S-Fx; Mon, 29 Oct 2012 05:57:32 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1557449bkc.4
	for <multiple recipients>; Mon, 29 Oct 2012 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LDgeOi9kJYFpGfMMY18jRt8rA53qZoAfCiABKEI0xHM=;
	b=JK9U6iOxRHYDpJQF8wwhsOpPYpFEj2NR3wkKRip1fRR9mSnnEcC6vsDj7hHZtskWpK
	CoWqFEMSaAK7fkYWvoC9iLtt7ipkmBJxqcjT/cbaKFlalgfzObzM8vTh+/ju7/64o0Rp
	CWahpQt/+7NoyUzsP8PXtUY9pwnixPYIE7VCUM1EVxXqUYGd0NHjI9McjQKHch0nSBc6
	Mz7frg049YX85s/lHDXRzowkOj2ddVJBYu9c4Y1RTMDDI7xVtMHxrd+7/tNcqboL9O41
	MjoDtd8FtfVcQcUYeRXLVn6/KQNediqX2PXMtkcKCpDvKMCwbqKQ5h+S4cPfJG9YgrVC
	oOkg==
Received: by 10.204.13.25 with SMTP id z25mr9196535bkz.119.1351504651505;
	Mon, 29 Oct 2012 02:57:31 -0700 (PDT)
Received: from localhost ([89.204.138.63])
	by mx.google.com with ESMTPS id k21sm3421627bkv.1.2012.10.29.02.57.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 02:57:30 -0700 (PDT)
Date: Mon, 29 Oct 2012 10:57:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Blue Swirl <blauwirbel@gmail.com>
Message-ID: <20121029095728.GA30930@stefanha-thinkpad.redhat.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/6] static patches
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
X-List-Received-Date: Mon, 29 Oct 2012 09:57:44 -0000

On Sun, Oct 28, 2012 at 11:04:45AM +0000, Blue Swirl wrote:
> v2: extract function removal patches, skip ARM
> 
> Blue Swirl (6):
>   target-sparc: make do_unaligned_access static
>   vl.c: add missing static
>   vnc: add missing static
>   ppc: add missing static
>   target-ppc: make some functions static
>   exec: make some functions static
> 
>  console.h                  |    2 --
>  cpu-common.h               |    5 -----
>  exec-all.h                 |    2 --
>  exec.c                     |   15 +++++++++------
>  hw/adb.c                   |    8 ++++----
>  hw/adb.h                   |    4 ----
>  hw/nvram.h                 |   10 +---------
>  hw/ppc.c                   |   16 ++++++++--------
>  memory-internal.h          |    2 --
>  sysemu.h                   |    5 -----
>  target-ppc/cpu.h           |    7 -------
>  target-ppc/mmu_helper.c    |   11 ++++++-----
>  target-sparc/cpu.h         |    3 ---
>  target-sparc/ldst_helper.c |    8 ++++++--
>  ui/vnc-jobs.c              |   10 +++++-----
>  ui/vnc-jobs.h              |    1 -
>  ui/vnc.c                   |   14 +++++++-------
>  ui/vnc.h                   |    5 -----
>  vl.c                       |   21 ++++++++++++---------
>  19 files changed, 58 insertions(+), 91 deletions(-)
> 
> -- 
> 1.7.2.5
> 
> 

Waiting a bit before merging so experts in the various areas touched can
take a look.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

