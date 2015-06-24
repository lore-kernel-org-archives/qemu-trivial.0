Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7q6Z-0002Xh-8G
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 15:13:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1Z7q6W-0002Sh-E5
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 15:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1Z7q6V-0005CL-HJ
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 15:13:00 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:33955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1Z7q6Q-00058Q-D2; Wed, 24 Jun 2015 15:12:54 -0400
Received: by wgqq4 with SMTP id q4so44272713wgq.1;
	Wed, 24 Jun 2015 12:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=YYoDzl0xjh8NoJ4rQJjH9Y0+LKFwhK5fogNTODOkkmY=;
	b=YWEszTfzz6iO5ANGLFxygob+ki22WeHGWALe23vThGEwDJDD4ObiXvyLucGPz0QsER
	ekgovcrC+W/nlPK2jiZD1siP2js/kji+Xn33gOw6kSH94hKAexuJFFvp8ajuK8wsnCyv
	inV0gPfwD4F9TSsg70KxN7EnVib0yHkcQwLZV284hPRFxpUrOmyYKlMfPmU/f15iFdM7
	vGGsWoHQ7sBJKG0sLQyOSA23i5HhQj+eoRsvm148lHNOE0CYEm5S3KC/Jfy+az0vf9D1
	X9oU7mCu9XXI4rdwRdRoZushz+7ENchkGV/Uu3UHe5rrNZEoC1qlhLRtEldwvJHqmhXU
	KWmA==
X-Received: by 10.180.36.103 with SMTP id p7mr7594812wij.88.1435173173444;
	Wed, 24 Jun 2015 12:12:53 -0700 (PDT)
Received: from thh440s (p57AEC007.dip0.t-ipconnect.de. [87.174.192.7])
	by mx.google.com with ESMTPSA id
	tl3sm42057743wjc.20.2015.06.24.12.12.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 12:12:52 -0700 (PDT)
Date: Wed, 24 Jun 2015 21:12:49 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Message-ID: <20150624211249.1fe44976@thh440s>
In-Reply-To: <1435104444-2550-1-git-send-email-laurent@vivier.eu>
References: <1435104444-2550-1-git-send-email-laurent@vivier.eu>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m68k: remove useless file
	m68k-qreg.h
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
X-List-Received-Date: Wed, 24 Jun 2015 19:13:01 -0000

On Wed, 24 Jun 2015 02:07:24 +0200
Laurent Vivier <laurent@vivier.eu> wrote:

> Unused since:
> 
>     commit e1f3808e03f73e7a7fa966afbed2455dd052202e
>     Author: pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
>     Date:   Sat May 24 22:29:16 2008 +0000
> 
>         Convert m68k target to TCG.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target-m68k/m68k-qreg.h | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 target-m68k/m68k-qreg.h
> 
> diff --git a/target-m68k/m68k-qreg.h b/target-m68k/m68k-qreg.h
> deleted file mode 100644
> index c224d5e..0000000
> --- a/target-m68k/m68k-qreg.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -enum {
> -#define DEFO32(name, offset) QREG_##name,
> -#define DEFR(name, reg, mode) QREG_##name,
> -#define DEFF64(name, offset) QREG_##name,
> -    QREG_NULL,
> -#include "qregs.def"
> -    TARGET_NUM_QREGS = 0x100
> -#undef DEFO32
> -#undef DEFR
> -#undef DEFF64
> -};

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

