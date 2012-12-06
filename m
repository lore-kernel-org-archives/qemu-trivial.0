Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgYK3-0003l7-Uf
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 05:04:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TgYJs-0003LT-FT
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 05:04:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TgYJj-0005He-1M
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 05:04:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TgYJT-0005C6-Cj; Thu, 06 Dec 2012 05:04:15 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB6A4Bgs030396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Dec 2012 05:04:11 -0500
Received: from dhcp-5-188.str.redhat.com (vpn1-5-119.ams2.redhat.com
	[10.36.5.119])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qB6A48LB016842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 05:04:10 -0500
Message-ID: <50C06D98.9040804@redhat.com>
Date: Thu, 06 Dec 2012 11:04:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] correct error message
	qemu-img reported
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
X-List-Received-Date: Thu, 06 Dec 2012 10:04:50 -0000

Am 05.11.2012 08:41, schrieb liguang:
> qemu-img will complain when qcow or qcow2
> size overflow for 64 bits, report the right
> message in this condition.
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  qemu-img.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index b41e670..d9434ad 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -340,7 +340,12 @@ static int img_create(int argc, char **argv)
>          int64_t sval;
>          char *end;
>          sval = strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFIX_B);
> -        if (sval < 0 || *end) {
> +        if (sval < 0) {
> +            error_report("Image size must be less than 8 exabytes!");
> +            ret = -1;
> +            goto out;
> +        }

This is wrong, overflows are not the only way how strtosz_suffix() can fail.

Before this patch:

$ ./qemu-img create /tmp/foo bar
qemu-img: Invalid image size specified! You may use k, M, G or T
suffixes for
qemu-img: kilobytes, megabytes, gigabytes and terabytes

With the patch applied:

$ ./qemu-img create /tmp/foo bar
qemu-img: Image size must be less than 8 exabytes!

Kevin


> +        if (*end) {
>              error_report("Invalid image size specified! You may use k, M, G or "
>                    "T suffixes for ");
>              error_report("kilobytes, megabytes, gigabytes and terabytes.");
> 



