Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmO2t-0006wi-Gg
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 12:09:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cmO2s-0006vs-3R
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 12:09:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cmO2r-0001ER-BY
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 12:09:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cmO2m-0001BJ-8E; Fri, 10 Mar 2017 12:09:32 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E54E3A76A8;
	Fri, 10 Mar 2017 17:09:32 +0000 (UTC)
Received: from [10.36.116.39] (ovpn-116-39.ams2.redhat.com [10.36.116.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2AH9QJu007014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Mar 2017 12:09:29 -0500
To: Suramya Shah <shah.suramya@gmail.com>, qemu-devel@nongnu.org
References: <20170310163948.7567-1-shah.suramya@gmail.com>
Cc: armbru@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2b156f0e-4700-c268-d60d-6b23b24d69b0@redhat.com>
Date: Fri, 10 Mar 2017 18:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170310163948.7567-1-shah.suramya@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 10 Mar 2017 17:09:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] util: Removed unneeded
 header from path.c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Mar 2017 17:09:39 -0000

On 10.03.2017 17:39, Suramya Shah wrote:
> Signed-off-by: Suramya Shah <shah.suramya@gmail.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> --- 
> qemu-common.h is no longer necessary as of refactoring done in commit f348b6d.
>  util/path.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/util/path.c b/util/path.c
> index 5479f76..7f9fc27 100644
> --- a/util/path.c
> +++ b/util/path.c
> @@ -6,7 +6,6 @@
>  #include "qemu/osdep.h"
>  #include <sys/param.h>
>  #include <dirent.h>
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/path.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>

(and putting qemu-trivial on CC: for this)


