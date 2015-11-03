Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtaM7-0007vh-Mf
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:06:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaLz-0007gq-Tb
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaLw-00042g-Ny
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:06:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZtaLm-00041l-LV; Tue, 03 Nov 2015 07:06:06 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CDBFF407DB;
	Tue,  3 Nov 2015 15:06:05 +0300 (MSK)
Message-ID: <5638A32D.90907@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:06:05 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
	<1446134122-32292-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1446134122-32292-2-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 1/4] ui: Use g_new() & friends where
 that makes obvious sense
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
X-List-Received-Date: Tue, 03 Nov 2015 12:06:25 -0000

29.10.2015 18:55, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  ui/console.c      | 2 +-
>  ui/curses.c       | 2 +-
>  ui/input-legacy.c | 4 ++--
>  ui/keymaps.c      | 2 +-
>  ui/sdl.c          | 2 +-
>  ui/vnc-jobs.c     | 6 +++---
>  ui/vnc.c          | 6 +++---
>  7 files changed, 12 insertions(+), 12 deletions(-)

ui/vnc.c code has been modified by Eric Blake meanwhile,
in 2d32addae70987521578d8bb27c6b3f52cdcbdcb "sockets:
Convert to new qapi union layout".

The patch applies for other files however.

Thanks,

/mjt

