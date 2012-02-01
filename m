Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsiWf-0006eb-Qx
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 17:19:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiQL-0002dr-Lt
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:13:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiQE-0000MU-Mk
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:13:04 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:40163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RsiPt-00006T-IP; Wed, 01 Feb 2012 17:12:37 -0500
Received: by mail-pw0-f45.google.com with SMTP id a11so1882314pba.4
	for <multiple recipients>; Wed, 01 Feb 2012 14:12:36 -0800 (PST)
Received: by 10.68.227.132 with SMTP id sa4mr1426891pbc.64.1328134356819;
	Wed, 01 Feb 2012 14:12:36 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id c5sm1207256pbq.13.2012.02.01.14.12.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 14:12:35 -0800 (PST)
Message-ID: <4F29B8D1.2070202@codemonkey.ws>
Date: Wed, 01 Feb 2012 16:12:33 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1328122242-18230-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1328122242-18230-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Remove
 linux-headers/asm symlink on distclean
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
X-List-Received-Date: Wed, 01 Feb 2012 22:19:36 -0000

On 02/01/2012 12:50 PM, Peter Maydell wrote:
> configure creates a linux-headers/asm symlink. Remove this when
> doing a distclean.
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   Makefile |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d172cbf..2560b59 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -233,6 +233,7 @@ distclean: clean
>   	rm -f qemu-doc.log qemu-doc.pdf qemu-doc.pg qemu-doc.toc qemu-doc.tp
>   	rm -f qemu-doc.vr
>   	rm -f config.log
> +	rm -f linux-headers/asm
>   	rm -f qemu-tech.info qemu-tech.aux qemu-tech.cp qemu-tech.dvi qemu-tech.fn qemu-tech.info qemu-tech.ky qemu-tech.log qemu-tech.pdf qemu-tech.pg qemu-tech.toc qemu-tech.tp qemu-tech.vr
>   	for d in $(TARGET_DIRS) $(QEMULIBS); do \
>   	rm -rf $$d || exit 1 ; \


