Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY9Wu-0004tc-Vz
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 08:26:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fY9Ws-0004s8-AD
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 08:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fY9Wr-0002tI-E1
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 08:26:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35404 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fY9Wn-0002pS-1E; Wed, 27 Jun 2018 08:26:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88665401B202;
	Wed, 27 Jun 2018 12:26:28 +0000 (UTC)
Received: from [10.10.125.113] (ovpn-125-113.rdu2.redhat.com [10.10.125.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC1D41C5B9;
	Wed, 27 Jun 2018 12:26:27 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
	<20180627132747.76773eb9@redhat.com>
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
Date: Wed, 27 Jun 2018 07:26:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180627132747.76773eb9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 27 Jun 2018 12:26:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 27 Jun 2018 12:26:28 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 12:26:35 -0000

On 06/27/2018 06:27 AM, Igor Mammedov wrote:
> On Mon, 25 Jun 2018 09:41:53 -0300
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>=20
>> Loosely based on 076b35b5a56.
>>
>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---

>> +#ifndef QEMU_UNITS_H
>> +#define QEMU_UNITS_H
>> +
>> +#define KiB     (INT64_C(1) << 10)
>> +#define MiB     (INT64_C(1) << 20)
>> +#define GiB     (INT64_C(1) << 30)
>> +#define TiB     (INT64_C(1) << 40)
>> +#define PiB     (INT64_C(1) << 50)
>> +#define EiB     (INT64_C(1) << 60)
> Shouldn't above use UINT64_C()

Since the decision of signed vs. unsigned was intentional based on=20
review on earlier versions, it may be worth a comment in this file that=20
these constants are intentionally signed (in usage patterns, these tend=20
to be multiplied by another value; and while it is easy to go to=20
unsigned by doing '1U * KiB', you can't go in the opposite direction if=20
you want a signed number for '1 * KiB' unless KiB is signed).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

