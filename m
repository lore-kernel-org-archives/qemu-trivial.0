Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3vP-0004Wd-Cw
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:59:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3vN-0004VT-Bk
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3vM-0002Lo-FK
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:59:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1db3vH-0002HR-G2; Fri, 28 Jul 2017 07:59:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67E3710E2D;
	Fri, 28 Jul 2017 11:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67E3710E2D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A319E7767A;
	Fri, 28 Jul 2017 11:59:09 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-6-f4bug@amsat.org>
	<a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
	<c44770f5-df9d-2340-5dba-2f5db7acd046@redhat.com>
	<20170728135614.3f14e3ad@gondolin>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3abbfa87-d882-39ab-b4ab-66f3e68a2fb4@redhat.com>
Date: Fri, 28 Jul 2017 13:59:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728135614.3f14e3ad@gondolin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 28 Jul 2017 11:59:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/47] MAINTAINERS: add
 missing KVM entry
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
X-List-Received-Date: Fri, 28 Jul 2017 11:59:22 -0000

On 28/07/2017 13:56, Cornelia Huck wrote:
> On Fri, 28 Jul 2017 13:51:14 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
>> On 28/07/2017 09:00, Thomas Huth wrote:
>>> On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote: =20
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>>  MAINTAINERS | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 3b472d7a09..ece02522be 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -278,6 +278,7 @@ S: Supported
>>>>  F: */kvm.*
>>>>  F: accel/kvm/
>>>>  F: include/sysemu/kvm*.h
>>>> +F: linux-headers/asm-*/kvm*.h =20
>>>
>>> The linux-headers are not really maintained by the QEMU project - so =
I
>>> guess we do not need an entry for these? =20
>>
>> Actually I agree with the patch.  I'd like to be CCed on
>> update-linux-headers patches, and this achieves it. :)
>=20
> But would it not a better idea to add an entry for all headers touched
> by update-linux-headers, then?

One thing doesn't exclude the other.  That entry would also list the
script itself and linux-headers.  KVM, VFIO and virtio patterns can only
list the files they care about.  Migration could list userfaultfd,
possibly.  And there's also include/standard-headers/, which includes
PCI and input subsystem files...  It has to be perfected, but it's a
good idea.

Paolo

Paolo


