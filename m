Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDvd-00054a-9z
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dhDvb-00053R-7h
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dhDva-0005i6-Ep
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:53:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dhDvV-0005g7-Uj; Mon, 14 Aug 2017 07:52:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 888076407E;
	Mon, 14 Aug 2017 11:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 888076407E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.101] (ovpn-116-101.ams2.redhat.com [10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F2E07FCC6;
	Mon, 14 Aug 2017 11:52:54 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	KONRAD Frederic <fred.konrad@greensocs.com>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
	<a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ff54b90d-9912-ce03-31cf-9fd08571eab2@redhat.com>
Date: Mon, 14 Aug 2017 13:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 14 Aug 2017 11:52:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 7/7] hw/misc/mmio_interface:
 Return after error_setg() to avoid crash
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
X-List-Received-Date: Mon, 14 Aug 2017 11:53:04 -0000

On 14.08.2017 13:45, Peter Maydell wrote:
> On 14 August 2017 at 12:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> QEMU currently abort()s if the user tries to specify the mmio_interface
>> device without parameters:
>>
>> x86_64-softmmu/qemu-system-x86_64 -nographic -device mmio_interface
>> qemu-system-x86_64: /home/thuth/devel/qemu/util/error.c:57: error_setv:
>>  Assertion `*errp == ((void *)0)' failed.
>> Aborted (core dumped)
>>
>> This happens because the realize function is trying to set the errp
>> twice in this case. After setting an error, the realize function
>> should immediately return instead.
> 
> It seems like it should be an error to permit this to be
> created from the command line at all
That's also what thought first ... but the commit message of commit
7cc2298c46a6afa4f4ff7e5cd262809c782d701b says that it "can be
hotplugged/hotunplugged" ? ... that's confusing ...

Frederic, I think some more comments in the header of the file would be
really useful here.

 Thomas

