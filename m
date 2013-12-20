Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VtvaH-0006L3-Ty
	for mharc-qemu-trivial@gnu.org; Fri, 20 Dec 2013 03:37:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VtvaA-00069r-6K
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 03:37:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vtva4-0004up-6i
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 03:37:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VtvZr-0004mC-Vh; Fri, 20 Dec 2013 03:37:00 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 65EFA42AD4;
	Fri, 20 Dec 2013 12:36:49 +0400 (MSK)
Message-ID: <52B401A0.2010403@msgid.tls.msk.ru>
Date: Fri, 20 Dec 2013 12:36:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1387523131-15647-1-git-send-email-famz@redhat.com>
In-Reply-To: <1387523131-15647-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] acpi unit-test: Create temporary disk
	file under /tmp
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
X-List-Received-Date: Fri, 20 Dec 2013 08:37:24 -0000

20.12.2013 11:05, Fam Zheng wrote:
> As other tests, the image file is created in /tmp other than current
> dir. Thus there will not be an unignored file under tests for intree
> build.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  tests/acpi-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acpi-test.c b/tests/acpi-test.c
> index ca83b1d6..e4f31b7 100644
> --- a/tests/acpi-test.c
> +++ b/tests/acpi-test.c
> @@ -116,7 +116,7 @@ static uint8_t boot_sector[0x200] = {
>      [0x1FF] = 0xAA,
>  };
>  
> -static const char *disk = "tests/acpi-test-disk.raw";
> +static const char *disk = "/tmp/qtest-acpi-test-disk.raw";

Please, PLEASE do NOT do this.

If you want a temp dir, create one in qemu source directory
(there's no urge to be able to specify one at build/run time,
a symlink created by user will do), -- so that all this junk
will be in a single dir easy to remove.

But never, ever, use /tmp like this, not here not elsewhere
else.  When you use /tmp, first, there's $TEMPDIR, and second,
much more important, there are apis like mkstemp(3) or
tmpfile(3), or tempnam(3), -- THIS is the only proper way to
use common temporary directories.

Never, ever, create fixed (or even predictable, with getpid()
for example) files in public temporary dirs.  Never.

For this issue, I think a better solution is to actually remove
this file on make clean.  Now you're just moving an unignored
file elsewhere, which isn't good by its own.

Thanks,

/mjt

