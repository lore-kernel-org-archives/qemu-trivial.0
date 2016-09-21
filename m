Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmgPs-0002rj-T4
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 08:14:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bmgPo-0002nc-Lm
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 08:14:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bmgPm-000590-J4
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 08:14:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bmgPe-00052B-J8; Wed, 21 Sep 2016 08:14:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B58BB6F52;
	Wed, 21 Sep 2016 12:14:06 +0000 (UTC)
Received: from localhost (ovpn-116-19.phx2.redhat.com [10.3.116.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8LCE3qS008184; Wed, 21 Sep 2016 08:14:05 -0400
Date: Wed, 21 Sep 2016 09:14:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, armbru@redhat.com, imammedo@redhat.com,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20160921121402.GI3233@thinpad.lan.raisama.net>
References: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 21 Sep 2016 12:14:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] monitor: fix crash for platforms without
 a CPU 0
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
X-List-Received-Date: Wed, 21 Sep 2016 12:14:20 -0000

On Wed, Sep 21, 2016 at 03:29:26PM +1000, David Gibson wrote:
> Now that we allow CPU hot unplug on a few platforms, we can end up in a
> situation where we don't have a CPU with index 0.  Or at least we could=
,
> if we didn't have code to explicitly prohibit unplug of CPU 0.
>=20
> Longer term we want to allow CPU 0 unplug, this patch is an early step =
in
> allowing this, by removing an assumption in the monitor code that CPU 0
> always exists.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> [dwg: Rewrote commit message to better explain background]
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Anyone want to volunteer to take this through their tree?  If not, I
> can take it through my ppc tree.
>=20
> diff --git a/monitor.c b/monitor.c
> index 8bb8bbf..83c4edf 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1025,7 +1025,7 @@ int monitor_set_cpu(int cpu_index)
>  CPUState *mon_get_cpu(void)
>  {
>      if (!cur_mon->mon_cpu) {
> -        monitor_set_cpu(0);
> +        monitor_set_cpu(first_cpu->cpu_index);

So, we are replacing the "CPU 0 always exists" assumption with a
"first_cpu is always non-NULL" assumption.

But considering that the first_cpu assumption already exists
elsewhere and those cases can be found easily using grep, I think
this is OK. So:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

BTW, it is also possible to crash QEMU by unplugging the current
monitor CPU;

  (qemu) device_add qemu64-x86_64-cpu,socket-id=3D2,core-id=3D0,thread-id=
=3D0,id=3Dmycpu
  (qemu) cpu 2
  (qemu) device_del mycpu
  (qemu) info registers
  qemu:qemu_cpu_kick_thread: No such process
  $=20

--=20
Eduardo

