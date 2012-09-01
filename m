Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7hW9-0006FZ-8R
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 02:49:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T7hW5-00064Q-Lq
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 02:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T7hW4-0002kb-N1
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 02:49:13 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:36920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T7hW0-0002k6-KS; Sat, 01 Sep 2012 02:49:08 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	22D3D728002B; Sat,  1 Sep 2012 08:49:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3cpc10WHGQsr; Sat,  1 Sep 2012 08:49:05 +0200 (CEST)
Received: from [192.168.178.20] (p54ADBD2F.dip.t-dialin.net [84.173.189.47])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B3D407280021; Sat,  1 Sep 2012 08:49:04 +0200 (CEST)
Message-ID: <5041AFE0.5070809@weilnetz.de>
Date: Sat, 01 Sep 2012 08:49:04 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
	<50412E4D.9010204@suse.de> <871uimi9dm.fsf@blackfin.pond.sub.org>
	<0CD423D9-2A2E-46E5-B0B3-63D6E044436A@suse.de>
In-Reply-To: <0CD423D9-2A2E-46E5-B0B3-63D6E044436A@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6Q=?= =?UTF-8?B?cmJlcg==?= <afaerber@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ppc405_uc: Fix buffer
	overflow
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
X-List-Received-Date: Sat, 01 Sep 2012 06:49:15 -0000


Am 01.09.2012 08:23, schrieb Alexander Graf:
>
>
> On 31.08.2012, at 22:45, Markus Armbruster <armbru@redhat.com> wrote:
>
>> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>> static uint32_t dcr_read_pob (void *opaque, int dcrn)

...

>>
>>>
>>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>
>>> We could alternatively leave besr[2] and access it with hardcoded 0..=
1.
>>
>> Minimally invasive fix would be besr[dcrn !=3D POB0_BESR0].
>>
>> [...]
>
> I don't think the change is important enough for these stylistic questi=
ons :). I'll just apply it once I'm back to a real internet connection.
>
> Alex

Of course I considered those minimally invasive solutions.

There was already other code in the same file which used besr0, besr1,
and the wrong statements were simple enough to justify a duplication.
If I were a compiler, I'd generate smaller and faster code with the
new code :-)

Cheers,
Stefan W.


