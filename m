Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZF2JX-0008S3-3p
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2015 11:40:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZF2JU-0008KW-Dn
	for qemu-trivial@nongnu.org; Tue, 14 Jul 2015 11:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZF2JR-0005AD-75
	for qemu-trivial@nongnu.org; Tue, 14 Jul 2015 11:40:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZF1h3-0004o3-IH; Tue, 14 Jul 2015 11:00:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 84086374A2B;
	Tue, 14 Jul 2015 15:00:24 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6EF0LnN015137; Tue, 14 Jul 2015 11:00:22 -0400
Message-ID: <55A52405.8070008@redhat.com>
Date: Tue, 14 Jul 2015 11:00:21 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1436815589-19194-1-git-send-email-jsnow@redhat.com>
	<CAFEAcA_hE0eepawDhF2DBidhd6iXvOx2f6w11+gFk-nh3Ju1XQ@mail.gmail.com>
	<55A41474.8000004@redhat.com> <55A4C890.70402@redhat.com>
In-Reply-To: <55A4C890.70402@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: coverity touchups
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
X-List-Received-Date: Tue, 14 Jul 2015 15:40:09 -0000



On 07/14/2015 04:30 AM, Paolo Bonzini wrote:
> 
> 
> On 13/07/2015 21:41, John Snow wrote:
>>>>>> s->ports should never exceed 32, but coverity doesn't know that.
>>>>>> ncq_tfs->sector_count should also never exceed 64K.
>>>>
>>>> Personally I tend to mark that kind of thing as a false
>>>> positive in the coverity UI and move on...
>>>>
>>>> -- PMM
>>>>
>> Either way; Paolo pinged me about the NCQ one so I figured I'd just do it.
> 
> Yeah, neither is particularly optimal.  Every now and then (a couple
> years, say) you do have to re-evaluate false positives, so it's better
> to fix them if possible.  On the other hand the code is uglier.
> 
> Let's ignore these in Coverity---with a triaging comment there about why
> they are false positives.
> 
> Paolo
> 

Alright, I'll follow your lead on this and just adjust the Coverity
triaging comments.

--js

