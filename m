Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwmnY-000291-FC
	for mharc-qemu-trivial@gnu.org; Fri, 05 Dec 2014 01:55:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XwmnQ-0001y8-BR
	for qemu-trivial@nongnu.org; Fri, 05 Dec 2014 01:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XwmnK-0002x6-7N
	for qemu-trivial@nongnu.org; Fri, 05 Dec 2014 01:55:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Xwmn3-0002ZM-6I; Fri, 05 Dec 2014 01:54:57 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB56suRB010263
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 5 Dec 2014 01:54:56 -0500
Received: from localhost (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB56ssJg002453; Fri, 5 Dec 2014 01:54:55 -0500
Date: Fri, 5 Dec 2014 14:54:53 +0800
From: Fam Zheng <famz@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20141205065453.GB10827@ad.nay.redhat.com>
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417701603-26388-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] util: Trivial cleanups
	around g_malloc()
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
X-List-Received-Date: Fri, 05 Dec 2014 06:55:26 -0000

On Thu, 12/04 15:00, Markus Armbruster wrote:
> Markus Armbruster (3):
>   util: Drop superfluous conditionals around g_free()
>   Fuse g_malloc(); memset() into g_new0()
>   util: Use g_new() & friends where that makes obvious sense
> 
>  util/hbitmap.c |  4 ++--
>  util/iov.c     |  4 ++--
>  util/uri.c     | 51 +++++++++++++++++++++++----------------------------
>  3 files changed, 27 insertions(+), 32 deletions(-)
> 
> -- 
> 1.9.3
> 
> 
Reviewed-by: Fam Zheng <famz@redhat.com>

