Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zfb10-0006JB-M2
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 17:58:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zfb0y-0006IC-Tm
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zfb0v-0004LR-OT
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:58:48 -0400
Received: from mail-vk0-f52.google.com ([209.85.213.52]:36858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zfb0v-0004LA-Lx
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:58:45 -0400
Received: by vkfp126 with SMTP id p126so64168456vkf.3
	for <qemu-trivial@nongnu.org>; Fri, 25 Sep 2015 14:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h/tZZOQ31mgjzUz9d44Pt5byX9jAcOM0dr6dkkkIJhY=;
	b=DP2rPz66cVgbRs/n2OXCu1SaCg68XHXwOZIZyDPkiVFZkO4Ss+dBOmI0SK4w8vquLN
	haQZnsSBh41dSL1GzleChOnTgMugbQYUWZYlftrbrIr85dI97G0mOkiZx1gMG2EKsfgE
	AIj1wEwg1lc3k7dI+At7L/DxWdahNFSfCv+Uif1lfTIF23qshRveud0jn/8gFaE+JT3a
	X5NX57hxGGZEfs0PxJURg6CHE3Z515a0k/rNZsaIouI3MPNCuwyXZ1KVlmAnk8GzmVC8
	eGFbYo+sC+8aw181yaBEtD/J0y9Afr8aUROUB6axVlLt8ONHfsG1yx6vAQ8XTtwYcs+0
	pbDg==
X-Gm-Message-State: ALoCoQnmLrQblJJA1Nke6TEdcauQ6rVegbX9GT4xOnOc/2FW2xI4dcAB2eCIcxRLHZRK0G++0OE0
X-Received: by 10.31.14.15 with SMTP id 15mr4707291vko.82.1443218325200; Fri,
	25 Sep 2015 14:58:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 25 Sep 2015 14:58:25 -0700 (PDT)
In-Reply-To: <1443213733-9807-1-git-send-email-sw@weilnetz.de>
References: <1443213733-9807-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Sep 2015 14:58:25 -0700
Message-ID: <CAFEAcA-tmZ_HhYL+v-fu_aFRbxBUytG_qiaKKuHoNBNMMw7+ug@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-arm: Add missing 'static'
	attribute
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
X-List-Received-Date: Fri, 25 Sep 2015 21:58:49 -0000

On 25 September 2015 at 13:42, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8367997..584f6df 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5194,7 +5194,7 @@ void switch_mode(CPUARMState *env, int mode)
>   *        BIT IRQ     IMO      Non-secure         Secure
>   *        EL3 FIQ  RW FMO   EL0 EL1 EL2 EL3   EL0 EL1 EL2 EL3
>   */
> -const int8_t target_el_table[2][2][2][2][2][4] = {
> +static const int8_t target_el_table[2][2][2][2][2][4] = {
>      {{{{/* 0   0   0   0 */{ 1,  1,  2, -1 },{ 3, -1, -1,  3 },},
>         {/* 0   0   0   1 */{ 2,  2,  2, -1 },{ 3, -1, -1,  3 },},},
>        {{/* 0   0   1   0 */{ 1,  1,  2, -1 },{ 3, -1, -1,  3 },},
> --
> 2.1.4

Applied to target-arm.next, thanks.

-- PMM

