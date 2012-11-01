Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TU01B-0003wJ-6G
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 15:01:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTzqQ-0002aP-CM
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 14:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTzqB-0002vf-P2
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 14:50:16 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:58181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TTzq4-0002mT-KE; Thu, 01 Nov 2012 14:50:00 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1055636bkc.4
	for <multiple recipients>; Thu, 01 Nov 2012 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Tp9eHY2IWX426RFQTT6MeiL/NjZuNXcCyk7LkE/Ttcg=;
	b=bvyJ3OIvfN+HOMsoabJqzd0lzjjMoIeLK1WnvGCmRrlT2xM0aOOhM55L/tEIO9ujEg
	NwMEbKsQtpPdEf8k0E0jy8xD1AxAmDggRZ9ef00Debgym2XJj4EdTzkCDVXEqAiw1h3C
	a6o569JJ9Qy6jHpBQ6AKKWJA5fbbkNv+UHS5RMgSwzXw1MJS44Q3ObLV6YVMwcSF/X/X
	Kohwq3ngT2+TJTQ5QPT00jr/yuja+msHwxcUPRJR0GKLiN+tbYtVocZelI0NYa7tQzCQ
	1AvVUyZs8XNlzpFn32bBJMfpHe6etjJtycSNls52a8BkOz5fNEeVGKi1SJiK2RELoIRt
	QbOw==
Received: by 10.204.5.215 with SMTP id 23mr12422776bkw.101.1351795799293;
	Thu, 01 Nov 2012 11:49:59 -0700 (PDT)
Received: from localhost (188-194-253-244-dynip.superkabel.de.
	[188.194.253.244])
	by mx.google.com with ESMTPS id e3sm5619114bks.7.2012.11.01.11.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:49:58 -0700 (PDT)
Date: Thu, 1 Nov 2012 19:49:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Blue Swirl <blauwirbel@gmail.com>
Message-ID: <20121101184957.GA910@stefanha-thinkpad.redhat.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
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
X-List-Received-Date: Thu, 01 Nov 2012 19:01:28 -0000

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

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

