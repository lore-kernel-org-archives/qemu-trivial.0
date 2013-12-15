Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vs5pu-0008Bc-L8
	for mharc-qemu-trivial@gnu.org; Sun, 15 Dec 2013 02:09:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1Vs32P-0001u6-9B
	for qemu-trivial@nongnu.org; Sat, 14 Dec 2013 23:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1Vs32F-0007Wi-TX
	for qemu-trivial@nongnu.org; Sat, 14 Dec 2013 23:10:41 -0500
Received: from mail-ie0-f179.google.com ([209.85.223.179]:62367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1Vs32F-0007WX-PC
	for qemu-trivial@nongnu.org; Sat, 14 Dec 2013 23:10:31 -0500
Received: by mail-ie0-f179.google.com with SMTP id x13so4969868ief.38
	for <qemu-trivial@nongnu.org>; Sat, 14 Dec 2013 20:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:organization:references:date
	:in-reply-to:message-id:user-agent:mime-version:content-type;
	bh=Yu4NIeA+pQcqdQlC7rrk8kJ7eOItotuuO7s6hG60uMg=;
	b=Pf9O4qzgpCaH4o7dY8wslNaqioDH0ShCKtCzLSZnaFhIKxVa2nNOQMeOAfxl7rOJkM
	iyMfQsQPqew7zUY67d9UJmw98997crmB6No6RboQbR7F72Kx1MBoROJKyqsW3tlGZit/
	2gYtMFVj1beuuV5B3ymYNBFfygBeiSm2zs/yxcUmXFRy0p/rDIiuC0+v4T4MSnWRtMtT
	Vq47iYyLWEyW3UQ4/9jAvYY8KbmaRalti4QsD6fvQBskc4Yzr6vTjQKr1f1fiSv70+sn
	XISZqTfsDirwXC3X0Gf4RtrcAnzmlzdN2tJpsyEBPBuNRQ/PuRbPDcwJ/KCWCi4OkGnY
	1DFA==
X-Gm-Message-State: ALoCoQmfWD88WMw14uwa9LaUWkvABi3X5I9O+X894pZre95fToP9inmDtibgLZTrJl2kqxhspNSj
X-Received: by 10.43.136.132 with SMTP id ik4mr7598153icc.31.1387080631166;
	Sat, 14 Dec 2013 20:10:31 -0800 (PST)
Received: from localhost (dsl-173-206-82-201.tor.primus.ca. [173.206.82.201])
	by mx.google.com with ESMTPSA id
	j16sm8346720igf.6.2013.12.14.20.10.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Dec 2013 20:10:30 -0800 (PST)
From: Anthony Green <green@moxielogic.com>
To: qemu-devel@nongnu.org
Organization: Moxie Logic
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
Date: Sat, 14 Dec 2013 23:10:29 -0500
In-Reply-To: <1368475464-3116-1-git-send-email-green@moxielogic.com> (Anthony
	Green's message of "Mon, 13 May 2013 16:04:24 -0400")
Message-ID: <8761qqn496.fsf@moxielogic.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.179
X-Mailman-Approved-At: Sun, 15 Dec 2013 02:09:57 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] ping..  Re: [PATCH moxie] Fix bug in tlb_fill.
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
X-List-Received-Date: Sun, 15 Dec 2013 04:10:47 -0000


This patch still needs to be applied.  There was some follow-up
discussion on this patch back in May, but none of it negates the fact
that this patch needs to be applied.

Thanks!

AG

Anthony Green <green@moxielogic.com> writes:

> Fix a simple bug in tlb_fill for moxie.  The port was mostly working
> before, which is why I only really noticed it recently.  Thanks to
> @jcmvbkbc for tracking it down.
>
> Signed-off-by: Anthony Green <green@moxielogic.com>
> ---
>  target-moxie/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-moxie/helper.c b/target-moxie/helper.c
> index 6e0ac2a..6c36c49 100644
> --- a/target-moxie/helper.c
> +++ b/target-moxie/helper.c
> @@ -55,8 +55,8 @@ void tlb_fill(CPUMoxieState *env, target_ulong addr, int is_write, int mmu_idx,
>          if (retaddr) {
>              cpu_restore_state(env, retaddr);
>          }
> +	cpu_loop_exit(env);
>      }
> -    cpu_loop_exit(env);
>  }
>  
>  void helper_raise_exception(CPUMoxieState *env, int ex)

