Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QAKJf-0000aG-DB
	for mharc-qemu-trivial@gnu.org; Thu, 14 Apr 2011 07:02:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QAKJZ-0000Js-2z
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 07:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QAKJY-0005zh-4a
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 07:02:21 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:46441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QAKJV-0005zI-T8; Thu, 14 Apr 2011 07:02:18 -0400
Received: by wyb42 with SMTP id 42so1474620wyb.4
	for <multiple recipients>; Thu, 14 Apr 2011 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xOw7mgZ4HSLCHwgf09E4dzBttiEa1M3wN3IkGTnQcNM=;
	b=S1G1bpltENw9e9wLqkIX+OzAI9ZHdCNtAUvNLMQnxlkamUuobSnTIN+/PXstbz+UF5
	OjZf0BjeMq1rx+GC+MHNKTSI0RsMRFYYFjWli4BRQbgn5a1epJPLmYGT70gIqnbM1pxO
	buO3yd9/YT/sbmJaBRjwe+TCToI3z7B7jxigg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lbVt1JoGokDE3Egi1sVu6mmWnReodeVCX14Eh97vOGRs6n0GwzpZu0RBP5aVT7+5Sy
	QlIQMheKNc5+idJl5O3t7s0DZEXze2+qCckrKAoH4LV2F7c9oGOng8pi8BA7VR8VCioN
	QYbCp3M7cCdlJMtWZzSOeRsBIrJK1y1WbDino=
Received: by 10.227.172.7 with SMTP id j7mr664329wbz.60.1302778936922;
	Thu, 14 Apr 2011 04:02:16 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id e13sm914326wbi.40.2011.04.14.04.02.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2011 04:02:16 -0700 (PDT)
Date: Thu, 14 Apr 2011 12:02:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Brad Hards <bradh@frogmouth.net>
Message-ID: <20110414110212.GB10492@stefanha-thinkpad.localdomain>
References: <1302676936-15215-1-git-send-email-bradh@frogmouth.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302676936-15215-1-git-send-email-bradh@frogmouth.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Clean up after "make pdf"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2011 11:02:25 -0000

On Wed, Apr 13, 2011 at 04:42:16PM +1000, Brad Hards wrote:
> ---
>  .gitignore |    3 +++
>  Makefile   |    5 ++++-
>  2 files changed, 7 insertions(+), 1 deletions(-)

Merged into the trivial-patches tree.  I will send a pull request to the
qemu.git maintainers:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

