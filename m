Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZ071-0007Nf-2h
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 13:21:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZZ06y-0007KJ-OU
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 13:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZZ06x-0003W7-Jh
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 13:21:44 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:34713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZZ06v-0003QT-Bh; Mon, 07 Sep 2015 13:21:41 -0400
Received: by wicfx3 with SMTP id fx3so95048320wic.1;
	Mon, 07 Sep 2015 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mhOtqmRTmMsehJNxn4zpptC5POn7siQmnto4ntKPErU=;
	b=UZc54pJKoKlsR0IIuQp9ZKOH3IW8N+6kiGk8Mwvr1zHK8waVgcgYvAP2lEgQzCzNIc
	OOXdjvhNt0B3bCOdm5dK3Rb6XWEAdNq0sqWfzI2FGh67Z2ZuftGCuSmtWOsxDiKiXy8I
	vVzB667EpyVBs7BZxLdjSOvmm9c+ccSU8mH5APpYXxbTAxqiXC3WLG/ki/O6EBecsdUv
	RSUaOCGj8MpvbEbO8yZ7uYCxk0rw7cD1t9epHrh7aqa3cTEfuq4QA9492cETv3Kml+69
	e1maN+yJarhhXVmdzlZExi2TxO+Gr6gANKGIWlGoZtCLW0F0K6k/eHqs0oc/ZFVnYWoV
	Wgrw==
MIME-Version: 1.0
X-Received: by 10.194.189.236 with SMTP id gl12mr22420046wjc.151.1441646500561;
	Mon, 07 Sep 2015 10:21:40 -0700 (PDT)
Received: by 10.28.134.18 with HTTP; Mon, 7 Sep 2015 10:21:40 -0700 (PDT)
In-Reply-To: <1441608340-26983-2-git-send-email-saipava@xilinx.com>
References: <1441608340-26983-1-git-send-email-saipava@xilinx.com>
	<1441608340-26983-2-git-send-email-saipava@xilinx.com>
Date: Mon, 7 Sep 2015 10:21:40 -0700
Message-ID: <CAPokK=rKa8hYWbtX7DGkUySFx1496B7yOMHM2MRvS0-ud=o3sw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	Alistair Francis <alistai@xilinx.com>
Subject: Re: [Qemu-trivial] [PATCH V3 2/2] sdhci: Change debug prints to
	compile unconditionally
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
X-List-Received-Date: Mon, 07 Sep 2015 17:21:45 -0000

On Sun, Sep 6, 2015 at 11:45 PM, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
> Conditionaly compilation hides few type mismatch warnings, fix it to

"conditional"

> compile unconditioinal.
>

"unconditionally"

> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Suggested-by: Eric Blake <eblake@redhat.com>

Otherwise:

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Can trivial take these two?

Regards,
Peter

> ---
>  hw/sd/sdhci.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 639feee..3ad6c76 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -37,24 +37,24 @@
>  #define SDHC_DEBUG                        0
>  #endif
>
> -#if SDHC_DEBUG == 0
> -    #define DPRINT_L1(fmt, args...)       do { } while (0)
> -    #define DPRINT_L2(fmt, args...)       do { } while (0)
> -    #define ERRPRINT(fmt, args...)        do { } while (0)
> -#elif SDHC_DEBUG == 1
> -    #define DPRINT_L1(fmt, args...)       \
> -        do {fprintf(stderr, "QEMU SDHC: "fmt, ## args); } while (0)
> -    #define DPRINT_L2(fmt, args...)       do { } while (0)
> -    #define ERRPRINT(fmt, args...)        \
> -        do {fprintf(stderr, "QEMU SDHC ERROR: "fmt, ## args); } while (0)
> -#else
> -    #define DPRINT_L1(fmt, args...)       \
> -        do {fprintf(stderr, "QEMU SDHC: "fmt, ## args); } while (0)
> -    #define DPRINT_L2(fmt, args...)       \
> -        do {fprintf(stderr, "QEMU SDHC: "fmt, ## args); } while (0)
> -    #define ERRPRINT(fmt, args...)        \
> -        do {fprintf(stderr, "QEMU SDHC ERROR: "fmt, ## args); } while (0)
> -#endif
> +#define DPRINT_L1(fmt, args...) \
> +    do { \
> +        if (SDHC_DEBUG) { \
> +            fprintf(stderr, "QEMU SDHC: " fmt, ## args); \
> +        } \
> +    } while (0)
> +#define DPRINT_L2(fmt, args...) \
> +    do { \
> +        if (SDHC_DEBUG > 1) { \
> +            fprintf(stderr, "QEMU SDHC: " fmt, ## args); \
> +        } \
> +    } while (0)
> +#define ERRPRINT(fmt, args...) \
> +    do { \
> +        if (SDHC_DEBUG) { \
> +            fprintf(stderr, "QEMU SDHC ERROR: " fmt, ## args); \
> +        } \
> +    } while (0)
>
>  /* Default SD/MMC host controller features information, which will be
>   * presented in CAPABILITIES register of generic SD host controller at reset.
> --
> 1.9.1
>

