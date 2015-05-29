Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyIDL-0007XW-Dc
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 07:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YyIDJ-0007U4-7d
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 07:12:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YyIDI-0005VL-08
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 07:12:32 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:38650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YyIDB-0005Sq-OO; Fri, 29 May 2015 07:12:25 -0400
Received: by wizo1 with SMTP id o1so19218560wiz.1;
	Fri, 29 May 2015 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=mCBd93F2OcbzdiJV5QqEdLOYvO6NAKrgzzAxAUasE4U=;
	b=UzIO6+bJj++Mrrl1B/b9zKoWOevELzVw4SPTh6oWUMtRI8aKyAr+agerLacqJO7QUR
	I71VwxyLc+Oqb+p3V5UDt/1btAk0y2xD/rcssDtis2bKFGiPNJaDapsq/QpqSTEtYvoT
	E6nH+Vt2UwU9V8g4d5Sf0Qo6DGd83mM73PH/t7EUdIM4VpIJYtmWnzguZnofswMhTXd3
	IKIdW7oBkyw83CIUG3V6ggAcWwKcGObfxcLgbbLc0NCcgrx345mRveEWN27MTSrHCT25
	SY8knlVf4y35a40J27SJFM36793pLer2nXa3Tyh0FTS2AlhzA6noS0GNKFzLuc0SVObu
	K/zw==
X-Received: by 10.194.23.234 with SMTP id p10mr14375074wjf.52.1432897945143;
	Fri, 29 May 2015 04:12:25 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-199-114.clienti.tiscali.it.
	[94.39.199.114])
	by mx.google.com with ESMTPSA id y19sm37679wia.15.2015.05.29.04.12.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 May 2015 04:12:24 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55684995.3070205@redhat.com>
Date: Fri, 29 May 2015 13:12:21 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-trivial@nongnu.org
References: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: don't apply -O2 if
	extra-cflags sets -O
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
X-List-Received-Date: Fri, 29 May 2015 11:12:34 -0000



On 29/05/2015 12:56, Alex Bennée wrote:
> If your trying to debug and want to force -O0 then don't allow the
> configure script to try and set -O2. You can use --enable-debug but that
> enables a lot more stuff by default.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index b707429..be1f354 100755
> --- a/configure
> +++ b/configure
> @@ -4240,7 +4240,10 @@ if test "$gcov" = "yes" ; then
>    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
>    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
>  elif test "$debug" = "no" ; then
> -  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
> +    if test "${EXTRA_CFLAGS#*-O}" = "$EXTRA_CFLAGS"; then
> +        CFLAGS="-O2 $CFLAGS"
> +    fi
> +    CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>  fi
>  
>  ##########################################
> 

Why aren't EXTRA_CFLAGS applied _after_ CFLAGS instead of before?

Paolo

