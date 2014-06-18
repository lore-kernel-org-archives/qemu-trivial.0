Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WxHhz-0002TP-K3
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jun 2014 11:23:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WxHhp-0002JZ-CF
	for qemu-trivial@nongnu.org; Wed, 18 Jun 2014 11:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WxHhg-0007Qv-Vg
	for qemu-trivial@nongnu.org; Wed, 18 Jun 2014 11:23:21 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54942 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WxHhP-0007OK-V5; Wed, 18 Jun 2014 11:22:56 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 22C2CACA1;
	Wed, 18 Jun 2014 15:22:55 +0000 (UTC)
Message-ID: <53A1AECE.9000508@suse.de>
Date: Wed, 18 Jun 2014 17:22:54 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>, 
	qemu-devel@nongnu.org
References: <1403096280-68774-1-git-send-email-emaste@freebsd.org>
	<53A1A52D.1090107@redhat.com>
In-Reply-To: <53A1A52D.1090107@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Alon Levy <alevy@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vscclient: Add required
 headers to fix build on FreeBSD
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
X-List-Received-Date: Wed, 18 Jun 2014 15:23:29 -0000

Am 18.06.2014 16:41, schrieb Paolo Bonzini:
> Il 18/06/2014 14:58, Ed Maste ha scritto:
>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>> ---
>>  libcacard/vscclient.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
>> index ab9b2b8..80111df 100644
>> --- a/libcacard/vscclient.c
>> +++ b/libcacard/vscclient.c
>> @@ -11,6 +11,8 @@
>>   */
>>
>>  #ifndef _WIN32
>> +#include <sys/socket.h>
>> +#include <netinet/in.h>
>>  #include <netdb.h>
>>  #define closesocket(x) close(x)
>>  #endif
>>
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Looks okay, CC'ing Alon and -trivial.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

