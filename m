Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RBMkf-00076U-KK
	for mharc-qemu-trivial@gnu.org; Wed, 05 Oct 2011 04:22:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RBMkc-0006td-9s
	for qemu-trivial@nongnu.org; Wed, 05 Oct 2011 04:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RBMka-0007aB-VM
	for qemu-trivial@nongnu.org; Wed, 05 Oct 2011 04:22:50 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:46630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RBMkY-0007Zk-91; Wed, 05 Oct 2011 04:22:46 -0400
Received: by wwg14 with SMTP id 14so1828390wwg.10
	for <multiple recipients>; Wed, 05 Oct 2011 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=beFiiCquWWetM2N/eNbwR+aYNwBSoOPwqqg9y6wtgL8=;
	b=r3oMC3iZ1I57Sc8c2Mo3krfyy2ZULyBQsttKosBI9eMDWc1yX9G/yyUC3AyRgmu4dW
	nnG2AVLO9xf6R/7nBbKPKC9fXr+gRsv6bv/rsQyOR4E5/zj8ONYBBho/gnrpE5SswI0K
	IvNXjT14CIha15fRwWw6hYzmLaxR3jj7dfEt0=
Received: by 10.227.58.200 with SMTP id i8mr2786826wbh.2.1317802965111;
	Wed, 05 Oct 2011 01:22:45 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id es10sm1556493wbb.4.2011.10.05.01.22.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 01:22:42 -0700 (PDT)
Date: Wed, 5 Oct 2011 09:22:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>
Message-ID: <20111005082240.GA17877@stefanha-thinkpad.localdomain>
References: <1317573348-7824-1-git-send-email-andreas.faerber@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1317573348-7824-1-git-send-email-andreas.faerber@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] target-arm: Fix typo
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
X-List-Received-Date: Wed, 05 Oct 2011 08:22:51 -0000

On Sun, Oct 02, 2011 at 06:35:48PM +0200, Andreas Färber wrote:
> The command line option is called -kernel, not -kenrel.
> 
> Cc: Paul Brook <paul@codesourcery.com>
> Signed-off-by: Andreas Färber <andreas.faerber@web.de>
> ---
>  target-arm/helper.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

