Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3sT9-00030I-UG
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 13:14:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3sT7-0002xE-IQ
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:14:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3sLt-0003RV-UN
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:07:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U3sG1-0001yz-A0; Fri, 08 Feb 2013 13:01:05 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18I115C005706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 13:01:01 -0500
Received: from localhost (ovpn-113-129.phx2.redhat.com [10.3.113.129])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18I0xF1018738; Fri, 8 Feb 2013 13:01:00 -0500
Date: Fri, 8 Feb 2013 16:00:58 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130208160058.1988648f@redhat.com>
In-Reply-To: <1360340232-4670-7-git-send-email-armbru@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-7-git-send-email-armbru@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 6/6] vl: Exit unsuccessfully
 on option argument syntax error
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
X-List-Received-Date: Fri, 08 Feb 2013 18:14:39 -0000

On Fri,  8 Feb 2013 17:17:12 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> We exit successfully after reporting syntax error for argument of
> --sandbox and --add-fd.
> 
> We continue undaunted after reporting it for argument of --option-rom
> and --object then.
> 
> Change all four to exit unsuccessfully, like the other options.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

What about qemu_opts_parse() call in QEMU_OPTION_boot?

> ---
>  vl.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 73122d8..4245ccc 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3623,6 +3623,9 @@ int main(int argc, char **argv, char **envp)
>  		    exit(1);
>  		}
>                  opts = qemu_opts_parse(qemu_find_opts("option-rom"), optarg, 1);
> +                if (!opts) {
> +                    exit(1);
> +                }
>                  option_rom[nb_option_roms].name = qemu_opt_get(opts, "romfile");
>                  option_rom[nb_option_roms].bootindex =
>                      qemu_opt_get_number(opts, "bootindex", -1);
> @@ -3780,14 +3783,14 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_sandbox:
>                  opts = qemu_opts_parse(qemu_find_opts("sandbox"), optarg, 1);
>                  if (!opts) {
> -                    exit(0);
> +                    exit(1);
>                  }
>                  break;
>              case QEMU_OPTION_add_fd:
>  #ifndef _WIN32
>                  opts = qemu_opts_parse(qemu_find_opts("add-fd"), optarg, 0);
>                  if (!opts) {
> -                    exit(0);
> +                    exit(1);
>                  }
>  #else
>                  error_report("File descriptor passing is disabled on this "
> @@ -3797,6 +3800,9 @@ int main(int argc, char **argv, char **envp)
>                  break;
>              case QEMU_OPTION_object:
>                  opts = qemu_opts_parse(qemu_find_opts("object"), optarg, 1);
> +                if (!opts) {
> +                    exit(1);
> +                }
>                  break;
>              default:
>                  os_parse_cmd_args(popt->index, optarg);


