Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SEgsf-00076x-N9
	for mharc-qemu-trivial@gnu.org; Mon, 02 Apr 2012 09:01:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgsV-0006ai-P9
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgsR-0001FQ-3z
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:00:59 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:36245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SEgsF-00019D-Mm; Mon, 02 Apr 2012 09:00:43 -0400
Received: by mail-we0-f173.google.com with SMTP id p12so1849173wer.4
	for <multiple recipients>; Mon, 02 Apr 2012 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J5KwVyiB9GW0cYVw28lJoVWyyj7nr4M2Xqs8FoWc4zY=;
	b=ugn0xzS5Fc31fij+btV6mpvUzsP8qFOMzkv2kD8nGIqs3SdkEDSx7GF6p00Ehvx/f4
	dq400qXcedjSOPEntn4B0bITjKmJEgdEpCZWvBAneAJzyG9Uhhce5An9Hw4ZkUpt8QiY
	9sxgAwoU7Kr6vB0mbU2SGTYEk5ddHoPRutuX5x1s2vrTRWh6gdmFnkWDKyPiNzV7Z6rc
	ivqE4xRM6dWVtpzwW1oORshP2yva6xKk8hoiM5AZUfQxId/atd/vFku10iuQ/huJhhsZ
	qRz3j/TEfpj9jr888EFJtx2j3nAYUKpgbVAU2pvUjWWEUZNRraeOpFj//cajqLPI7kxo
	+ScQ==
Received: by 10.180.96.168 with SMTP id dt8mr24676402wib.18.1333371642074;
	Mon, 02 Apr 2012 06:00:42 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	bx13sm33929481wib.10.2012.04.02.06.00.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 06:00:41 -0700 (PDT)
Date: Mon, 2 Apr 2012 14:00:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120402130039.GB11583@stefanha-thinkpad.localdomain>
References: <1333208081-26421-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333208081-26421-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block/curl: Replace usleep by g_usleep
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
X-List-Received-Date: Mon, 02 Apr 2012 13:01:07 -0000

On Sat, Mar 31, 2012 at 05:34:41PM +0200, Stefan Weil wrote:
> The function usleep is not available for all supported platforms:
> at least some versions of MinGW don't support it.
> 
> usleep was also declared obsolete by POSIX.1-2001.
> 
> The function g_usleep is part of glib2.0, so it is available for
> all supported platforms.
> 
> Using nanosleep would also be possible but needs more code.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block/curl.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

