Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9bXG-0007ri-TG
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 15:49:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1g9bXD-0007qG-G3
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 15:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1g9bXC-0007kG-Qn
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 15:49:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1g9bX7-0007iO-3f; Mon, 08 Oct 2018 15:49:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BB7F30001D8;
	Mon,  8 Oct 2018 19:49:36 +0000 (UTC)
Received: from [10.18.17.221] (dhcp-17-221.bos.redhat.com [10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCAF41001F4A;
	Mon,  8 Oct 2018 19:49:34 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-6-crosa@redhat.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
	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
	NRhibLIrSP2g5nqXONyQrFxb1HtVaoR+Nrk=
Message-ID: <11027abb-cc36-8921-fec3-f310104ad8a2@redhat.com>
Date: Mon, 8 Oct 2018 15:49:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-6-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 08 Oct 2018 19:49:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 05/10]
 docs/devel/testing.rst: add missing newlines after code block
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
X-List-Received-Date: Mon, 08 Oct 2018 19:49:44 -0000



On 10/04/2018 12:18 PM, Cleber Rosa wrote:
> The line immediate following a ".. code::" block is considered
> to contains arguments to the "code directive".  The lack of a
> new line gives me during at parse time:
> 
>    testing.rst:63: (ERROR/3) Error in "code" directive:
>    maximum 1 argument(s) allowed, 3 supplied.
> 
>    .. code::
>      make check-unit V=1
> 
>    testing.rst:120: (ERROR/3) Error in "code" directive:
>    maximum 1 argument(s) allowed, 3 supplied.
> 
>    .. code::
>      make check-qtest V=1
> 

pandoc doesn't complain, but rst.ninjs.org does. What tool did you use
to find these? we should formalize a formatting checker for rst files.

Actually, we should formalize building our RST docs at all...

--js

> Let's add the missing newlines, both for consistency and to
> avoid the parsing errors.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

