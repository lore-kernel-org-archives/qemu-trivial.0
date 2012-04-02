Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SEgsF-0005no-Hl
	for mharc-qemu-trivial@gnu.org; Mon, 02 Apr 2012 09:00:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgs9-0005VP-C1
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgs3-0001Bv-9N
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:00:36 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:38451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SEgrs-00018J-7n; Mon, 02 Apr 2012 09:00:20 -0400
Received: by wibhn6 with SMTP id hn6so2296501wib.10
	for <multiple recipients>; Mon, 02 Apr 2012 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A415qtmYma8WeYsAPw9UojJIajOi+h6S/Vta3zaGU/4=;
	b=Sn1P/r/OwFQaYS8EclAj06S1TqwGUp+Y0gkGTr7xMgfPsgF59IZfu3bxUX31PRW2//
	n0RBcE4npniJAeuwAWEioS1IWy8TpAODQbBPux6/0jAxFFC/+K7fOKTDnlAGVbKaR1+d
	KhPmYcEkgN4BwsNLa2iGNMAeK2EcTnDB2SToWoEyAeFwS7v/FukG0k3pIOKtlfvXc0dG
	qVmX91DdoTg7b7XUE42sINSDSgkkxFY33ELS/ROIdi9gYTvaZXwxSTL07twurkPji53W
	lmRn4AD+xF5hHOyrbsOILLe0P5oSDCOOPsq1QZmN5Bvbr9vAiozdtY2GCig8ddhTMXYF
	04/g==
Received: by 10.180.94.33 with SMTP id cz1mr24859063wib.13.1333371617367;
	Mon, 02 Apr 2012 06:00:17 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	gg2sm54991061wib.7.2012.04.02.06.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 06:00:16 -0700 (PDT)
Date: Mon, 2 Apr 2012 14:00:15 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120402130014.GA11583@stefanha-thinkpad.localdomain>
References: <1333206691-8459-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333206691-8459-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest: Add missing
	GCC_FMT_ATTR
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
X-List-Received-Date: Mon, 02 Apr 2012 13:00:42 -0000

On Sat, Mar 31, 2012 at 05:11:31PM +0200, Stefan Weil wrote:
> gcc reports an error when the code is compiled with -Wmissing-format-attribute.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qtest.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

