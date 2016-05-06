Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aykfz-0000pn-5G
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 14:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aykfq-0000W2-C5
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 14:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aykfe-0003yK-Uy
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 14:40:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aykfN-0003nS-1M; Fri, 06 May 2016 14:39:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7116F40619;
	Fri,  6 May 2016 21:39:38 +0300 (MSK)
To: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <1458614246-28528-1-git-send-email-peterx@redhat.com>
	<87vb4eo72f.fsf@blackfin.pond.sub.org>
Cc: kwolf@redhat.com, pbonzini@redhat.com,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <572CE4E9.1030108@msgid.tls.msk.ru>
Date: Fri, 6 May 2016 21:39:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <87vb4eo72f.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] qdict: fix unbounded stack warning
 for qdict_array_entries
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
X-List-Received-Date: Fri, 06 May 2016 18:40:33 -0000

22.03.2016 18:39, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
>> Here we use one g_strdup_printf() to replace the two stack allocated
>> array, considering it's more convenient, safe, and as long as it's
>> called rarely only when quorum device opens. This will remove the
>> unbound stack warning when compiling with "-Wstack-usage=1000000".
>>
>> Reviewed-by:   Eric Blake <eblake@redhat.com>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> I lack the time to take this through my tree before my Easter vacation.
> Nominating for qemu-trivial, assuming Luiz doesn't mind.

(Finally) applied to -trivial, thanks!

/mjt


