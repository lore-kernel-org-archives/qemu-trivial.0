Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6XZl-0003rF-0T
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 03:22:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d6XZj-0003qO-0J
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 03:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d6XZi-0000Lf-9j
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 03:22:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1d6XZZ-0000Jj-Jg; Fri, 05 May 2017 03:22:41 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E5D6883A6;
	Fri,  5 May 2017 07:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3E5D6883A6
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3E5D6883A6
Received: from [10.36.116.145] (ovpn-116-145.ams2.redhat.com [10.36.116.145])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v457MZpN014082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 5 May 2017 03:22:37 -0400
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com
References: <20170503104441.1349-1-pbonzini@redhat.com>
	<3a1419bd-710a-61f5-bfee-0eb5895a022c@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <578c614d-741f-bac5-b42a-86e61a6658e4@redhat.com>
Date: Fri, 5 May 2017 09:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <3a1419bd-710a-61f5-bfee-0eb5895a022c@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1251
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 05 May 2017 07:22:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Fri, 05 May 2017 07:22:51 -0000



On 05/05/2017 08:24, Michael Tokarev wrote:
> 03.05.2017 13:44, Paolo Bonzini wrote:
>> Detected by GCC 7's -Wformat-truncation.  snprintf writes at most
>> 2 bytes here including the terminating NUL, so the result is
>> truncated.  In addition, the newline at the end is pointless.
>> Fix the buffer size and the format string.
> 
> Polo, that's quite a bit too bureaucratic,
> but where's your s-o-b for this patch? :)

Oops, here:

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> 
> Thanks,
> 
> /mjt
> 

