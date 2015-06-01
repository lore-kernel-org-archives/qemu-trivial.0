Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzPGG-0000WV-T9
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 08:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1YzOWW-00007Y-JP
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 08:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1YzOWP-0002Vz-PF
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 08:08:56 -0400
Received: from 212-4-128-36.cust.selfnet.cz ([212.4.128.36]:51146
	helo=workimage.brq.redhat.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1YzOWP-0002VZ-Gn
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 08:08:49 -0400
Received: by workimage.brq.redhat.com (Postfix, from userid 1000)
	id EB79B409F2E1; Mon,  1 Jun 2015 13:28:56 +0200 (CEST)
Date: Mon, 1 Jun 2015 13:28:56 +0200
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150601112856.GA22121@lws.brq.redhat.com>
References: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.22.1 (2013-10-16)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 212.4.128.36
X-Mailman-Approved-At: Mon, 01 Jun 2015 08:56:11 -0400
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: use less predictable
 directory name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Mon, 01 Jun 2015 12:08:57 -0000

On Thu, May 28, 2015 at 02:15:43PM +0300, Michael Tokarev wrote:
> In this version I used mkdtemp(3) which is:
> 
>         _BSD_SOURCE
>         || /* Since glibc 2.10: */
>             (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)
> 
> so should be available on systems we care about.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  net/slirp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index 9bbed74..0ad32ad 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -481,7 +481,6 @@ static void slirp_smb_cleanup(SlirpState *s)
>  static int slirp_smb(SlirpState* s, const char *exported_dir,
>                       struct in_addr vserver_addr)
>  {
> -    static int instance;
>      char smb_conf[128];
>      char smb_cmdline[128];
>      struct passwd *passwd;
> @@ -505,9 +504,8 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>          return -1;
>      }
>  
> -    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.%ld-%d",
> -             (long)getpid(), instance++);
> -    if (mkdir(s->smb_dir, 0700) < 0) {
> +    strcpy(s->smb_dir, "/tmp/qemu-smb.XXXXXX");
> +    if (!mkdtemp(s->smb_dir)) {
>          error_report("could not create samba server dir '%s'", s->smb_dir);
>          return -1;
>      }
> -- 
> 2.1.4
> 
> 

I suggest to go with this patch as:

1) It was sent first

2) Is simplier

3) Keep original behavior

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

