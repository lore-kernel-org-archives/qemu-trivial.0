Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoCi-00064a-FC
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoCg-00061Y-Jy
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoCc-0003Ho-Ne
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:36:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49293)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoCW-0003D3-Az; Mon, 27 Jul 2015 15:36:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1FA75425AF;
	Mon, 27 Jul 2015 22:36:39 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0A32AA57;
	Mon, 27 Jul 2015 22:36:39 +0300 (MSK)
Message-ID: <55B68846.3070304@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:36:38 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVy?=
	=?UTF-8?B?ZWF1?= <marcandre.lureau@redhat.com>
References: <1435917064-17827-1-git-send-email-marcandre.lureau@redhat.com>	<1435917064-17827-3-git-send-email-marcandre.lureau@redhat.com>
	<87h9pleemt.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9pleemt.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/5] qapi: add missing @
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
X-List-Received-Date: Mon, 27 Jul 2015 19:36:51 -0000

03.07.2015 13:09, Markus Armbruster write:
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>=20
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  qapi-schema.json | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qapi-schema.json b/qapi-schema.json
>> index 71c894e..1d3ee6b 100644
>> --- a/qapi-schema.json
>> +++ b/qapi-schema.json
>> @@ -15,7 +15,7 @@
>>  { 'include': 'qapi/trace.json' }
>> =20
>>  ##
>> -# LostTickPolicy:
>> +# @LostTickPolicy:

Applied to -trivial, thanks!

/mjt

