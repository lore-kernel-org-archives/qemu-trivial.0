Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhGii-0006O8-7E
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 07:06:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhGia-0006Av-9o
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhGiU-0002jH-3E
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:05:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WhGiH-0002Mo-2K; Mon, 05 May 2014 07:05:37 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s45B5Zwi006570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 5 May 2014 07:05:35 -0400
Received: from localhost (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s45B5XF6017338; Mon, 5 May 2014 07:05:34 -0400
Date: Mon, 5 May 2014 19:05:45 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20140505110545.GB4370@T430.nay.redhat.com>
References: <1399287591-6525-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399287591-6525-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] docs/memory.txt:
 Fixes on whitespace and MMIO operations
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
X-List-Received-Date: Mon, 05 May 2014 11:06:02 -0000

On Mon, 05/05 18:59, Fam Zheng wrote:
> 
> 
> Fam Zheng (2):
>   docs/memory.txt: Put one whitespace between sentences
>   docs/memory.txt: Fix document on MMIO operations

Michael, this is based on Peter's

[PATCH] docs/memory.txt: old_portio has gone, so don't mention it

So you could apply on top.

Thanks,
Fam

