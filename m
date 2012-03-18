Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9OQT-0005tx-DS
	for mharc-qemu-trivial@gnu.org; Sun, 18 Mar 2012 18:18:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S9OQQ-0005su-Cj
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S9OQM-0001dG-TM
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:18:05 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S9OQM-0001cy-MF
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:18:02 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E7CD372800A1; Sun, 18 Mar 2012 23:18:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id j5k3ogpzV88Z; Sun, 18 Mar 2012 23:18:00 +0100 (CET)
Received: from flocke.weilnetz.de (p5086F20B.dip.t-dialin.net [80.134.242.11])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	20606728009F; Sun, 18 Mar 2012 23:18:00 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1S9OQJ-0005b2-Pq; Sun, 18 Mar 2012 23:17:59 +0100
Message-ID: <4F665F17.1060505@weilnetz.de>
Date: Sun, 18 Mar 2012 23:17:59 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120207 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/3] Add support for target helper
 functions which don't return
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
X-List-Received-Date: Sun, 18 Mar 2012 22:18:07 -0000

Am 18.03.2012 23:14, schrieb Stefan Weil:
> Most functions which handle exceptions don't return.
>
> With a compiler attribute (added by QEMU_NORETURN),
> gcc can optimize the code.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   def-helper.h |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/def-helper.h b/def-helper.h
> index 0e70c31..b98ff69 100644
> --- a/def-helper.h
> +++ b/def-helper.h
> @@ -39,6 +39,7 @@
>   #endif
>   #define dh_alias_ptr ptr
>   #define dh_alias_void void
> +#define dh_alias_noreturn noreturn
>   #define dh_alias_env ptr
>   #define dh_alias(t) glue(dh_alias_, t)
>
> @@ -52,36 +53,42 @@
>   #define dh_ctype_tl target_ulong
>   #define dh_ctype_ptr void *
>   #define dh_ctype_void void
> +#define dh_ctype_noreturn void QEMU_NORETURN
>   #define dh_ctype_env CPUArchState *
>   #define dh_ctype(t) dh_ctype_##t
>
>   /* We can't use glue() here because it falls foul of C preprocessor
>      recursive expansion rules.  */
>   #define dh_retvar_decl0_void void
> +#define dh_retvar_decl0_noreturn void
>   #define dh_retvar_decl0_i32 TCGv_i32 retval
>   #define dh_retvar_decl0_i64 TCGv_i64 retval
>   #define dh_retvar_decl0_ptr TCGv_ptr retval
>   #define dh_retvar_decl0(t) glue(dh_retvar_decl0_, dh_alias(t))
>
>   #define dh_retvar_decl_void
> +#define dh_retvar_decl_noreturn
>   #define dh_retvar_decl_i32 TCGv_i32 retval,
>   #define dh_retvar_decl_i64 TCGv_i64 retval,
>   #define dh_retvar_decl_ptr TCGv_ptr retval,
>   #define dh_retvar_decl(t) glue(dh_retvar_decl_, dh_alias(t))
>
>   #define dh_retvar_void TCG_CALL_DUMMY_ARG
> +#define dh_retvar_noreturn TCG_CALL_DUMMY_ARG
>   #define dh_retvar_i32 GET_TCGV_i32(retval)
>   #define dh_retvar_i64 GET_TCGV_i64(retval)
>   #define dh_retvar_ptr GET_TCGV_ptr(retval)
>   #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
>
>   #define dh_is_64bit_void 0
> +#define dh_is_64bit_noreturn 0
>   #define dh_is_64bit_i32 0
>   #define dh_is_64bit_i64 1
>   #define dh_is_64bit_ptr (TCG_TARGET_REG_BITS == 64)
>   #define dh_is_64bit(t) glue(dh_is_64bit_, dh_alias(t))
>
>   #define dh_is_signed_void 0
> +#define dh_is_signed_noreturn 0
>   #define dh_is_signed_i32 0
>   #define dh_is_signed_s32 1
>   #define dh_is_signed_i64 0
>    

I'm sorry, these three patches should have been sent to qemu-devel,
not qemu-trivial. Please ignore them for qemu-trivial.

Best regards,

Stefan W.


