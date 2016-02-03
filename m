Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQtqW-00063b-Av
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 04:35:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aQtqU-0005zs-AZ
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 04:35:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aQtqT-0008W9-GR
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 04:35:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aQtqL-0008V8-7s; Wed, 03 Feb 2016 04:35:21 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D96DEC064B30;
	Wed,  3 Feb 2016 09:35:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u139ZJOa018200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 3 Feb 2016 04:35:20 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9ADBA303F81B; Wed,  3 Feb 2016 10:35:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1454469583-15753-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56B1A88C.6020604@msgid.tls.msk.ru>
Date: Wed, 03 Feb 2016 10:35:18 +0100
In-Reply-To: <56B1A88C.6020604@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Wed, 3 Feb 2016 10:13:16 +0300")
Message-ID: <87k2mmxhk9.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com,
	Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix inconsistency between
	comment and variable name
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
X-List-Received-Date: Wed, 03 Feb 2016 09:35:31 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 03.02.2016 06:19, Cao jin wrote:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>  include/hw/qdev-core.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index abcdee8..42fa5db 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -221,7 +221,7 @@ typedef struct BusChild {
>>=20=20
>>  /**
>>   * BusState:
>> - * @hotplug_device: link to a hotplug device associated with bus.
>> + * @hotplug_handler: link to a hotplug device associated with bus.
>
> Hmm.  Now while the field name in comment and in the structure
> do match, the comment is still wrong, since it is a linke to
> a handler, not a device=E2=80=A6 :)

Do you mean to suggest the line should be changed to

 * @hotplug_device: link to a hotplug handler associated with bus.

?

