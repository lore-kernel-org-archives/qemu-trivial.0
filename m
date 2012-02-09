Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQDU-0000LK-DU
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 04:23:00 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDL-0008Fz-Ts
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDH-0007p9-Qc
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:51 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvQD6-0007i1-TY; Thu, 09 Feb 2012 04:22:37 -0500
Received: by mail-wi0-f173.google.com with SMTP id hi20so1152830wib.4
	for <multiple recipients>; Thu, 09 Feb 2012 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zb8G3SzIg8HP4oQPtAtpcnTDrl/iMXQ9HVzVObc1cxc=;
	b=Dxe1wDSnmnIVSYI72KC5sUXcMysLVs1NnmVV/4svXrT+97g1aFNdprZMvnJ4YW1nYJ
	k5jFLbN/D7I7iubjkc1znvN8mauhZUdA+gVKmv5/cO3k3Gsy3ndzpP/9Y8bWahDuLl5N
	wmVTvvcsa0j6JDCW5kNhzWKBor+24sQ5r9vTA=
Received: by 10.180.24.202 with SMTP id w10mr1485481wif.9.1328779356435;
	Thu, 09 Feb 2012 01:22:36 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	hb10sm5971029wib.10.2012.02.09.01.22.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 01:22:35 -0800 (PST)
Date: Thu, 9 Feb 2012 08:47:10 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120209084710.GE30956@stefanha-thinkpad.localdomain>
References: <1328649989-3096-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1328649989-3096-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fmopl: Fix typo in function
	name
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
X-List-Received-Date: Thu, 09 Feb 2012 09:22:58 -0000

On Tue, Feb 07, 2012 at 10:26:29PM +0100, Stefan Weil wrote:
> Fix a typo in a local function name.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/fmopl.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

