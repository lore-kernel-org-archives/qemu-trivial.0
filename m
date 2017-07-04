Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSPhU-0002ca-Gz
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jul 2017 11:25:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dSPhS-0002YX-OC
	for qemu-trivial@nongnu.org; Tue, 04 Jul 2017 11:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dSPhR-0005Pq-Tx
	for qemu-trivial@nongnu.org; Tue, 04 Jul 2017 11:25:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dSPhM-0005Ln-Jc; Tue, 04 Jul 2017 11:25:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64AD3804E9;
	Tue,  4 Jul 2017 15:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 64AD3804E9
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 64AD3804E9
Received: from [10.36.117.179] (ovpn-117-179.ams2.redhat.com [10.36.117.179])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A941617546;
	Tue,  4 Jul 2017 15:25:05 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
References: <1497863771-24929-1-git-send-email-thuth@redhat.com>
	<20170704144600.GH4253@noname.str.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <72652c2b-f7a5-d662-b648-78450d2f3c5b@redhat.com>
Date: Tue, 4 Jul 2017 17:25:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170704144600.GH4253@noname.str.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 04 Jul 2017 15:25:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Add missing "@c man end"
 statements
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
X-List-Received-Date: Tue, 04 Jul 2017 15:25:15 -0000



On 04/07/2017 16:46, Kevin Wolf wrote:
> Am 19.06.2017 um 11:16 hat Thomas Huth geschrieben:
>> Since commit 3f2ce724f1f1 ("Move the qemu-ga description into a
>> separate chapter"), the qemu.1 man page looks pretty much screwed
>> up, e.g. the title was "qemu-ga - QEMU Guest Agent" instead of
>> "qemu-doc - QEMU Emulator User Documentation". However, that movement
>> of the gemu-ga chapter is not the real problem, it just triggered
>> another bug in the qemu-doc.texi: There are some parts in the file
>> which introduce a "@c man begin OPTIONS" section, but never close
>> it again with "@c man end". After adding the proper end tags here,
>> the title of the man page is right again and the previously wrongly
>> tagged sections now also show up correctly in the man page, too.
>>
>> Reported-by: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Michael, do you want to take this through qemu-trivial?

FWIW, I'm sending it out tomorrow.  Already tested the pull request, but
I'd like Richard to take another look at the final version of the
TCG-disabling patches and not rush them out.

Paolo

