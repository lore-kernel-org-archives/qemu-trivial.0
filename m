Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2y3P-0005ME-0T
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jun 2015 04:41:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Z2y3L-0005Hb-Uy
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 04:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Z2y3L-0003CG-8T
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 04:41:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Z2y3E-00037Q-2z; Thu, 11 Jun 2015 04:41:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9F4FFBBB2C;
	Thu, 11 Jun 2015 08:41:27 +0000 (UTC)
Received: from localhost (dhcp-14-104.nay.redhat.com [10.66.14.104])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5B8fPPQ027729; Thu, 11 Jun 2015 04:41:26 -0400
Date: Thu, 11 Jun 2015 16:41:24 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20150611084124.GC22459@ad.nay.redhat.com>
References: <1432272908-8330-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432272908-8330-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] Makefile: Generate
 tag files under $SRC_PATH
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
X-List-Received-Date: Thu, 11 Jun 2015 08:41:36 -0000

On Fri, 05/22 13:35, Fam Zheng wrote:

Ping :)

Fam

> 
> 
> Fam Zheng (2):
>   Makefile: Fix "make cscope TAGS"
>   Makefile: Add "make ctags"
> 
>  Makefile | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> -- 
> 2.4.1
> 
> 

