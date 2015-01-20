Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDY1k-0006Mo-Lh
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jan 2015 07:35:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YDY1g-0006Ha-QM
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 07:35:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YDY1f-0002bB-HJ
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 07:35:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YDY1W-0002Sk-2I; Tue, 20 Jan 2015 07:35:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0KCYkcY004367
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 20 Jan 2015 07:34:46 -0500
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0KCYhDi007440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Jan 2015 07:34:45 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8395D30408B3; Tue, 20 Jan 2015 13:34:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1421747963-2860-1-git-send-email-armbru@redhat.com>
	<CAFEAcA9Gw-q+NDvb-Ysj-uB=QRdK_1GQJJZUQ2sOjpeBMnGDwg@mail.gmail.com>
Date: Tue, 20 Jan 2015 13:34:43 +0100
In-Reply-To: <CAFEAcA9Gw-q+NDvb-Ysj-uB=QRdK_1GQJJZUQ2sOjpeBMnGDwg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 20 Jan 2015 11:05:01 +0000")
Message-ID: <87lhkxiqak.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Leon Alrae <leon.alrae@imgtec.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
	switch fall through after commit fecd264
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
X-List-Received-Date: Tue, 20 Jan 2015 12:35:21 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 20 January 2015 at 09:59, Markus Armbruster <armbru@redhat.com> wrote:
>> Commit fecd264 added a number of fall-throughs, but neglected to
>> properly document them as intentional.  Commit d922445 cleaned that up
>> for many, but not all cases.  Take care of the remaining ones.
>>
>> Spotted by Coverity.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  target-mips/translate.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/target-mips/translate.c b/target-mips/translate.c
>> index e9d86b2..8abc12b 100644
>> --- a/target-mips/translate.c
>> +++ b/target-mips/translate.c
>> @@ -18729,6 +18729,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
>>      case OPC_SWL:
>>      case OPC_SWR:
>>          check_insn_opc_removed(ctx, ISA_MIPS32R6);
>> +         /* fall through */
>
> Indent here seems to be out by one? The others look OK.

Sorry about that.  Fix up on commit, or would you like a respin?

