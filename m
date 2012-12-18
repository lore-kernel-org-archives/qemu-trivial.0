Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tkzgs-0005oi-KO
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:06:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tkzgn-0005bV-PD
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tkzgm-0008Sn-O2
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:06:41 -0500
Received: from mail-we0-f174.google.com ([74.125.82.174]:40863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tkzgd-0008Rh-LU; Tue, 18 Dec 2012 11:06:31 -0500
Received: by mail-we0-f174.google.com with SMTP id x10so401866wey.33
	for <multiple recipients>; Tue, 18 Dec 2012 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=q0/vxkMHCtmVT/md4h6bzmGkTGBy8mT+JQSYi3oLZZA=;
	b=bapTZOt+Bj/63Ry74NENPy0nfvAdCzOzelCQzKs7RRBZT/qiOG/qMX1JFvjqtI9NSG
	Rs18mR7FmeFrBUsVbhw0qTEoPaxa42cFXVZvVTWKRnwKA7rgZOqKn+MSQ2220XkqlvlT
	2OqtPtIWiiHMkxsUGbk4YMpRjbFIVRIWU4+8zdLNttEYsvWuRccX+leWGLOjlm0EF+x/
	lhJ8t8rOcKy91YGeKh8yAcc4UxzdxDYL2cjEiwcNDisCeF1SbEZnqgf8Un22OrTZRbYq
	UA9g6BD1D66ogkzOEomqVMd2/WITu6qRw0ntEQf9r5QuITy9OcR0gyFCrFofRCMoTS7Y
	M2Uw==
X-Received: by 10.180.75.208 with SMTP id e16mr5868215wiw.3.1355846790797;
	Tue, 18 Dec 2012 08:06:30 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id ew4sm3283388wid.11.2012.12.18.08.06.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:06:29 -0800 (PST)
Date: Tue, 18 Dec 2012 17:06:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cole Robinson <crobinso@redhat.com>
Message-ID: <20121218160628.GC12099@stefanha-thinkpad.redhat.com>
References: <8b94a7004b9d169a579a9ee1a9513e6cb212690f.1354842199.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b94a7004b9d169a579a9ee1a9513e6cb212690f.1354842199.git.crobinso@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.174
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] gitignore: Add virtfs-proxy-helper
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
X-List-Received-Date: Tue, 18 Dec 2012 16:06:46 -0000

On Thu, Dec 06, 2012 at 08:03:26PM -0500, Cole Robinson wrote:
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

