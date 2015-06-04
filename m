Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z1n7n-00085T-5w
	for mharc-qemu-trivial@gnu.org; Sun, 07 Jun 2015 22:49:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1Z1n7k-00080R-JT
	for qemu-trivial@nongnu.org; Sun, 07 Jun 2015 22:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>) id 1Z1n7j-0000qi-4J
	for qemu-trivial@nongnu.org; Sun, 07 Jun 2015 22:49:16 -0400
Received: from 212-4-128-36.cust.selfnet.cz ([212.4.128.36]:43955
	helo=workimage.brq.redhat.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrezanin@redhat.com>)
	id 1Z1n7d-0000pK-RA; Sun, 07 Jun 2015 22:49:09 -0400
Received: by workimage.brq.redhat.com (Postfix, from userid 1000)
	id A100440A8FF7; Thu,  4 Jun 2015 06:38:53 +0200 (CEST)
Date: Thu, 4 Jun 2015 06:38:53 +0200
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150604043853.GA2485@lws.brq.redhat.com>
References: <1433223995-26725-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433223995-26725-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.22.1 (2013-10-16)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 212.4.128.36
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] slirp: use less
 predictable directory name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Mon, 08 Jun 2015 02:49:17 -0000

On Tue, Jun 02, 2015 at 08:46:35AM +0300, Michael Tokarev wrote:
> In this version I used mkdtemp(3) which is:
> 
>         _BSD_SOURCE
>         || /* Since glibc 2.10: */
>             (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700)
> 
> (POSIX.1-2008), so should be available on systems we care about.
> 
> While at it, reset the resulting directory name within smb structure
> on error so cleanup function wont try to remove directory which we
> failed to create.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2:
> Add resetting of the dirname on failure so that cleanup function
> does not try to remove directory which we failed to create.
> 
> Use snprintf() as was in the original code, not strcpy(): while
> in this very case it does not matter at all since both strings
> are of known size, some people dislike strcpy() in principle.
> 
>  net/slirp.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index 0e15cf6..3533837 100644
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
> @@ -505,10 +504,10 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>          return -1;
>      }
>  
> -    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.%ld-%d",
> -             (long)getpid(), instance++);
> -    if (mkdir(s->smb_dir, 0700) < 0) {
> +    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.XXXXXX");
> +    if (!mkdtemp(s->smb_dir)) {
>          error_report("could not create samba server dir '%s'", s->smb_dir);
> +        s->smb_dir[0] = 0;
>          return -1;
>      }
>      snprintf(smb_conf, sizeof(smb_conf), "%s/%s", s->smb_dir, "smb.conf");
> -- 
> 2.1.4
> 
> 
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

