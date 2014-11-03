Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlIQ9-0001HJ-8a
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 09:15:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlIQ2-0001AE-Hq
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:15:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlIPx-0001e0-8h
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:15:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlIPl-0001Zd-L7; Mon, 03 Nov 2014 09:15:25 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5F7E240583;
	Mon,  3 Nov 2014 17:15:24 +0300 (MSK)
Message-ID: <54578DFC.3070807@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 17:15:24 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Peter Wu <peter@lekensteyn.nl>, qemu-devel@nongnu.org
References: <1415011930-1964-1-git-send-email-peter@lekensteyn.nl>
In-Reply-To: <1415011930-1964-1-git-send-email-peter@lekensteyn.nl>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [PATCH] slirp/smbd: disable printer in smb config
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
X-List-Received-Date: Mon, 03 Nov 2014 14:15:47 -0000

03.11.2014 13:52, Peter Wu wrote:
> The file sharing module should not handle printers, so disable it.
> The options 'load printers' and 'printing' have been available since the
> beginning (May 1996, commit 0e8fd3398771da2f016d72830179507f3edda51b).
> Option 'disable spoolss' is available since Samba 2.0.4, commit
> de5f42c9d9172592779fa2504d44544e3b6b1c0d).
> 
> Next, "socket address" was reported as deprecated, use a combination of
> "interfaces" and "bind interfaces only" instead (available since October
> 1997, commit 79f4fb52c1ed56fd843f81b4eb0cdd2991d4d0f4).
> 
> Override cache directory to avoid writing to a global directory. Option
> available since Samba 3.4.0, Jan 2009, commit
> 19a05bf2f485023b11b41dfae3f6459847d55ef7.
> 
> Set "usershare max shared=0" to prevent a global directory from being
> used. Option available since Samba 3.0.23, February 2006, commit
> 5831715049f2d460ce42299963a5defdc160891b.
> 
> The most recently option was introduced with Samba 3.4.0, but previously
> "state directory" was already added which exists in Samba 3.4.0. As
> unknown parameters are ignored (while printing a warning), it should be
> safe to add another option.

I think this all makes very good sense.  Let's apply it to -trivial too,
for now anyway, -- if we'll ever decide to factor it out to a helper
script, that script will be more complete.

BTW, I'm not sure `socket address' paraameter is relevant in this context
at all, -- smbd should not use it in inetd mode.  It'd be interesting to
know why this option is here to start with, and whenever we really need
the new interfaces/bind-interfacs-only replacement.

I picked it up for -trivial, and also Cc'ing Jan.

Thank you!

/mjt

> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> ---
> Hi,
> 
> While trying to share a folder with a guest, I noticed that the option -net
> user,smb=... would time out in the guest due to an incompatibility with Samba 4
> (see also mailing list message "slirp-smb broken with Samba 4.1" from Jan Kiska
> and https://bugs.debian.org/747636). FYI, the bug is fixed in newer Samba
> (tested with samba-4.2.0rc1-388-ga3b333a).
> 
> While trying to fix that, I found that Samba would try to communicate with CUPS.
> This patch disables that fixes some other paths as well. Looking through the
> smb.conf manual for "{prefix}", it seems that no other directory is forgotten
> now.
> 
> As the inetd mode is broken, I work around by starting smbd with the generated
> config:
> 
>     smbd -s smb.conf -p 1337
> 
> Then I forward the ports to the guest with (newline inserted for readability):
> 
>     -user net,
>         guestfwd=tcp:0.0.0.0:139-cmd:'nc 127.0.0.1 1337',
>         guestfwd=tcp:0.0.0.0:445-cmd:'nc 127.0.0.1 1337'
> 
> This "works" but is certainly not optimal.
> 
> Kind regards,
> Peter
> ---
>  net/slirp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index c171119..bad427b 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -523,15 +523,21 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>      fprintf(f,
>              "[global]\n"
>              "private dir=%s\n"
> -            "socket address=127.0.0.1\n"
> +            "interfaces=127.0.0.1\n"
> +            "bind interfaces only=yes\n"
>              "pid directory=%s\n"
>              "lock directory=%s\n"
>              "state directory=%s\n"
> +            "cache directory=%s\n"
>              "ncalrpc dir=%s/ncalrpc\n"
>              "log file=%s/log.smbd\n"
>              "smb passwd file=%s/smbpasswd\n"
>              "security = user\n"
>              "map to guest = Bad User\n"
> +            "load printers = no\n"
> +            "printing = bsd\n"
> +            "disable spoolss = yes\n"
> +            "usershare max shares = 0\n"
>              "[qemu]\n"
>              "path=%s\n"
>              "read only=no\n"
> @@ -544,6 +550,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>              s->smb_dir,
>              s->smb_dir,
>              s->smb_dir,
> +            s->smb_dir,
>              exported_dir,
>              passwd->pw_name
>              );
> 


