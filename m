Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U50c7-0000vw-L8
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 16:08:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U50c3-0000k0-85
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 16:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U50c1-0001TY-Qt
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 16:08:31 -0500
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:34695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1U50by-0001SI-RP; Mon, 11 Feb 2013 16:08:27 -0500
Received: from [192.168.0.10] (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id CBC79940060;
	Mon, 11 Feb 2013 22:08:18 +0100 (CET)
Message-ID: <51195DC1.5050208@reactos.org>
Date: Mon, 11 Feb 2013 22:08:17 +0100
From: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<CAFEAcA9Xf8_HOu1biVhtckp2vAf1VR9-sVtHkPQG2-6uvZxvBA@mail.gmail.com>
In-Reply-To: <CAFEAcA9Xf8_HOu1biVhtckp2vAf1VR9-sVtHkPQG2-6uvZxvBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Mon, 11 Feb 2013 21:08:32 -0000

Peter Maydell a =C3=A9crit :
> On 10 February 2013 22:12, Herv=C3=A9 Poussineau <hpoussin@reactos.org>=
 wrote:
>> --- a/hw/ide/core.c
>> +++ b/hw/ide/core.c
>> @@ -1394,8 +1394,10 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
>>          break;
>>      case WIN_PACKETCMD:
>>          /* overlapping commands not supported */
>> -        if (s->feature & 0x02)
>> +        if (s->feature & 0x02) {
>> +            qemu_log_mask(LOG_UNIMP, "ide: overlapping command not su=
pported");
>=20
> Messages for qemu_log_mask() need to supply the trailing \n.

OK to add the '\n' in the v2 (if required), once I know if I can keep=20
the qemu_log_mask call, or if I have to change it to hw_error/fprintf.

Regards,

Herv=C3=A9

