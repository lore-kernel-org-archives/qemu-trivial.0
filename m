Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3sA4-0003AT-Qu
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 12:54:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3sA2-00034d-IB
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 12:54:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3sA1-0000En-EL
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 12:54:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U3s9y-0000DI-B0; Fri, 08 Feb 2013 12:54:50 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18HsmkM030306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 12:54:48 -0500
Received: from localhost (ovpn-113-129.phx2.redhat.com [10.3.113.129])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18HskmK024869; Fri, 8 Feb 2013 12:54:47 -0500
Date: Fri, 8 Feb 2013 15:54:46 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130208155446.4e8caee4@redhat.com>
In-Reply-To: <1360340232-4670-6-git-send-email-armbru@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-6-git-send-email-armbru@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 5/6] vl: Drop redundant "parse
	error" reports
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
X-List-Received-Date: Fri, 08 Feb 2013 17:54:56 -0000

On Fri,  8 Feb 2013 17:17:11 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> qemu_opts_parse() reports the error already, and in a much more useful
> way.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  vl.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index a8dc73d..73122d8 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3334,7 +3334,6 @@ int main(int argc, char **argv, char **envp)
>                  }
>                  opts = qemu_opts_parse(olist, optarg, 1);
>                  if (!opts) {
> -                    fprintf(stderr, "parse error: %s\n", optarg);
>                      exit(1);
>                  }
>                  break;
> @@ -3350,7 +3349,6 @@ int main(int argc, char **argv, char **envp)
>                  }
>                  opts = qemu_opts_parse(olist, optarg, 1);
>                  if (!opts) {
> -                    fprintf(stderr, "parse error: %s\n", optarg);
>                      exit(1);
>                  }
>  
> @@ -3521,7 +3519,6 @@ int main(int argc, char **argv, char **envp)
>                  olist = qemu_find_opts("machine");
>                  opts = qemu_opts_parse(olist, optarg, 1);
>                  if (!opts) {
> -                    fprintf(stderr, "parse error: %s\n", optarg);
>                      exit(1);
>                  }
>                  optarg = qemu_opt_get(opts, "type");
> @@ -3755,7 +3752,6 @@ int main(int argc, char **argv, char **envp)
>                  }
>                  opts = qemu_opts_parse(olist, optarg, 0);
>                  if (!opts) {
> -                    fprintf(stderr, "parse error: %s\n", optarg);
>                      exit(1);
>                  }
>                  break;


