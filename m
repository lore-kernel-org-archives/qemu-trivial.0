Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzm2X-0000Yd-Ne
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 09:15:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mkletzan@redhat.com>) id 1Yzhlb-00055p-I7
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mkletzan@redhat.com>) id 1Yzhla-00068A-KF
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:41:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mkletzan@redhat.com>)
	id 1YzhlY-00066Y-I4; Tue, 02 Jun 2015 04:41:44 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 2DC72B82C9;
	Tue,  2 Jun 2015 08:41:44 +0000 (UTC)
Received: from wheatley.localdomain (dhcp129-92.brq.redhat.com [10.34.129.92])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t528ff66006650
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Jun 2015 04:41:43 -0400
Received: by wheatley.localdomain (Postfix, from userid 1000)
	id 382A37E0399; Tue,  2 Jun 2015 10:41:41 +0200 (CEST)
Date: Tue, 2 Jun 2015 10:41:41 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20150602084141.GA28929@wheatley>
References: <1433232329-14983-1-git-send-email-mkletzan@redhat.com>
	<CAFEAcA9ggEPZyuVs66bT5Omte8gdkDv8Fdz1nSW9LuEDa6Z_vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9ggEPZyuVs66bT5Omte8gdkDv8Fdz1nSW9LuEDa6Z_vQ@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 02 Jun 2015 09:15:32 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] arm: Fix invalid assert logic in
	op_helper.c
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
X-List-Received-Date: Tue, 02 Jun 2015 08:41:48 -0000


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Jun 02, 2015 at 09:10:23AM +0100, Peter Maydell wrote:
>On 2 June 2015 at 09:05, Martin Kletzander <mkletzan@redhat.com> wrote:
>> Boolean value '!arm_current_el(env)' can never be equal to 3.  Fix it
>> according to the comment above as currently the build fails with
>> gcc-5.1.0.
>>
>> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
>> ---
>>  target-arm/op_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
>> index 3f5b9ab5963b..7583ae71217b 100644
>> --- a/target-arm/op_helper.c
>> +++ b/target-arm/op_helper.c
>> @@ -421,7 +421,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
>>          /* Requesting a trap to EL2 when we're in EL3 or S-EL0/1 is
>>           * a bug in the access function.
>>           */
>> -        assert(!arm_is_secure(env) && !arm_current_el(env) == 3);
>> +        assert(!arm_is_secure(env) && arm_current_el(env) != 3);
>>          target_el = 2;
>>          break;
>>      case CP_ACCESS_TRAP_EL3:
>
>Thanks, but there are already two versions of this patch on the list.
>

Oh, I'm very sorry for that, I must've missed them.  I'm still missing
the skill to not miss relevant information from the list.

Have a nice day,
Martin

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbWxFAAoJEAgfwp8kF4bd0pMP/AoI5FNqC2jFmi+RGVPckG65
Zg0Int7Z2LkoMsIh52eJ4t0XEBQ36VdrsVYN3BdzNM+2QxOPq3BbIJb4cVPwuwTL
Z0OvxA/sHHjv1ZDlIeRPYNqLomLHCVKDDqnhb0qTJ6nwmFqKihO0upRgkY8dU1EQ
ybftb8ERfW0UASSZ2WmudOba1pQCRuhZm4wGB9DkyR72fX/kHseV+5ekfQ3AoSGm
5ywr9Foa+fHQ3NeJbWJaof0RyX7XTqBIrHwCzRwlnBU4XVBqjn5Kn+iwZLgbsAmI
hG7D2wW2HdmwwuVxWBR3VAGQbkooJ68l1XwP+Kdlv1U/2ATEcwqAQhjRRhfILk12
8nSL18m++EBlf1QSiYgiLSlz4uMM5fLIuc7xbgYPuSJ6/L+Ujk0pfwyHij5CBdjG
3OZKdGhRI/J8tkrqEVAgW6oSZ0n/+saTJKZqR4kisuTeFhemfy1q/hUZmNu75k62
QujdDzYbcZdWW0O4V6vtcb79ree0h9mThQrg4MToAnr8zboZki2ebrPe7+cnD1J5
WzEBfkKATkTRgKLh+GUgFrmSTwSi6t7YPKnSvBFg5DTSHLW0XGXDCXNwzXMBqtHZ
lOrL6nL6WZMd0oJQl1JVd9j8pIts0jOa+BYwPPLeZru72nK1eLouNrUBfPV82+Kw
y/H4zIctvjmXkZW9PQmG
=Dmn1
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

