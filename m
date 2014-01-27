Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W7mpm-0004Yx-32
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jan 2014 09:06:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1W7mpf-0004Qe-Au
	for qemu-trivial@nongnu.org; Mon, 27 Jan 2014 09:06:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1W7mpZ-0001gV-Fa
	for qemu-trivial@nongnu.org; Mon, 27 Jan 2014 09:06:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1W7mpZ-0001fv-7u; Mon, 27 Jan 2014 09:06:29 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0RE6JYu027062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 27 Jan 2014 09:06:19 -0500
Received: from localhost (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0RE6Gxh011792; Mon, 27 Jan 2014 09:06:17 -0500
Date: Mon, 27 Jan 2014 13:20:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140127122036.GD11887@stefanha-thinkpad.redhat.com>
References: <1390670304-381-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390670304-381-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] readline: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Mon, 27 Jan 2014 14:06:40 -0000

On Sat, Jan 25, 2014 at 06:18:23PM +0100, Stefan Weil wrote:
> This fixes a compiler warning with -Werror=missing-format-attribute
> and allows improved compiler checks for variable argument lists.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  include/qemu/readline.h |    3 ++-
>  monitor.c               |    3 ++-
>  qemu-io.c               |    3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

