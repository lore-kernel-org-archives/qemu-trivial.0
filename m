Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyhXu-0000IO-V4
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 10:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhXs-0000Fm-G0
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 10:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhXr-00052C-LC
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 10:15:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YyhXm-0004xD-C8; Sat, 30 May 2015 10:15:22 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6478D42A03;
	Sat, 30 May 2015 17:15:21 +0300 (MSK)
Message-ID: <5569C5F9.3080608@msgid.tls.msk.ru>
Date: Sat, 30 May 2015 17:15:21 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, 
	qemu-devel@nongnu.org
References: <1432925572-487-1-git-send-email-dgilbert@redhat.com>
In-Reply-To: <1432925572-487-1-git-send-email-dgilbert@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, quintela@redhat.com--dry-run
Subject: Re: [Qemu-trivial] [PATCH 1/1] Add -incoming help text
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
X-List-Received-Date: Sat, 30 May 2015 14:15:29 -0000

29.05.2015 21:52, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The help/man text for
> 
> -incoming defer
> 
> didn't make it through the merge of the code that implemented it.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  qemu-options.hx | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dad49cf..3085412 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3238,7 +3238,9 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
>      "-incoming fd:fd\n" \
>      "-incoming exec:cmdline\n" \
>      "                accept incoming migration on given file descriptor\n" \
> -    "                or from given external command\n",
> +    "                or from given external command\n" \
> +    "-incoming defer\n" \
> +    "                wait for the URI to be specified via migrate_incoming\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -incoming tcp:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
> @@ -3254,6 +3256,8 @@ Accept incoming migration from a given filedescriptor.
>  
>  @item -incoming exec:@var{cmdline}
>  Accept incoming migration as an output from specified external command.
> +@item -incoming defer
> +Wait for the URI to be specified via migrate_incoming.

I wonder what's the reason of mentioning it twice with
such a short and _identical_ text each time...  Maybe
it's a good idea to reword the second message a bit.
Because actually it is not clear what does the whole
thing mean, what qemu will do when starting? Will it
accept other commands?

Thanks,

/mjt

