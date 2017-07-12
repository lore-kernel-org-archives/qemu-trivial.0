Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVJs8-00029R-GP
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 11:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVJs6-00027d-6E
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 11:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVJs5-0006K6-77
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 11:48:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVJry-0006E2-Vb; Wed, 12 Jul 2017 11:48:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54F4FC04B924;
	Wed, 12 Jul 2017 15:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 54F4FC04B924
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 54F4FC04B924
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CF356031A;
	Wed, 12 Jul 2017 15:48:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8F1311138645; Wed, 12 Jul 2017 17:48:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
References: <20170609152017.7286-1-eblake@redhat.com>
	<1298d3b1-a6d6-499b-323b-b79c6e38bc7b@msgid.tls.msk.ru>
	<15dc487a-c340-e407-a7b0-b7159a5a49a2@redhat.com>
Date: Wed, 12 Jul 2017 17:48:01 +0200
In-Reply-To: <15dc487a-c340-e407-a7b0-b7159a5a49a2@redhat.com> (Eric Blake's
	message of "Wed, 12 Jul 2017 08:56:05 -0500")
Message-ID: <871spl4pxq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 12 Jul 2017 15:48:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] qobject coccinelle
 followups
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jul 2017 15:48:15 -0000

Eric Blake <eblake@redhat.com> writes:

> On 07/12/2017 08:35 AM, Michael Tokarev wrote:
>> 09.06.2017 18:20, Eric Blake wrote:
>>> Inspired by https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg02505.html
>>>
>>> Surprisingly, the updated script didn't find any existing longhand
>>> use as candidates for QDECREF() (our last such use was cleaned up
>>> as a side effect, in commit b72fe9e), but it DID find another straggler
>>> missed in commit 579cf1d1.
>>>
>>> Eric Blake (2):
>>>   qobject: Update coccinelle script to catch Q{INC,DEC}REF
>>>   qobject: Catch another straggler for use of qdict_put_str()
>> 
>> Applied to -trivial, thanks!
>
> Markus has taken v2 of these patches through his qapi-next tree:
> https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg05589.html
>
> so you can drop this v1 from -trivial

I've dragged my feet on the pull request in the hope of still adding a
few patches of my own.  Figure I better put them into the next one.

