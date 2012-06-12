Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SeNl5-0003Yw-3p
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2012 05:51:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNkz-0003JN-QW
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNkq-0006jL-3H
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:51:25 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:37590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SeNkh-0006fs-HS; Tue, 12 Jun 2012 05:51:07 -0400
Received: by bkwj10 with SMTP id j10so4713517bkw.4
	for <multiple recipients>; Tue, 12 Jun 2012 02:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=n2fcHlqpW/ox8LkDfbEUywA9WtEVYYlKej7b4uIqWKA=;
	b=DXpCunVfjJBvAL231pqQsCU1beqj6AzH9f/TT66h8WCRuncdY5jEyzO6A7BniZcYeY
	5B4MswxD/tuc1SwKa6B7qTK0r4Fr70VFJ+nyIVDqV5TIWqx/339V8ER4hv//D2bwdtnq
	5kw3U1NzZ5DpHCTm1Fq1+iDCO/fauY+TvKIUMBj3b+4AB/8TIS6I6fh0dYhgv02dax64
	Hq0/CNq72WcZaj85oVtdHEj5zlFFNNyoC+6HCEavkn5xaFtsR60SlZ2okIqCPzuNHgBl
	fL9Yu7RFmxtGGT6S4OzCsg6zXqEzqAszrTXVgHyeI6rfoJ8FLPDxJc/5LcyWUW50a8po
	Xqmg==
Received: by 10.204.141.18 with SMTP id k18mr11533128bku.27.1339494664430;
	Tue, 12 Jun 2012 02:51:04 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	e20sm19522628bkv.10.2012.06.12.02.51.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 02:51:03 -0700 (PDT)
Date: Tue, 12 Jun 2012 10:50:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20120612095059.GD29104@stefanha-thinkpad.localdomain>
References: <1339243002-13760-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1339243002-13760-1-git-send-email-afaerber@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile.user: Define CONFIG_USER_ONLY
 for libuser/
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
X-List-Received-Date: Tue, 12 Jun 2012 09:51:30 -0000

On Sat, Jun 09, 2012 at 01:56:42PM +0200, Andreas Färber wrote:
> In *-*-user/ build dirs CONFIG_USER_ONLY is defined via config-target.h.
> In libuser/ it is not defined.
> 
> Add it via QEMU_CFLAGS.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Soon needed for cpu.c.
> 
>  Makefile.user |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

