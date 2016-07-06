Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bKh9Y-0004Z3-IT
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jul 2016 03:21:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1bKh9W-0004XU-Pe
	for qemu-trivial@nongnu.org; Wed, 06 Jul 2016 03:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1bKh9V-0007SL-Sf
	for qemu-trivial@nongnu.org; Wed, 06 Jul 2016 03:21:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:60986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1bKh9P-0007Qo-F7; Wed, 06 Jul 2016 03:21:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 3D268AAB7;
	Wed,  6 Jul 2016 07:21:37 +0000 (UTC)
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
References: <1465889269-7226-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<577C9CA0.8050505@cn.fujitsu.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
X-Enigmail-Draft-Status: N1110
Organization: SUSE Linux GmbH
Cc: qemu trival <qemu-trivial@nongnu.org>, qemu devel <qemu-devel@nongnu.org>
Message-ID: <577CB17F.1070708@suse.de>
Date: Wed, 6 Jul 2016 09:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <577C9CA0.8050505@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-trivial] [PATCH] qom/object: fix comment typo
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
X-List-Received-Date: Wed, 06 Jul 2016 07:21:47 -0000

Am 06.07.2016 um 07:52 schrieb Changlong Xie:
> Would any maintainer pick this one?

Please in the future use just "qom:" in the subject. How to find out?
git log --oneline -- include/qom/object.h

Also please mention the typo in the commit message. Fixing.

Thanks,
Andreas

>=20
> On 06/14/2016 03:27 PM, Changlong Xie wrote:
>> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>> ---
>>   include/qom/object.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index 99de539..925c279 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -901,7 +901,7 @@ GSList *object_class_get_list(const char
>> *implements_type,
>>   void object_ref(Object *obj);
>>
>>   /**
>> - * qdef_unref:
>> + * object_unref:
>>    * @obj: the object
>>    *
>>    * Decrease the reference count of a object.  A object cannot be
>> freed as long
>>
>=20
>=20


--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=C3=BCrnberg)

