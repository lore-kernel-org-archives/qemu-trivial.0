Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiO7F-0006Fd-Bk
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 08:07:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UiO79-000673-4Q
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UiO77-00071f-T6
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:07:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UiO74-00071B-L5; Fri, 31 May 2013 08:07:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CC68642B55;
	Fri, 31 May 2013 16:07:16 +0400 (MSK)
Message-ID: <51A89273.8010400@msgid.tls.msk.ru>
Date: Fri, 31 May 2013 16:07:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Thomas Schwinge <thomas@codesourcery.com>
References: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
In-Reply-To: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] fpu: Simplify floatx80ToCommonNaN
	function.
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
X-List-Received-Date: Fri, 31 May 2013 12:07:28 -0000

31.05.2013 13:39, Thomas Schwinge wrote:
> Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
> ---
>  fpu/softfloat-specialize.h |   15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git fpu/softfloat-specialize.h fpu/softfloat-specialize.h
> index 518f694..83add1a 100644
> --- fpu/softfloat-specialize.h
> +++ fpu/softfloat-specialize.h
> @@ -934,15 +934,14 @@ static commonNaNT floatx80ToCommonNaN( floatx80 a STATUS_PARAM)
>      commonNaNT z;
>  
>      if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
> -    if ( a.low >> 63 ) {
> -        z.sign = a.high >> 15;
> -        z.low = 0;
> -        z.high = a.low << 1;
> -    } else {
> -        z.sign = floatx80_default_nan_high >> 15;
> -        z.low = 0;
> -        z.high = floatx80_default_nan_low << 1;
> +    /* Replace a Pseudo NaN with a default NaN.  */
> +    if (!(a.low >> 63)) {
> +        a.low = floatx80_default_nan_low;
> +        a.high = floatx80_default_nan_high;
>      }
> +    z.sign = a.high >> 15;
> +    z.low = 0;
> +    z.high = a.low << 1;
>      return z;
>  }

Hmm. And where's the simplification?  Here's context diff for the same:

*** fpu/softfloat-specialize.h.orig	2013-05-31 16:02:51.614710351 +0400
--- fpu/softfloat-specialize.h	2013-05-31 16:02:59.838820308 +0400
***************
*** 936,946 ****
      if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
!     if ( a.low >> 63 ) {
!         z.sign = a.high >> 15;
!         z.low = 0;
!         z.high = a.low << 1;
!     } else {
!         z.sign = floatx80_default_nan_high >> 15;
!         z.low = 0;
!         z.high = floatx80_default_nan_low << 1;
      }
      return z;
--- 936,945 ----
      if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
!     /* Replace a Pseudo NaN with a default NaN.  */
!     if (!(a.low >> 63)) {
!         a.low = floatx80_default_nan_low;
!         a.high = floatx80_default_nan_high;
      }
+     z.sign = a.high >> 15;
+     z.low = 0;
+     z.high = a.low << 1;
      return z;


Yes, your version is 3 lines shorter, because it
does not have extra else{} (2 lines) and the
remaining if() construct is one line shorter too,
due to moving z.low=0 construct into common place.

But I don't think your version is more readable, --
before it was easy to understand what is going on,
we had two easy case with all right stuff done for
each case.  Now we do some preparation before, so
the common case works.

Generated code should be about the same anyway, but
to me (IMHO!), original code is a bit more readable.

Thanks,

/mjt

