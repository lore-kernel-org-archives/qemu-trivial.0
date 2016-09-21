Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmfpJ-0000G6-Rb
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 07:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bmfpD-00006i-On
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 07:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bmfpB-0000S7-Qe
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 07:36:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bmfp2-0000NL-Of; Wed, 21 Sep 2016 07:36:16 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE77B3D954;
	Wed, 21 Sep 2016 11:36:15 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8LBaDNj008706; Wed, 21 Sep 2016 07:36:14 -0400
Date: Wed, 21 Sep 2016 13:36:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
	armbru@redhat.com, lcapitulino@redhat.com, qemu-ppc@nongnu.org,
	=?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20160921133613.13684d80@nial.brq.redhat.com>
In-Reply-To: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
References: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 21 Sep 2016 11:36:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: fix crash for
 platforms without a CPU 0
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
X-List-Received-Date: Wed, 21 Sep 2016 11:36:31 -0000

On Wed, 21 Sep 2016 15:29:26 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> Now that we allow CPU hot unplug on a few platforms, we can end up in a
> situation where we don't have a CPU with index 0.  Or at least we could,
> if we didn't have code to explicitly prohibit unplug of CPU 0.
>=20
> Longer term we want to allow CPU 0 unplug, this patch is an early step in
> allowing this, by removing an assumption in the monitor code that CPU 0
> always exists.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> [dwg: Rewrote commit message to better explain background]
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
>      }
>      cpu_synchronize_state(cur_mon->mon_cpu);
>      return cur_mon->mon_cpu;


