Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTwjc-0001TA-W8
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2011 09:54:21 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwjV-0001Rh-3c
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwjT-00024N-CJ
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:54:12 -0400
Received: from mail-ww0-f41.google.com ([74.125.82.41]:51360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QTwjJ-000231-Nr; Tue, 07 Jun 2011 09:54:02 -0400
Received: by wwi18 with SMTP id 18so2488285wwi.4
	for <multiple recipients>; Tue, 07 Jun 2011 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zDy5fq/bKUFDdHaiZoU3tWn7h/RQ9rtcMLXSDkIFiN8=;
	b=ZxclP+Ra65WXwM72dJsJjtGPnBgj5ZwsrGVmhBRxMb8keJ/Pwbn2RXp31pLg4KOyfC
	gnbHQHvB3d39FkTD/wCf1EAzGmtoGg/yyHjvFEgZ51I7LmiBsrcreZQE222hWLl5NYLP
	fS4VDu2FEVXZ2bzPSufwTgQUrXfTwUfFv2wtk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=f+BxsVaKyO+vfbuXDKevydd6sbAHz4KBLsAFP0Tgv0Szr7mAWj5MCQjSCDlpTc9hZa
	hdwZxBvOLsTO58CRiyIbpKvEs4v6a1sWVowbBQqvTLCMx9QjStWwU2xJlkwEj0DLuuAB
	Js1H87wBdnlJILvx4bYNuLA+9OvpbL6sUHYxY=
Received: by 10.216.242.205 with SMTP id i55mr3992096wer.66.1307454840659;
	Tue, 07 Jun 2011 06:54:00 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id fw15sm3576267wbb.10.2011.06.07.06.53.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:53:59 -0700 (PDT)
Date: Tue, 7 Jun 2011 14:53:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Message-ID: <20110607135354.GA1493@stefanha-thinkpad.localdomain>
References: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix compilation warning due to missing
 header for sigaction (followup)
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
X-List-Received-Date: Tue, 07 Jun 2011 13:54:19 -0000

On Thu, Jun 02, 2011 at 11:26:49PM -0400, Alexandre Raymond wrote:
> This patch removes all references to signal.h when qemu-common.h is included
> as they become redundant.
> 
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
>  audio/audio_pt_int.c  |    2 --
>  audio/sdlaudio.c      |    1 -
>  block/raw-posix.c     |    2 --
>  bsd-user/syscall.c    |    1 -
>  darwin-user/signal.c  |    3 ---
>  exec.c                |    1 -
>  linux-user/signal.c   |    1 -
>  net/tap.c             |    1 -
>  posix-aio-compat.c    |    1 -
>  qemu-char.c           |    1 -
>  qemu-progress.c       |    1 -
>  savevm.c              |    1 -
>  target-i386/helper.c  |    1 -
>  target-ppc/helper.c   |    1 -
>  target-sparc/helper.c |    1 -
>  ui/curses.c           |    1 -
>  ui/sdl.c              |    4 ----
>  usb-bsd.c             |    1 -
>  usb-linux.c           |    1 -
>  19 files changed, 0 insertions(+), 26 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

