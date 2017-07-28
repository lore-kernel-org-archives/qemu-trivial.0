Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4KY-0004ep-Ib
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:25:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db4KW-0004ch-7Z
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db4KV-0000PQ-C2
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:25:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1db4KP-0000HB-C1; Fri, 28 Jul 2017 08:25:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DC19C2BB6;
	Fri, 28 Jul 2017 12:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4DC19C2BB6
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19E9D77CB5;
	Fri, 28 Jul 2017 12:25:09 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-6-f4bug@amsat.org>
	<a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
	<c44770f5-df9d-2340-5dba-2f5db7acd046@redhat.com>
	<20170728135614.3f14e3ad@gondolin>
	<3abbfa87-d882-39ab-b4ab-66f3e68a2fb4@redhat.com>
	<20170728141353.3b8382be@gondolin>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3a4f3a2a-cebc-e730-4a63-2616a17f5f2b@redhat.com>
Date: Fri, 28 Jul 2017 14:25:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728141353.3b8382be@gondolin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 28 Jul 2017 12:25:12 +0000 (UTC)
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
X-List-Received-Date: Fri, 28 Jul 2017 12:25:21 -0000

On 28/07/2017 14:13, Cornelia Huck wrote:
>>> But would it not a better idea to add an entry for all headers touched
>>> by update-linux-headers, then?  
>>
>> One thing doesn't exclude the other.  That entry would also list the
>> script itself and linux-headers.  KVM, VFIO and virtio patterns can only
>> list the files they care about.  Migration could list userfaultfd,
>> possibly.  And there's also include/standard-headers/, which includes
>> PCI and input subsystem files...  It has to be perfected, but it's a
>> good idea.
> 
> Personally, I'm not really a fan. If something is changed in one of the
> headers, it implies that either it has already been changed in the
> original headers in Linux (and I will have seen it then), or that
> someone is sending a preliminary patch (and I should hope that I'm
> already cc:ed for the changes that this headers change is for then). It
> does not really hurt, but it feels wrong.

Sometime people pull changes too early, or otherwise I want to comment
on the timing of the change... I don't know, I already get too much
qemu-devel email. :)

Paolo

