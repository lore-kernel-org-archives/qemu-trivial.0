Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYVxP-0005XK-50
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 07:18:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dYVxM-0005VR-O9
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 07:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dYVxL-0008FG-T9
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 07:18:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dYVxH-00089X-Kk; Fri, 21 Jul 2017 07:18:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90E2F1E31B;
	Fri, 21 Jul 2017 11:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 90E2F1E31B
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 90E2F1E31B
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BF3F60F84;
	Fri, 21 Jul 2017 11:18:45 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
	<b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
	<CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0ed4e0fb-3699-f633-ee6f-ccd4b6494563@redhat.com>
Date: Fri, 21 Jul 2017 13:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 21 Jul 2017 11:18:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 4/4]
 bsd-user/main.c: Fix unused variable warning
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
X-List-Received-Date: Fri, 21 Jul 2017 11:18:53 -0000

On 19.07.2017 10:19, Peter Maydell wrote:
> On 18 July 2017 at 23:01, Eric Blake <eblake@redhat.com> wrote:
>> On 07/18/2017 11:26 AM, Peter Maydell wrote:
>>> On OpenBSD the compiler warns:
>>> bsd-user/main.c:622:21: warning: variable 'sig' set but not used [-Wunused-but-set-variable]
>>>
>>> This is because a lot of the signal delivery code is #if-0'd
>>> out as unused. Reshuffle #ifdefs a bit to silence the warning.
>>
>> Why not just nuke the #if 0 code instead (we can always 'git revert' it
>> later as a starting point for someone that wants to implement it).
> 
> I went for the minimal change, especially given we know
> that the freebsd folks have a big patchset on top of
> us fixing a lot of bsd-user code and it didn't seem worth
> giving them a more awkward rebase task.

That's fair. So FWIW:

Reviewed-by: Thomas Huth <thuth@redhat.com>

