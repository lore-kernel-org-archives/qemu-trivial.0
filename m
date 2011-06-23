Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZk3P-0006eh-Gk
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 09:34:43 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk3N-0006dk-19
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk3L-00038g-K7
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:34:40 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:65084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZk3H-000380-Aa; Thu, 23 Jun 2011 09:34:35 -0400
Received: by wyf28 with SMTP id 28so1432424wyf.4
	for <multiple recipients>; Thu, 23 Jun 2011 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BXpS7bw1KxsClM00eFdNNnKbwjrXoJg0VUSmNf95leQ=;
	b=Eio9uvAFh3b8OGBZ0cZV6ERi7JHLFt164WxrJKoH5x4yXS0+k0ylS0WwhfDBq/AAOH
	nWKVVrclBjf7UbGaAwdi86foO0dxA4//mL4jbj66nh4jGonK1bcuiOdaaGBrRLAAs0W4
	taCURxagdhJO9KkEkfjiQ+HbwI4TaAQ7wBpJY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CXhcsr932PRBjwRyJ95qJyAPAlzJCEfDivk0JSXLhU9HSnbSjpjN5t0ayBWqQQkMd3
	uNvIZfW9zbtB/qPNOu4Ap2P3YvsTTZl9oMam0PE9wGRXrcCWH+zAs/w0LtunUFPocZeP
	FKy/a/qJhbiTs0kprR71vDRIYDZTOnrgruepg=
Received: by 10.216.237.136 with SMTP id y8mr3311714weq.76.1308836073861;
	Thu, 23 Jun 2011 06:34:33 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id c17sm1243198wbh.12.2011.06.23.06.34.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 06:34:32 -0700 (PDT)
Date: Thu, 23 Jun 2011 14:34:29 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Matthew Fernandez <matthew.fernandez@gmail.com>
Message-ID: <20110623133429.GD12698@stefanha-thinkpad.localdomain>
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix comment typos
	in hw/armv7m.c
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
X-List-Received-Date: Thu, 23 Jun 2011 13:34:42 -0000

On Thu, Jun 23, 2011 at 10:59:26AM +1000, Matthew Fernandez wrote:
> Fix a couple of typos in comments.
> 
> Signed-off-by: Matthew Fernandez <matthew.fernandez@gmail.com>
> ----
> This patch doesn't touch any code and should (hopefully) not be
> controversial. There doesn't seem to be a maintainer for this file,
> but changes are trivial.
> 

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

