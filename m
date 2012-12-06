Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgaIP-00074l-By
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 07:11:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <owasserm@redhat.com>) id 1TgaIF-0006gE-Hi
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:11:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <owasserm@redhat.com>) id 1TgaI5-0006AN-Cr
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:11:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <owasserm@redhat.com>)
	id 1TgaHr-00067O-Fh; Thu, 06 Dec 2012 07:10:43 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB6CAb0x005207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Dec 2012 07:10:41 -0500
Received: from dhcp-1-120.tlv.redhat.com (vpn-202-96.tlv.redhat.com
	[10.35.202.96])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qB6CAWdP000767; Thu, 6 Dec 2012 07:10:36 -0500
Message-ID: <50C08B66.5030607@redhat.com>
Date: Thu, 06 Dec 2012 14:11:18 +0200
From: Orit Wasserman <owasserm@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1354795349-2613-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1354795349-2613-1-git-send-email-alevy@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arch_init/ram_load: add
 error message for block length mismatch
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
X-List-Received-Date: Thu, 06 Dec 2012 12:11:15 -0000

On 12/06/2012 02:02 PM, Alon Levy wrote:
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  arch_init.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch_init.c b/arch_init.c
> index e6effe8..84bca99 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -808,8 +808,10 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>                      QLIST_FOREACH(block, &ram_list.blocks, next) {
>                          if (!strncmp(id, block->idstr, sizeof(id))) {
>                              if (block->length != length) {
> +                                fprintf(stderr, "Length mismatch: %s: %d "
> +                                        "in != %d\n", id, length,
> +                                        block->length);
>                                  ret =  -EINVAL;
> -                                goto done;
>                              }
>                              break;
>                          }
> 
Reviewed-by: Orit Wasserman <owasserm@redhat.com>

But the real question is what did we break this time? can it be fixed?

Orit

