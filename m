Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtaFl-0000FT-08
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:46:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaFh-0000FM-3j
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:46:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaFf-00052j-8A
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:46:13 -0500
Received: from mail-we0-f180.google.com ([74.125.82.180]:64032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TtaFe-00052W-Vc; Fri, 11 Jan 2013 03:46:11 -0500
Received: by mail-we0-f180.google.com with SMTP id t57so709381wey.11
	for <multiple recipients>; Fri, 11 Jan 2013 00:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Tb8Sgzv1nHt5M8KIzcleWiP9EfBZ440DOPVviBvDeKM=;
	b=PIPnsxsJ4lbqkQZ4MZvm5BHnSucRLXfTApvDmvkUNDa3dnQcLEx5RPqXxmDf4JXXbR
	c5xO4ErsPAsgQur/Z/5LvaNYCHn9O+aElzZqLYp/5+FejpqyV0Hh7WxknFJV6RYAgGbN
	3vwaqkQBWLnO0dO4q9f6OwhKYzVHEQTCaSRv4jTZ7qZ14KuXSYoc8R+ruAlUODFg6g4C
	TjIMnMoStdEQ7v9H8G1td3WOrgh0FZ5qn62YXpESv3OuyaFHbGL/eC5SSGZB7pksvCV7
	xu8wGzdg3lAsAR3Gt6SgS7BUHUnUKpafthgk6PRJtg636zVlJvnzkTQ0yogX+p6X+L0L
	dImQ==
X-Received: by 10.194.88.98 with SMTP id bf2mr119694616wjb.49.1357893969962;
	Fri, 11 Jan 2013 00:46:09 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id gz3sm11854444wib.2.2013.01.11.00.46.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 00:46:09 -0800 (PST)
Date: Fri, 11 Jan 2013 09:46:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130111084604.GE23656@stefanha-thinkpad.muc.redhat.com>
References: <1357596493-27396-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1357596493-27396-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.180
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Replace remaining gmtime,
 localtime by gmtime_r, localtime_r
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
X-List-Received-Date: Fri, 11 Jan 2013 08:46:16 -0000

On Mon, Jan 07, 2013 at 11:08:13PM +0100, Stefan Weil wrote:
> diff --git a/vl.c b/vl.c
> index f056c95..21e4a74 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -454,15 +454,13 @@ void qemu_get_timedate(struct tm *tm, int offset)
>      ti += offset;
>      if (rtc_date_offset == -1) {
>          if (rtc_utc)
> -            ret = gmtime(&ti);
> +            ret = gmtime_r(&ti, tm);
>          else
> -            ret = localtime(&ti);
> +            ret = localtime_r(&ti, tm);
>      } else {
>          ti -= rtc_date_offset;
> -        ret = gmtime(&ti);
> +        ret = gmtime_r(&ti, tm);
>      }
> -
> -    memcpy(tm, ret, sizeof(struct tm));
>  }

BTW I fixed the compiler warning here, no need to respin:

vl.c: In function ‘qemu_get_timedate’:
vl.c:451:16: error: variable ‘ret’ set but not used [-Werror=unused-but-set-variable]

Stefan

