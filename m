Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4tVn-0006l4-AU
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 08:33:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1U4tVk-0006fS-Km
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 08:33:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1U4tVj-0007Er-IY
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 08:33:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1U4tVf-0007Dy-O0; Mon, 11 Feb 2013 08:33:27 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1BDXPUZ031811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 11 Feb 2013 08:33:25 -0500
Received: from dhcp-5-188.str.redhat.com (dhcp-192-240.str.redhat.com
	[10.33.192.240])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1BDXME4009939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Mon, 11 Feb 2013 08:33:24 -0500
Message-ID: <5118F322.709@redhat.com>
Date: Mon, 11 Feb 2013 14:33:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130211132727.GC6491@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r1BDXPUZ031811
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Blue Swirl <blauwirbel@gmail.com>,
	=?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
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
X-List-Received-Date: Mon, 11 Feb 2013 13:33:34 -0000

Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
> On Sun, Feb 10, 2013 at 11:12:11PM +0100, Herv=E9 Poussineau wrote:
>>
>> Signed-off-by: Herv=E9 Poussineau <hpoussin@reactos.org>
>> ---
>>  hw/ide/core.c |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>> index 3743dc3..f0ab1a8 100644
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
> qemu_log_*() isn't used much in hw/.
>=20
> I think we need to side-track this patch email to figure out what to
> use:
>=20
> fprintf(stderr) - some warnings/errors use this
> error_report() - goes to the monitor, if possible, otherwise stderr

These look wrong to me.

> qemu_log_*() - goes to the qemu log, seems a little TCG-centric

I would suggest either this or just trace points. (And by the way, it's
a pity that -d is so TCG-centric, it's been more than once the reason
why I disabled KVM when debugging a guest... Having at least -d int
would be so useful.)

Kevin

