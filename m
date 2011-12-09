Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RYy9n-0006Pu-3v
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 05:58:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RYy9k-0006Dh-0Q
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 05:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RYy9i-0000kY-S4
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 05:58:19 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:53100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RYy9g-0000jz-IU; Fri, 09 Dec 2011 05:58:16 -0500
Received: by eekb45 with SMTP id b45so538802eek.4
	for <multiple recipients>; Fri, 09 Dec 2011 02:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xrs5l40zdblTG6V74z10dyUYvDZ0nVmAG1h8EtoD9vw=;
	b=c0DIevrj1pPJeDcv17Rx8i4/h1dp6J9zOzbxCxsT1TiMuR0EYe5siAoUR+2rI+V0rU
	u93TrI/+OflWfz/S+dkUCNUgE56KEO8mw9iSgJXsxtQNaeMczozGfuDYxtJFMzm5LShl
	x4jUa6jApmE2MDFtstg67Q0Z/Ck5maEbzvbLE=
Received: by 10.14.11.199 with SMTP id 47mr786445eex.147.1323428293814;
	Fri, 09 Dec 2011 02:58:13 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	z43sm17455570eef.7.2011.12.09.02.58.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:58:13 -0800 (PST)
Date: Fri, 9 Dec 2011 10:58:11 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111209105811.GC29426@stefanha-thinkpad.localdomain>
References: <1323297106-27312-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323297106-27312-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg: Remove redundant declarations of
 TCG_TARGET_REG_BITS
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
X-List-Received-Date: Fri, 09 Dec 2011 10:58:21 -0000

On Wed, Dec 07, 2011 at 11:31:46PM +0100, Stefan Weil wrote:
> TCG_TARGET_REG_BITS is declared in tcg.h for all TCG targets.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tcg/i386/tcg-target.h |    5 -----
>  1 files changed, 0 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

