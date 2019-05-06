Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNZPL-00064g-Qm
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2019 04:55:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNZPJ-00063D-R1
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 04:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNZPI-0002IX-RE
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 04:55:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hNZPC-000284-Gd; Mon, 06 May 2019 04:55:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25AA730917AF;
	Mon,  6 May 2019 08:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3CB319C4F;
	Mon,  6 May 2019 08:55:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0D0981132B35; Mon,  6 May 2019 10:55:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,  Philippe =?utf-8?Q?M?=
	=?utf-8?Q?athieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Juan Quintela <quintela@redhat.com>,
	David Alan Gilbert <dgilbert@redhat.com>
References: <20190505230140.5661-1-philmd@redhat.com>
Date: Mon, 06 May 2019 10:55:20 +0200
In-Reply-To: <20190505230140.5661-1-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 6 May 2019 01:01:40
	+0200")
Message-ID: <87sgtsrmh3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 06 May 2019 08:55:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/sd/sdcard: Use the
 available enums
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
X-List-Received-Date: Mon, 06 May 2019 08:55:34 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> We already define SDCardModes/SDCardStates as enums. Declare
> the mode/state as enums too, this make gdb debugging sessions
> friendlier: instead of numbers, the mode/state name is displayed.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/sd/sd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index aaab15f3868..a66b3d5b45e 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -96,8 +96,8 @@ struct SDState {
>      BlockBackend *blk;
>      bool spi;
>=20=20
> -    uint32_t mode;    /* current card mode, one of SDCardModes */
> -    int32_t state;    /* current card state, one of SDCardStates */
> +    enum SDCardModes mode;
> +    enum SDCardStates state;
>      uint32_t vhs;
>      bool wp_switch;
>      unsigned long *wp_groups;
> @@ -1640,7 +1640,7 @@ static int cmd_valid_while_locked(SDState *sd, SDRe=
quest *req)
>=20=20
>  int sd_do_command(SDState *sd, SDRequest *req,
>                    uint8_t *response) {
> -    int last_state;
> +    enum SDCardStates last_state;
>      sd_rsp_type_t rtype;
>      int rsplen;

These guys are part of the migration state:

   static const VMStateDescription sd_vmstate =3D {
       .name =3D "sd-card",
       .version_id =3D 1,
       .minimum_version_id =3D 1,
       .pre_load =3D sd_vmstate_pre_load,
       .fields =3D (VMStateField[]) {
           VMSTATE_UINT32(mode, SDState),
           VMSTATE_INT32(state, SDState),
   [...]

Juan, David, are VMSTATE_UINT32() and VMSTATE_INT32() safe to use with
enums?

