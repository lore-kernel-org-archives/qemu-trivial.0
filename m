Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQCvj-00067Q-KV
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 05:36:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WQCvb-0005rf-Ej
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 05:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WQCvV-0007wX-MX
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 05:36:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1WQCvF-0007rT-NQ; Wed, 19 Mar 2014 05:36:29 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2J9aSAC025038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Mar 2014 05:36:28 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s2J9aQoR003463; Wed, 19 Mar 2014 05:36:27 -0400
Date: Wed, 19 Mar 2014 10:36:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20140319093626.GC3263@noname.str.redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts: add sample model
 file for Coverity Scan
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
X-List-Received-Date: Wed, 19 Mar 2014 09:36:57 -0000

Am 18.03.2014 um 18:03 hat Paolo Bonzini geschrieben:
> This is the model file that is being used for the QEMU project's scans
> on scan.coverity.com.  It fixed about 30 false positives (10% of the
> total) and exposed about 60 new memory leaks.
> 
> The file is not automatically used; changes to it must be propagated
> to the website manually by an admin (right now Markus, Peter and me
> are admins).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-model.c | 170 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 scripts/coverity-model.c
> 
> diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
> new file mode 100644
> index 0000000..1cc0c1b
> --- /dev/null
> +++ b/scripts/coverity-model.c
> @@ -0,0 +1,170 @@
> +/* Coverity Scan model
> + *
> + * Copyright (C) 2014 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>
> + *  Paolo Bonzini <pbonzini@redhat.com>
> + *
> + * This is a modeling file for Coverity Scan. Modeling helps to avoid false
> + * positives.
> + *
> + * - A model file can't import any header files.  Some built-in primitives are
> + *   available but not wchar_t, NULL etc.
> + * - Modeling doesn't need full structs and typedefs. Rudimentary structs
> + *   and similar types are sufficient.
> + * - An uninitialized local variable signifies that the variable could be
> + *   any value.
> + *
> + * The model file must be uploaded by an admin in the analysis settings of
> + * http://scan.coverity.com/projects/378
> + */

Only copyright notice, but no license?

Kevin

