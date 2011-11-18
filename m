Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRMYI-00070t-0o
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 06:24:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMYC-0006gG-6q
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMY7-0007A2-UK
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:24:07 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:47526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RRMY7-00079x-Pp; Fri, 18 Nov 2011 06:24:03 -0500
Received: by faas14 with SMTP id s14so4548802faa.4
	for <multiple recipients>; Fri, 18 Nov 2011 03:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I5CR1wWEIzBly3CDite89S8/rbBpUFhQRWXChLV1Gqw=;
	b=ZCrySMvXQARBpmkTtPu+icwUyqSGNMK2E+9iPGKyPVzSCyUeR7hzhyvthDl8JQog5O
	D5WNVAxYSts3FNooBqcXFaA35Vp6wP7MYE3y42cHyXLVHeY9nUX0DJ0bAXDAZ8lPT7rt
	l8KdNq04ekiidnk6r3PwW2N5FI2ieVRG5DH+8=
Received: by 10.204.151.84 with SMTP id b20mr2986068bkw.22.1321615442595;
	Fri, 18 Nov 2011 03:24:02 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id q16sm5094623fae.6.2011.11.18.03.24.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 03:24:01 -0800 (PST)
Date: Fri, 18 Nov 2011 11:24:00 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: matthias.bgg@googlemail.com
Message-ID: <20111118112400.GB12781@stefanha-thinkpad.localdomain>
References: <1321358234-14229-1-git-send-email-matthias.bgg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321358234-14229-1-git-send-email-matthias.bgg@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, Matthias Brugger <matthias.bgg@gmail.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fixing some spelling in
	docs/libcacard.txt
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
X-List-Received-Date: Fri, 18 Nov 2011 11:24:12 -0000

On Tue, Nov 15, 2011 at 11:57:14AM +0000, matthias.bgg@googlemail.com wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  docs/libcacard.txt |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

I have already sent a pull request including this patch for QEMU 1.0.

Stefan

