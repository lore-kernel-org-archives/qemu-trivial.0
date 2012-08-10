Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzpNS-00073p-PM
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 09:35:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzpNO-00073A-JD
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 09:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzpNL-0001wz-U0
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 09:35:42 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:47253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SzpNL-0001wn-O5; Fri, 10 Aug 2012 09:35:39 -0400
Received: by wgbfm10 with SMTP id fm10so1081690wgb.10
	for <multiple recipients>; Fri, 10 Aug 2012 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QQj2JQ7mAbxcmSliZFp1BqybiIiswPYzi6BaObnYrEA=;
	b=uqF/tIvZ2laKZL7mSSiY5gUpxC0Q9MXnsbWbooZuqzdXW3B7kXlpV6o8kOv6Ng+3/T
	IP/RFeB03dmf+jrdiizR6mkRdlnokx3rSBNFDm6LFNGZaSnyBg+jS/32Y230tMafUwX4
	P3KfHlyi1Ekodaw1gjkmzghhWLCYjQQY3490hNjj0Bf9LyXE38nsuvur34qg+DH3f4Qy
	GIcR6gs5lufhrl6ZLwu7GL3EUn5c/7fyzvinjY91DlZtzRKIdeoKbxt+QP8TT4uH7wAA
	Lq3kCmTUO5yLdisS2T3oZ9xw76sEwMIe8ju4jFSbUWQph30gRA6d9S/TDlyUK4DdsEF3
	DfEg==
Received: by 10.216.30.136 with SMTP id k8mr1689753wea.103.1344605738136;
	Fri, 10 Aug 2012 06:35:38 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id eu4sm7799835wib.2.2012.08.10.06.35.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:35:37 -0700 (PDT)
Date: Fri, 10 Aug 2012 14:35:35 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Message-ID: <20120810133535.GA14122@stefanha-thinkpad.localdomain>
References: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] arm: translate: comment typo -
 s/middel/middle/
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
X-List-Received-Date: Fri, 10 Aug 2012 13:35:45 -0000

On Mon, Aug 06, 2012 at 05:05:56PM +1000, Peter A. G. Crosthwaite wrote:
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> ---
>  target-arm/translate.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Also congrats on getting two Reviewed-bys.  That's a rate of 1
Reviewed-by per changed character and the most thorough review a QEMU
patch has ever had! :)

Stefan

