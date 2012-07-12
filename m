Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sp9Zp-00072F-9g
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jul 2012 22:56:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1Sp9Zn-0006v5-44
	for qemu-trivial@nongnu.org; Wed, 11 Jul 2012 22:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1Sp9Zm-0001ZK-1u
	for qemu-trivial@nongnu.org; Wed, 11 Jul 2012 22:56:23 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:60232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1Sp9Zj-0001Yw-K5; Wed, 11 Jul 2012 22:56:19 -0400
Received: by lbok6 with SMTP id k6so2859118lbo.4
	for <multiple recipients>; Wed, 11 Jul 2012 19:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=urTwik6NEJ7cMhcR1bweYM3ZgYr+C2bi0eRrpG4c/MI=;
	b=pmJSnRuS1WZ5D1pUyDw9e+t01+woEwViebHNfhpJzQrq3IPtZKPXcKIYdrhrPA4j6B
	3o/pLAp+6PYYFEOuB7C5ZwfP9eenTB/ryKuO5mi7i1gPNSpQtIQ1SOPBQ+5T57CLqr+9
	dOuY90Fb6eHosgyWz3hGUAiS3A2oG7BR5M1e76BTLmTuTaE1wCaXMnv3yLf+P125wPIp
	gVaC/MELw7yJphw7jjxt6DiN/x6hy33jAC5hLi6xaxKH00gL31hF01XTUl+/IOzM2Bm2
	3pYi59tctZ+iiSJka3L/CUyi/+vQfe2yRP1iIBus1vTzDAp0xBYSLUxPSrhYGM9UFftl
	XgCQ==
MIME-Version: 1.0
Received: by 10.152.146.163 with SMTP id td3mr38150348lab.26.1342061778148;
	Wed, 11 Jul 2012 19:56:18 -0700 (PDT)
Received: by 10.112.148.228 with HTTP; Wed, 11 Jul 2012 19:56:18 -0700 (PDT)
In-Reply-To: <1342060843-27453-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1342060843-27453-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Date: Thu, 12 Jul 2012 10:56:18 +0800
Message-ID: <CAOZVR5beCNxO_rxSWYsyY5iHxjZ9c9vuuafYoq4L8-UgAwWudw@mail.gmail.com>
From: Dunrong Huang <riegamaths@gmail.com>
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: correct help
	message
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
X-List-Received-Date: Thu, 12 Jul 2012 02:56:24 -0000

2012/7/12 Dong Xu Wang <wdongxu@linux.vnet.ibm.com>:
> qemu-img not only suports k/K/M/G/T/b, but also supports m/g/t/B. So correct
> it in help message.
>
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> ---
>  qemu-img.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-img.c b/qemu-img.c
> index 80cfb9b..533eac2 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -69,8 +69,9 @@ static void help(void)
>             "    options are: 'none', 'writeback' (default, except for convert), 'writethrough',\n"
>             "    'directsync' and 'unsafe' (default for convert)\n"
>             "  'size' is the disk image size in bytes. Optional suffixes\n"
> -           "    'k' or 'K' (kilobyte, 1024), 'M' (megabyte, 1024k), 'G' (gigabyte, 1024M)\n"
> -           "    and T (terabyte, 1024G) are supported. 'b' is ignored.\n"
> +           "    'k' or 'K' (kilobyte, 1024), 'm' or 'M' (megabyte, 1024k),\n"
> +           "    'g' or 'G' (gigabyte, 1024M) and 't' or 'T' (terabyte, 1024G) are supported.\n"
> +           "    'b' or 'B' is ignored.\n"
>             "  'output_filename' is the destination disk image filename\n"
>             "  'output_fmt' is the destination format\n"
>             "  'options' is a comma separated list of format specific options in a\n"
Those error reporting also need to be corrected:
        if (sval < 0 || *end) {
            error_report("Invalid image size specified! You may use k, M, G or "
                  "T suffixes for ");
            error_report("kilobytes, megabytes, gigabytes and terabytes.");
            ret = -1;
            goto out;
        }

-- 
Best Regards,

Dunrong Huang

