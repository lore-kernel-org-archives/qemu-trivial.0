Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwRWe-0006T7-UZ
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 07:26:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dwRWc-0006Rp-4w
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 07:26:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dwRWb-00006e-BB
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 07:26:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46064)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dwRWX-0008Ve-6h; Mon, 25 Sep 2017 07:26:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D81E7E423;
	Mon, 25 Sep 2017 11:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2D81E7E423
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.32.181.85] (unknown [10.32.181.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43EA06BF67;
	Mon, 25 Sep 2017 11:26:00 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, Eduardo Otubo <otubo@redhat.com>
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>
References: <20170915090643.6043-1-otubo@redhat.com>
	<fbe31cc8-c628-32e6-90b0-0341ef1972d3@msgid.tls.msk.ru>
	<0e84971b-592e-22f7-8815-2b3e193f6c1d@redhat.com>
	<20170925092641.GD12137@vader>
	<52fe072e-8e53-0610-2195-3ef8e120b553@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cd87c7b5-76e3-c5f1-3c2a-59c163f4bc35@redhat.com>
Date: Mon, 25 Sep 2017 13:25:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <52fe072e-8e53-0610-2195-3ef8e120b553@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 25 Sep 2017 11:26:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] dma/i82374: avoid double creation of
 i82374 device
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
X-List-Received-Date: Mon, 25 Sep 2017 11:26:11 -0000

On 25/09/2017 12:54, Michael Tokarev wrote:
>> Yes, that's correct. I can revert this patch with the error
>> propagation patch as well, if you guys don't mind.
> Hmm. After reading the original discussion I concluded this patch
> is okay.  I can remove it right now before the series has been
> applied, together with another tiny change.

No problem, it's okay for now as a trivial change.

Paolo

