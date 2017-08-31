Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnPdx-0003lE-R0
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 09:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnPdu-0003jm-N8
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 09:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnPdq-0008Bh-Rd
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 09:36:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51765)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dnPdm-0008An-FR; Thu, 31 Aug 2017 09:36:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C97A806D1;
	Thu, 31 Aug 2017 13:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6C97A806D1
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.27] (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD9AAB5149;
	Thu, 31 Aug 2017 13:36:00 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1503941985-25657-1-git-send-email-thuth@redhat.com>
	<20170830154803.46bc99fc@nial.brq.redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0cf2b541-a9da-ddbf-bfe4-fe0bb24327c1@redhat.com>
Date: Thu, 31 Aug 2017 15:35:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170830154803.46bc99fc@nial.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 31 Aug 2017 13:36:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] tests/bios-tables:
 Silence some messages with V=1, print them with V=2 only
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
X-List-Received-Date: Thu, 31 Aug 2017 13:36:24 -0000

On 30.08.2017 15:48, Igor Mammedov wrote:
> On Mon, 28 Aug 2017 19:39:45 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> When running "make check-qtest-x86_64 V=1", the output is currently flooded
>> with "Looking for expected file ..." and "Using expected file ..." messages.
>> None of the other tests is doing that with V=1, so this is a little bit
>> annoying. Let's only print these debug messages when we're running the test
>> with V=2 or higher.
> well, normally make check is run without V=
> and if someone once in a while need to run it in verbose mode,
> he/she can tolerate it since it's a verbose mode after all.
> 
> Hiding message behind V=XX is going to make us remember/recall
> at which verbosity level one needs to run tests to get needed
> diagnostic info.
> 
> I'd rather keep it as it is now.

Well, I love to run the tests with V=1, especially as soon as one of the
tests hangs. But the output of the bios-tables-test really breaks the
well-formatted output of the test framework in that case, so adding a
V=2 debug level is IMHO a good idea. But if I'm the only who's annoyed
by the current output of the bios-tables-test, feel free to ignore me ;-)

 Thomas

