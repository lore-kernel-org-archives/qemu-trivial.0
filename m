Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkE96-0003Vo-Je
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2012 07:16:12 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkE91-0003F0-Nv
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 07:16:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkE8v-0006Xz-Ti
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 07:16:07 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:63760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RkE8o-0006WH-Cm; Mon, 09 Jan 2012 07:15:54 -0500
Received: by eekb45 with SMTP id b45so2397857eek.4
	for <multiple recipients>; Mon, 09 Jan 2012 04:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QCgcnAmhZGoZzAs2reOqku0rsg2CAhep2ckQpGyjp5Y=;
	b=FQThYhCmiEyGKJZuT6QrLHR0opuTDPUGdCtdr70VN5bymBuo0sN/lprIXnSzvlYIZt
	M5fXR+sEUhDOanSQ6Gs9HYizaxcbuocLOURzhBFQBWpS/2SXGTuVzU6tUlZH7yjFFLKd
	SGe0FmRv5S0DkyEfrp1FKIC6xIB9VrNMa0bDU=
Received: by 10.14.120.82 with SMTP id o58mr5989081eeh.129.1326111353529;
	Mon, 09 Jan 2012 04:15:53 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	a60sm290159257eeb.4.2012.01.09.04.15.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 04:15:52 -0800 (PST)
Date: Mon, 9 Jan 2012 12:15:51 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120109121551.GC14603@stefanha-thinkpad.localdomain>
References: <1326047709-32345-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326047709-32345-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Spelling fixes in comments and
 documentation
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
X-List-Received-Date: Mon, 09 Jan 2012 12:16:11 -0000

On Sun, Jan 08, 2012 at 07:35:09PM +0100, Stefan Weil wrote:
> Codespell detected these new spelling issues.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/writing-qmp-commands.txt |    2 +-
>  memory.h                      |    4 ++--
>  qemu-ga.c                     |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

