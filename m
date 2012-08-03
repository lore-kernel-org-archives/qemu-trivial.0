Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxHNG-0003aR-Qc
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2012 08:53:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SxHNE-0003U2-Pk
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 08:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SxHN9-0006nz-6e
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 08:53:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1SxHMy-0006ma-5K; Fri, 03 Aug 2012 08:52:44 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q73CqgQe028698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 3 Aug 2012 08:52:42 -0400
Received: from doriath.home (ovpn-113-120.phx2.redhat.com [10.3.113.120])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q73CqeaB022980; Fri, 3 Aug 2012 08:52:40 -0400
Date: Fri, 3 Aug 2012 09:53:18 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Amos Kong <akong@redhat.com>
Message-ID: <20120803095318.44ae5920@doriath.home>
In-Reply-To: <1343963182-28297-2-git-send-email-akong@redhat.com>
References: <1343963182-28297-1-git-send-email-akong@redhat.com>
	<1343963182-28297-2-git-send-email-akong@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/2] remove unused
	include of error.h
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
X-List-Received-Date: Fri, 03 Aug 2012 12:53:01 -0000

On Fri,  3 Aug 2012 11:06:21 +0800
Amos Kong <akong@redhat.com> wrote:

> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  qemu_socket.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/qemu_socket.h b/qemu_socket.h
> index 4689ff3..1a2f517 100644
> --- a/qemu_socket.h
> +++ b/qemu_socket.h
> @@ -27,7 +27,6 @@ int inet_aton(const char *cp, struct in_addr *ia);
>  #endif /* !_WIN32 */
>  
>  #include "qemu-option.h"
> -#include "error.h"
>  #include "qerror.h"

This is wrong. There are functions in this header that takes an Error argument
(which is declared in error.h).

qerror.h should be dropped though, as it's deprecated and as such shouldn't
be in a public header like this. If you get build failures, then you can
include it in the .c files where it's missing.

>  
>  /* misc helpers */


