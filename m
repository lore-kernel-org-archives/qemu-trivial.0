Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umdag-0006BO-GE
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 01:27:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmdaY-00069h-Fs
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 01:27:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmdaQ-00046m-GI
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 01:27:18 -0400
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:45469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmdaP-00046R-QO
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 01:27:10 -0400
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mohankumar.m@gmail.com>;
	Wed, 12 Jun 2013 10:50:30 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 12 Jun 2013 10:50:27 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 42DBA1258053;
	Wed, 12 Jun 2013 10:55:51 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r5C5Qrxm18153530; Wed, 12 Jun 2013 10:56:54 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r5C5QvoE005465; Wed, 12 Jun 2013 15:26:57 +1000
Received: from explorer.ibm.com (explorer.in.ibm.com [9.124.31.139])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r5C5Qvjl005453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 12 Jun 2013 15:26:57 +1000
From: "M. Mohan Kumar" <mohan@in.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51B76A28.5030008@msgid.tls.msk.ru>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
	<51B7183E.6070203@msgid.tls.msk.ru>
	<CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
	<87ehc8tvd5.fsf@gmail.com> <51B76A28.5030008@msgid.tls.msk.ru>
User-Agent: Notmuch/0.13.2 (http://notmuchmail.org) Emacs/24.1.1
	(x86_64-redhat-linux-gnu)
Date: Wed, 12 Jun 2013 10:56:57 +0530
Message-ID: <878v2fucf2.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13061205-8878-0000-0000-0000077EA4AB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.7
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
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
X-List-Received-Date: Wed, 12 Jun 2013 05:27:25 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 11.06.2013 21:23, M. Mohan Kumar wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> 
>> How about this approach?
>
> Well, this is definitely wrong :)
>
>> -if test "$softmmu" = yes ; then
>> -  if test "$virtfs" != no ; then
>> +
>> +if test "$virtfs" != no ; then
>> +  if test "$softmmu" = yes ; then
>>      if test "$cap" = yes && test "$linux" = yes && test "$attr" = yes ; then
>>        virtfs=yes
>>        tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
>> @@ -3415,6 +3416,12 @@ if test "$softmmu" = yes ; then
>>        fi
>>        virtfs=no
>>      fi
>> +  else
>> +    if test "$virtfs" = yes; then
>> +      error_exit "VirtFS is supported only on Linux and requires softmmu"
>> +    else
>> +     virtfs=no
>> +    fi
>>    fi
>>    if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
>>      if [ "$guest_agent" = "yes" ]; then
>
> Now this "if [ $linux..." test is only checked
> if $virtfs != no.  Before, it was checked when
> $softmmu != no...
My bad :(, I missed check for guest_agent inside softmmu case.

>
> FWIW, I still don't understand what Peter Maydell dislikes
> in a simplest case I posted initially, where we merely ignore
> (disable) virtfs in case !softmmu.  We should probably do the
> same for alot of other features which makes sense only if
> softmmu==yes, and omit many configure tests which are still
> done even if softmmu is disabled, but that's a different
> patch for sure.  Maube we should separate out this last linux|bsd|solaris
> test and add another if softmmu there, for readability, so that
> disabling of virtfs will be closer to other virtfs tests.
>
> I applied my initial patch to our debian tree to fix build
> failure for now, because else it fails during build.
>
> Thanks,
>
> /mjt


