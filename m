Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQZD9-0004WW-IB
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 04:52:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQZD2-0004Nx-Mo
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 04:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQZCx-0005Qp-Mo
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 04:52:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VQZCe-0005OW-Np; Mon, 30 Sep 2013 04:51:40 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8U8pdAC023854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 30 Sep 2013 04:51:39 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8U8pa4R022306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 30 Sep 2013 04:51:37 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 84789200BF; Mon, 30 Sep 2013 10:51:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1380008620-13796-1-git-send-email-armbru@redhat.com>
	<1380008620-13796-2-git-send-email-armbru@redhat.com>
	<524880C3.6000801@msgid.tls.msk.ru>
Date: Mon, 30 Sep 2013 10:51:35 +0200
In-Reply-To: <524880C3.6000801@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sun, 29 Sep 2013 23:34:27 +0400")
Message-ID: <87y56eitew.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	anthony@codemonkey.ws, lersek@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v3 1/2] tests: Fix schema parser test for
	in-tree build
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
X-List-Received-Date: Mon, 30 Sep 2013 08:52:09 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 24.09.2013 11:43, armbru@redhat.com wrote:
>> From: Markus Armbruster <armbru@redhat.com>
>>
>> Commit 4f193e3 added the test, but screwed up in-tree builds
>> (SRCDIR=.): the tests's output overwrites the expected output, and is
>> thus compared to itself.
>
> []
>>   .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
>>   $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json:
>> $(SRC_PATH)/%.json
>> - $(call quiet-command, PYTHONPATH=$(SRC_PATH)/scripts $(PYTHON)
>> $(SRC_PATH)/tests/qapi-schema/test-qapi.py <$^ >$*.out 2>$*.err;
>> echo $$? >$*.exit, " TEST $*.out")
>> -	@diff -q $(SRC_PATH)/$*.out $*.out
>> -	@diff -q $(SRC_PATH)/$*.err $*.err
>> -	@diff -q $(SRC_PATH)/$*.exit $*.exit
>> + $(call quiet-command, PYTHONPATH=$(SRC_PATH)/scripts $(PYTHON)
>> $(SRC_PATH)/tests/qapi-schema/test-qapi.py <$^ >$*.test.out
>> 2>$*.test.err; echo $$? >$*.test.exit, " TEST $*.out")
>> +	@diff -q $(SRC_PATH)/$*.out $*.test.out
>> +	@diff -q $(SRC_PATH)/$*.err $*.test.err
>> +	@diff -q $(SRC_PATH)/$*.exit $*.test.exit
>
> Hmm.  Maybe these new files should be cleaned up somehow by
> `make clean' ?

Guess so.  However, "make clean" doesn't clean *anything* in tests/
right now.  Separate fix?

