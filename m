Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCJE-0004pB-CJ
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:55:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhCJ8-0004lA-PW
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhCJ3-0006eO-TV
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:55:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhCIq-0006aw-7P; Thu, 23 Oct 2014 02:55:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59FB145ABF;
	Thu, 23 Oct 2014 10:55:19 +0400 (MSK)
Message-ID: <5448A656.6030204@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:55:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Arthur Gautier <baloo@gandi.net>, qemu-devel@nongnu.org
References: <1413984320-28585-1-git-send-email-baloo@gandi.net>
In-Reply-To: <1413984320-28585-1-git-send-email-baloo@gandi.net>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmdk: Fix cylinders number during convert
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
X-List-Received-Date: Thu, 23 Oct 2014 06:55:43 -0000

On 10/22/2014 05:25 PM, Arthur Gautier wrote:
> We can not rely on int cast to get a correct number of cylinders. The
> cylinders information was wrong in 49.9999% of cases.
> 
> This ensures the cylinders always gets the ceiling value.

Good thing, especially the good probability :), and also a good patch
which comes with a test.

But I wonder if anything can break this way?  Migration, windows guest
being unable to find its partitions, something else?

And more.  What-if our drive size in cylinders will be larger than
the size in bytes?  The proposed div_round_up() will increase number
of cylinders, so size in CHS will be larger than size in bytes.  Maybe
there was a reason why originally the size in cylinders was calculated
by truncating extra fractional part?  What-if guest will try to access
the very last CHS which is incomplete?

Thanks,

/mjt

> Reviewed-by: William Dauchy <william@gandi.net>
> Signed-off-by: Arthur Gautier <baloo@gandi.net>
> ---
>  block/vmdk.c               |  4 +--
>  tests/qemu-iotests/106     | 67 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/106.out |  5 ++++
>  tests/qemu-iotests/group   |  1 +
>  4 files changed, 75 insertions(+), 2 deletions(-)
>  create mode 100755 tests/qemu-iotests/106
>  create mode 100644 tests/qemu-iotests/106.out
> 
> diff --git a/block/vmdk.c b/block/vmdk.c
> index 4ae6c75..c22a6c6 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -1928,8 +1928,8 @@ static int vmdk_create(const char *filename, QemuOpts *opts, Error **errp)
>                             parent_desc_line,
>                             ext_desc_lines->str,
>                             (flags & BLOCK_FLAG_COMPAT6 ? 6 : 4),
> -                           total_size /
> -                               (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE),
> +                           DIV_ROUND_UP(total_size,
> +                               (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE)),
>                             number_heads,
>                             adapter_type);
>      desc_len = strlen(desc);
[]

