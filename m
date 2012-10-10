Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLyyw-0007I9-1a
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 12:18:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TLyyo-0006vl-Qa
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TLyyj-0004tA-3u
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:17:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1TLyyY-0004qo-TC; Wed, 10 Oct 2012 12:17:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9AGHbJI028272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Oct 2012 12:17:37 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-24.ams2.redhat.com
	[10.36.112.24])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9AGHYxV015783; Wed, 10 Oct 2012 12:17:35 -0400
Message-ID: <50759F9E.3060800@redhat.com>
Date: Wed, 10 Oct 2012 18:17:34 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de>
In-Reply-To: <50759EEC.8070308@weilnetz.de>
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
X-List-Received-Date: Wed, 10 Oct 2012 16:18:00 -0000

Il 10/10/2012 18:14, Stefan Weil ha scritto:
>>
>>
>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>> index f9a8270..b34a84a 100644
>> --- a/fsdev/virtfs-proxy-helper.c
>> +++ b/fsdev/virtfs-proxy-helper.c
>> @@ -290,8 +290,12 @@ static int setfsugid(int uid, int gid)
>>           CAP_DAC_OVERRIDE,
>>       };
>>   -    setfsgid(gid);
>> -    setfsuid(uid);
>> +    if (setfsgid(gid) != 0) {
>> +        return -1;
>> +    }
> 
> Wouldn't setfsgid(gid) == gid be also ok?

Of course, it should be < 0.  I have no idea how to test this thing...

Paolo

