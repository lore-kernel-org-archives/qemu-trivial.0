Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwCSq-0006Xy-9M
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 09:26:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwCSl-0006Gv-6Q
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 09:26:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwCSh-0003qV-9A
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 09:26:15 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:34986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SwCSV-0003kp-Qt; Tue, 31 Jul 2012 09:25:59 -0400
Received: by weyz53 with SMTP id z53so4303799wey.4
	for <multiple recipients>; Tue, 31 Jul 2012 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zbGWFP+4eWgTgfj9WcJbgIE9GhO7DdxbrOKefXjVBDc=;
	b=f0eXKtw9TUHnCa99dRxY5/L/Oeqom3bg2kerpE6gbGPAf8dQ8GSQ+8iu721Sime1Dh
	hj9ZB+/elgQ15dOvCQj+t4g/CN58lPy0IcMRlTRaLfMNEnVG1Jwc2NPjEXtFy8OT7lg/
	XMp8iSMjk5TVaS/IibLfsI1zOGP1Rys+e0OzBDJSBlZMVlg362tAb0q1GrBSsJYW4AGL
	+uZnyyxLVisfnxeAJl22A6UMFELygwBWC/A/Zel54i2OGUgghH4vsaKBCU2DzLz3rSm6
	Pskxsr/zNZb7KArCWo9068qFR+ZquWUV0DkvecDuRzRV/Z3uZDJGC8F7t413RtZ38Stj
	ajig==
Received: by 10.180.81.193 with SMTP id c1mr2295603wiy.12.1343741158936;
	Tue, 31 Jul 2012 06:25:58 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id h9sm22193597wiz.1.2012.07.31.06.25.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 06:25:58 -0700 (PDT)
Date: Tue, 31 Jul 2012 14:25:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120731132556.GA16269@stefanha-thinkpad.localdomain>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Avoid explicit list of
 directories in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 13:26:19 -0000

On Tue, Jul 31, 2012 at 02:01:35PM +0100, Peter Maydell wrote:
> Avoid having an explicit list of directories in the 'clean'
> target by using 'find' to remove all .o and .d files instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I figured that (unlike Makefile.target) we should probably take
> the xargs route here since otherwise the rm command line is huge...
> 
> There's also an argument that there's not much point having a clean
> target in Makefile.target when this one blows away most of it anyway.
> 
>  Makefile |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Looks fine but waiting for others to review in case there is a subtlety
that affects some build environments.

Stefan

