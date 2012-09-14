Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCQcD-0006Jl-Pv
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 03:47:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQc6-0005zl-O1
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQc5-0005bD-Tt
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:46:58 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:49310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TCQbx-0005aS-Dj; Fri, 14 Sep 2012 03:46:49 -0400
Received: by weyz53 with SMTP id z53so2153193wey.4
	for <multiple recipients>; Fri, 14 Sep 2012 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dD5rZPWrbC5/ozS4hbEgTxehnSMHRhcCIakV3YSnxUs=;
	b=ZRFGnK9x7/3aomwGDvrasCTS5l9JkTWXbS7d2pPDVZ8yghrwgN6o2SvVb8yYccYo79
	X3qAGWvy5whrY+WBI7vK+gCpcAxO38uyVG5BjVRrWGPKCmS/ifJCSAVAJRFTdDcOqzeV
	8m4tOchFNrON5bSwqHxAD4RiwnKkiucIaDURU9TxYpyR1WfyUbyYAWE1ognYwr1LBscX
	a/T0OVX1F534j9yhhlYhlH/tqXPuV01B9GaMW73ppsZtLDZA/NjfjklM3J8qyLLcWxUB
	+ojUGbyM1nN/P+J/vOa35O8rwvBKwYpHOByrk0evfeVlnKPB0RKroRRecI94gfbMRjGr
	Hm5g==
Received: by 10.180.100.35 with SMTP id ev3mr46150579wib.7.1347608808463;
	Fri, 14 Sep 2012 00:46:48 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id hv8sm1810494wib.0.2012.09.14.00.46.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 00:46:47 -0700 (PDT)
Date: Fri, 14 Sep 2012 08:46:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20120914074644.GB25596@stefanha-thinkpad.localdomain>
References: <1346964030-17633-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346964030-17633-1-git-send-email-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: fix seccomp check
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
X-List-Received-Date: Fri, 14 Sep 2012 07:47:04 -0000

On Thu, Sep 06, 2012 at 10:40:30PM +0200, Yann E. MORIN wrote:
> Currently, if libseccomp is missing but the user explicitly requested
> seccomp support using --enable-seccomp, configure silently ignores the
> situation and disables seccomp support.
> 
> This is unlike all other tests that explicitly fail in such situation.
> 
> Fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

