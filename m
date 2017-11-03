Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAbhw-0008FF-Kj
	for mharc-qemu-trivial@gnu.org; Fri, 03 Nov 2017 09:08:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eAbhq-0008CT-Cf
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 09:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eAbhk-0007wl-Gf
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 09:08:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eAbhf-0007uB-Ru; Fri, 03 Nov 2017 09:08:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FB77356CF;
	Fri,  3 Nov 2017 13:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0FB77356CF
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.33.36.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 469C65C54C;
	Fri,  3 Nov 2017 13:08:05 +0000 (UTC)
Date: Fri, 3 Nov 2017 13:08:03 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20171103130803.GI20155@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1509710092-31645-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1509710092-31645-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 03 Nov 2017 13:08:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] tests: Run the luks tests in
 test-crypto-block only if encryption is available
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
X-List-Received-Date: Fri, 03 Nov 2017 13:08:21 -0000

On Fri, Nov 03, 2017 at 12:54:52PM +0100, Thomas Huth wrote:
> The test-crypto-block currently fails if encryption has not been
> compiled into QEMU:
> 
> TEST: tests/test-crypto-block... (pid=22231)
>   /crypto/block/qcow:                                                  OK
>   /crypto/block/luks/default:
>   Unexpected error in qcrypto_pbkdf2() at qemu/crypto/pbkdf-stub.c:41:
> FAIL
> GTester: last random seed: R02Sbbb5b6f299c6727f41bb50ba4aa6ef5c
> (pid=22237)
>   /crypto/block/luks/aes-256-cbc-plain64:
>   Unexpected error in qcrypto_pbkdf2() at qemu/crypto/pbkdf-stub.c:41:
> FAIL
> GTester: last random seed: R02S3e27992a5ab4cc95e141c4ed3c7f0d2e
> (pid=22239)
>   /crypto/block/luks/aes-256-cbc-essiv:
>   Unexpected error in qcrypto_pbkdf2() at qemu/crypto/pbkdf-stub.c:41:
> FAIL
> GTester: last random seed: R02S51b52bb02a66c42d8b331fd305384f53
> (pid=22241)
> FAIL: tests/test-crypto-block
> 
> So run the luks test only if the required encryption support is available.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Added the check to TEST_LUKS in the .c file instead of disabling
>      test-crypto-block completely in the Makefile.include.
> 
>  tests/test-crypto-block.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

