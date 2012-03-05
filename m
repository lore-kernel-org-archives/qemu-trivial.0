Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4Xbd-000731-Ts
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:05:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4XbW-00071E-Ll
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:05:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4XbM-0005go-4w
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:05:30 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:47490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4XbL-0005gD-SK; Mon, 05 Mar 2012 08:05:20 -0500
Received: by werp12 with SMTP id p12so2943602wer.4
	for <multiple recipients>; Mon, 05 Mar 2012 05:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KRNBqUzRoHsk0XfJf1vdTyE9Ck978GNUf4WB9ukX2z4=;
	b=vIrlMW0vPEglp0E3kLPQXqsIdJ8TX0fehAz7Udrp1Sc6VcyP45yoRzHG42p8MbEYw1
	OqQKSbvgAIa00sC5vuineTYSuTvFgTHxMFaYUAuTP498WeAXq9X8Te6J7FVzok16gWjz
	NcAZ9GlaKX9+6gLPEEJlU8Ctpo7H8WBcZAQQk5S3q97f+L7w4lC3kNwxJ9lPdAKjSHP9
	CmKd1jxx0Jk7x+ajsGS1Yr2zksFWW7/kiGLElkF82MbE+BCL771jnmYlnzEFGwVYJAbz
	PbfDKArm4ctxllfIf5XYSd7eT2v/7PQDwEXav7OVhO9KgKbyvFIclJbinaTMtrCEvc84
	almg==
Received: by 10.180.87.8 with SMTP id t8mr11995460wiz.15.1330952717098;
	Mon, 05 Mar 2012 05:05:17 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id k6sm20792297wiy.7.2012.03.05.05.05.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:05:16 -0800 (PST)
Date: Mon, 5 Mar 2012 13:05:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305130514.GA28506@stefanha-thinkpad.localdomain>
References: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] Trivial MemoryRegionOps patches
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
X-List-Received-Date: Mon, 05 Mar 2012 13:05:36 -0000

On Sat, Feb 25, 2012 at 01:37:11PM +0100, Stefan Weil wrote:
> Please apply http://patchwork.ozlabs.org/patch/139660/ to the qemu-trivial
> patch queue. Here are two additional trivial patches which also touch
> MemoryRegionOps and make the code more uniform.
> 
> [PATCH 1/2] ppc: Add missing 'static' to spin_rw_ops
> [PATCH 2/2] sh7750: Remove redundant 'struct' from MemoryRegionOps

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

