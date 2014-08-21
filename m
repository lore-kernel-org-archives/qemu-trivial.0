Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKOyy-0004go-Hf
	for mharc-qemu-trivial@gnu.org; Thu, 21 Aug 2014 05:48:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XKOyr-0004Yb-U6
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XKOym-0001AO-UG
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:48:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XKOyb-00016v-Uu; Thu, 21 Aug 2014 05:48:14 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7L9mBUY024171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 21 Aug 2014 05:48:12 -0400
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7L9m9YQ017689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 21 Aug 2014 05:48:10 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A3FF5303FEC9; Thu, 21 Aug 2014 11:48:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Johny Mattsson <jmattsson@dius.com.au>
References: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
Date: Thu, 21 Aug 2014 11:48:08 +0200
In-Reply-To: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
	(Johny Mattsson's message of "Thu, 21 Aug 2014 17:35:25 +1000")
Message-ID: <87egwab2cn.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
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
X-List-Received-Date: Thu, 21 Aug 2014 09:48:35 -0000

I'm afraid this is *not* trivial.  Migration stuff rarely is :)

Johny Mattsson <jmattsson@dius.com.au> writes:

> When using snapshots on e.g. the VersatilePB board, the pflash driver
> would report an error and get reset at times after resuming the snapshot.
> This was traced down to the 'romd' flag in the pflash emulation which was
> not being persisted in the snapshot.
>
> Author: Bernd Meyer <bmeyer@dius.com.au>
> Signed-off-by: Johny Mattsson <jmattsson@dius.com.au>
>
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
>      }

Doesn't this break migration to/from unfixed versions?

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
> @@ -804,6 +819,7 @@ static void pflash_cfi01_realize(DeviceState *dev,
> Error **errp)
>      pfl->wcycle = 0;
>      pfl->cmd = 0;
>      pfl->status = 0;
> +    pfl->romd = 1;
>      /* Hardcoded CFI table */
>      pfl->cfi_len = 0x52;
>      /* Standard "QRY" string */
> -- 
> 2.0.0

I suspect you need a subsection.  Initialize ->romd = 1, then let the
subsection override it.

