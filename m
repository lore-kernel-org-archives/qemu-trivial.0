Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ramnm-0003nv-HR
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2011 06:15:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ramnc-0003Jh-Mr
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:15:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RamnW-0008MV-UG
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:15:00 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:47804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RamnL-0008Ku-2q; Wed, 14 Dec 2011 06:14:43 -0500
Received: by faao26 with SMTP id o26so1074764faa.4
	for <multiple recipients>; Wed, 14 Dec 2011 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MvgWqMjcNpcSz5YtfhoplCegoHlGcKnt/ExzDhmQIRk=;
	b=dlRlNcvy7YXx7C78mmwRa9FTGoyNW4g1cN2+1u9u7BcFioId7jiCQormuiFoqUyB1/
	pyZzFpp2kNhdDWM/n/mLZXeDBT/lyA+TGhOahnpxs7uglwczltr2pgINlJ1bze5yv5Lr
	+7aVD8H0AiHzhaUYBsZ8YE+mm7GY+sqt7NulY=
Received: by 10.180.88.66 with SMTP id be2mr3538150wib.54.1323861282277;
	Wed, 14 Dec 2011 03:14:42 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id k5sm2920526wiz.9.2011.12.14.03.14.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 03:14:41 -0800 (PST)
Date: Wed, 14 Dec 2011 11:14:40 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111214111440.GD10403@stefanha-thinkpad.localdomain>
References: <1323844224-22432-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323844224-22432-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] doc: Remove Symbian Virtual Platform
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
X-List-Received-Date: Wed, 14 Dec 2011 11:15:09 -0000

On Wed, Dec 14, 2011 at 07:30:24AM +0100, Stefan Weil wrote:
> Commit d396a657baec8c6b7aa0c888746e0e2f78303650 removed the code
> for SVP, so the documentation needs this update.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-doc.texi |   23 -----------------------
>  1 files changed, 0 insertions(+), 23 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

