Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Waum2-0000RQ-7x
	for mharc-qemu-trivial@gnu.org; Thu, 17 Apr 2014 18:27:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Waulw-0000Px-T5
	for qemu-trivial@nongnu.org; Thu, 17 Apr 2014 18:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wauls-0006Jn-DT
	for qemu-trivial@nongnu.org; Thu, 17 Apr 2014 18:27:08 -0400
Received: from mail-we0-f175.google.com ([74.125.82.175]:58429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wauls-0006JZ-7a
	for qemu-trivial@nongnu.org; Thu, 17 Apr 2014 18:27:04 -0400
Received: by mail-we0-f175.google.com with SMTP id q58so988792wes.20
	for <qemu-trivial@nongnu.org>; Thu, 17 Apr 2014 15:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SCvdNnUDDRx2Nwfy+0mQ40mUqIfhLTJ6ghWTNlV/PRA=;
	b=kRAY3d9f3p82kE8dzu83pKjnYoaJSLnyhx+k50+wk98bV8a8+k1FbfOnX/uoige5Rd
	b0pVcjaXJ3H2yPUvf9oWxW3p0mTegvi8yyYAXrdMs6PKj73h8Bsjcop2G/36S5bLjSeC
	DPCeSYAiBmyoPVwT7SjbqhbYLf/jCF+eDtu8zb+SLcqSi2DyZ5fXdzWDG68Sxo5Z8/9Y
	GLkVSKbIRKzpD38cR1FpQyMyBR0HOnBqiMq4YZdWxrA6vEwiPedRKhfufQziTW64ZDkw
	aGY+fdxr7qLYYxehX+zFZWLLs9/4zqY1Qte9300D8otdHkHAGOZfNNB748Yn5Yf6kIrR
	9eXg==
X-Gm-Message-State: ALoCoQlJEv0YqD4X6oJCiTSTZGtc+VOnJMrMBGxCeSqAnIDSQ1Ge3iSDs0sNywLzuBK8lq0mt1yT
MIME-Version: 1.0
X-Received: by 10.194.204.199 with SMTP id la7mr13919823wjc.4.1397773623209;
	Thu, 17 Apr 2014 15:27:03 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.128.131 with HTTP; Thu, 17 Apr 2014 15:27:03 -0700 (PDT)
In-Reply-To: <1397755962-19435-1-git-send-email-sw@weilnetz.de>
References: <1397755962-19435-1-git-send-email-sw@weilnetz.de>
Date: Fri, 18 Apr 2014 08:27:03 +1000
X-Google-Sender-Auth: rNRuMgNeB5AYzz72l-If5YZp9Nw
Message-ID: <CAEgOgz4CU-3ZfjrABq+C=bXg=imjg5OMocQG23YBRSAhtKxHTA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.175
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xilinx: Fix typo in comment
	(Marvel -> Marvell)
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
X-List-Received-Date: Thu, 17 Apr 2014 22:27:13 -0000

On Fri, Apr 18, 2014 at 3:32 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>  hw/net/xilinx_axienet.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 839d97c..6dc665f 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -98,7 +98,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
>              r |= 1;
>              break;
>          case 17:
> -            /* Marvel PHY on many xilinx boards.  */
> +            /* Marvell PHY on many xilinx boards.  */
>              r = 0x8000; /* 1000Mb  */
>              break;
>          case 18:
> --
> 1.7.10.4
>
>

