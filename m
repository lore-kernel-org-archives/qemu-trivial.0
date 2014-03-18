Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPqTG-0008Gy-6T
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 05:38:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WPqT8-00085B-Bx
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:38:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WPqT2-0006xb-Dg
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:37:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WPqSp-0006vR-6T; Tue, 18 Mar 2014 05:37:39 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2I9balH012897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Mar 2014 05:37:37 -0400
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2I9bY1B010574; Tue, 18 Mar 2014 05:37:36 -0400
Date: Tue, 18 Mar 2014 10:37:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Maria Kustova <maxa@catit.be>
Message-ID: <20140318093733.GE25460@stefanha-thinkpad.redhat.com>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395122359-28890-1-git-send-email-maria.k@catit.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Maria Kustova <maria.k@catit.be>
Subject: Re: [Qemu-trivial] [PATCH v2 0/3] Trivial patches
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
X-List-Received-Date: Tue, 18 Mar 2014 09:38:04 -0000

On Tue, Mar 18, 2014 at 09:59:16AM +0400, Maria Kustova wrote:
> These patches are the part of OPW application.
> Two of them update help messages of qemu-io utility.
> And last one replaces fprintf() with error_setg() in curl.c
> 
> Changes v1 -> v2:
>  * Removed trailing "\n" from the error string in error_setg() call
> 
> Maria Kustova (3):
>   qemu-io-cmds: Fixed typo in example for writev.
>   block: Replaced old error handling with error reporting API.
>   qemu-io: Extended "--cmd" description in usage text
> 
>  block/curl.c   | 2 +-
>  qemu-io-cmds.c | 2 +-
>  qemu-io.c      | 9 ++++++---
>  3 files changed, 8 insertions(+), 5 deletions(-)

Thanks!

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

