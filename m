Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhDNC-0002KO-Ln
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 04:03:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XhDN5-0002D4-Rx
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 04:03:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XhDN0-000450-M0
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 04:03:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XhDMq-00041K-5O; Thu, 23 Oct 2014 04:03:32 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9N83SIq010518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 04:03:28 -0400
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9N83Q63018059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 23 Oct 2014 04:03:27 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 659E5303F175; Thu, 23 Oct 2014 10:03:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1413984320-28585-1-git-send-email-baloo@gandi.net>
	<5448A656.6030204@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:03:25 +0200
In-Reply-To: <5448A656.6030204@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Thu, 23 Oct 2014 10:55:18 +0400")
Message-ID: <87egtzusaa.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Arthur Gautier <baloo@gandi.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmdk: Fix cylinders number
	during convert
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
X-List-Received-Date: Thu, 23 Oct 2014 08:03:53 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> On 10/22/2014 05:25 PM, Arthur Gautier wrote:
>> We can not rely on int cast to get a correct number of cylinders. The
>> cylinders information was wrong in 49.9999% of cases.
>> 
>> This ensures the cylinders always gets the ceiling value.
>
> Good thing, especially the good probability :), and also a good patch
> which comes with a test.
>
> But I wonder if anything can break this way?  Migration, windows guest
> being unable to find its partitions, something else?
>
> And more.  What-if our drive size in cylinders will be larger than
> the size in bytes?  The proposed div_round_up() will increase number
> of cylinders, so size in CHS will be larger than size in bytes.  Maybe
> there was a reason why originally the size in cylinders was calculated
> by truncating extra fractional part?  What-if guest will try to access
> the very last CHS which is incomplete?

Too many questions for -trivial, copying VMDK maintainers.

