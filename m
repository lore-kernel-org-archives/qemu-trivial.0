Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHasR-0004MM-Lj
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 09:12:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHasM-0004Ly-4I
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHasJ-0003XB-VW
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:12:49 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:37352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHasJ-0003WT-N6
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:12:47 -0400
Received: by wgbds1 with SMTP id ds1so3059910wgb.4
	for <qemu-trivial@nongnu.org>; Tue, 10 Apr 2012 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yt7okQ20pLP7sOhm/IeEa3H41VF7gyXEL4ZvXIIXutk=;
	b=rEipoLxx+tIy2HQb8C5vJK0uLN/YqEf1w6aFnkWes595Kd1CvPRIMopVqCzoblcoGl
	/gdGbEQBzxK/R2FbD4fKrpwcE97fIEef7CxwAggX+WGJ9kI6OtwhgJiUvQKo/xuyHW0u
	J50P/3GupfeDfdKAWDb85MEsAqj2zA6qcJVNFS30KCD6Yuc0UMnth8XvB/tXqq339qjq
	qqCI7mTkfblWaqKoBGdI5XyNxSIzCiqlSLrUfBVkMu2iImW9gEDNIC8gvK7hKE0OaXCb
	RWRuraxEljR4TEwa2uyAJINEsGmr06jTO8HhAF14N2yNzFTN6i5jY7GrQPqbKVOD7iSz
	WQgg==
Received: by 10.180.80.70 with SMTP id p6mr6844300wix.21.1334063565806;
	Tue, 10 Apr 2012 06:12:45 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 6sm37622613wiz.1.2012.04.10.06.12.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 06:12:45 -0700 (PDT)
Date: Tue, 10 Apr 2012 14:12:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Wanpeng Li <liwp@linux.vnet.ibm.com>
Message-ID: <20120410131240.GD9094@stefanha-thinkpad.localdomain>
References: <1333938436-20345-1-git-send-email-liwp@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333938436-20345-1-git-send-email-liwp@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] avoid repeating contain header file
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
X-List-Received-Date: Tue, 10 Apr 2012 13:12:54 -0000

On Mon, Apr 09, 2012 at 10:27:16AM +0800, Wanpeng Li wrote:
> Signed-off-by: Wanpeng Li <liwp@linux.vnet.ibm.com>
> ---
>  hw/ps2.h |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)

Please use version numbers on your patches so it's easy to identify the
latest version and understand the changes between versions.  [PATCH v2]
would be good.

Also please CC qemu-devel@nongnu.org.  All QEMU patches must go to
qemu-devel@nongnu.org, CCing qemu-trivial will bring them to my
attention but they still need to be on the main mailing list.

Stefan

