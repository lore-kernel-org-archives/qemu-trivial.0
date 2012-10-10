Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLzYe-0002gt-Hk
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 12:54:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TLzYU-0002FU-4Q
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TLzYM-0001G6-5q
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:54:45 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TLzYD-0001DM-Tm; Wed, 10 Oct 2012 12:54:30 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A79217280041; Wed, 10 Oct 2012 18:54:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NA96xjVqJXzZ; Wed, 10 Oct 2012 18:54:28 +0200 (CEST)
Received: from [192.168.178.20] (p5086E9D6.dip.t-dialin.net [80.134.233.214])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E8649728003D; Wed, 10 Oct 2012 18:54:27 +0200 (CEST)
Message-ID: <5075A843.8020107@weilnetz.de>
Date: Wed, 10 Oct 2012 18:54:27 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
In-Reply-To: <5075A420.10003@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtfs-proxy-helper: check
 return code of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 10 Oct 2012 16:54:55 -0000

Am 10.10.2012 18:36, schrieb Paolo Bonzini:
> Il 10/10/2012 18:23, Stefan Weil ha scritto:
>> < 0 would be wrong because it looks like both functions never
>> return negative values.
>> I just wrote a small test program (see
>> below) and called it with different uids with and without root
>> rights. This pattern should be fine:
>>
>> new_uid = setfsuid(uid);
>> if (new_uid != 0 && new_uid != uid) {
>>    return -1;
>> }
> I didn't really care about this case.  I assumed that the authors knew
> what they were doing...
>
> What I cared about is: "When glibc determines that the argument is not a
>   valid  group  ID,  it will  return  -1  and set errno to EINVAL without
> attempting the system call".

I was not able to get -1 with my test program: any value which I tried
seemed to work when the program was called with sudo.

>
> I think this would also work:
>
>     if (setfsuid(uid) < 0 || setfsuid(uid) != uid) {
>         return -1;
>     }
>
> but it seems wasteful to do four syscalls instead of two.
>
> Paolo

I added a local variable in my example to avoid those extra
syscalls.

Your last patch v2 does not handle missing rights (no root)
because in that case the functions don't return a value < 0
but fail nevertheless.Calling a program which requires
root privileges from a normal user account is usually a
very common error. I don't know the use cases for virtfs -
maybe that's no problem here.

The functions have an additional problem: they don't set
errno (see manpages). I tested this, and here the manpages
are correct. The code in virtfs-proxy-helper expects that
errno was set, so the patch must set errno = EPERM or
something like that.

Stefan


