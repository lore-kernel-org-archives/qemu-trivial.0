Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RT9Rl-0006IR-Ln
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 04:48:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9Rh-000658-TJ
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:48:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9Rg-0001Je-PI
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:48:49 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:62417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RT9RV-0001Hr-I9; Wed, 23 Nov 2011 04:48:42 -0500
Received: by ghbg19 with SMTP id g19so1358642ghb.4
	for <multiple recipients>; Wed, 23 Nov 2011 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=peR8dC9PV7JxX9TtORDd+fqt6/LFeuozOifyfVmBcj4=;
	b=g5JWBOe9zdWDJNsi7PIuv6sWMb0XBUksd4yPxecVQPtGxaj/GG4Pu4vwjcbWM7QDbI
	ZC30kYypBQ7TQpaoXpB38isSZayafTs5Pmr0HNR4Ndc0ZcAwzUg5dzbne3r00r3teums
	irfH++HxrPNMO/1wqRzIRAzAhUtNLbVG9Ax0k=
Received: by 10.152.109.199 with SMTP id hu7mr14219169lab.16.1322041716205;
	Wed, 23 Nov 2011 01:48:36 -0800 (PST)
Received: from localhost ([109.224.133.37]) by mx.google.com with ESMTPS id
	hr17sm15299296lab.12.2011.11.23.01.48.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 01:48:35 -0800 (PST)
Date: Wed, 23 Nov 2011 09:48:33 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Message-ID: <20111123094833.GC21327@stefanha-thinkpad.localdomain>
References: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH] fix out of tree build
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
X-List-Received-Date: Wed, 23 Nov 2011 09:48:51 -0000

On Tue, Nov 22, 2011 at 05:27:15PM +0000, Stefano Stabellini wrote:
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

