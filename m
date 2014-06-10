Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuMIC-0007FF-E8
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 09:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WuMI3-0007Bc-5Y
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 09:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WuMHv-0007Zr-VH
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 09:40:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1WuMHf-0007RV-L3; Tue, 10 Jun 2014 09:40:15 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5ADeCSl007000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 10 Jun 2014 09:40:12 -0400
Received: from localhost (ovpn-113-65.phx2.redhat.com [10.3.113.65])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5ADeAbb004131; Tue, 10 Jun 2014 09:40:11 -0400
Date: Tue, 10 Jun 2014 09:40:10 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140610094010.01354730@redhat.com>
In-Reply-To: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
References: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	stefanha@redhat.com, eblake@redhat.com, xiawenc@linux.vnet.ibm.com
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
X-List-Received-Date: Tue, 10 Jun 2014 13:40:45 -0000

On Sun,  1 Jun 2014 12:53:35 +0100
Hani Benhabiles <kroosec@gmail.com> wrote:

> Signed-off-by: Hani Benhabiles <hani@linux.com>

Applied to the qmp branch, thanks.

Btw, we don't add a period to the end of the first line in the changelog.

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


