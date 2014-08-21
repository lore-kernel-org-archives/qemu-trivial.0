Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKOac-0002rU-Ln
	for mharc-qemu-trivial@gnu.org; Thu, 21 Aug 2014 05:23:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XKOaU-0002n1-38
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XKOaO-00089q-Ps
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:23:17 -0400
Received: from mail-la0-f50.google.com ([209.85.215.50]:53727)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XKOaO-00089a-JO
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:23:12 -0400
Received: by mail-la0-f50.google.com with SMTP id pi18so8339469lab.37
	for <qemu-trivial@nongnu.org>; Thu, 21 Aug 2014 02:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RJVatXcab5heMW4hgIUoiR3rEJOo34Uc7nebgEUfQ/E=;
	b=Oygkngo/5gpCnO9ZD2rLqe/bJ3mC/LH2AE4zy0SoQ19uu4AoT3V9vw5JywS4Sxcy3g
	8phu8wWxSCvfRCA3fAKaG47nhX9sseQvvwtfUMYhL1pFlsBGg/BGUQZEBaBqcO6A5kZ4
	1zyLEQ719MQyLr0NjytzuqPNvjzc/ZTqxA0MiOKhO2HjE5Z3jz2xPJd8gLfvvpskaKqA
	kEKVEdRuP/xa7vsNu9ZhVQuEUbQpWy1or0jmurr2RAKHeKdIZxFgCuc/ou0LnAy6+lr0
	vK6QExVKRSZpPV0yEUqwStNrx4KA0AnThKPiSY9czshAHetXgRXG+bxHN00XTHc8vUax
	L9uQ==
X-Gm-Message-State: ALoCoQmeXWBqsXiZqsanFcI1tgie1DIaiL9BI5fRR7Z3TKuo5LbA7L/Zzx1CzK0SkLZF4gS387zy
X-Received: by 10.112.35.44 with SMTP id e12mr44546868lbj.13.1408612991680;
	Thu, 21 Aug 2014 02:23:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 21 Aug 2014 02:22:51 -0700 (PDT)
In-Reply-To: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
References: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Aug 2014 10:22:51 +0100
Message-ID: <CAFEAcA_bCOTLT1jvvJp+Wtaah43qb-UQgzxRuZc3WcyzNPrjSw@mail.gmail.com>
To: Johny Mattsson <jmattsson@dius.com.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix pflash_cfi01 to restore
 flash command/array state after migration
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
X-List-Received-Date: Thu, 21 Aug 2014 09:23:24 -0000

On 21 August 2014 08:35, Johny Mattsson <jmattsson@dius.com.au> wrote:
> When using snapshots on e.g. the VersatilePB board, the pflash driver
> would report an error and get reset at times after resuming the snapshot.
> This was traced down to the 'romd' flag in the pflash emulation which was
> not being persisted in the snapshot.
>
> Author: Bernd Meyer <bmeyer@dius.com.au>
> Signed-off-by: Johny Mattsson <jmattsson@dius.com.au>

Paolo -- remind me, is it the device model's job to keep track of
what its memory regions are doing, rather than the memory region's
job to make sure it's migrated? I definitely remember having this
argument with Avi before but I can't remember the outcome...

> ---
>  hw/block/pflash_cfi01.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index f9507b4..83cb1d3 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -80,6 +80,7 @@ struct pflash_t {
>      int ro;
>      uint8_t cmd;
>      uint8_t status;
> +    uint8_t romd;
>      uint16_t ident0;
>      uint16_t ident1;
>      uint16_t ident2;
> @@ -94,14 +95,25 @@ struct pflash_t {
>      void *storage;
>  };
>
> +static int sync_romd(void* opaque, int version_id)
> +{
> +  (void)version_id;
> +  pflash_t *pfl = opaque;
> +
> +  memory_region_rom_device_set_romd(&pfl->mem,!!pfl->romd);
> +  return 0;
> +}
> +
>  static const VMStateDescription vmstate_pflash = {
>      .name = "pflash_cfi01",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .post_load = sync_romd,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(wcycle, pflash_t),
>          VMSTATE_UINT8(cmd, pflash_t),
>          VMSTATE_UINT8(status, pflash_t),
> +        VMSTATE_UINT8(romd, pflash_t),
>          VMSTATE_UINT64(counter, pflash_t),
>          VMSTATE_END_OF_LIST()

Isn't this a migration format change in a device that's in
the PC model? That probably needs thought to avoid
migration-compatibility breaks...

>      }
> @@ -114,6 +126,7 @@ static void pflash_timer (void *opaque)
>      DPRINTF("%s: command %02x done\n", __func__, pfl->cmd);
>      /* Reset flash */
>      pfl->status ^= 0x80;
> +    pfl->romd=1;
>      memory_region_rom_device_set_romd(&pfl->mem, true);
>      pfl->wcycle = 0;
>      pfl->cmd = 0;
> @@ -453,6 +466,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
>
>      if (!pfl->wcycle) {
>          /* Set the device in I/O access mode */
> +        pfl->romd=0;
>          memory_region_rom_device_set_romd(&pfl->mem, false);
>      }
>
> @@ -638,6 +652,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
>                    "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
>
>   reset_flash:
> +    pfl->romd=1;
>      memory_region_rom_device_set_romd(&pfl->mem, true);
>
>      pfl->wcycle = 0;
> @@ -804,6 +819,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error
> **errp)
>      pfl->wcycle = 0;
>      pfl->cmd = 0;
>      pfl->status = 0;
> +    pfl->romd = 1;
>      /* Hardcoded CFI table */
>      pfl->cfi_len = 0x52;
>      /* Standard "QRY" string */
> --
> 2.0.0


thanks
-- PMM

