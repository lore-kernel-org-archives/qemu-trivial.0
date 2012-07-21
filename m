Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWHz-0001sj-UX
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:47:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWHx-0001lO-1o
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:47:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWHw-0007RG-39
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:47:52 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:54876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWHt-0007OX-Mg; Sat, 21 Jul 2012 05:47:49 -0400
Received: by wibhm2 with SMTP id hm2so966571wib.10
	for <multiple recipients>; Sat, 21 Jul 2012 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tXskXE0xYhxzMFLA3a/U4iuUg64TDOTZC/6X4pyuY7k=;
	b=neN3xarGJtwuSqP8Oa6y9fDJqdbpbAC9ctVYhLGZafdHoN3zWnXIrFR2pqCdwUfBK3
	hh3dHU/ouTrSv/wTbGuiXE++cvGK/ppujdTH/dHr2s2rtLBUGJ3ccGoH7o/P6CrDr1+L
	xxZUM2tL6lEPSit+wOGKxZPXC+v8Z+kk6qZw/UIJRYjRwIQWWslI6DJMdfFEXtQglQBs
	7ELt6yE+1zMy3Sy/x7bxKN6tZhvbYcVGgV7r9Pe4Fzi/N8iKzRaZ6KvppoPi4Pgq2bsP
	6A4trtqeszDbnyzcWAM2RdZ52KCQfweB5JfMhuTSPfg5jNojahE+IONedzoHBsVYGLcD
	mGgg==
Received: by 10.180.109.195 with SMTP id hu3mr3315277wib.8.1342864068701;
	Sat, 21 Jul 2012 02:47:48 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id de10sm3000613wib.7.2012.07.21.02.47.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:47:48 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:47:47 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120721094747.GB14213@stefanha-thinkpad.localdomain>
References: <1342713147-14729-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1342713147-14729-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cpus.c: Make
	all_cpu_threads_idle() static
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
X-List-Received-Date: Sat, 21 Jul 2012 09:47:54 -0000

On Thu, Jul 19, 2012 at 04:52:27PM +0100, Peter Maydell wrote:
> Commit 946fb27c1 moved all the uses of all_cpu_threads_idle()
> into cpus.c. This means we can mark the function 'static'
> (again), if we shuffle it a bit earlier in the source file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  cpus.c        |   52 ++++++++++++++++++++++++++--------------------------
>  qemu-common.h |    1 -
>  2 files changed, 26 insertions(+), 27 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

