Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsSGU-0005MO-0i
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 04:43:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YsSGR-0005M4-4x
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 04:43:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YsSGJ-00066g-4P
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 04:43:39 -0400
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:33193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YsSGI-00066S-UL; Wed, 13 May 2015 04:43:31 -0400
Received: by wicmx19 with SMTP id mx19so4954781wic.0;
	Wed, 13 May 2015 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=xBJJF3VwWRaOHopca+ISeu0XunU9mqYgWm/65GndQ00=;
	b=U7bZiEj0XAw8CszxaejIULh1TuA+1W8hP+97Tx/861celJtmkRYhhLT4uGCCA3LOBW
	aj6YXveJ/G310OTPSaSwyOfOXIoBJUECXPqRiX8x7jAjA6ph6bOjuqffm6T4YpyKMQyb
	aBHovsroO2BcOqhKu9SEKqQCAjKbJAYuaGZebfixOjI6iam/tFzUgirsG74cddjYVEru
	OirAGx5HF+4/y1ygn504OHnLmFGuVyGCSoW/Jzr4rzOpPaFs2si0V0XitzDzBJQ15uTd
	Kfw6Le18LrtN7e9qMWNePxRBbS8q8sYSFI6Fy6peAW6CyHVINBSn+STgqkALL3A2MFiP
	K8OA==
X-Received: by 10.180.208.84 with SMTP id mc20mr12584090wic.38.1431506610282; 
	Wed, 13 May 2015 01:43:30 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-186-233.clienti.tiscali.it.
	[94.39.186.233])
	by mx.google.com with ESMTPSA id gj7sm6873093wib.4.2015.05.13.01.43.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 01:43:29 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55530EAD.5070104@redhat.com>
Date: Wed, 13 May 2015 10:43:25 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1431522928-5292-1-git-send-email-famz@redhat.com>
In-Reply-To: <1431522928-5292-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] iscsi: Remove pointless runtime check of
	macro value
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
X-List-Received-Date: Wed, 13 May 2015 08:43:40 -0000



On 13/05/2015 15:15, Fam Zheng wrote:
> raw_bsd already has QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != 512), so iscsi
> should relax.

It's okay to have the same QEMU_BUILD_BUG_ON in different places.
However, you're right that this should be a compile-time check rather
than run-time check.

Paolo

> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  block/iscsi.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 8fca1d3..14e97a6 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1323,13 +1323,6 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
>      const char *filename;
>      int i, ret = 0;
>  
> -    if ((BDRV_SECTOR_SIZE % 512) != 0) {
> -        error_setg(errp, "iSCSI: Invalid BDRV_SECTOR_SIZE. "
> -                   "BDRV_SECTOR_SIZE(%lld) is not a multiple "
> -                   "of 512", BDRV_SECTOR_SIZE);
> -        return -EINVAL;
> -    }
> -
>      opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
>      qemu_opts_absorb_qdict(opts, options, &local_err);
>      if (local_err) {
> 

