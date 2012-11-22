Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbRfK-0003C1-5M
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2012 02:57:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TbRfG-000329-Jj
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 02:57:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TbRfC-0007B0-CR
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 02:57:38 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:57531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TbRfA-0007AL-9a; Thu, 22 Nov 2012 02:57:32 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so4687488eek.4
	for <multiple recipients>; Wed, 21 Nov 2012 23:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tyIW/ti9fKEmJ0DQQPtsE7lmKTVidAbH9fF+m50dyO8=;
	b=Uphg6Gdzq1fm2nmqCq8ESedFiQzc40U6LjCfLdVuUh2KXmJE245q8PQIbDolaRBieX
	hjoYvrv4J4AetvvH1N7Kokt3B3tg2iKxDAT4ZO5erfTUPgI0s159oYWmMJpuMaxvMe9b
	AiKwlQD4cyrXj0ZfXEarxzNPeJE1LfTcnq3FcJZopq+Shg7DKhw1WcfOCaJWMAl08498
	jHRhS9ZY1Ok8uLbNOuCR7Bp7IEcRDZ7rvJP6sBEXYeDcHLCa3J+MPOOvunRXQkevn1Q0
	brct/rq0+Yio2f66/T6VoC09TgshVYkOFuE8Ng5zPy3n3ETdhfgU5ZNWTfZVhj6v6RNu
	Evaw==
Received: by 10.14.221.9 with SMTP id q9mr55343098eep.3.1353571051173;
	Wed, 21 Nov 2012 23:57:31 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id a45sm4794185eep.16.2012.11.21.23.57.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 23:57:30 -0800 (PST)
Date: Thu, 22 Nov 2012 08:57:29 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20121122075729.GB7598@stefanha-thinkpad.redhat.com>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1351805797-31899-1-git-send-email-rth@twiddle.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] trivial: Remove some pre-TCG
 CPUArchState members
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
X-List-Received-Date: Thu, 22 Nov 2012 07:57:40 -0000

On Fri, Nov 02, 2012 at 08:36:34AM +1100, Richard Henderson wrote:
> Best I can figure, these temporaries were used by the dyngen
> code generator, last seen in qemu 0.9.0.  Certainly there are
> no references to these members remaining.
> 
> Built x86_64 and i686 hosts.
> 
> 
> r~
> 
> 
> Richard Henderson (3):
>   target-alpha: Remove t0, t1 from CPUAlphaState
>   target-m68k: Remove t1 from CPUM68KState
>   target-sparc: Remove t0, t1 from CPUSPARCState
> 
>  target-alpha/cpu.h | 7 -------
>  target-m68k/cpu.h  | 3 ---
>  target-sparc/cpu.h | 1 -
>  3 files changed, 11 deletions(-)
> 
> -- 
> 1.7.11.7
> 
> 

Sorry I missed your pull request.

Thanks, applied to the trivial patches tree and should get in once the
1.4 merge window opens:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

