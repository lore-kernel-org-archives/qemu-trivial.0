Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekPqY-0007Qe-Uj
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:45:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ekPqW-0007MS-L9
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:45:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ekPqV-0005cl-HV
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:45:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58646 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ekPqM-0005Qk-E6; Sat, 10 Feb 2018 02:45:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA41640201A1;
	Sat, 10 Feb 2018 07:44:58 +0000 (UTC)
Received: from [10.36.116.49] (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB48100F9C9;
	Sat, 10 Feb 2018 07:44:50 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, info@mobile-stream.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1954640316.20171226142913@mobile-stream.com>
	<751c9675-7e93-a907-4b9e-998c50155e84@msgid.tls.msk.ru>
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5796eeab-0a9a-b150-88f0-7296e050f8f3@redhat.com>
Date: Sat, 10 Feb 2018 08:44:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <751c9675-7e93-a907-4b9e-998c50155e84@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Sat, 10 Feb 2018 07:44:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Sat, 10 Feb 2018 07:44:59 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] fix evsrwu and others for powerpcspe
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
X-List-Received-Date: Sat, 10 Feb 2018 07:45:18 -0000

On 10.02.2018 08:25, Michael Tokarev wrote:
> 26.12.2017 14:29, info@mobile-stream.com wrote:
>> GEN_SPEOP_ARITH2 declares non-local temporaries then calls gen_op_evsr=
wu/evsrws/evslw which generates branch insn.
>=20
> I'm Cc'ing qemu-devel@ for review, since I don't know much about how pp=
c works.

For PPC related stuff, please also always send a CC: to
qemu-ppc@nongnu.org (or even better, use the scripts/get_maintainer.pl
script to get the CC: list right).

Also, your patch is missing a proper "Signed-off-by" line. Please have a
look at https://wiki.qemu.org/Contribute/SubmitAPatch for details.

 Thanks,
  Thomas

>=20
>> --- target/ppc/translate/spe-impl.inc.c.orig
>> +++ target/ppc/translate/spe-impl.inc.c
>> @@ -158,8 +158,8 @@
>>          gen_exception(ctx, POWERPC_EXCP_SPEU);                       =
         \
>>          return;                                                      =
         \
>>      }                                                                =
         \
>> -    t0 =3D tcg_temp_new_i32();                                       =
           \
>> -    t1 =3D tcg_temp_new_i32();                                       =
           \
>> +    t0 =3D tcg_temp_local_new_i32();                                 =
                 \
>> +    t1 =3D tcg_temp_local_new_i32();                                 =
                 \
>>                                                                       =
         \
>>      tcg_gen_trunc_tl_i32(t0, cpu_gpr[rA(ctx->opcode)]);              =
         \
>>      tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);              =
         \
>>
>>
>=20
>=20


