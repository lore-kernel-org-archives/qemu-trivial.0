Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVJPZ-0003WZ-1f
	for mharc-qemu-trivial@gnu.org; Wed, 02 Apr 2014 07:32:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WVJPS-0003OG-Gy
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 07:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WVJPN-0003CB-HY
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 07:32:46 -0400
Received: from cantor2.suse.de ([195.135.220.15]:55020 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1WVJPD-00038v-4H; Wed, 02 Apr 2014 07:32:31 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 3DE61ACDA;
	Wed,  2 Apr 2014 11:32:30 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: Alexander Graf <agraf@suse.de>
X-Mailer: iPhone Mail (11B554a)
In-Reply-To: <533BEC2E.2050802@suse.de>
Date: Wed, 2 Apr 2014 13:32:29 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <085F8437-7DC7-4614-AEA4-82CA80C44EA1@suse.de>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-2-git-send-email-prasadjoshi.linux@gmail.com>
	<5330405F.7040306@suse.de> <533BD03A.7070405@suse.com>
	<533BEC2E.2050802@suse.de>
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"aliguori@amazon.com" <aliguori@amazon.com>,
	"aik@ozlabs.ru" <aik@ozlabs.ru>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
	Prasad Joshi <prasadjoshi.linux@gmail.com>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"v.maffione@gmail.com" <v.maffione@gmail.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"av1474@comtv.ru" <av1474@comtv.ru>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"g.lettieri@iet.unipi.it" <g.lettieri@iet.unipi.it>,
	"alex@alex.org.uk" <alex@alex.org.uk>,
	"rizzo@iet.unipi.it" <rizzo@iet.unipi.it>, Alexander Graf <agraf@suse.com>,
	"kraxel@redhat.com" <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/6] intc/openpic_kvm: fix
	MemListener delete regiion callback function
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
X-List-Received-Date: Wed, 02 Apr 2014 11:32:51 -0000



> Am 02.04.2014 um 12:53 schrieb Andreas F=C3=A4rber <afaerber@suse.de>:
>=20
> Am 02.04.2014 10:54, schrieb Alexander Graf:
>>=20
>> On 24.03.14 15:25, Andreas F=C3=A4rber wrote:
>>> Am 23.03.2014 10:28, schrieb Prasad Joshi:
>>>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>>>> ---
>>>>  hw/intc/openpic_kvm.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> Thanks for spotting this, applied to ppc-next (w/ typo fix in subject):
>>> https://github.com/afaerber/qemu-cpu/commits/ppc-next
>>=20
>> This patch breaks the e500 platform target.
>=20
> Ouch. I had specifically tested build and -M pseries on PowerKVM but
> obviously did not for e500.

Yeah, this file is only used on e500 with kvm enabled. No worries, things wo=
rked out well :).

>=20
> Means it was theoretically broken from the start then, if you compare my
> extended commit message:
>=20
> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D6f1834a2baa2f2688efaa7756=
d000876c7898d13

Well, it definitely worked before, though most likely by chance ;).


Alex

>=20
> Andreas
>=20
> --=20
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

