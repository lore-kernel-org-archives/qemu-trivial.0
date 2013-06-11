Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNiA-0004ik-NU
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:30:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNi6-0004aC-A4
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNi1-0002M7-D9
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:30:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmNhw-0002Ko-PO; Tue, 11 Jun 2013 08:29:52 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7ACDF41266;
	Tue, 11 Jun 2013 16:29:51 +0400 (MSK)
Message-ID: <51B7183E.6070203@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 16:29:50 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
In-Reply-To: <CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 12:30:05 -0000

11.06.2013 01:45, Peter Maydell wrote:
> On 10 June 2013 21:47, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> Or else
>>
>>  ./configure --disable-system --enable-virtfs
>>
>> (which makes no sense by its own but does not error out)
>> will fail to build, because it will define CONFIG_VIRTFS,
>> and the makefile will try to build virtfs-proxy-helper
>> manpage (but not the executable).
>>
>> Cc: qemu-trivial@nongnu.org
>> Cc: M. Mohan Kumar <mohan@in.ibm.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  configure |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/configure b/configure
>> index a3f0b7a..0ff0380 100755
>> --- a/configure
>> +++ b/configure
>> @@ -3423,6 +3423,8 @@ if test "$softmmu" = yes ; then
>>        tools="qemu-ga\$(EXESUF) $tools"
>>      fi
>>    fi
>> +else
>> +  virtfs=no
>>  fi
> 
> This doesn't feel to me like it's quite the right way
> to fix this bug. The current code in configure seems
> to tangle up (a) was virtfs requested and can we do it?
> with (b) what do we need to do if it was? (build some
> extra tools) and (c) when does it make sense? not for
> linux-user targets. So you end up with an 'else virtfs=no'
> clause added in an odd place. If the mess was untangled
> then this probably wouldn't be necessary.

Um. I don't think that tangling is a bad thing really.
Having different variables or options for it will be
too bloated, in my opinion.  I don't think there should
be anything done with it.

How about something like this:

--- a/configure
+++ b/configure
@@ -3810,7 +3810,7 @@ fi
 if test "$libattr" = "yes" ; then
   echo "CONFIG_LIBATTR=y" >> $config_host_mak
 fi
-if test "$virtfs" = "yes" ; then
+if test "$virtfs" = "yes" && test "$target_softmmu" = "yes" ; then
   echo "CONFIG_VIRTFS=y" >> $config_host_mak
 fi
 if test "$vhost_scsi" = "yes" ; then

(BTW, why configure uses this "test" instead of more readable [ ] ? )

> Also, disabling building tools and docs in general seems
> broken: --disable-tools disables building qemu-img, for
> instance, but not its documentation. So maybe we should
> fix this by generally making sure we don't build the docs
> unless we build the tool as well.

This has been addressed by a separate patch sent by afaerber.

Thanks,

/mjt

