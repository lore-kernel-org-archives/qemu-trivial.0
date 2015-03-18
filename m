Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYEt8-00081w-S1
	for mharc-qemu-trivial@gnu.org; Wed, 18 Mar 2015 10:24:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YYEt6-0007wv-Ap
	for qemu-trivial@nongnu.org; Wed, 18 Mar 2015 10:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YYEt3-0000GO-5s
	for qemu-trivial@nongnu.org; Wed, 18 Mar 2015 10:24:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YYEsk-0000Ch-Gl; Wed, 18 Mar 2015 10:23:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2IENbKK011034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 18 Mar 2015 10:23:37 -0400
Received: from scv.usersys.redhat.com (unused [10.10.52.93] (may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2IENa34025426; Wed, 18 Mar 2015 10:23:37 -0400
Message-ID: <55098A68.2090907@redhat.com>
Date: Wed, 18 Mar 2015 10:23:36 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1426625899-25348-1-git-send-email-jsnow@redhat.com>
	<871tkmkcej.fsf@blackfin.pond.sub.org>
In-Reply-To: <871tkmkcej.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] qtest/ahci:
 Fix clang 3.5.0 error
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
X-List-Received-Date: Wed, 18 Mar 2015 14:24:01 -0000



On 03/18/2015 03:11 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
>
>> A thinko that clang 3.5.0 caught.
>> Thankfully does not introduce any new failures.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>
> How you caught the bug is interesting enough to be mentioned in the
> commit message, but the nature of the bug surely is more interesting
> than that.  Suggest to change the subject to
>
>      qtest/ahci: Fix a bit mask expression
>
> Perhaps it can be fixed up on commit.
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

If it goes in through trivial,

can we change this to Markus's suggestion?

Thank you,
--js

