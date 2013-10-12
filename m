Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VV4W6-0004Hp-VN
	for mharc-qemu-trivial@gnu.org; Sat, 12 Oct 2013 15:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VV4Vz-000483-7S
	for qemu-trivial@nongnu.org; Sat, 12 Oct 2013 15:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VV4Vt-0005BM-95
	for qemu-trivial@nongnu.org; Sat, 12 Oct 2013 15:06:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VV4Vh-0004kP-3n; Sat, 12 Oct 2013 15:05:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EEB114195D;
	Sat, 12 Oct 2013 23:05:47 +0400 (MSK)
Message-ID: <52599D8B.3020200@msgid.tls.msk.ru>
Date: Sat, 12 Oct 2013 23:05:47 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
	<525978C8.9010002@redhat.com>
In-Reply-To: <525978C8.9010002@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: create fsdev/ directory
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
X-List-Received-Date: Sat, 12 Oct 2013 19:06:21 -0000

12.10.2013 20:28, Paolo Bonzini wrote:
> Il 11/10/2013 11:05, Michael Tokarev ha scritto:
[]
>> --- a/configure
>> +++ b/configure
>> @@ -3576,6 +3576,7 @@ if test "$softmmu" = yes ; then
>>       if test "$cap" = yes && test "$linux" = yes && test "$attr" = yes ; then
>>         virtfs=yes
>>         tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
>> +      mkdir -p fsdev
>>       else
>>         if test "$virtfs" = yes; then
>>           error_exit "VirtFS is supported only on Linux and requires libcap-devel and libattr-devel"
>>
>
> Please modify around
>
> DIRS="tests tests/tcg tests/tcg/cris tests/tcg/lm32 tests/libqos
> tests/qapi-schema tests/tcg/xtensa tests/qemu-iotests"
> DIRS="$DIRS pc-bios/optionrom pc-bios/spapr-rtas pc-bios/s390-ccw"
> DIRS="$DIRS roms/seabios roms/vgabios"
> DIRS="$DIRS qapi-generated"
>
> instead.

I considered doing it there initially, but decided to add it
to the other place, because that's where virtfs variable
is set.  The place you're referring to will need to have a
condition `if' based on $virtfs value.

Also, there are other places below this virtfs test (which I
modified) which runs mkdir (dtc, pixman), so this is not
something unusual.

Thanks,

/mjt

