Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzKfm-0003PH-50
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 04:02:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YzKfe-0003Ek-Oi
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 04:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YzKfd-00037Q-E3
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 04:02:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YzKfX-00036o-51; Mon, 01 Jun 2015 04:01:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D44153674CE;
	Mon,  1 Jun 2015 08:01:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5181tOr005665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Jun 2015 04:01:57 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 48FDF30408A8; Mon,  1 Jun 2015 10:01:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Mon, 01 Jun 2015 10:01:55 +0200
In-Reply-To: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Thu, 28 May 2015 14:15:43 +0300")
Message-ID: <87bngzluvg.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: pmatouse@redhat.com, P J P <pjp@fedoraproject.org>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Miroslav Rezanina <mrezanin@redhat.com>
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
X-List-Received-Date: Mon, 01 Jun 2015 08:02:12 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

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

Uh, I have to suspend my R-by.  This clobbers s->smb_dir[] when
mkdtemp() fails.  Is that safe?  Explain why, and get my R-by back.

The alternative "[PATCH] net: fix insecure temporary file creation in
SLiRP" doesn't clobber it.
http://lists.nongnu.org/archive/html/qemu-devel/2015-06/msg00005.html

