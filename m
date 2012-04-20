Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SLCqo-00009q-NN
	for mharc-qemu-trivial@gnu.org; Fri, 20 Apr 2012 08:22:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLCqj-00009i-JV
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:22:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLCqh-0001Rd-OP
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:22:05 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:34735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SLCqh-0001RO-Fa; Fri, 20 Apr 2012 08:22:03 -0400
Received: by werp12 with SMTP id p12so7027352wer.4
	for <multiple recipients>; Fri, 20 Apr 2012 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1TUgbuei3i9CJ4MWnBEVXEV22uMllAljg62oYDUhbs4=;
	b=bSjEum0GpLASyjxNEER3d4HjNesVeV9y9tpNALlyQEAbX4jCnLVswoM4oHjhifU72n
	F/x81TtTcGWdZo3zvf++T2bHBBWUoCSgwkQGky9Exw6DK7KKVQedfYwFV2pNQguscpBC
	2Z8jbZRKfaE1OXcaYGcl/OmdnCcgpx76b0dyRWM0XXKX1y81ziEW/JpU583a4UbSOsRK
	45oHgaPeTsqjeHVNY5xZxZx1thgBMY/5K7/lpa5vhCaoSKhnpJA/gn+/qen+fKc4YXna
	2muxdadnRWgEDUf0+9BZZdUb/dP9mjYG+qLW3OrjDqqsS0HlaNTdADumdsynuge7QXKM
	rwVw==
Received: by 10.216.139.67 with SMTP id b45mr15373wej.0.1334924520902;
	Fri, 20 Apr 2012 05:22:00 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id e6sm5121938wix.8.2012.04.20.05.21.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Apr 2012 05:22:00 -0700 (PDT)
Date: Fri, 20 Apr 2012 13:21:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20120420122158.GB13274@stefanha-thinkpad.localdomain>
References: <1334886024-27969-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334886024-27969-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add .gitignore for tests/
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
X-List-Received-Date: Fri, 20 Apr 2012 12:22:10 -0000

On Fri, Apr 20, 2012 at 11:40:24AM +1000, David Gibson wrote:
> The new autotests in tests/ generate a number of files, both
> executable and source, which are not caught by the existing .gitignore
> files.  This patch adds a new .gitignore in tests/ which covers these.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  tests/.gitignore |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 tests/.gitignore

I sent a similar patch recently but yours is more comprehensive.  I've
made one small change: instead of 'rtc-test' ignore 'tests/*-test' so
that future tests do not need to be added to .gitignore on a
case-by-case basis.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

