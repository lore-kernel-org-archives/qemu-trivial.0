Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGQh0-0008W4-2U
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 06:21:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGQgt-0008U1-Ol
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 06:21:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGQgs-0003OP-O0
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 06:21:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YGQgm-0003NJ-Ma; Wed, 28 Jan 2015 06:21:40 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SBLd1P032414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 06:21:39 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SBLb0d014324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Jan 2015 06:21:39 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 64341303E241; Wed, 28 Jan 2015 12:21:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
	<54C7C02E.40701@redhat.com>
Date: Wed, 28 Jan 2015 12:21:37 +0100
In-Reply-To: <54C7C02E.40701@redhat.com> (Paolo Bonzini's message of "Tue, 27
	Jan 2015 17:43:26 +0100")
Message-ID: <87twzb881q.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] util/uri: Cleanups and
	a bug fix
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
X-List-Received-Date: Wed, 28 Jan 2015 11:21:48 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 27/01/2015 17:13, Markus Armbruster wrote:
>> Note: checkpatch is unhappy with the first patch, because I refrained
>> from cleaning up the ugly return(NULL).  They're all over the place.
>> 
>> Markus Armbruster (3):
>>   util/uri: uri_new() can't fail, drop dead error handling
>>   util/uri: realloc2n() can't fail, drop dead error handling
>>   util/uri: URI member path can be null, compare more carfully
>> 
>>  util/uri.c | 61 +++++++++++++------------------------------------------------
>>  1 file changed, 13 insertions(+), 48 deletions(-)
>> 
>
> Patches 1-2 okay.  For patch 3 a very similar patch was posted yesterday.

Missed it until now.  Yes, it's functionally identical.

Dear -trivial maintainer, pick whichever you like better :)

