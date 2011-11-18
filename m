Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRMVH-0006KF-C2
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 06:21:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMVB-0006Fw-KQ
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:21:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMV7-0006jv-Kr
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:21:01 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:49982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMV7-0006jo-AV
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:20:57 -0500
Received: by bkbzu5 with SMTP id zu5so3815625bkb.4
	for <qemu-trivial@nongnu.org>; Fri, 18 Nov 2011 03:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=spOF3f9Eq7TTVKu1fXYHkkM3zT+PwW3XIYkzklhzfR4=;
	b=QGMEi6UadEVNYEoIjlPlIq0fnK6aXkWHvwIqpOktp+VVdeH+mZoDOnS4dTcMa8+AvR
	MWEz3gbN1gyV8gCdhMBFiWp3oKPfXXvPNCKzYwyc8pZHPCObs3N5lmEOIO6AYuEhRTme
	HDHPZO9cWHS9+05orHTSldcVuZ2XGco9qX49g=
Received: by 10.204.147.215 with SMTP id m23mr2933900bkv.84.1321615255941;
	Fri, 18 Nov 2011 03:20:55 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id l18sm5083063fab.9.2011.11.18.03.20.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 03:20:55 -0800 (PST)
Date: Fri, 18 Nov 2011 11:20:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111118112053.GA12697@stefanha-thinkpad.localdomain>
References: <1321219467-12000-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321219467-12000-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@non-gnu.org
Subject: Re: [Qemu-trivial] [PATCH 1.0 1/2] Fix spelling in documentation
 and comments (similiar -> similar)
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
X-List-Received-Date: Fri, 18 Nov 2011 11:21:05 -0000

On Sun, Nov 13, 2011 at 10:24:26PM +0100, Stefan Weil wrote:
> This bug was detected by codespell.
> In mips_mipssim.c a grammatical error was fixed, too.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/libcacard.txt |    2 +-
>  hw/mips_mipssim.c  |    2 +-
>  qemu-doc.texi      |    4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

I already sent a pull request including this patch for QEMU 1.0.

Stefan

