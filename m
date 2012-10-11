Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TMD9F-0004Yp-Sq
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2012 03:25:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1TMD9B-0004Wy-KA
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2012 03:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1TMD94-0006uc-Ut
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2012 03:25:33 -0400
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:40822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1TMD94-0006rr-AI
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2012 03:25:26 -0400
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mohan@in.ibm.com>;
	Thu, 11 Oct 2012 12:55:21 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
	by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 11 Oct 2012 12:55:02 +0530
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q9B7P1o84194592; Thu, 11 Oct 2012 12:55:01 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q9BCscW4004912; Thu, 11 Oct 2012 23:54:38 +1100
Received: from explorer.in.ibm.com.ibm.com (explorer.in.ibm.com [9.122.21.77])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q9BCsbma004899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 11 Oct 2012 23:54:38 +1100
From: "M. Mohan Kumar" <mohan@in.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <5075A966.3090708@weilnetz.de>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
User-Agent: Notmuch/0.13.2 (http://notmuchmail.org) Emacs/24.1.1
	(x86_64-redhat-linux-gnu)
Date: Thu, 11 Oct 2012 12:55:00 +0530
Message-ID: <871uh5tqr7.fsf@explorer.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
x-cbid: 12101107-3864-0000-0000-00000503DC2C
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 11 Oct 2012 07:25:36 -0000

Stefan Weil <sw@weilnetz.de> writes:

We need to change fsuid and fsgid in 9p server side when 9p client wants
to create a file with given uid and gid.

In my case setfsuid and setfsgid never return -1 even if a normal user tries to
change fsuid.

I am running F17 and glibc is 2.15-56.fc17

IMHO setfsuid/setfsgid need to return -1 & set errno to EPERM when calling user
lacks CAP_SETUID capability. I can work on the kernel side to return
proper error values.

Also as per the man page:
       When glibc determines that the argument is not a valid user ID,
       it will return -1 and set errno  to  EINVAL
       without attempting the system call.

If it mean a nonexistent id by 'not a valid user ID' it may be a
problem in virtfs case. Client sends the user id details which may be
a nonexistent user id in host system. Ideally setfsuid setfsgid sets
whatever uid/gid passed if the caller is root as of now.   


> Am 10.10.2012 18:54, schrieb Stefan Weil:
>> Am 10.10.2012 18:36, schrieb Paolo Bonzini:
>>> Il 10/10/2012 18:23, Stefan Weil ha scritto:
>>>> < 0 would be wrong because it looks like both functions never
>>>> return negative values.
>>>> I just wrote a small test program (see
>>>> below) and called it with different uids with and without root
>>>> rights. This pattern should be fine:
>>>>
>>>> new_uid = setfsuid(uid);
>>>> if (new_uid != 0 && new_uid != uid) {
>>>>    return -1;
>>>> }
>>> I didn't really care about this case.  I assumed that the authors knew
>>> what they were doing...
>>>
>>> What I cared about is: "When glibc determines that the argument is not a
>>>   valid  group  ID,  it will  return  -1  and set errno to EINVAL 
>>> without
>>> attempting the system call".
>>
>> I was not able to get -1 with my test program: any value which I tried
>> seemed to work when the program was called with sudo.
>>
>>>
>>> I think this would also work:
>>>
>>>     if (setfsuid(uid) < 0 || setfsuid(uid) != uid) {
>>>         return -1;
>>>     }
>>>
>>> but it seems wasteful to do four syscalls instead of two.
>>>
>>> Paolo
>>
>> I added a local variable in my example to avoid those extra
>> syscalls.
>>
>> Your last patch v2 does not handle missing rights (no root)
>> because in that case the functions don't return a value < 0
>> but fail nevertheless.Calling a program which requires
>> root privileges from a normal user account is usually a
>> very common error. I don't know the use cases for virtfs -
>> maybe that's no problem here.
>>
>> The functions have an additional problem: they don't set
>> errno (see manpages). I tested this, and here the manpages
>> are correct. The code in virtfs-proxy-helper expects that
>> errno was set, so the patch must set errno = EPERM or
>> something like that.
>>
>> Stefan
>
> Maybe the author of those code can tell us more on the
> use cases and which errors must be handled.
>
> Is it necessary to use those functions at all (they are very
> Linux specific), or can they be replaced by seteuid, setegid?
>
> Regards
>
> Stefan W.


