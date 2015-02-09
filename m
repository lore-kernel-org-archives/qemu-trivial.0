Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKnHc-0001qM-N1
	for mharc-qemu-trivial@gnu.org; Mon, 09 Feb 2015 07:17:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YKnHX-0001hn-RO
	for qemu-trivial@nongnu.org; Mon, 09 Feb 2015 07:17:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YKnHX-0003BB-4X
	for qemu-trivial@nongnu.org; Mon, 09 Feb 2015 07:17:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1YKnHR-0003AX-8k; Mon, 09 Feb 2015 07:17:33 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t19CHVWF018789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 9 Feb 2015 07:17:32 -0500
Received: from localhost (ovpn-116-130.ams2.redhat.com [10.36.116.130])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t19CHUUQ030549; Mon, 9 Feb 2015 07:17:31 -0500
From: Juan Quintela <quintela@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <54D66F36.5080200@redhat.com> (Paolo Bonzini's message of "Sat,
	07 Feb 2015 21:01:58 +0100")
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
	<54D5D416.6040704@msgid.tls.msk.ru> <54D66F36.5080200@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
Date: Mon, 09 Feb 2015 13:17:30 +0100
Message-ID: <874mqv2s9x.fsf@neno.neno>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/7] Six coverity fixes and a cleanup
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Feb 2015 12:17:40 -0000

Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 07/02/2015 10:00, Michael Tokarev wrote:
>>> > Patch 2 is the cleanup.  The other six patches make the tcg, utils and
>>> > migration components clean.
>> Applied to -trivial patches 1,2,3,4 and 6, not applied 5 (due to
>> questionable errno checking addition) and 7, due to a discussion.
>
> Thanks, will resubmit 5.
>
> Juan/Amit, can you pick up 7 which Juan has already reviewed?

I pick 7.

Thanks, Juan.

