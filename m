Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VO50z-00051h-BY
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2013 08:13:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VO50s-0004k6-FY
	for qemu-trivial@nongnu.org; Mon, 23 Sep 2013 08:13:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VO50m-000812-U5
	for qemu-trivial@nongnu.org; Mon, 23 Sep 2013 08:13:14 -0400
Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230]:59540)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1VO50b-0007z2-HU; Mon, 23 Sep 2013 08:12:57 -0400
Received: by mail-ee0-f48.google.com with SMTP id l10so1673947eei.21
	for <multiple recipients>; Mon, 23 Sep 2013 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=//HqBkAo6OUl68/lPFApvzFG544urRirwu/Bop1XvVE=;
	b=kPeKvKrUwT7Jy5AnYWTcFGz5s24qbwoXnJq9HTU/jGSev31vDrBxrZrlAi/1rnkNmd
	Gtqq9afe2d6dltcZ69tiDC6WsrLLd2ULPCpJNEDMC19DA+xuDFnepJLLy/7JWMurIplQ
	MRH25Fp9zKABFF+Pld/6CBBg5OOoUdkvGiAW3Oiyl7U1pvFxPihG2Io5q20oGpNwBD/V
	vBo7h/IpPfwYn5mb4s/Uh5hVnafqB02MDsIuggspE60BCd2oFQp126Ny2zg+/ujtb1+v
	8EP3iYoJA22/qsv7t0lTOZTNGAjqiO1h8a9QulB4ikCyMXL5+57POXay50cuQ2m6qLgK
	owbw==
X-Received: by 10.15.98.9 with SMTP id bi9mr2669648eeb.67.1379938376632;
	Mon, 23 Sep 2013 05:12:56 -0700 (PDT)
Received: from localhost (178-26-142-215-dynip.superkabel.de. [178.26.142.215])
	by mx.google.com with ESMTPSA id h45sm32893905eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 05:12:55 -0700 (PDT)
Date: Mon, 23 Sep 2013 14:12:53 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130923121253.GB3623@stefanha-thinkpad.redhat.com>
References: <1379830750-23801-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1379830750-23801-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::230
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] block: Fix compiler
 warning (-Werror=uninitialized)
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
X-List-Received-Date: Mon, 23 Sep 2013 12:13:20 -0000

On Sun, Sep 22, 2013 at 08:19:10AM +0200, Stefan Weil wrote:
> The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:
> 
> block/stream.c:141:22: error:
> ‘copy’ may be used uninitialized in this function [-Werror=uninitialized]
> 
> This is not a real bug - a better compiler would not complain.
> 
> Now 'copy' has always a defined value, so the check for ret >= 0
> can be removed.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> v2:
> 
> As noted by Andreas Färber, 'copy' must be set to false after the goto label.
> Thanks for this hint.
> 
> Regards,
> Stefan
> 
>  block/stream.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 078ce4a..45837f4 100644
> --- a/block/stream.c
> +++ b/block/stream.c
> @@ -119,11 +119,12 @@ wait:
>              break;
>          }
>  
> +        copy = false;
> +
>          ret = bdrv_is_allocated(bs, sector_num,
>                                  STREAM_BUFFER_SIZE / BDRV_SECTOR_SIZE, &n);
>          if (ret == 1) {
>              /* Allocated in the top, no need to copy.  */
> -            copy = false;
>          } else if (ret >= 0) {
>              /* Copy if allocated in the intermediate images.  Limit to the
>               * known-unallocated area [sector_num, sector_num+n).  */
> @@ -138,7 +139,7 @@ wait:
>              copy = (ret == 1);
>          }
>          trace_stream_one_iteration(s, sector_num, n, ret);
> -        if (ret >= 0 && copy) {
> +        if (copy) {
>              if (s->common.speed) {
>                  delay_ns = ratelimit_calculate_delay(&s->limit, n);
>                  if (delay_ns > 0) {
> -- 
> 1.7.10.4

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

