Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaKyK-0001Pt-Pz
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 03:09:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UaKyI-0001N7-JL
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:08:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UaKyH-0008RU-9f
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:08:58 -0400
Received: from [222.73.24.84] (port=17249 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UaKyE-0008N0-B9; Thu, 09 May 2013 03:08:54 -0400
X-IronPort-AV: E=Sophos;i="4.87,640,1363104000"; 
   d="scan'208";a="7223717"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 09 May 2013 15:05:56 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4978hSQ004114;
	Thu, 9 May 2013 15:08:43 +0800
Received: from localhost ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013050915074638-1111117 ;
	Thu, 9 May 2013 15:07:46 +0800 
Date: Thu, 9 May 2013 15:08:13 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130509070813.GA30653@arch.fnst.cn.fujitsu.com>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
	<518A4A2E.200@msgid.tls.msk.ru> <87vc6t61te.fsf@codemonkey.ws>
	<518B40CD.7030604@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <518B40CD.7030604@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/09 15:07:46,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/09 15:07:47,
	Serialize complete at 2013/05/09 15:07:47
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, Trival <trivial@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] remove needless
	semicolon
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
X-List-Received-Date: Thu, 09 May 2013 07:08:59 -0000

On Thu, May 09, 2013 at 10:23:09AM +0400, Michael Tokarev wrote:
> 08.05.2013 17:25, Anthony Liguori wrote:
> > Michael Tokarev <mjt@tls.msk.ru> writes:
> > 
> >> 08.05.2013 13:46, Trival wrote:
> >>> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>

I think wdongxu probably wants HIS name and email go here. wdongxu, can
you resend your patches with:

  Signed-off-by: <your real name> <wdongxu@linux.vnet.ibm.com>

?

> > 
> > Something went wrong in sending this.  This is not a valid SoB.
> 
> So, do we not accept it?  Should I revert it in the
> trivial-patches-next ?
> 
> Thanks,
> 
> /mjt

