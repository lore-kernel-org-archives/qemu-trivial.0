Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UHw1K-00020F-UR
	for mharc-qemu-trivial@gnu.org; Tue, 19 Mar 2013 08:52:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UHw1E-0001qP-S5
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 08:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UHw18-0004Nd-Ho
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 08:51:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1UHw15-0004Ml-TG; Tue, 19 Mar 2013 08:51:48 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JCpkso005007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 19 Mar 2013 08:51:46 -0400
Received: from blackfin.pond.sub.org (ovpn-116-67.ams2.redhat.com
	[10.36.116.67])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JCpjxY024161; Tue, 19 Mar 2013 08:51:45 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5CBCA200B0; Tue, 19 Mar 2013 13:51:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <1363692343-22299-1-git-send-email-kwolf@redhat.com>
Date: Tue, 19 Mar 2013 13:51:44 +0100
In-Reply-To: <1363692343-22299-1-git-send-email-kwolf@redhat.com> (Kevin
	Wolf's message of "Tue, 19 Mar 2013 12:25:43 +0100")
Message-ID: <871ubba6xr.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial: Fix debug format
	strings
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
X-List-Received-Date: Tue, 19 Mar 2013 12:52:01 -0000

Cc'ing qemu-trivial

Kevin Wolf <kwolf@redhat.com> writes:

> This fixes the build of hw/serial.c with DEBUG_SERIAL enabled.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/serial.c b/hw/serial.c
> index 48a5eb6..0ccc499 100644
> --- a/hw/serial.c
> +++ b/hw/serial.c
> @@ -306,7 +306,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>      SerialState *s = opaque;
>  
>      addr &= 7;
> -    DPRINTF("write addr=0x%02x val=0x%02x\n", addr, val);
> +    DPRINTF("write addr=0x%" HWADDR_PRIx " val=0x%" PRIx64 "\n", addr, val);
>      switch(addr) {
>      default:
>      case 0:
> @@ -527,7 +527,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
>          ret = s->scr;
>          break;
>      }
> -    DPRINTF("read addr=0x%02x val=0x%02x\n", addr, ret);
> +    DPRINTF("read addr=0x%" HWADDR_PRIx " val=0x%02x\n", addr, ret);
>      return ret;
>  }

