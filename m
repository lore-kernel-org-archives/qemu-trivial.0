Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RPx2B-0007RM-UK
	for mharc-qemu-trivial@gnu.org; Mon, 14 Nov 2011 08:57:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RPx27-0007C4-NB
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 08:57:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RPx22-0002Lj-AG
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 08:57:11 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:32809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RPx1u-0002JR-JW; Mon, 14 Nov 2011 08:56:58 -0500
Received: by eyh6 with SMTP id 6so5521989eyh.4
	for <multiple recipients>; Mon, 14 Nov 2011 05:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=7pzrGZwqy/ot2Is/oLeK5BUHNLkzVmZO2louUuurN/Q=;
	b=J0W30gyBUpsA1yCqZgGEgMGbZDRzDUEvlDvkN8XCbso9IaGC7YNQWlfLSpQq7XWf70
	5ueOmspQQW4A5vqFbfOz0/AJeAq6fR4og1l1skVDhJQMt/iGtiBf1w+FMoyevlv6Wuq8
	Osfu3IwaF39xSdVj9En3oBFt3V8ACY/apheLE=
MIME-Version: 1.0
Received: by 10.180.109.106 with SMTP id hr10mr26105710wib.9.1321279016144;
	Mon, 14 Nov 2011 05:56:56 -0800 (PST)
Received: by 10.180.85.165 with HTTP; Mon, 14 Nov 2011 05:56:56 -0800 (PST)
In-Reply-To: <20111111160420.787aee5c@revolver>
References: <20111111125818.444e400b@revolver> <4EBD3004.3080301@codemonkey.ws>
	<20111111160420.787aee5c@revolver>
Date: Mon, 14 Nov 2011 13:56:56 +0000
Message-ID: <CAJSP0QWfFk8JoTZX=JKy9pY26aBmH5Go3JyFZxKwriJgGz67Wg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] make user networking
 hostfwd work with restrict=y
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
X-List-Received-Date: Mon, 14 Nov 2011 13:57:13 -0000

On Fri, Nov 11, 2011 at 3:04 PM, Gertjan Halkes <qemu@ghalkes.nl> wrote:
> On Fri, 11 Nov 2011 08:24:04 -0600, Anthony Liguori <anthony@codemonkey.w=
s>
> wrote:
>
>>Please submit against qemu.git master with a Signed-off-by.
>
> Ok, here goes:
>
> This patch allows the hostfwd option to override the restrict=3Dy setting=
 in
> the user network stack, as explicitly stated in the documentation on the
> restrict option:
>
> =A0 =A0 restrict=3Don|off
> =A0 =A0 =A0 =A0 If this option is enabled, the guest will be isolated, i.=
e. it
> =A0 =A0 =A0 =A0 will not be able to contact the host and no guest IP pack=
ets
> =A0 =A0 =A0 =A0 will be routed over the host to the outside. This option =
does
> =A0 =A0 =A0 =A0 not affect any explicitly set forwarding rules.
>
> Qemu bug tracker:
> https://bugs.launchpad.net/qemu/+bug/829455
>
> Signed-off-by: Gertjan Halkes <qemu@ghalkes.nl>
> ---
> =A0slirp/tcp_input.c | =A0 28 +++++++++++++++++-----------
> =A01 files changed, 17 insertions(+), 11 deletions(-)

Jan: Want to take a look at this as SLIRP maintainer?

> diff --git a/slirp/tcp_input.c b/slirp/tcp_input.c
> index 942aaf4..ed09c27 100644
> --- a/slirp/tcp_input.c
> +++ b/slirp/tcp_input.c
> @@ -316,16 +316,6 @@ tcp_input(struct mbuf *m, int iphlen, struct socket =
*inso)
> =A0 =A0 =A0 =A0m->m_data +=3D sizeof(struct tcpiphdr)+off-sizeof(struct t=
cphdr);
> =A0 =A0 =A0 =A0m->m_len =A0-=3D sizeof(struct tcpiphdr)+off-sizeof(struct=
 tcphdr);
>
> - =A0 =A0if (slirp->restricted) {
> - =A0 =A0 =A0 =A0for (ex_ptr =3D slirp->exec_list; ex_ptr; ex_ptr =3D ex_=
ptr->ex_next) {
> - =A0 =A0 =A0 =A0 =A0 =A0if (ex_ptr->ex_fport =3D=3D ti->ti_dport &&
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ti->ti_dst.s_addr =3D=3D ex_ptr->ex_addr=
.s_addr) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> - =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0if (!ex_ptr)
> - =A0 =A0 =A0 =A0 =A0 =A0goto drop;
> - =A0 =A0}
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Locate pcb for segment.
> =A0 =A0 =A0 =A0 */
> @@ -354,7 +344,23 @@ findso:
> =A0 =A0 =A0 =A0 * the only flag set, then create a session, mark it
> =A0 =A0 =A0 =A0 * as if it was LISTENING, and continue...
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 =A0if (so =3D=3D NULL) {
> + =A0 =A0if (so =3D=3D NULL) {
> + =A0 =A0 =A0 =A0if (slirp->restricted) {
> + =A0 =A0 =A0 =A0 =A0 =A0/* Any hostfwds will have an existing socket, so=
 we only get here
> + =A0 =A0 =A0 =A0 =A0 =A0 * for non-hostfwd connections. These should be =
dropped, unless it
> + =A0 =A0 =A0 =A0 =A0 =A0 * happens to be a guestfwd.
> + =A0 =A0 =A0 =A0 =A0 =A0 */
> + =A0 =A0 =A0 =A0 =A0 =A0for (ex_ptr =3D slirp->exec_list; ex_ptr; ex_ptr=
 =3D ex_ptr->ex_next) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ex_ptr->ex_fport =3D=3D ti->ti_dport=
 &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ti->ti_dst.s_addr =3D=3D ex_ptr-=
>ex_addr.s_addr) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0if (!ex_ptr) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto dropwithreset;
> + =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0}
> +
> =A0 =A0 =A0 =A0 =A0if ((tiflags & (TH_SYN|TH_FIN|TH_RST|TH_URG|TH_ACK)) !=
=3D TH_SYN)
> =A0 =A0 =A0 =A0 =A0 =A0goto dropwithreset;
>
> --
> 1.7.1
>
>
>

