Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Shzol-0001SO-Mr
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:06:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Shzoj-0001SG-Tx
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:06:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Shzoi-0007vN-4B
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:06:13 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:49941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Shzoh-0007v3-R8; Fri, 22 Jun 2012 05:06:12 -0400
Received: by bkwj10 with SMTP id j10so1443684bkw.4
	for <multiple recipients>; Fri, 22 Jun 2012 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QKpYfCjV/tq+w4X7yJKWpzTyl2aWzj9UdzQhX3ZeQys=;
	b=tl58Iojjhbs4yBJgvFpVopO8tXrW5c03F7YAAnNoTAdxYcER/5J0YA5OuT+BMQtONq
	+o5QOQTzKEJjR/T73QwpPBo7CHld5vKMQpepTr1BnSUlfSLgmYlSkZxf8QdIeMj3eHuJ
	6ew2k9XItd9rDf6dpMUTju8uTHKFnknkW/CPfzARF5BfvYbLGM8KFt2S9ltKjywTAAxq
	+qfs+TpcHUJib82nnLUi7yB4q0geWdmJHKBDQOpASIEhEe8qEDLcL3pSW98MraUqfbzJ
	wtCDoU5MfcpERaL3hAvd8LYzroHyDW3kyzrVkcaYMKgTepOK5twy+LyoWOzxqpM9iU/v
	QPnw==
Received: by 10.204.156.155 with SMTP id x27mr456728bkw.84.1340355969061;
	Fri, 22 Jun 2012 02:06:09 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id u8sm35157130bks.0.2012.06.22.02.06.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 02:06:08 -0700 (PDT)
Date: Fri, 22 Jun 2012 10:06:06 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120622090606.GD27038@stefanha-thinkpad.localdomain>
References: <1340165151-30936-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340165151-30936-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: Use QEMU instead of Qemu
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
X-List-Received-Date: Fri, 22 Jun 2012 09:06:15 -0000

On Wed, Jun 20, 2012 at 06:05:51AM +0200, Stefan Weil wrote:
> This new 'QEmu' was recently added.
> Replace it by the official all upper case 'QEMU'.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Hopefully those 'Qemu' and 'QEmu' variants will stop
> as soon as my patch for checkpatch.pl was applied.
> 
>  target-i386/cpu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

