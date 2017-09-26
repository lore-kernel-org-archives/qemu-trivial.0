Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwhO6-0003cB-B5
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 00:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwhO4-0003Ya-Ou
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwhO4-0002br-1z
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:22:24 -0400
Received: from tk2-216-17739.vs.sakura.ne.jp ([160.16.80.243]:60365
	helo=maro.localdomain)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daniel@loffgren.org>)
	id 1dwhO1-0002Zs-Ks; Tue, 26 Sep 2017 00:22:22 -0400
Received: from [10.0.0.206] (c-24-23-203-58.hsd1.ca.comcast.net [24.23.203.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by maro.localdomain (Postfix) with ESMTPSA id DDE9D19D43D;
	Tue, 26 Sep 2017 13:20:05 +0900 (JST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Daniel Loffgren <daniel@loffgren.org>
In-Reply-To: <7726e35d-4869-e5aa-4151-f40bed148825@redhat.com>
Date: Mon, 25 Sep 2017 21:22:18 -0700
Cc: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8DDD6AB1-B01F-4B6E-96E4-7AEE486CAFDD@loffgren.org>
References: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
	<7726e35d-4869-e5aa-4151-f40bed148825@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 160.16.80.243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] thunk.h uses
 TARGET_ABI_BITS without including abitypes.h
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
X-List-Received-Date: Tue, 26 Sep 2017 04:22:25 -0000

I am attempting to get ppc-darwin-user in a good working state again, =
and this broke one of the .c files that included it. I figured this =
change should be made regardless of my branch, and would help reduce the =
size of my branch for future rebasing.

> On Sep 25, 2017, at 9:37 AM, Thomas Huth <thuth@redhat.com> wrote:
>=20
>=20
> Did this cause any trouble? ... one of two sentences in the patch
> description would be nice, I think.
>=20
> Thomas
>=20
>=20
> On 25.09.2017 03:02, Daniel Loffgren wrote:
>>=20
>> Signed-off-by: Daniel Loffgren <daniel@loffgren.org>
>> ---
>> include/exec/user/thunk.h | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
>> index f19ef4b230..12b5449d8c 100644
>> --- a/include/exec/user/thunk.h
>> +++ b/include/exec/user/thunk.h
>> @@ -19,6 +19,7 @@
>> #ifndef THUNK_H
>> #define THUNK_H
>>=20
>> +#include "abitypes.h"
>> #include "cpu.h"
>>=20
>> /* types enums definitions */
>>=20
>=20


