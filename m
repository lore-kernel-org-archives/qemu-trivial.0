Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wu6FX-0007IF-PC
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jun 2014 16:32:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wu6FR-0007D5-NH
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 16:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wu6FM-0000x7-JV
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 16:32:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Wu6FC-0000vk-6k; Mon, 09 Jun 2014 16:32:38 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s59KWYtp017788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 9 Jun 2014 16:32:34 -0400
Received: from localhost (ovpn-113-65.phx2.redhat.com [10.3.113.65])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s59KWXS1012393; Mon, 9 Jun 2014 16:32:33 -0400
Date: Mon, 9 Jun 2014 16:32:32 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140609163232.5d0fc6ed@redhat.com>
In-Reply-To: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
References: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
	eblake@redhat.com, xiawenc@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] readline: Clear screen on form feed.
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
X-List-Received-Date: Mon, 09 Jun 2014 20:32:58 -0000

On Sun,  1 Jun 2014 12:53:35 +0100
Hani Benhabiles <kroosec@gmail.com> wrote:

> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  util/readline.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/util/readline.c b/util/readline.c
> index 8baec55..08d07e3 100644
> --- a/util/readline.c
> +++ b/util/readline.c
> @@ -345,6 +345,12 @@ static void readline_completion(ReadLineState *rs)
>      }
>  }
>  
> +static void readline_clear_screen(ReadLineState *rs)
> +{
> +    rs->printf_func(rs->opaque, "\033[2J\033[1;1H");

That's a smart way of doing it and I can't suggest anything better. But
what happens on Windows?

> +    readline_show_prompt(rs);
> +}
> +
>  /* return true if command handled */
>  void readline_handle_byte(ReadLineState *rs, int ch)
>  {
> @@ -363,6 +369,9 @@ void readline_handle_byte(ReadLineState *rs, int ch)
>          case 9:
>              readline_completion(rs);
>              break;
> +        case 12:
> +            readline_clear_screen(rs);
> +            break;
>          case 10:
>          case 13:
>              rs->cmd_buf[rs->cmd_buf_size] = '\0';


