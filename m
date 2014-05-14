Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkVMx-00068E-V0
	for mharc-qemu-trivial@gnu.org; Wed, 14 May 2014 05:20:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WkVMr-0005zQ-6o
	for qemu-trivial@nongnu.org; Wed, 14 May 2014 05:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WkVMm-0006mO-7p
	for qemu-trivial@nongnu.org; Wed, 14 May 2014 05:20:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WkVMb-0006lg-S0; Wed, 14 May 2014 05:20:38 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4E9KVkS012157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 14 May 2014 05:20:36 -0400
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4E9KEPP030453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 14 May 2014 05:20:15 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 95321200D2; Wed, 14 May 2014 11:20:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
References: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
Date: Wed, 14 May 2014 11:20:13 +0200
In-Reply-To: <1399374955-29082-1-git-send-email-dgilbert@redhat.com> (David
	Alan Gilbert's message of "Tue, 6 May 2014 12:15:55 +0100")
Message-ID: <87lhu4hg36.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, wdauchy@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix 'name' option to work
	with -readconfig
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
X-List-Received-Date: Wed, 14 May 2014 09:20:58 -0000

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The 'name' option silently failed when used in config files
> ( http://lists.gnu.org/archive/html/qemu-devel/2014-04/msg00378.html )
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reported-by: William Dauchy <wdauchy@gmail.com>
> ---
>  vl.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 8411a4a..47c199a 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -965,7 +965,7 @@ static int parse_sandbox(QemuOpts *opts, void *opaque)
>      return 0;
>  }
>  
> -static void parse_name(QemuOpts *opts)
> +static int parse_name(QemuOpts *opts, void *opaque)
>  {
>      const char *proc_name;
>  
> @@ -978,6 +978,8 @@ static void parse_name(QemuOpts *opts)
>      if (proc_name) {
>          os_set_proc_name(proc_name);
>      }
> +
> +    return 0;
>  }
>  
>  bool usb_enabled(bool default_usb)
> @@ -3780,7 +3782,6 @@ int main(int argc, char **argv, char **envp)
>                  if (!opts) {
>                      exit(1);
>                  }
> -                parse_name(opts);
>                  break;
>              case QEMU_OPTION_prom_env:
>                  if (nb_prom_envs >= MAX_PROM_ENVS) {
> @@ -3955,6 +3956,10 @@ int main(int argc, char **argv, char **envp)
>          exit(1);
>      }
>  
> +    if (qemu_opts_foreach(qemu_find_opts("name"), parse_name, NULL, 1)) {
> +        exit(1);
> +    }
> +

This will never exit, but that's okay.

>  #ifndef _WIN32
>      if (qemu_opts_foreach(qemu_find_opts("add-fd"), parse_add_fd, NULL, 1)) {
>          exit(1);

-readconfig stores the configuration read in QemuOpts.  Command line
option parsing should do the same, and no more.  In particular it should
not act upon the option.  That needs to be done separately, where both
command line and -readconfig settings are visible in QemuOpts.

Your patch does exactly that.  I think amending the commit message with
the previous paragraph would improve it.

Have you checked command line option parsing (the big switch) for
similar problems?

Reviewed-by: Markus Armbruster <armbru@redhat.com>

