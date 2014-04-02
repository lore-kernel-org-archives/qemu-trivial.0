Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVInz-0001Eq-5Q
	for mharc-qemu-trivial@gnu.org; Wed, 02 Apr 2014 06:54:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WVIns-00017D-Q4
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 06:54:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WVInn-0006QZ-CN
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 06:53:56 -0400
Received: from cantor2.suse.de ([195.135.220.15]:53923 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WVInb-0006Ob-Fq; Wed, 02 Apr 2014 06:53:39 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DB8ABACDA;
	Wed,  2 Apr 2014 10:53:35 +0000 (UTC)
Message-ID: <533BEC2E.2050802@suse.de>
Date: Wed, 02 Apr 2014 12:53:34 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-2-git-send-email-prasadjoshi.linux@gmail.com>
	<5330405F.7040306@suse.de> <533BD03A.7070405@suse.com>
In-Reply-To: <533BD03A.7070405@suse.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: peter.maydell@linaro.org, aliguori@amazon.com, aik@ozlabs.ru,
	jan.kiszka@siemens.com,
	Prasad Joshi <prasadjoshi.linux@gmail.com>, riku.voipio@iki.fi,
	agraf@suse.de, v.maffione@gmail.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, av1474@comtv.ru, stefanha@redhat.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, kraxel@redhat.com
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
X-List-Received-Date: Wed, 02 Apr 2014 10:54:02 -0000

Am 02.04.2014 10:54, schrieb Alexander Graf:
>=20
> On 24.03.14 15:25, Andreas F=E4rber wrote:
>> Am 23.03.2014 10:28, schrieb Prasad Joshi:
>>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>>> ---
>>>   hw/intc/openpic_kvm.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> Thanks for spotting this, applied to ppc-next (w/ typo fix in subject)=
:
>> https://github.com/afaerber/qemu-cpu/commits/ppc-next
>=20
> This patch breaks the e500 platform target.

Ouch. I had specifically tested build and -M pseries on PowerKVM but
obviously did not for e500.

Means it was theoretically broken from the start then, if you compare my
extended commit message:

http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D6f1834a2baa2f2688efaa775=
6d000876c7898d13

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

