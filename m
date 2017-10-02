Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz0BH-0004Af-G2
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 08:50:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dz0B9-00047N-SP
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 08:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dz0B6-0005tS-48
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 08:50:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dz0Az-0005nA-6g; Mon, 02 Oct 2017 08:50:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33ACD4A6E6;
	Mon,  2 Oct 2017 12:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 33ACD4A6E6
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.118.50] (unknown [10.36.118.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6233D99DDD;
	Mon,  2 Oct 2017 12:50:09 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>, Eduardo Otubo <otubo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Alexander Graf <agraf@suse.de>,
	Markus Armbruster <armbru@redhat.com>
References: <20170929140540.13766-1-otubo@redhat.com>
	<20170929193139.GB17385@localhost.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c365c30-8b63-f762-aa56-5b952b491aec@redhat.com>
Date: Mon, 2 Oct 2017 14:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170929193139.GB17385@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 02 Oct 2017 12:50:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCHv2] dma/i82374: avoid double creation of
 i82374 device
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 12:50:42 -0000

On 29/09/2017 21:31, Eduardo Habkost wrote:
>> -void DMA_init(ISABus *bus, int high_page_enable)
>> +void DMA_init(ISABus *bus, int high_page_enable, Error **errp)
> 
> If you make the function return a boolean to indicate success (in
> addition to setting *errp), you avoid the need for a local_err
> variable on the caller.

I think in this case, rather than a bool, it would be better to return 0
or -EBUSY.  A check for "< 0" would be more self-explanatory in the caller.

Paolo

