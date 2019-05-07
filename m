Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNxHz-0007Bt-7Q
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2019 06:25:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hNxHw-00079V-0T
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 06:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hNxHu-0002PH-11
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 06:25:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1hNxHm-0002E7-LU; Tue, 07 May 2019 06:25:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27B4281F19;
	Tue,  7 May 2019 10:25:17 +0000 (UTC)
Received: from work-vm (ovpn-116-183.ams2.redhat.com [10.36.116.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AEDC2854E;
	Tue,  7 May 2019 10:25:13 +0000 (UTC)
Date: Tue, 7 May 2019 11:25:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Juan Quintela <quintela@redhat.com>
Message-ID: <20190507102510.GA2752@work-vm>
References: <20190505230140.5661-1-philmd@redhat.com>
	<87sgtsrmh3.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87sgtsrmh3.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 07 May 2019 10:25:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 07 May 2019 10:25:33 -0000

* Markus Armbruster (armbru@redhat.com) wrote:
> Philippe Mathieu-Daud=E9 <philmd@redhat.com> writes:
>=20
> > We already define SDCardModes/SDCardStates as enums. Declare
> > the mode/state as enums too, this make gdb debugging sessions
> > friendlier: instead of numbers, the mode/state name is displayed.
> >
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > ---
> >  hw/sd/sd.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> > index aaab15f3868..a66b3d5b45e 100644
> > --- a/hw/sd/sd.c
> > +++ b/hw/sd/sd.c
> > @@ -96,8 +96,8 @@ struct SDState {
> >      BlockBackend *blk;
> >      bool spi;
> > =20
> > -    uint32_t mode;    /* current card mode, one of SDCardModes */
> > -    int32_t state;    /* current card state, one of SDCardStates */
> > +    enum SDCardModes mode;
> > +    enum SDCardStates state;
> >      uint32_t vhs;
> >      bool wp_switch;
> >      unsigned long *wp_groups;
> > @@ -1640,7 +1640,7 @@ static int cmd_valid_while_locked(SDState *sd, =
SDRequest *req)
> > =20
> >  int sd_do_command(SDState *sd, SDRequest *req,
> >                    uint8_t *response) {
> > -    int last_state;
> > +    enum SDCardStates last_state;
> >      sd_rsp_type_t rtype;
> >      int rsplen;
>=20
> These guys are part of the migration state:
>=20
>    static const VMStateDescription sd_vmstate =3D {
>        .name =3D "sd-card",
>        .version_id =3D 1,
>        .minimum_version_id =3D 1,
>        .pre_load =3D sd_vmstate_pre_load,
>        .fields =3D (VMStateField[]) {
>            VMSTATE_UINT32(mode, SDState),
>            VMSTATE_INT32(state, SDState),
>    [...]
>=20
> Juan, David, are VMSTATE_UINT32() and VMSTATE_INT32() safe to use with
> enums?

I think that is compiler dependent, so no.

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

