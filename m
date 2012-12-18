Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tl029-0007V8-9w
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:28:45 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl022-00079u-7n
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:28:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl020-0006MR-Jf
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:28:38 -0500
Received: from mail-wg0-f42.google.com ([74.125.82.42]:45934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl020-0006MJ-Di
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:28:36 -0500
Received: by mail-wg0-f42.google.com with SMTP id dr1so2405857wgb.1
	for <qemu-trivial@nongnu.org>; Tue, 18 Dec 2012 08:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=l8JDJRfl+F46phbCunrXOFGRpQq/u/ulYP9Vy9W8um4=;
	b=cyjaF4hV1b9AE6+bIJNEYrXUSYnaviaHtCAmMp0I1uJXsPcMigGi0HO62Hn/Q4Y9Yd
	cIpcqpUY4zN/TDM/tDgabYqdUH/xd5fcZ+uz+ufjGoa/PYYYTjOC3WTuGQEPIMa99iR1
	yujITps48E7yok/AP2XDIwXH5BkWDJAUCU6bEP62ZxfOUKogOEitTZRbkxRISxDL/6aw
	xLgBM32an2RtLdSYS1E0iBnfX7qHDHAKYFqlisGKHKpeLTVh5WiejJK0F6GfTZ2qaQkV
	GJm44v8I2EboENB5RGsaHlkjdNM+t+Q1R7YTiKFMrPVEyRNOgRdQNKOL0RIBgs9bc3wo
	JYOg==
X-Received: by 10.194.88.166 with SMTP id bh6mr5626245wjb.37.1355848115587;
	Tue, 18 Dec 2012 08:28:35 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id i2sm16505554wiw.3.2012.12.18.08.28.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:28:34 -0800 (PST)
Date: Tue, 18 Dec 2012 17:28:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121218162833.GF12099@stefanha-thinkpad.redhat.com>
References: <20121210135131.GA40753@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121210135131.GA40753@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.42
Cc: qemu-trivial@nongnu.org, Andreas Faerber <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Remove Sparc v7 and v8 host support from
 the configure list
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
X-List-Received-Date: Tue, 18 Dec 2012 16:28:43 -0000

On Mon, Dec 10, 2012 at 09:51:31PM +0800, 陳韋任 (Wei-Ren Chen) wrote:
>   According to QEMU 1.3 release note, sparc v7 and v8 host support have
> been removed. [1] Fix configure list as well.
> 
> [1] http://wiki.qemu.org/ChangeLog/1.3#Host_support
> 
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/configure b/configure
> index e5aedef..56cf49d 100755
> --- a/configure
> +++ b/configure
> @@ -1089,7 +1089,7 @@ echo "  --fmod-inc               path to FMOD includes"
>  echo "  --oss-lib                path to OSS library"
>  echo "  --enable-uname-release=R Return R for uname -r in usermode emulation"
>  echo "  --cpu=CPU                Build for host CPU [$cpu]"
> -echo "  --sparc_cpu=V            Build qemu for Sparc architecture v7, v8, v8plus, v8plusa, v9"
> +echo "  --sparc_cpu=V            Build qemu for Sparc architecture v8plus, v8plusa, v9"
>  echo "  --disable-uuid           disable uuid support"
>  echo "  --enable-uuid            enable uuid support"
>  echo "  --disable-vde            disable support for vde network"

Please remove --sparc_cpu completely, it no longer does anything.  See
9b9c37c36439ee0452632253dac7a31897f27f70 for details.

Stefan

