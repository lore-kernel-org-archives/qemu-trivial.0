Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dICIa-00054g-M3
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2017 07:05:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dICIY-00052Y-1w
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 07:05:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dICIW-0002ji-TL
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 07:05:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dICIQ-0002hA-Br; Tue, 06 Jun 2017 07:05:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5603080471;
	Tue,  6 Jun 2017 11:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5603080471
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5603080471
Received: from blackfin.pond.sub.org (ovpn-116-98.ams2.redhat.com
	[10.36.116.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F525B839;
	Tue,  6 Jun 2017 11:05:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B13ED1138645; Tue,  6 Jun 2017 13:05:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
	peter.maydell@redhat.com, marcandre.lureau@gmail.com,
	qemu-devel@nongnu.org, f4bug@amsat.org
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
	<df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
	<877f0p38tr.fsf@dusky.pond.sub.org>
	<b60c5d7b-6ae7-4aa0-6263-b96c964b9195@msgid.tls.msk.ru>
Date: Tue, 06 Jun 2017 13:05:05 +0200
In-Reply-To: <b60c5d7b-6ae7-4aa0-6263-b96c964b9195@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Tue, 6 Jun 2017 10:10:06 +0300")
Message-ID: <878tl5wf4u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 06 Jun 2017 11:05:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] ivshmem-server:
 ivshmem-client: Build when eventfd() is available
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
X-List-Received-Date: Tue, 06 Jun 2017 11:05:19 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 06.06.2017 09:54, Markus Armbruster wrote:
>
> [ ./configure --disable-linux-user --disable-system --static ]
>
>> I haven't, but here's a quick guess on what we need to squash into the
>> patch:
>> 
>> diff --git a/Makefile b/Makefile
>> index c830d7a..2ef5a78 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -469,10 +469,12 @@ ifneq ($(EXESUF),)
>>  qemu-ga: qemu-ga$(EXESUF) $(QGA_VSS_PROVIDER) $(QEMU_GA_MSI)
>>  endif
>>  
>> +ifdef CONFIG_IVSHMEM
>>  ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
>>  	$(call LINK, $^)
>>  ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
>>  	$(call LINK, $^)
>> +endif
>
> This effectively disables building ivshmem executables on this config
> on linux, while previously they were building fine. Hmm..

These executables are only useful together with an ivshmem device.  Not
building them when they can't be useful makes sense to me.

See previous discussion
Message-ID: <87fufwjfqw.fsf@dusky.pond.sub.org>
https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg05108.html

