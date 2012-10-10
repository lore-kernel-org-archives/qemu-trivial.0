Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLzHL-0002Mn-CF
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 12:37:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TLzHF-00024e-H3
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TLzH9-0003lY-QI
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:36:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1TLzH9-0003lU-Ht; Wed, 10 Oct 2012 12:36:51 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9AGaomX027220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Oct 2012 12:36:50 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-24.ams2.redhat.com
	[10.36.112.24])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9AGamtg022347; Wed, 10 Oct 2012 12:36:49 -0400
Message-ID: <5075A420.10003@redhat.com>
Date: Wed, 10 Oct 2012 18:36:48 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Stefan Weil <Stefan.Weil@weilnetz.de>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de>
In-Reply-To: <5075A0FF.3080904@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-List-Received-Date: Wed, 10 Oct 2012 16:37:02 -0000

Il 10/10/2012 18:23, Stefan Weil ha scritto:
> < 0 would be wrong because it looks like both functions never
> return negative values.
> I just wrote a small test program (see
> below) and called it with different uids with and without root
> rights. This pattern should be fine:
> 
> new_uid = setfsuid(uid);
> if (new_uid != 0 && new_uid != uid) {
>   return -1;
> }

I didn't really care about this case.  I assumed that the authors knew
what they were doing...

What I cared about is: "When glibc determines that the argument is not a
 valid  group  ID,  it will  return  -1  and set errno to EINVAL without
attempting the system call".

I think this would also work:

   if (setfsuid(uid) < 0 || setfsuid(uid) != uid) {
       return -1;
   }

but it seems wasteful to do four syscalls instead of two.

Paolo

