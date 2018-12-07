Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVD8B-0006wB-A7
	for mharc-qemu-trivial@gnu.org; Fri, 07 Dec 2018 05:13:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVD88-0006vm-Ng
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 05:13:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVD85-0002S6-HL
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 05:13:08 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:36922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gVD81-0002E4-Mw
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 05:13:03 -0500
Received: by mail-wm1-f49.google.com with SMTP id g67so3912518wmd.2
	for <qemu-trivial@nongnu.org>; Fri, 07 Dec 2018 02:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TBnuPdiv+YYyR2AgFmobVDcK50XB7bfMC4zCWLTzQkc=;
	b=T2L/0SGMnYj9VCm5AY0ft0wcpugMwOmeQvZWZC3lJhw0b6vLYCWh4lgwIrOQEoFOQh
	U/3dsSHt9qQw0/6rGPv16plcIcGHPWUzPdX+ymQbqJKzRtq6yYSlORescILDPLek55l1
	PVZDnsqtVl7BkeCT1tpaVuYVmBX27nBayL1zil82EkDCWJ04nUjZthsRjs00WyhGGCqM
	KgsH6RTNL13retKEWMs8NE6vFPi8E3/7r8CQxQyQD4p2cwzXIaJKVLELspU+XgsDdsuu
	REFt9CeZQwWgd+TTDjG8UYzmO4Vu41MPf1L5STNWk2FOHVp3Aio+SCSz0cp1xpm7WkK+
	6AIQ==
X-Gm-Message-State: AA+aEWYMGI/1F1LSQnL4OwNh3Qay/M6lNNY45y5N9VeWqXegNxJ6BT/V
	PyHHLkbnh8vzLVVP+3AbTcWQgg==
X-Google-Smtp-Source: AFSGD/Xr0oYecCzqG7xBzWLi1ztc1fVDn7+f0AzB43ThIimAIjYaJngHholywezD53LP1Rb3m+qddA==
X-Received: by 2002:a1c:5585:: with SMTP id
	j127-v6mr1535828wmb.127.1544177579961; 
	Fri, 07 Dec 2018 02:12:59 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	k128sm1416863wmd.37.2018.12.07.02.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 02:12:59 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, vsementsov@virtuozzo.com, armbru@redhat.com
References: <20181206151856.77503-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9022c85e-9bbd-3500-edcd-c4ff014c5604@redhat.com>
Date: Fri, 7 Dec 2018 11:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181206151856.77503-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.49
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cutils: Assert in-range
 base for string-to-integer conversions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2018 10:13:09 -0000

On 12/6/18 4:18 PM, Eric Blake wrote:
> POSIX states that the value of endptr is unspecified if strtol()
> fails with EINVAL due to an invalid base argument.  Since none of
> the callers to check_strtox_error() initialized endptr, we could
> end up propagating uninitialized data back to a caller on error.
> However, passing an out-of-range base is already a sign of poor
> programming, so let's just assert that base is in range, at which
> point check_strtox_error() can be tightened to assert that it is
> receiving an initialized ep that points somewhere within the
> caller's original string, regardless of whether strto*() succeeded
> or failed with ERANGE.
> 
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Also tested that this does not negatively impact David's pending
> additions of qemu_strtod{,_finite}().  Thus:
> Based-on: <20181121164421.20780-1-david@redhat.com>
> 
>  util/cutils.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index 91930d1bbeb..e098debdc0c 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -278,6 +278,7 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result)
>  static int check_strtox_error(const char *nptr, char *ep,
>                                const char **endptr, int libc_errno)
>  {
> +    assert(ep >= nptr);
>      if (endptr) {
>          *endptr = ep;
>      }
> @@ -325,6 +326,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
>      char *ep;
>      long long lresult;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!nptr) {
>          if (endptr) {
>              *endptr = nptr;
> @@ -377,6 +379,7 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
>      char *ep;
>      long long lresult;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!nptr) {
>          if (endptr) {
>              *endptr = nptr;
> @@ -433,6 +436,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
>  {
>      char *ep;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!nptr) {
>          if (endptr) {
>              *endptr = nptr;
> @@ -475,6 +479,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
>  {
>      char *ep;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!nptr) {
>          if (endptr) {
>              *endptr = nptr;
> @@ -502,6 +507,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>  {
>      char *ep;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!nptr) {
>          if (endptr) {
>              *endptr = nptr;
> @@ -525,6 +531,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
>  {
>      char *ep;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!nptr) {
>          if (endptr) {
>              *endptr = nptr;
> @@ -657,6 +664,7 @@ int parse_uint(const char *s, unsigned long long *value, char **endptr,
>      char *endp = (char *)s;
>      unsigned long long val = 0;
> 
> +    assert((unsigned) base <= 36 && base != 1);
>      if (!s) {
>          r = -EINVAL;
>          goto out;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

