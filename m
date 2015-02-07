Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK1FO-0006L6-7j
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 04:00:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1FM-0006Ji-TJ
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:00:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1FL-0005GG-TJ
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:00:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YK1FH-0005Du-Nl; Sat, 07 Feb 2015 04:00:07 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B917141366;
	Sat,  7 Feb 2015 12:00:06 +0300 (MSK)
Message-ID: <54D5D416.6040704@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 12:00:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/7] Six coverity fixes and a cleanup
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
X-List-Received-Date: Sat, 07 Feb 2015 09:00:13 -0000

26.01.2015 14:12, Paolo Bonzini wrote:
> Patch 2 is the cleanup.  The other six patches make the tcg, utils and
> migration components clean.

Applied to -trivial patches 1,2,3,4 and 6, not applied 5 (due to
questionable errno checking addition) and 7, due to a discussion.

Thanks,

/mjt

> 
> Paolo Bonzini (7):
>   cpu-exec: drop dead assignment
>   cpu-exec: simplify icount code
>   uri: avoid NULL arguments to strcmp
>   qemu-sockets: improve error reporting in unix_listen_opts
>   cutils: refine strtol error handling in parse_debug_env
>   aes: remove a dead return statement
>   migration: do floating-point division
> 
>  cpu-exec.c            | 12 +++---------
>  migration/migration.c |  2 +-
>  util/aes.c            |  2 +-
>  util/cutils.c         |  4 ++--
>  util/qemu-sockets.c   | 24 ++++++++++++++++++------
>  util/uri.c            |  4 +++-
>  6 files changed, 28 insertions(+), 20 deletions(-)
> 


