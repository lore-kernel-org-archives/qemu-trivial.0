Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R4B03-0005Ek-7q
	for mharc-qemu-trivial@gnu.org; Thu, 15 Sep 2011 08:25:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R4B00-00055U-3r
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 08:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R4Azw-0007Od-27
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 08:24:59 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:42356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R4Azs-0007O2-Sf; Thu, 15 Sep 2011 08:24:52 -0400
Received: by fxh13 with SMTP id 13so648084fxh.4
	for <multiple recipients>; Thu, 15 Sep 2011 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GmqLFZTHV43Gp2u5i+tBuvhrNATcVUaojz1XNfozqA4=;
	b=Z4gtHUvLCXL8yYvn66+E25IJWHYoQvf4j8yui1ufOiFRZhcxnNdwEhrFXubFEhZf/C
	mszhFsmZsl8Cn8w+A6t9k7jjxpw8cnJbVOL0mubINnpU01NY5q1AMGhJio15sXYDR+Tq
	/4MrTMXVjMT3SukKjcyboJr2OEFu5y+MD5YOA=
Received: by 10.223.76.24 with SMTP id a24mr868459fak.109.1316089491787;
	Thu, 15 Sep 2011 05:24:51 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	e17sm6882567fae.17.2011.09.15.05.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 05:24:50 -0700 (PDT)
Date: Thu, 15 Sep 2011 13:24:48 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20110915122448.GA18553@stefanha-thinkpad.localdomain>
References: <1315928872-6730-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315928872-6730-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix compilation with stderr
	trace backend
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
X-List-Received-Date: Thu, 15 Sep 2011 12:25:01 -0000

On Tue, Sep 13, 2011 at 05:47:52PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  trace-events |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

