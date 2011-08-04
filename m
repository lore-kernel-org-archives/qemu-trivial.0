Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QotzL-0003JV-VC
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2011 05:13:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QotzJ-0003JL-Ay
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 05:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QotzH-0008LQ-TT
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 05:13:09 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:33768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QotzH-0008IF-Kq; Thu, 04 Aug 2011 05:13:07 -0400
Received: by fxbb27 with SMTP id b27so2104702fxb.4
	for <multiple recipients>; Thu, 04 Aug 2011 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YUsP0m63PKuH2hs1/5o+oFMbOXIqtk5IZ+oq/rA4MHk=;
	b=mnz1oSv2q+hITwESeodR334Vb9FnS49iAlHgEjlokmkSxKai4t2ApdtuxcgghptE6Q
	RvFn6JeHRrHK6rERHjimCFYYY0OeSjIZcNM/5TNvKEhHnU2ErmfeW/dYTviMSzgdGYg2
	1egC60WAGdr0XL0Gdu3PvFEusGlW6Zi2Bgzy8=
Received: by 10.223.69.83 with SMTP id y19mr844212fai.108.1312449186057;
	Thu, 04 Aug 2011 02:13:06 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id o7sm135678fah.12.2011.08.04.02.13.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 02:13:04 -0700 (PDT)
Date: Thu, 4 Aug 2011 10:12:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
Message-ID: <20110804091257.GA29786@stefanha-thinkpad.localdomain>
References: <1312443635-21856-1-git-send-email-wuzhy@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1312443635-21856-1-git-send-email-wuzhy@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: aliguori@us.ibm.com, stefanha@linux.vnet.ibm.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, zwu.kernel@gmail.com, ryanh@us.ibm.com,
	luowenj@cn.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] scsi-bus: use DO_UPCAST.
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
X-List-Received-Date: Thu, 04 Aug 2011 09:13:10 -0000

On Thu, Aug 04, 2011 at 03:40:35PM +0800, Zhi Yong Wu wrote:
> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>  hw/scsi-bus.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

