Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwyYB-0002p0-GN
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 15:32:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZwyY9-0002ly-0c
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 15:32:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZwyY7-0004cz-W7
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 15:32:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZwyY2-0004ZR-Hg; Thu, 12 Nov 2015 15:32:46 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id CAA6E8F025;
	Thu, 12 Nov 2015 20:32:45 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-56-36.rdu2.redhat.com [10.10.56.36])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tACKWiRc004424; Thu, 12 Nov 2015 15:32:44 -0500
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1447359664-25407-1-git-send-email-jsnow@redhat.com>
	<5644F734.6020201@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5644F76C.2000600@redhat.com>
Date: Thu, 12 Nov 2015 15:32:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5644F734.6020201@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: ignore
	test-blockjob-txn
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 20:32:54 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256



On 11/12/2015 03:31 PM, Eric Blake wrote:
> On 11/12/2015 01:21 PM, John Snow wrote:
>> Reported-by: Eric Blake <eblake@redhat.com> Signed-off-by: John
>> Snow <jsnow@redhat.com> --- tests/.gitignore | 1 + 1 file
>> changed, 1 insertion(+)
> 
> My version of this same patch at least called out the commit that 
> introduced the problem :) 
> https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg03142.html
>
> 
>> 
>> diff --git a/tests/.gitignore b/tests/.gitignore index
>> e96f569..de5e793 100644 --- a/tests/.gitignore +++
>> b/tests/.gitignore @@ -9,6 +9,7 @@ check-qom-proplist rcutorture 
>> test-aio test-bitops +test-blockjob-txn test-coroutine 
>> test-crypto-cipher test-crypto-hash
>> 
> 

Oh, I didn't realize you sent a _patch_, I just saw the part saying
"Hey, stuff gooofed up!"

ignore, NACK, etc

(Sorry, Eric -- I'm on autopilot right now.)

- --js
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWRPdnAAoJEH3vgQaq/DkOo+YQALWnjexfVyEC7I0kZaIzH/yh
voBG7XiApNPxPqq1X/C+UtGkM6XxIBAECoz2O5+eGnnw9OTcNkdQELcvERfcnG50
+ULvQIf+BeCrMV8fPZaq8uCvwYCIMOxUd2JH22QptYsetBIQHeVnARY8OltdJ1ET
gLRHFcBTYy/LFnQvuIqBNKcSTuiWTSxqHpsQHeDRv2a+0XTIgFCbsPLKKPpR0e7d
UdX1NSUuT0suIcgkDf34Vx1rEmlShFzmtrjVlFG8WFtzN0qrYOqn6SQ+1KxgAeR2
RzQeH8RUy7JgLIbKjARb+4Ya3wxKUFIFqZ3Y871uCG1eYC4BE/q3+Q3CdBM45w3E
DNLLk48efHHYumRXYMwS6dPo84T8s5XC76raWuMXLN8kbzj8F2fAgro1NXYfPlz0
NS81aw0HEDDsupvKafvnatF0neVaP1PCOT33ques2T/SIbzzLM9Eu/gNPaQAlBne
Uf7kV8NU38TW3dBKczzUVH//XeVo8dqsQiByGe4YXeMCC9vLHCBwtfxtnZXZtBth
mZ0JJnlIbnX43M8m0/+PsicFzGpddEOXhb4hgWhSRHxNThJQbALy36oFtKWkTCg4
nR/12rIlQQx/A1MfWtYflAAFxPNgGyp8B6Gu1A0utCUMIPti9oYgmROX7+32I7WZ
R71Xc2d3chK0ozyqh/8w
=eOua
-----END PGP SIGNATURE-----

