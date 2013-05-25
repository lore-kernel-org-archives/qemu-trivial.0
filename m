Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgBpT-0000R0-60
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 06:36:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgBpL-0000JF-0J
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 06:36:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgBpH-0008NT-AR
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 06:35:54 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54414 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UgBpC-0008Mp-OY; Sat, 25 May 2013 06:35:46 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id F2BB0A4EB7;
	Sat, 25 May 2013 12:35:41 +0200 (CEST)
Message-ID: <51A093F6.4070202@suse.de>
Date: Sat, 25 May 2013 12:35:34 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51A08422.7030207@msgid.tls.msk.ru>
In-Reply-To: <51A08422.7030207@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] debugcon: fix some bugs
 when DEBUG_DEBUGCON
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
X-List-Received-Date: Sat, 25 May 2013 10:36:02 -0000

Am 25.05.2013 11:28, schrieb Michael Tokarev:
> 24.05.2013 06:47, liguang wrote:
>> when enable DEBUG_DEBUGCON, there are some message
>> printing bugs, so fix them.
>>
>> this patch-set based on previous 3 patches,
>> http://comments.gmane.org/gmane.comp.emulators.qemu/212550
>> http://comments.gmane.org/gmane.comp.emulators.qemu/212551
>> http://comments.gmane.org/gmane.comp.emulators.qemu/212552
>>
>> cover-letter and patch [4/4] are new, no changes
>> for other 3.
>>
>> Li Guang (4)
>> 	 debugcon: fix always print "addr=3D0x0, val=3D0x0" bug when use DEBU=
G_DEBUGCON
>> 	 debugcon: make debug message more readable
>> 	 debugcon: fix compiler warning when open DEBUG_DEBUGCON
>> 	 debugcon: use fprintf(stderr...) instead of printf
>=20
> The subjects and commit messages are a bit inaccurate, and
> as Andreas says, these may have been merged together, but
> the inaccuracy is small (and mostly due to language barriers),
> and the result is good anyway, with one patch doing one thing.
>=20
> So.. thanks, applied to the trivial-patches queue.

NACK. If you want to apply 1-3, okay. But please unqueue 4/4, it makes
no sense as-is (just look at the stderr output to see what I mean) and
it pretends that I suggested that!

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

