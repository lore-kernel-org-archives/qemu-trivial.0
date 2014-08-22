Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKkuV-0006wM-2T
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 05:13:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XKkuO-0006mU-OL
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 05:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XKkuJ-0007vC-MP
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 05:13:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XKku9-0007tk-Jp; Fri, 22 Aug 2014 05:13:05 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7M9D1Vq026750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 22 Aug 2014 05:13:02 -0400
Received: from blackfin.pond.sub.org (ovpn-116-64.ams2.redhat.com
	[10.36.116.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7M9Cxs6018641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Aug 2014 05:13:00 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7A9D5303FEC9; Fri, 22 Aug 2014 11:12:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Johny Mattsson <jmattsson@dius.com.au>
References: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
	<87egwab2cn.fsf@blackfin.pond.sub.org>
	<CACTyEaMmNrNvOC7zs_=piuea6jWBLzvVVwADRHJpx2x-a7y1Eg@mail.gmail.com>
Date: Fri, 22 Aug 2014 11:12:58 +0200
In-Reply-To: <CACTyEaMmNrNvOC7zs_=piuea6jWBLzvVVwADRHJpx2x-a7y1Eg@mail.gmail.com>
	(Johny Mattsson's message of "Fri, 22 Aug 2014 17:53:31 +1000")
Message-ID: <87egw8hopx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix pflash_cfi01 to restore
	flash command/array state after migration
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
X-List-Received-Date: Fri, 22 Aug 2014 09:13:25 -0000

Johny Mattsson <jmattsson@dius.com.au> writes:

> On 21 August 2014 19:48, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Doesn't this break migration to/from unfixed versions?
>>
>
> It might. It is not something we've tried here, and I'm certainly not
> familiar enough with QEMU internals myself to say one way or another. We
> encountered this issue in what I can best describe as a short-and-furious
> proof-of-concept project, and as part of the wrapping up of this I'm going
> over our change logs to see if anything can be contributed back upstream.
> It seemed like a trivial fix in the tree, but I acknowledge it may have
> ramifications we didn't consider.
>
>
>> I suspect you need a subsection.  Initialize ->romd = 1, then let the
>> subsection override it.
>>
>
> And here I'm well and truly out of my depth! If someone who actually knows
> what they're doing would like to run with this, please do.
>
> Sorry to effectively do a dump-and-run here - I hope its a net positive at
> least.

Sure it is!  Imperfect patches can be a rather nice kind of bug report.

