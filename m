Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3s8s-0001iG-VD
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 12:53:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3s8o-0001VS-LY
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 12:53:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3s8l-0008Qm-Ro
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 12:53:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:14914)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U3s8f-0008Ox-0W; Fri, 08 Feb 2013 12:53:29 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18HrQ9u015581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 12:53:27 -0500
Received: from localhost (ovpn-113-129.phx2.redhat.com [10.3.113.129])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r18HrP9w000814; Fri, 8 Feb 2013 12:53:25 -0500
Date: Fri, 8 Feb 2013 15:53:24 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130208155324.0c456dcc@redhat.com>
In-Reply-To: <1360340232-4670-5-git-send-email-armbru@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-5-git-send-email-armbru@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 4/6] qemu-option: Disable two
 helpful messages that got broken recently
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
X-List-Received-Date: Fri, 08 Feb 2013 17:53:42 -0000

On Fri,  8 Feb 2013 17:17:10 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> commit 8be7e7e4 and commit ec7b2ccb messed up the ordering of error
> message and the helpful explanation that should follow it, like this:
> 
>     $ qemu-system-x86_64 --nodefaults -S --vnc :0 --chardev null,id=,
>     Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.
>     qemu-system-x86_64: -chardev null,id=,: Parameter 'id' expects an identifier
> 
>     $ qemu-system-x86_64 --nodefaults -S --vnc :0 --machine kvm_shadow_mem=dunno
>     You may use k, M, G or T suffixes for kilobytes, megabytes, gigabytes and terabytes.
>     qemu-system-x86_64: -machine kvm_shadow_mem=dunno: Parameter 'kvm_shadow_mem' expects a size
> 
> Pity.  Disable them for now.

Oops, sorry. I think I'd prefer to drop them, but as this fixes the problem:

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

Also, the real problem here is that general functions like parse_option_size()
should never assume/try to guess in which context they're running. So, the
best solution here is either to have a general enough error message that's
not tied to any context, or let up layers (say vl.c) concatenate the
context-dependent part of the error message.

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  util/qemu-option.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index c12e724..5a1d03c 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -231,8 +231,10 @@ static void parse_option_size(const char *name, const char *value,
>              break;
>          default:
>              error_set(errp, QERR_INVALID_PARAMETER_VALUE, name, "a size");
> +#if 0 /* conversion from qerror_report() to error_set() broke this: */
>              error_printf_unless_qmp("You may use k, M, G or T suffixes for "
>                      "kilobytes, megabytes, gigabytes and terabytes.\n");
> +#endif
>              return;
>          }
>      } else {
> @@ -771,7 +773,9 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
>      if (id) {
>          if (!id_wellformed(id)) {
>              error_set(errp,QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
> +#if 0 /* conversion from qerror_report() to error_set() broke this: */
>              error_printf_unless_qmp("Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.\n");
> +#endif
>              return NULL;
>          }
>          opts = qemu_opts_find(list, id);


