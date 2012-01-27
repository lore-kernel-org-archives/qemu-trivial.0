Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqlgb-00042P-9A
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 08:17:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RqlgY-0003p4-6N
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RqlgU-0002G4-Am
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:17:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:18972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RqlgO-0002FU-JL; Fri, 27 Jan 2012 08:17:36 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0RDHZF9020131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jan 2012 08:17:35 -0500
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q0RDHYrb024743; Fri, 27 Jan 2012 08:17:35 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id D7DE76006E; Fri, 27 Jan 2012 14:17:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <1327613801-5828-1-git-send-email-lersek@redhat.com>
Date: Fri, 27 Jan 2012 14:17:33 +0100
In-Reply-To: <1327613801-5828-1-git-send-email-lersek@redhat.com> (Laszlo
	Ersek's message of "Thu, 26 Jan 2012 22:36:41 +0100")
Message-ID: <m31uqluvwy.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] keep the PID file locked
	for the lifetime of the process
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
X-List-Received-Date: Fri, 27 Jan 2012 13:17:47 -0000

Laszlo Ersek <lersek@redhat.com> writes:

> The lockf() call in qemu_create_pidfile() aims at ensuring mutual
> exclusion. We shouldn't close the pidfile on success, because that drops
> the lock as well [1]:
>
>     "File locks shall be released on first close by the locking process
>     of any file descriptor for the file."
>
> Coverity may complain again about the leaked file descriptor; let's
> worry about that later.
>
> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html

Broken in commit 1bbd1592 by yours truly %-}  Suitable pointer could be
added to the commit message.

> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
> Please keep me CC'd, I'm not subscribed. Thanks!
>
>  os-posix.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/os-posix.c b/os-posix.c
> index 5c437ca..f4940c8 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -348,6 +348,5 @@ int qemu_create_pidfile(const char *filename)
>          return -1;
>      }
>  
> -    close(fd);
>      return 0;
>  }

We intentionally leak fd here.  A comment would be nice.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

