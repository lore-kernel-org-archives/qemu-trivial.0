Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHtqj-0004AC-H9
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:18:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHtqh-00047n-6U
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:18:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHtqa-000500-9Y
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:18:46 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:32901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHtqa-0004zf-4F
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:18:40 -0400
Received: by mail-vk0-x229.google.com with SMTP id j3so23874308vkb.0
	for <qemu-trivial@nongnu.org>; Tue, 28 Jun 2016 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i+UtviPWOkWVPJitNT+U1kzpR8kEBW4b6rxfS5v2RiI=;
	b=Jt98MjC7XkEtTENZ8rNpInPxLsckc9m147DzIdxYIqXajyeJNtucengu/Zn6Eo5Yj5
	VO5tN6YR9F0LyV5MaSCu3wdqvwhFO0unoX3xTa/Jyz0jTXinTNoqiZbH9IommzU5zZt4
	JHSUPXhn85cy4CIdzGZyi8N9VGnv3NEebxG9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i+UtviPWOkWVPJitNT+U1kzpR8kEBW4b6rxfS5v2RiI=;
	b=OPaShyOVfxnMoM5yiH14MddM0nQ73LpdQH2s7f2h4TuANt+sRQ/DZM7jriYO4VmxZr
	dUZ9I/Of8MCg/gx1r0mk39gHl/Td+vhPm3XoMX/yiokJJtB3slQVfobL5GgcdXqk75OP
	HoXSFGpnsdr4k26imvoYrcxPRzYpMtRp4qPqbU3FqZjmXOgn7fljUaCdiqhzgUaM/0hm
	6j+OSvxLjEk7wPPzUBmjnY4T6RBRmQRNjHHJqPwuTpbM1hMT7QedPlcrJZ306mvadu8D
	tfxXbNX2XnnVNM4vjaQelSGxcTzelA7pKKVC7x6dpmo9kwFEOgaI7RMxTwjsaEZJYs4r
	sr4A==
X-Gm-Message-State: ALyK8tIwA5hqhOmINoioa2gTmP+ULFUCcssnEhFOJoSOZXlLajaDF17ekvA9d18sQFBKFZswJo7wyg3Y8vd4gAWt
X-Received: by 10.176.65.106 with SMTP id j97mr733953uad.64.1467123519672;
	Tue, 28 Jun 2016 07:18:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 07:18:20 -0700 (PDT)
In-Reply-To: <1466093402-18143-1-git-send-email-peter.maydell@linaro.org>
References: <1466093402-18143-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 15:18:20 +0100
Message-ID: <CAFEAcA-TwZ-NqgVE0jpnX2uUZO9mmeaJHYn==547ssxDBTx4oA@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/bt: Don't use
 cpu_to_*w() and *_to_cpup()
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
X-List-Received-Date: Tue, 28 Jun 2016 14:18:48 -0000

Ping?

thanks
-- PMM

On 16 June 2016 at 17:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> Don't use cpu_to_*w() and *_to_cpup() to do byte-swapped loads
> and stores; instead use ld*_p() and st*_p() which correctly handle
> misaligned accesses.
>
> Bring the HNDL() macro into line with how we deal with
> PARAMHANDLE(), by using cpu_to_le16() rather than an ifdef
> HOST_WORDS_BIGENDIAN.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/bt/hci.c   | 10 +++-------
>  hw/bt/l2cap.c | 12 ++++++------
>  2 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/hw/bt/hci.c b/hw/bt/hci.c
> index 7d52205..351123f 100644
> --- a/hw/bt/hci.c
> +++ b/hw/bt/hci.c
> @@ -426,11 +426,7 @@ static void bt_submit_raw_acl(struct bt_piconet_s *net, int length, uint8_t *dat
>   * be continuously allocated.  We do it though, to preserve similar
>   * behaviour between hosts.  Some things, like the BD_ADDR cannot be
>   * preserved though (for example if a real hci is used).  */
> -#ifdef HOST_WORDS_BIGENDIAN
> -# define HNDL(raw)     bswap16(raw)
> -#else
> -# define HNDL(raw)     (raw)
> -#endif
> +#define HNDL(raw) cpu_to_le16(raw)
>
>  static const uint8_t bt_event_reserved_mask[8] = {
>      0xff, 0x9f, 0xfb, 0xff, 0x07, 0x18, 0x00, 0x00,
> @@ -1504,8 +1500,8 @@ static void bt_submit_hci(struct HCIInfo *info,
>          return;
>
>  #define PARAM(cmd, param)      (((cmd##_cp *) data)->param)
> -#define PARAM16(cmd, param)    le16_to_cpup(&PARAM(cmd, param))
> -#define PARAMHANDLE(cmd)       HNDL(PARAM(cmd, handle))
> +#define PARAM16(cmd, param) lduw_le_p(&PARAM(cmd, param))
> +#define PARAMHANDLE(cmd) PARAM16(cmd, handle)
>  #define LENGTH_CHECK(cmd)      if (length < sizeof(cmd##_cp)) goto short_hci
>      /* Note: the supported commands bitmask in bt_hci_read_local_commands_rp
>       * needs to be updated every time a command is implemented here!  */
> diff --git a/hw/bt/l2cap.c b/hw/bt/l2cap.c
> index dfc95ed..e342045 100644
> --- a/hw/bt/l2cap.c
> +++ b/hw/bt/l2cap.c
> @@ -526,9 +526,9 @@ static int l2cap_channel_config(struct l2cap_instance_s *l2cap,
>              }
>
>              /* MTU */
> -            val = le16_to_cpup((void *) opt->val);
> +            val = lduw_le_p(opt->val);
>              if (val < ch->min_mtu) {
> -                cpu_to_le16w((void *) opt->val, ch->min_mtu);
> +                stw_le_p(opt->val, ch->min_mtu);
>                  result = L2CAP_CONF_UNACCEPT;
>                  break;
>              }
> @@ -543,7 +543,7 @@ static int l2cap_channel_config(struct l2cap_instance_s *l2cap,
>              }
>
>              /* Flush Timeout */
> -            val = le16_to_cpup((void *) opt->val);
> +            val = lduw_le_p(opt->val);
>              if (val < 0x0001) {
>                  opt->val[0] = 0xff;
>                  opt->val[1] = 0xff;
> @@ -987,7 +987,7 @@ static void l2cap_bframe_in(struct l2cap_chan_s *ch, uint16_t cid,
>  static void l2cap_iframe_in(struct l2cap_chan_s *ch, uint16_t cid,
>                  const l2cap_hdr *hdr, int len)
>  {
> -    uint16_t fcs = le16_to_cpup((void *) (hdr->data + len - 2));
> +    uint16_t fcs = lduw_le_p(hdr->data + len - 2);
>
>      if (len < 4)
>          goto len_error;
> @@ -1002,7 +1002,7 @@ static void l2cap_iframe_in(struct l2cap_chan_s *ch, uint16_t cid,
>              /* TODO: Signal an error? */
>              return;
>          }
> -        l2cap_sframe_in(ch, le16_to_cpup((void *) hdr->data));
> +        l2cap_sframe_in(ch, lduw_le_p(hdr->data));
>          return;
>      }
>
> @@ -1022,7 +1022,7 @@ static void l2cap_iframe_in(struct l2cap_chan_s *ch, uint16_t cid,
>          if (len - 6 > ch->mps)
>              goto len_error;
>
> -        ch->len_total = le16_to_cpup((void *) (hdr->data + 2));
> +        ch->len_total = lduw_le_p(hdr->data + 2);
>          if (len >= 6 + ch->len_total)
>              goto seg_error;
>
> --
> 1.9.1
>
>

