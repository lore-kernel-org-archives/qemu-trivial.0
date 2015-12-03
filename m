Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4ZKB-0005AR-1X
	for mharc-qemu-trivial@gnu.org; Thu, 03 Dec 2015 14:13:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1a4ZK8-000580-4y
	for qemu-trivial@nongnu.org; Thu, 03 Dec 2015 14:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1a4ZK7-0005eI-5L
	for qemu-trivial@nongnu.org; Thu, 03 Dec 2015 14:13:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:37136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1a4ZK1-0005Wm-NO; Thu, 03 Dec 2015 14:13:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B94F3ADE6;
	Thu,  3 Dec 2015 19:13:40 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, Cao jin <caoj.fnst@cn.fujitsu.com>,
	qemu-devel@nongnu.org
References: <1446709143-19935-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<565AD80B.50207@msgid.tls.msk.ru>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <56609463.10909@suse.de>
Date: Thu, 3 Dec 2015 20:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <565AD80B.50207@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Trivial: update comment of
	struct Object
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
X-List-Received-Date: Thu, 03 Dec 2015 19:13:49 -0000

Am 29.11.2015 um 11:48 schrieb Michael Tokarev:
> 05.11.2015 10:39, Cao jin wrote:
>> it don`t has "GSList *interfaces" anymore
>=20
> Andreas, should this be applied?  It's been on the list for long alread=
y,
> and you said I shouldn't apply qom patches...

I seem to have missed this for the last pull because it doesn't show up
in a "qom" inbox query. Thanks for the reminder.

Applied to qom-next now (with massaging of commit message).

Thanks,
Andreas

>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>  include/qom/object.h | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index 0bb89d4..e46cc30 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -396,9 +396,6 @@ struct ObjectClass
>>   * As a result, #Object contains a reference to the objects type as i=
ts
>>   * first member.  This allows identification of the real type of the =
object at
>>   * run time.
>> - *
>> - * #Object also contains a list of #Interfaces that this object
>> - * implements.
>>   */
>>  struct Object
>>  {

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)

