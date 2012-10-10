Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TM0UP-0003Io-B5
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 13:54:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TM0UN-0003Es-6j
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 13:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TM0UM-0006vH-Ay
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 13:54:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1TM0UM-0006vB-07; Wed, 10 Oct 2012 13:54:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9AHsWla007722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Oct 2012 13:54:33 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-24.ams2.redhat.com
	[10.36.112.24])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9AH0ais007513; Wed, 10 Oct 2012 13:00:37 -0400
Message-ID: <5075A9B4.4080407@redhat.com>
Date: Wed, 10 Oct 2012 19:00:36 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de>
In-Reply-To: <5075A843.8020107@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 10 Oct 2012 17:54:36 -0000

Il 10/10/2012 18:54, Stefan Weil ha scritto:
>>
>>     if (setfsuid(uid) < 0 || setfsuid(uid) != uid) {
>>         return -1;
>>     }
>>
>> but it seems wasteful to do four syscalls instead of two.
> 
> I added a local variable in my example to avoid those extra
> syscalls.

Note that the two setfsuid() calls are different.

The first checks the "-1" error from glibc.  The second says "if the
first call succeeded, the second call should see "uid" as the current
fsuid and the second call will be a no-op; if not, the first call must
have failed".

> The functions have an additional problem: they don't set
> errno (see manpages). I tested this, and here the manpages
> are correct. The code in virtfs-proxy-helper expects that
> errno was set, so the patch must set errno = EPERM or
> something like that.

So it would be

    if (setfsuid(uid) < 0) {
        return -1;
    }
    if (setfsuid(uid) != uid) {
        errno = EPERM;
        return -1;
    }

I still prefer my v2 (v1 is wrong).  The return path seems to be dead,
but it's not worse than before...

Paolo

