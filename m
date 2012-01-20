Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoCp2-0004ij-Mk
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2012 06:39:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RoCoz-0004YQ-Ol
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:39:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RoCov-0004iO-Hg
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:39:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:65282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1RoCoj-0004gw-M9; Fri, 20 Jan 2012 06:39:37 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0KBdaPj018667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 20 Jan 2012 06:39:36 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-23.ams2.redhat.com
	[10.36.112.23])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0KBdY0b017232; Fri, 20 Jan 2012 06:39:35 -0500
Message-ID: <4F195276.9000308@redhat.com>
Date: Fri, 20 Jan 2012 12:39:34 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <1327057522-6590-1-git-send-email-pbonzini@redhat.com>
	<4F194D46.1050501@siemens.com> <4F194F4E.9060901@redhat.com>
	<4F195003.7050500@siemens.com>
In-Reply-To: <4F195003.7050500@siemens.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] rename get_clock_realtime
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
X-List-Received-Date: Fri, 20 Jan 2012 11:39:55 -0000

On 01/20/2012 12:29 PM, Jan Kiszka wrote:
>> >  Yeah, however, realtime is quite confusing because CLOCK_MONOTONIC is
>> >  part of the "real-time clock API".  The code is much clearer than the
>> >  comment, I'll remove it completely.  v2 on the way.
> There is CLOCK_MONOTONIC and CLOCK_REALTIME, and this function uses the
> latter.

Actually it uses gettimeofday, but I see what you mean.

But QEMU_CLOCK_REALTIME and rt_clock refer to CLOCK_MONOTONIC and are 
_not_ read by get_clock_realtime.  This actually is what prompted me to 
rename get_clock_realtime (see commit message).

Paolo

