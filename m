Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5u3G-0002fh-8c
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 09:10:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d5u3D-0002cr-8F
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 09:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d5u3C-0008Hy-EH
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 09:10:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56095)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1d5u36-0008Ew-AS; Wed, 03 May 2017 09:10:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46FF181243;
	Wed,  3 May 2017 13:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 46FF181243
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 46FF181243
Received: from [10.36.118.18] (ovpn-118-18.ams2.redhat.com [10.36.118.18] (may
	be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v43DAOv4001492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 3 May 2017 09:10:29 -0400
To: Markus Armbruster <armbru@redhat.com>
References: <20170503104441.1349-1-pbonzini@redhat.com>
	<874lx21880.fsf@dusky.pond.sub.org>
	<8e6b18bc-eb3e-c77f-2b9a-c797c3c15680@redhat.com>
	<87pofqxfna.fsf@dusky.pond.sub.org>
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com, qemu-devel@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cba7fc39-0b43-7514-7bf1-8375f3f7cc38@redhat.com>
Date: Wed, 3 May 2017 15:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <87pofqxfna.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 03 May 2017 13:10:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Wed, 03 May 2017 13:10:40 -0000



On 03/05/2017 14:56, Markus Armbruster wrote:
>> snprintf writes at most 2 bytes here including the terminating NUL, so
>> the result is truncated".
>
> You're right; I forgot that snprintf() always adds a NUL.  So this *is*
> broken: we write NUL instead of the second digit.  Mentioning this in
> the commit message wouldn't hurt.

Well, it does, see the quote. :)

Paolo

