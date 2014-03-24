Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS5hh-0004xX-KS
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 10:18:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WS5hY-0004lV-W6
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 10:18:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WS5hR-00017Z-J2
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 10:18:08 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51899 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WS5hC-0000r2-IR; Mon, 24 Mar 2014 10:17:46 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CB1CDAB49;
	Mon, 24 Mar 2014 14:17:45 +0000 (UTC)
Message-ID: <53303E87.7090209@suse.de>
Date: Mon, 24 Mar 2014 15:17:43 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>,
	Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>	<20140324131959.GF4384@stefanha-thinkpad.redhat.com>
	<CAFEAcA-D+6uHgaChtvmmZ6gXoPsAxY=0L9ho6a2xoryYHC6xsA@mail.gmail.com>
In-Reply-To: <CAFEAcA-D+6uHgaChtvmmZ6gXoPsAxY=0L9ho6a2xoryYHC6xsA@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Anthony Liguori <aliguori@amazon.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	"J. Kiszka" <jan.kiszka@siemens.com>,
	Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	v.maffione@gmail.com, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Alex Bligh <alex@alex.org.uk>,
	Paolo Bonzini <pbonzini@redhat.com>, g.lettieri@iet.unipi.it,
	rizzo@iet.unipi.it, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] audio: set top level
 latch for each slot
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
X-List-Received-Date: Mon, 24 Mar 2014 14:18:16 -0000

Am 24.03.2014 14:22, schrieb Peter Maydell:
> On 24 March 2014 13:19, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> On Sun, Mar 23, 2014 at 02:58:38PM +0530, Prasad Joshi wrote:
>>> CSMKeyControll function is supposed to set the top level latch for ea=
ch
>>> slot. However, at the moment, it incorrectly updates only the first
>>> slot. Patch fixes the problem.
>>>
>>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>>> ---
>>>  hw/audio/fmopl.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Peter: This series has some fixes for QEMU 2.0 since they are bug fixe=
s.
>=20
> I'm currently assuming that bugfixes for 2.0 will appear in
> the form of pullrequests marked 'for-2.0' from the appropriate
> submaintainers...

I've already picked up the openpic patch earlier today and got
distracted from testing it on PowerKVM for sending out the message...

Regards,
Andreas

P.S. Prasad, please remember to prepend a cover letter 0/6 next time.

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

