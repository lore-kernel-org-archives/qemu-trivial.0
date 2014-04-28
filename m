Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WehuW-0004xR-3O
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 05:31:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WehuO-0004pK-Km
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 05:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WehuI-0001dT-FR
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 05:31:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wehu5-0001Vu-T4; Mon, 28 Apr 2014 05:31:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C4DC24307E;
	Mon, 28 Apr 2014 13:31:10 +0400 (MSK)
Message-ID: <535E1FDE.50209@msgid.tls.msk.ru>
Date: Mon, 28 Apr 2014 13:31:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Deepak Kathayat <deepak.mk17@gmail.com>, qemu-devel@nongnu.org
References: <1395217173-20902-1-git-send-email-deepak.mk17@gmail.com>
In-Reply-To: <1395217173-20902-1-git-send-email-deepak.mk17@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qcow2.c: Check if backing file name
 length is valid
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
X-List-Received-Date: Mon, 28 Apr 2014 09:31:38 -0000

19.03.2014 12:19, Deepak Kathayat wrote:
> Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
> ---
> The len variable is a signed integer whereas the backing file name
>  length in the image header is unsigned. Therefore, it may
>  overflow. Furthermore, backing file name length cannot be
>  zero. These two cases must be handled explicitly.
>  block/qcow2.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 945c9d6..7b6f65c 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -625,6 +625,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
>      /* read the backing file name */
>      if (header.backing_file_offset != 0) {
>          len = header.backing_file_size;
> +        if (len <= 0) {
> +            error_setg(errp, "Invalid backing file name length: %d", len);
> +            ret = -EINVAL;
> +            goto fail;
> +        }
>          if (len > 1023) {
>              len = 1023;
>          }

A better fix has been implemented meanwhile, as a part of input format validation
series:

commit 6d33e8e7dc9d40ea105feed4b39caa3e641569e8
Author: Kevin Wolf <kwolf@redhat.com>
Date:   Wed Mar 26 13:05:47 2014 +0100

    qcow2: Fix backing file name length check

    len could become negative and would pass the check then. Nothing bad
    happened because bdrv_pread() happens to return an error for negative
    length values, but make variables for sizes unsigned anyway.

    This patch also changes the behaviour to error out on invalid lengths
    instead of silently truncating it to 1023.


Thanks,

/mjt

